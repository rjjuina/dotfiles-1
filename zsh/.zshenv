if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
    export ANDROID_HOME='/opt/android-sdk'
    export PATH=/opt/ruby2.4/bin:$PATH
    # ...
else [[ "$OSTYPE" == "darwin"* ]];
    # Mac OSX
    export ANDROID_HOME='/usr/local/share/android-sdk'
    export JAVA_HOME="$(/usr/libexec/java_home)"
    export GOPATH=$HOME/go
    export SCALA_HOME=/usr/local/opt/scala/idea
    export JDK_HOME="$(/usr/libexec/java_home)"
    export PATH=/usr/local/sbin:$PATH
    export PATH=/usr/local/bin:$PATH
fi

export PATH=$HOME/.local/bin/:$PATH
export PATH=$HOME/.yarn/bin/:$PATH
export PATH=$HOME/.nix-profile/bin/:$PATH
# export PATH=$HOME/.gem/ruby/2.5.0/bin:$PATH

export GTAGSLABEL=pygments

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color
export HISTCONTROL=ignoreboth:erasedups

export GHTOKEN="ad38f8a815e974c98db2abd6f5ff304eca53400f"

# export https_proxy=http://127.0.0.1:64396
# export http_proxy=$https_proxy
# ftp_proxy = $https_proxy

#android
alias eml='/usr/local/share/android-sdk/emulator/emulator -avd Nexus_S_API_25'

# Postgress Env
export PGHOST=localhost
export PGPORT=5432
export PGDATA='/usr/local/var/postgres'

# Leadiq env
export DATABASE_URL="jdbc:postgresql://localhost/pg_dev"
export LEAD_SEARCH_ENABLE=true
export LEAD_SEARCH_HOST="localhost"
export LEAD_SEARCH_PORT="9300"
export LEAD_SEARCH_CLUSTER_NAME="elasticsearch_xiongchenyu"
export DATA_SCRIPTS_ES_CLUSTER_NAME="elasticsearch_xiongchenyu"
export DATA_SCRIPTS_ES_URI="localhost:9300"
#export LEADIQ_DEV_DOCKER_VOLUMES="/Volumes/mongo/docker"

# UniwebPay Env
export Uniwebpay_Mysql_U="root"
export Uniwebpay_Mysql_P=""
export Uniwebpay_Url="http://localhost:9000"
# Hashnest Env
#
export MYSQL_USER="root"
export MYSQL_PASSWORD=""
export TEST_ENV_NUMVER=1
# amazon
alias vim='nvim'
alias git=hub
alias yolo='git commit -m "$(curl -s whatthecommit.com/index.txt)"'
alias ef='f -e emacsclient -n'
alias ensime="gtags & sbt clean ensimeConfig test:compile ensimeServerIndex"
export NIX_PATH=$NIX_PATH:$HOME/.nix-defexpr/channels
export SBT_OPTS="-Xmx8G"
export EDITOR="emacsclient"

export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

export NODE_PATH=$HOME/.config/yarn/global/node_modules

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
