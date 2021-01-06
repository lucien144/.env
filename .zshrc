###############
# Zplug init
###############
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

###############
# PATHS
###############
export PATH=$HOME/bin:/usr/local/bin$PATH:/Applications/SDKs/flutter/bin:~/.npm-global/bin:$HOME/.composer/vendor/bin
export ZSH="~/.oh-my-zsh"

###############
# CUSTOM
###############

function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

# UP/DOWN arr search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

###############
# Zplug plugins
###############

autoload colors && colors
setopt prompt_subst

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
zplug "woefe/git-prompt.zsh"
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "plugins/colorize", from:oh-my-zsh
zplug "b4b4r07/enhancd"
zplug "djui/alias-tips"
#zplug 'dracula/zsh', as:theme
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

###############
# Aliases
###############

alias tmp="cd ~/Downloads/tmp/"
alias l="ls -la"
alias c8="cd ~/htdocs/circul8/"
alias ..="cd .."
alias ...="cd .. && cd .."

zplug check || zplug install
zplug load
