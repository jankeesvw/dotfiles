let t_Co=256

ZSH=$HOME/.oh-my-zsh

plugins=(git history-substring-search rails docker bundler)

ZSH_THEME=juanghurtado
COMPLETION_WAITING_DOTS="true"

export EDITOR="/usr/local/bin/mate -w"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

eval "$(rbenv init -)"

export ANDROID_HOME="/Users/jankeesvw/Library/Android/sdk"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NODE_ENV=development

export PATH="$PATH:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools/"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT="${ret_status}"