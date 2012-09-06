function parse_git_branch {
git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
local        BLUE="\[\033[0;34m\]"
local         RED="\[\033[0;31m\]"
local   LIGHT_RED="\[\033[1;31m\]"
local       GREEN="\[\033[0;32m\]"
local LIGHT_GREEN="\[\033[1;32m\]"
local       WHITE="\[\033[1;37m\]"
local  LIGHT_GRAY="\[\033[0;37m\]"
case $TERM in
    xterm*)
        TITLEBAR='\[\033]0;\u@\h:\w\007\]'
        ;;
    *)
        TITLEBAR=""
        ;;
esac

PS1="${TITLEBAR}\
$BLUE[$GREEN\$(date +%H:%M)$BLUE]\
$BLUE[$GREEN\u$BLUE][$GREEN\w$RED\$(parse_git_branch)$BLUE]\
 \$ \e[0m"
PS2='> '
PS4='+ '
}
proml

export JDK_HOME=/usr/local/jdk1.7.0_04
 
export JRE_HOME=/usr/local/jdk1.7.0_04/jre
 
export CLASSPATH=.:$JDK_HOME/lib/dt.jar:$JDK_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
 
export PATH=$PATH:$JDK_HOME/bin:$JRE_HOME/bin
