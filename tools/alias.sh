# ~/.bash_aliases

alias dc="/usr/bin/docker-compose"
alias drun="/bin/docker run"
alias dimg="/bin/docker images"
alias dps='docker ps --format "table {{.Label \"com.docker.compose.service\"}} {{.ID}} {{.Image}} {{.Command}} {{.CreatedAt}} {{.Status}} {{.Names}} {{.Ports}}" $*'
alias dcp="/bin/docker cp"
alias dexec="/bin/docker exec -it"
alias drm="/bin/docker rm"
alias drmi="/bin/docker rmi"
alias dstop="/bin/docker stop"
alias dstart="/bin/docker start"
alias dexec="/bin/docker exec"
alias dbuild="/bin/docker build"
alias dgc='/bin/docker rmi $(/bin/docker images -q -f dangling=true)'
alias settls='. /depot/forge/settls $1'
alias unsettls='. /depot/forge/unsettls'
alias gitlogpath='git log --follow --all -p $*'
alias gitlist='git show --pretty="format:" --name-only $1'
alias gitlog='git log --graph --decorate --oneline'
alias gitco='git checkout'

