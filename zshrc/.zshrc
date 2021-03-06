# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/vincentchang/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Lyft stuff
source '/Users/vincentchang/src/blessclient/lyftprofile'

# Vi bindings on prompt
set -o vi
bindkey -v
bindkey '^R' history-incremental-search-backward

# Aliases
alias ctags="`brew --prefix`/bin/ctags" 
alias ct="ctags -R -f ./.tags ."
alias a='ag --noheading -S'
alias al='a -l'

#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

sshOneboxFunc() {
    if [ $# -eq 2 ]; then
        ~/src/blessclient/ssh_wrapper.sh -oStrictHostKeyChecking=no $2-legacy-$1-onebox.dev.lyft.net
    elif [ $# -eq 1 ]; then
        ~/src/blessclient/ssh_wrapper.sh -oStrictHostKeyChecking=no $1-onebox.dev.lyft.net
    else
        ~/src/blessclient/ssh_wrapper.sh -oStrictHostKeyChecking=no vc-onebox.dev.lyft.net
    fi
}
alias onebox=sshOneboxFunc

function syncOneboxFunc() {
    eval "~/src/ops/hacktools/sync-to-onebox-v3.sh "$1"-legacy-"$2"-onebox.dev.lyft.net"
}
alias oneboxs=syncOneboxFunc
alias r='exec bash'

# Allows you to page up and down with ctrl-{f,b} in FZF
export FZF_DEFAULT_OPTS='--bind ctrl-f:page-down,ctrl-b:page-up'

# Go
export GOPATH=~/src/go
export PATH=$GOPATH/bin:$PATH

# Android
export ANDROID_HOME=/Users/vincentchang/Library/Android/sdk

function safeterm {
  # Term nodes by AWS ID or IP

  for arg in "$@"
  do
    if [[ "$arg" =~ ^([0-9]+\.){3}[0-9]+$ ]]
    then
      addr="$arg"
    else
      addr="i-$arg.ln"
    fi

    ssh -o StrictHostKeyChecking=no "$addr" 'sudo /etc/service/envoy/web-off.sh; sudo shutdown -h now' &
  done
}
export LYFT_CODE_ROOT=$GOPATH/src/github.com/lyft

alias runlyft="aws-okta exec zimride-client-team-access-readonly -- runlyft"

alias ga='git add'
alias gaa='git add -A'
alias gb='git status | head -1 | awk '\''{print $3}'\'' | pbcopy'
alias gbr='git branch'
alias gce='git commit --allow-empty-message -m '\'''\'' '
alias gcm='git commit -m'
alias gcmn='git commit --no-verify -m'
alias gco='git checkout'
alias gdf='git diff'
alias gf='git fetch'
alias gft='git fetch'
alias glg='git log'
alias gmg='git merge'
alias gpl='git pull'
alias gps='git push'
alias gst='git status'

PATH=$PATH:/Users/vincentchang/.lyftkube-bin
alias runlyft="aws-okta exec zimride-client-team-access-readonly -- runlyft"
alias okta="aws-okta exec zimride-sudo-developer -- $SHELL"
