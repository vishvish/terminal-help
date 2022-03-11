# Uncomment the next line to use the profiler, and uncomment the matching line near the end of this file
# zmodload zsh/zprof

export ZSH="/Users/vish/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="in-fino-veritas"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# 10ms for key sequences
KEYTIMEOUT=1

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  autojump
  direnv
  macos
  pipenv
  ssh-agent
  sudo
  zsh-autocomplete
  zsh-autosuggestions
  zsh-syntax-highlighting
)

export EDITOR=nvim
export HOMEBREW_INSTALL_BADGE=🎃
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export ITERM_24BIT=1
export TERM="screen-256color"
export WWW_HOME=http://www.google.com/
export SAM_CLI_TELEMETRY=0

# Now set up all the paths where I keep binaries - you may change these!
declare -a paths=(
"./"
"./bin"
"/usr/local/bin"
"/usr/local/sbin"
"${GOPATH}/bin"
"${HOME}/Dropbox/bin"
"${HOME}/.emacs.d/bin"
)

for i in "${paths[@]}"
do
  export PATH=${i}:${PATH}
done

zstyle ':autocomplete:*' recent-dirs zoxide
zstyle ':autocomplete:*' widget-style menu-complete
# # zstyle ':autocomplete:*' fzf-completion yes
zstyle ':autocomplete:*' insert-unambiguous yes

 # zstyle ':completion:*:*:git:*' script ~/.dotfiles/git-completion.bash

ZSH_AUTOSUGGEST_STRATEGY=(completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#865324,bg=cyan,bold,underline"
ZSH_AUTOSUGGEST_USE_ASYNC="true"
# ZSH_TMUX_AUTOSTART=true

# DISABLE_FZF_KEY_BINDINGS=false

# Load functions from the func directory
# you may have a different directory
fpath=( ~/.dotfiles/zsh/func "${fpath[@]}" )
autoload -Uz colours
autoload -Uz fixpermissions
autoload -Uz ggb
autoload -Uz heat
autoload -Uz heatoff
autoload -Uz manplus
autoload -Uz tm
autoload -Uz shellspeed

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='exa -lah --color=auto'
alias ll='exa -Glxhb --git -@ --time-style=long-iso'
alias l='exa -Glxhb --git -@ --time-style=long-iso'
alias lt='gls -lt --color=auto'
alias la='gls -lA --color=auto'
alias sl=ls # often screw this up

alias afind='ack -il'

# Aliases for certificate generation
alias generate_rsa_key="openssl genrsa -des3 -out server.key 2048"
alias strip_passphrase_from_key="openssl rsa -in server.key -out server.key"
alias generate_csr="openssl req -new -key server.key -out server.csr"
alias generate_cert="openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt"
alias create_ssl_cert="generate_rsa_key && strip_passphrase_from_key && generate_csr && generate_cert"

# Alias helper commands
alias tunnels="lsof -i -n | egrep '\<ssh\>'"

# Make beautiful git logs
alias glo="git log --decorate=full --all --graph"
alias gll="git log --oneline --decorate --all --graph"
alias glp="git log --oneline --decorate --graph --format=short"

alias gpr="git pull -r"

# Software shortcuts
alias uninstall_all_gems="gem uninstall --all -Ix"

# handy fixes
#alias fixy_perms="chmod -R 755 $(find . -type d) && chmod -R 644 $(find . -type f)"
alias serve="python -m SimpleHTTPServer 8080"

alias tig="tig status"

alias bl="brew list"
alias bo="brew outdated"
alias bu="brew update"
alias bi="brew info"
alias bs="brew search"
alias br="brew remove"

alias dst="find . -name ".DS_Store" -delete"

alias nvimplug="nvim +PlugInstall +UpdateRemotePlugins +qa && nvim +PlugClean! +UpdateRemotePlugins +qa"

alias df="duf"
alias du="dust"
alias dig="dog"


#####################################################

source $ZSH/oh-my-zsh.sh

archey -o

# (fortune && echo "\n" && cat ~/.dotfiles/motd) | pokemonsay
fortune | pokemonsay


eval "$(pyenv init --path)"
eval "$(rbenv init - zsh)"
eval "$(zoxide init zsh)"
eval "$(mcfly init zsh)"

# Start the starship
eval "$(starship init zsh)"
