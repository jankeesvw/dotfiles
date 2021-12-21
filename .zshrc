ZSH=$HOME/.oh-my-zsh

plugins=(git history-substring-search rails docker bundler)

ZSH_THEME=juanghurtado
COMPLETION_WAITING_DOTS="true"

export EDITOR="/usr/local/bin/mate -w"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NODE_ENV=development

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="/usr/local/bin/rubocop-daemon-wrapper:$PATH"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use >/dev/null 2>&1
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    nvm use default >/dev/null 2>&1
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT="${ret_status}"

eval "$(rbenv init -)"