let t_Co=256

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

plugins=(git history-substring-search rails bundler)

ZSH_THEME=juanghurtado
COMPLETION_WAITING_DOTS="true"

export EDITOR="/usr/local/bin/mate -w"
export REACT_EDITOR="idea"
export ANDROID_SDK_ROOT="/Users/jankeesvw/Library/Android/sdk"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export NODE_ENV=development

export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/share/npm/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export PATH="$HOME/Qt5.5.1/5.5/clang_64/bin:$PATH"
export PATH="/usr/local/opt/qt@5.5/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

eval "$(rbenv init -)"

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

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
