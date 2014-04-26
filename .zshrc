# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="custom-bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
bt_push()
{
    ussp-push 00:1D:07:69:C1:D0@4 $1 `basename $1`
}
alias bluetooth-push=bt_push
alias mysql='mysql --sigint-ignore'
alias ack=ack-grep

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux django mercurial pip python virtualenv virtualenvwrapper jump lein redis-cli zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# virtualenvwrapper
[[ -f /usr/local/bin/virtualenvwrapper.sh ]] && {
    export WORKON_HOME=~/.envs/
    source /usr/local/bin/virtualenvwrapper.sh
}
export EDITOR=vim
export BROWSER=firefox
export LC_CTYPE=uk_UA.UTF-8
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist norelativenumber' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
export GIT_PAGER=less

export GOPATH=/home/settler/gocode 

export PATH=$PATH:$HOME/.gem/ruby/1.9.1/bin:$GOPATH/bin
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache


# extract zip archives
convmv-unzip() {
        convmv -f iso8859-1 -t cp850 -r --notest --nosmart $1
        NEW_NAME=`echo $1 | iconv -f iso8859-1 -tcp850`
        convmv -f cp866 -t utf8 -r --notest --nosmart $NEW_NAME
}

bindkey '\e.' insert-last-word
unsetopt nomatch
unsetopt correctall
[[ -s "$HOME/.pythonbrew/etc/bashrc" ]] && source "$HOME/.pythonbrew/etc/bashrc"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
