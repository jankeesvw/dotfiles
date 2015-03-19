let t_Co=256

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

plugins=(git history-substring-search osx rails pow powder rbenv bundler rake-fast)

ZSH_THEME=juanghurtado
COMPLETION_WAITING_DOTS="true"

export EDITOR="/usr/local/bin/mate -w"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/share/npm/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"

eval "$(rbenv init -)"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
