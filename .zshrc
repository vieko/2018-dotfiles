# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/vieko/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  github
  git-flow-avh
  aws
  osx
  npm
  tmux
  pyenv
  web-search
  # gpg-agent
  # shrink-path
  common-aliases
  last-working-dir
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# pure prompt
autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=⚡
PURE_GIT_UP_ARROW=
PURE_GIT_DOWN_ARROW=
prompt pure

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# TEMP EXPORTS
export AWS_PROFILE=loadmin
export EDITOR='nvim'
export GPG_TTY=$(tty)
export LOCAL="--endpoint-url http://localhost:8000"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ssh='TERM=xterm-256color ssh'
alias vim='nvim'
alias vi='nvim'
alias afk='pmset sleepnow'
alias nvimrc='nvim ~/dotfiles/nvim/'

# Start / Stop / Restart Services
alias mongo.start="brew services start mongodb"
alias mongo.stop="brew services stop mongodb"
alias mongo.restart="brew services restart mongodb"
alias redis.start="brew services start redis"
alias redis.stop="brew services stop redis"
alias redis.restart="brew services restart redis"
alias nginx.start="sudo brew services start nginx"
alias nginx.stop="sudo brew services stop nginx"
alias nginx.restart="sudo brew services restart nginx"
alias php.start="sudo brew services start php"
alias php.stop="sudo brew services stop php"
alias php.restart="sudo brew services restart php"
alias mysql.start="brew services start mysql"
alias mysql.stop="brew services stop mysql"
alias mysql.restart="brew services restart mysql"
alias dnsmasq.start="sudo brew services start dnsmasq"
alias dnsmasq.stop="sudo brew services stop dnsmasq"
alias dnsmasq.restart="sudo brew services restart dnsmasq"
alias dynamodb.start="java -Djava.library.path=./dynamodb/DynamoDBLocal_lib -jar ./dynamodb/DynamoDBLocal.jar -sharedDb" 

# Service General
alias services.list="brew services list"
alias nginx.dir="cd /usr/local/etc/nignx"

# Log Services
alias nginx.logs.error="tail -250f /usr/local/etc/nginx/logs/error.log"
alias nginx.logs.access="tail -250f /usr/local/etc/nginx/logs/access.log"
alias nginx.logs.goodshepherd.access="tail -250f /usr/local/etc/nginx/logs/goodshepherd.test-access.log"
alias nginx.logs.goodshepherd.error="tail -250f /usr/local/etc/nginx/logs/goodshepherd.test-error.log"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
