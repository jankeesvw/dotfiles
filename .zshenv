#### Git aliases ####
alias gac="git add .;git commit -a -v"  #git add and commit
alias gl="git log --pretty=format:'%h - %an, %ar: %s'" # show a nice log: 'Jankees van Woezik, 3 days ago : Log meisters readme file'
alias gs="git status"
alias gm="git checkout master"
alias gx="gitx --all"
alias gb="git branch -a"
alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"
alias gpr="git pull -r"
alias semver="git semver-tags"
alias prune_branches='git checkout master && git fetch && git remote prune origin && git branch --merged master | grep -v "master$" | xargs git branch -d'

#### PROJECTS SPECIFIC ALIASES ####
alias work="cd ~/Documents/"
alias base42="cd /Users/jankeesvw/Documents/Base42/"
alias workaway="cd /Users/jankeesvw/Documents/workaway"
alias treehouse="cd /Users/jankeesvw/Documents/treehouse"
alias jankeesvw="cd /Users/jankeesvw/Dropbox/jankeesvw.com"
alias tango="cd /Users/jankeesvw/Documents/Timi/timi"
alias timi="cd /Users/jankeesvw/Documents/Timi/timi"

#### System  specific aliases ####
alias l="ls -alG"
alias aliases="vim ~/dotfiles/.zshenv && source ~/.zshrc"
alias finderS='defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder'
alias finderH='defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder'
alias migrate="rake db:migrate db:test:clone"
alias s="rails server"
alias belp="bundle exec localeapp pull"
alias pull="git pull -r"
alias spec="rake spec"
alias bi="bundle install"
alias db_reset='rake db:drop db:create db:migrate && rake db:seed db:test:clone'
alias apache_log='tail -f /private/var/log/apache2/error_log'
alias integration="bundle exec rspec spec --format nested -t integration"
alias reload="source ~/.zshrc"
alias tmux="TERM=screen-256color-bce tmux"

unsetopt correct_all

export DISABLE_COVERAGE=true

