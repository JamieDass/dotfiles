export CLICOLOR=1
export LSCOLORS=exFxCxBxcxegedabagacfx
export PS1="\[\033[0;31m\][\h:\w]$\[\033[0m\] "
##
# Your previous /Users/jamie/.bash_profile file was backed up as /Users/jamie/.bash_profile.macports-saved_2010-07-02_at_15:32:20
##
###source /afs/desy.de/group/grid/UI/OSX10.6/etc/globus-user-env.sh
# MacPorts Installer addition on 2010-07-02_at_15:32:20: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


##
# Your previous /Users/jamie/.bash_profile file was backed up as /Users/jamie/.bash_profile.macports-saved_2010-07-02_at_15:39:30
##

# MacPorts Installer addition on 2010-07-02_at_15:39:30: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

export ROOTSYS=/usr/local/root
export PATH=$ROOTSYS/bin:$PATH
export LD_LIBRARY_PATH=$ROOTSYS/lib:$LD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=$ROOTSYS/lib:$DYLD_LIBRARY_PATH #(MacOS X only)
DYLD_LIBRARY_PATH=$HOME/boost/stage/lib:${DYLD_LIBRARY_PATH}
export DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib:$LD_LIBRARY_PATH
#export DYLD_LIBRARY_PATH=/System/Library/Frameworks/Python.framework/Versions/Current:$DYLD_LIBRARY_PATH
#source '/usr/local/root/bin/thisroot.sh'  #new
source '/Users/jamie/old_root/bin/thisroot.sh' #old
# Finished adapting your PATH environment variable for use with MacPorts.


test -r @PREFIX@/bin/init.sh && . @PREFIX@/bin/init.sh

test -r @PREFIX@/bin/init.sh && . @PREFIX@/bin/init.sh

test -r @PREFIX@/bin/init.sh && . @PREFIX@/bin/init.sh

test -r @PREFIX@/bin/init.sh && . @PREFIX@/bin/init.sh

test -r @PREFIX@/bin/init.sh && . @PREFIX@/bin/init.sh

test -r @PREFIX@/bin/init.sh && . @PREFIX@/bin/init.sh

test -r @PREFIX@/bin/init.sh && . @PREFIX@/bin/init.sh

test -r /sw/bin/init.sh && . /sw/bin/init.sh

##
# Your previous /Users/jamie/.bash_profile file was backed up as /Users/jamie/.bash_profile.macports-saved_2010-11-29_at_10:51:18
##

# MacPorts Installer addition on 2010-11-29_at_10:51:18: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
##
# Your previous /Users/jamie/.bash_profile file was backed up as /Users/jamie/.bash_profile.macports-saved_2013-10-30_at_12:54:43
##

# MacPorts Installer addition on 2013-10-30_at_12:54:43: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# function local_dir_and_within {
# __LAST="${PWD##*/}"
# __IN="${PWD%/*}"
# __IN="${__IN/#$HOME/~}"
# TITLE_TAB="$__LAST"
# echo -n $TITLE_TAB
# }
#  export PROMPT_COMMAND='echo -ne "\033]0;$(local_dir_and_within)\007"'

function set_tab_title {
  echo -n -e "\033]0;${PWD##*/}\007"
}

PROMPT_COMMAND="set_tab_title;$PROMPT_COMMAND"
export PATH=/usr/local/apache-ant/bin:"$PATH"
