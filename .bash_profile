# Terminal custom
export PS1='\[\e[0;1;97m\]\u\[\e[0m\]@\[\e[0;38;5;246m\]\H\[\e[0m\]#\[\e[0;38;5;39m\]\w\[\e[0m\][\[\e[0;1;38;5;46m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\]]\[\e[0m\]$ \[\e[0m\]'

# Useful system cmds
alias bash-edit='vim ~/.bash_profile'
alias bash-info='cat ~/.bash_profile'
alias ls='ls -la --color=auto'
alias text='open gedit'
alias cd..='cd ..'

# DOCKER
alias docker-status='docker ps -a'
alias docker-down='docker stop $(docker ps -aq) && docker rm $(docker ps -aq)'
alias docker-prune='docker system prune -a && docker rmi $(docker images -a -q)'

# GIT
alias gs='git status'
alias gc='git commit'
alias gp='git push origin'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gd='git diff origin/master -- '
alias gaa='git add --all'

# CONFIG
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# FIX
export CLOUDSDK_PYTHON='/usr/bin/python3'
export LD_LIBRARY_PATH=/usr/local/lib

# CONFIDENTIAL
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/Documentos/secret/cerc2-book-stg-01-7f491d4a32b7.json"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google/google-cloud-sdk/path.bash.inc' ]; then . '/opt/google/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google/google-cloud-sdk/completion.bash.inc' ]; then . '/opt/google/google-cloud-sdk/completion.bash.inc'; fi
