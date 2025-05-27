-- Function to execute JavaScript in the active Chrome tab
local function executeJavaScript(script)
    local success, result = hs.osascript.javascript([[
        (function() {
            var chrome = Application("Google Chrome");
            var tab = chrome.windows[0].activeTab();
            return tab.execute({ javascript: `]] .. script .. [[` });
        })();
    ]])
    if not success then
        hs.alert.show("JavaScript execution failed: " .. (result or "unknown error"))
        return nil
    end
    return result
end

-- Function to scrape information from the page
local function scrapePage()
    -- JavaScript script to scrape the title, description, and URL
    local scrapeScript = [[
        var title = document.querySelector("head > title") ? document.querySelector("head > title").innerText : "";
        var description = document.querySelector('meta[property="og:description"]') ? document.querySelector('meta[property="og:description"]').content : "";
        var url = document.querySelector('meta[property="og:url"]') ? document.querySelector('meta[property="og:url"]').content : "";
        JSON.stringify({title: title, description: description, url: url});
    ]]

    -- Execute the scraping script and log the data
    local scrapedData = executeJavaScript(scrapeScript)
    if scrapedData then
        print("Scraped Data: " .. scrapedData)
    else
        hs.alert.show("Failed to scrape data.")
    end
end

-- Function to gather all links on the initial page
local function gatherLinks()
    local gatherScript = [[
        var links = [];
        var index = 1;
        while (true) {
            var selector = "#__next > div.relative.z-0.flex.h-full.w-full.overflow-hidden > div.flex-shrink-0.overflow-x-hidden.bg-token-sidebar-surface-primary > div > div > div > div > nav > div.flex-col.flex-1.transition-opacity.duration-500.-mr-2.pr-2.overflow-y-auto > div:nth-child(2) > div:nth-child(" + index + ") > a";
            var link = document.querySelector(selector);
            if (link) {
                links.push(link.href);
                index++;
            } else {
                break;
            }
        }
        console.log("Gathered links: " + JSON.stringify(links));
        JSON.stringify(links);
    ]]

    local linksData = executeJavaScript(gatherScript)
    if linksData then
        local links = hs.json.decode(linksData)
        for i, link in ipairs(links) do
            print("Link " .. i .. ": " .. link)
        end
        return links
    else
        hs.alert.show("Failed to gather links.")
        return {}
    end
end

-- Function to iterate through the gathered links and scrape each page sequentially
local function scrapeLinksSequentially(links, index)
    if index > #links then
        print("Scraping complete.")
        return
    end

    local link = links[index]
    hs.urlevent.openURL(link)
    hs.timer.doAfter(5, function()
        scrapePage()
        hs.timer.doAfter(2, function()
            -- Close the current tab and move to the next link
            hs.osascript.javascript([[
                var chrome = Application("Google Chrome");
                chrome.windows[0].tabs[chrome.windows[0].tabs.length - 1].close();
            ]])
            scrapeLinksSequentially(links, index + 1)
        end)
    end)
end

-- Define the main scraping function
function startScraping()
    local links = gatherLinks()
    if #links > 0 then
        scrapeLinksSequentially(links, 1)
    else
        print("No links found to scrape.")
    end
end