## Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

## themes
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="random"

# Set list of themes to pick from when loading at random
ZSH_THEME_RANDOM_CANDIDATES=(
    powerlevel10k

    nanotech

    clean
    crunch
    philips
    obraun
    tonotdo
    geoffgarside
    xiong-chiamiov-plus
    jonathan
    wedisagree
    junkfood
    re5et
)

## plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    ag
    # ansible (aliases)
    # autoenv (enables this tool)
    autopep8
    autojump
    aws # completions
    copypath
    copyfile
    copybuffer
    dirhistory
    git
    jsontools
    macos
    aliases
    diff-so-fancy
    z
    alias-finder
    zsh-autosuggestions
    poetry
    conda-zsh-completion
    ripgrep
    zsh-ssh
    # fzf
    # thefuck
    # sudo (but i need to change the keybinding)
)

## omz
source $ZSH/oh-my-zsh.sh


## User configuration
# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto  # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 30

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"



## old configs
### themes considered
# juanghurtado
# agnoster
# smt
# UYSAL
# af-magic
# eastwood
# blinks
# robbyrussell
# sonicradish

# 3den Soliah adben
# af-magic afowler agnoster
# alanpeabody amuse apple
# arrow aussiegeek avit
# awesomepanda bira
# bureau candy candy-kingdom
# clean cloud crcandy
# crunch cypher dallas
# darkblood daveverwer dieter
# dogenpunk dpoggi dst
# dstufft duellj eastwood
# edvardm emotty essembeh
# evan fino fino-time
# fishy flazz fletcherm
# frisk frontcube
# funky fwalch gallifrey
# gallois garyblessington gentoo
# geoffgarside gianu gnzh
# gozilla half-life humza
# imajes intheloop itchy
# jaischeema jbergantine jispwoso
# jnrowe jonathan
# jreese jtriley juanghurtado
# junkfood kafeitu
# kennethreitz kiwi kolo
# kphoen lambda linuxonly
# lukerandall macovsky macovsky-ruby
# maran mgutz mh
# michelebologna mikeh miloshadzic
# minimal mira mlh
# mortalscumbag mrtazz murilasso
# muse nebirhos
# nicoulaj norm obraun
# philips pmcgee
# pygmalion pygmalion-virtualenv random
# re5et refined rgm
# risto rkj
# rkj-repos robbyrussell sammy
# simonoff simple skaro
# smt sonicradish sorin
# sporty_256 steeef strug
# sunaku sunrise superjarin
# suvash takashiyoshida terminalparty
# theunraveler tjkirch tjkirch_mod
# tonotdo trapd00r wedisagree
# wezm wezm+ wuffers
# xiong-chiamiov xiong-chiamiov-plus ys
# zhann