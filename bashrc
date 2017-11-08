GLOBUS_LOCATION=/opt/ldg
export GLOBUS_LOCATION
alias ll="ls -l"
alias desy="source ~/desy_ssh"
alias naf="source ~/naf"
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias sscp="scp $1 dassoula@atlas31.desy.de:~/www/files/."
alias countChar="source /Users/jamie/Documents/Work/ATLMCPROD/countChars.sh ."
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d'
alias nrao="ssh -Y jdassoul@ssh.aoc.nrao.edu"
alias nvnc="ssh -N -C -L 5901:casa-dev-10.aoc.nrao.edu:5901 jdassoul@ssh.aoc.nrao.edu"

if [ -f ${GLOBUS_LOCATION}/etc/globus-user-env.sh ] ; then
    . ${GLOBUS_LOCATION}/etc/globus-user-env.sh
fi
function mkalias()
{
    if [[ $1 && $2 ]]
    then
        echo "alias $1=\"$2\"" >> ~/.bashrc
        alias $1="$2"
    fi;
}
function univ() {
    #do things with parameters like $1 such as
    ssh -XY dassoula@thuner-gw$1.cpp.ualberta.ca
}
alias ua=univ
function rl()
{
    if [ -f ~/rootlogon.C ]
    then
	mv ~/rootlogon.C ~/rootlogonj.C
	echo   "rootlogonj.C"
    else
	mv ~/rootlogonj.C ~/rootlogon.C
	echo   "rootlogon.C"
    fi;
}
function xd()
{
    if [[ $@ == -* ]]; then
        echo "ok"
	cd $1;
    fi
    cd $1;

}

_ocd() {
    local cmd="${1##*/}"
    local cur opts drs
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(dirs -v)
if [[ ${cur} == -* ]]; then
   printf "\n"
   echo "$opts"
fi;

#    printf "\n"
#    echo "$opts"
}

_wcd() {
#    set completion-display-width 1
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(dirs -v)
    printf "\n"
    echo "$opts"
 #   COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
#    COMPREPLY=($(compgen -W "$opts" -- ${cur}))
}
#export PROMPT_COMMAND='history -a'
complete -F _wcd zd
complete -d cd
complete -F _ocd jd
alias jd=cd

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=200000
HISTFILESIZE=200000

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=200000
export HISTSIZE=200000
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
export QT5PATH=/Users/jamie/Qt5.7/5.7/clang_64/bin
export CARTAWORKHOME=/Users/jamie/cartawork
export PATH=/opt/casa/02/bin:$PATH
export PATH=$HOME/Qt5.7/5.7/clang_64/bin:$PATH

source acd_func.sh
