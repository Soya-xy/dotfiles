# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

ZSH_THEME="powerlevel10k/powerlevel10k"
# export

# GOLANG
export GOROOT=/usr/local/go 
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin
export GOPROXY=https://goproxy.cn,direct
export GOPRIVATE=gitee.com

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"


# alias

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# List all files colorized in long format
alias l="ls -lF ${colorflag}"
# List all files colorized in long format, excluding . and ..
alias la="ls -lAF ${colorflag}"
# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"
# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# my alias
alias myserve="ssh root@150.158.90.60"
alias ip="ipconfig getifaddr en0"

# docker
alias d="docker-compose"
# tmux
alias tnew="tmux new -s"
alias tlog="tmux attach-session -t"
# ni
alias nio="ni --prefer-offline"
alias nd="nr dev"
alias s="nr start"
alias b="nr build"
alias bw="nr build --watch"
alias r="nr"
# git
alias g='git'
alias ga='git add'
alias gs='git status'
alias gcm='git commit -m'
alias gcam='git add -A && git commit -m'
alias gp='git push'
alias gpl='git pull --rebase'
alias gc='git clone'


# 自动生成.gitignore
ignore() {
  if [ -f ".gitignore" ]; then
    echo "gitignore已存在"
    return
  fi
  echo "...正在生成.gitignore"
  touch .gitignore                                                                                                                                # 创建文件
  echo "*.DS_Store  \nnode_modules \n*.log \nidea/ \n*.local \n.DS_Store \ndist \n.cache \n.idea \nlogs \n&-debug.log \n*-error.log" >>.gitignore # 添加内容
}

#设置代理
function proxy_on() {
    export http_proxy="http://127.0.0.1:7890"
    export https_proxy=$http_proxy
    export all_proxy="socks5://127.0.0.1:7890" # or this line
    echo -e "已开启代理"
}

function proxy_off(){
    unset http_proxy
    unset https_proxy
    unset all_proxy
    unset no_proxy
    echo -e "已关闭代理"
}



# p10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /Users/soya/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/soya/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh



# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
	export LS_COLORS='no=00:fi=00:di=01;31:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
else # macOS `ls`
	colorflag="-G"
	export LSCOLORS='BxBxhxDxfxhxhxhxhxcxcx'
fi
