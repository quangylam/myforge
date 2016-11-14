# ~/.bash_aliases

alias dc="docker-compose"
alias drun="docker run"
alias dimg="docker images"
alias dps='docker ps --format "table {{.Label \"com.docker.compose.service\"}} {{.ID}} {{.Image}} {{.Command}} {{.CreatedAt}} {{.Status}} {{.Names}} {{.Ports}}" $*'
alias dcp="docker cp"
alias dexec="docker exec -it"
alias drm="docker rm"
alias drmi="docker rmi"
alias dstop="docker stop"
alias dstart="docker start"
alias dexec="docker exec"
alias dbuild="docker build"
alias dgc='docker rmi $(docker images -q -f dangling=true)'
alias settls='. /depot/forge/settls $1'
alias unsettls='. /depot/forge/unsettls'
alias gitlogpath='git log --follow --all -p $*'
alias gitlist='git show --pretty="format:" --name-only $1'
alias gitlog='git log --graph --decorate --oneline'
alias gitco='git checkout'

