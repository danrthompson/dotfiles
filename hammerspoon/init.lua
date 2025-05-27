-- Example: Reload Hammerspoon configuration automatically when you save changes
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", hs.reload):start()
hs.alert.show("Hammerspoon config loaded")



-- MACROS

-- Macro: Search Current Site on Google

function enableChromeHotkey()
    chromeHotkey = hs.hotkey.bind({"ctrl"}, "S", function()
        -- Get the URL from Chrome
        local url = nil
        local ok, result = hs.osascript.applescript('tell application "Google Chrome" to get URL of active tab of front window')
        if ok then url = result end

        if url then
            -- Extract the domain
            local domain = url:match("https?://([%w%.%-]+%.%w+)")
            if domain then
                -- Remove 'www.' if present
                domain = domain:gsub("^www%.", "")
                local searchQuery = "site:" .. domain .. " "
                hs.eventtap.keyStroke({"cmd"}, "L") -- Focus URL bar
                hs.timer.usleep(200000) -- Wait for 0.2 seconds
                hs.eventtap.keyStrokes(searchQuery)
            else
                hs.notify.new({title="Search Current Site", informativeText="Could not extract domain."}):send()
            end
        else
            hs.notify.new({title="Search Current Site", informativeText="Could not retrieve URL."}):send()
        end
    end)
end


function disableChromeHotkey()
    if chromeHotkey then
        chromeHotkey:delete() -- Unbind the hotkey
        chromeHotkey = nil
    end
end

-- App specific hotkey support
local chromeHotkey = nil

appWatcher = hs.application.watcher.new(function(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if appName == "Google Chrome" then
            enableChromeHotkey() -- Enable the hotkey when Chrome is focused
        else
            disableChromeHotkey() -- Disable the hotkey when Chrome is not focused
        end
    end
end)

appWatcher:start()

