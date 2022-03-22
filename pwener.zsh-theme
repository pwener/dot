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


function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST
export PROMPT='%B%n%b@%F{white}%m%f#%F{33}%~%f$(parse_git_branch)$ '
