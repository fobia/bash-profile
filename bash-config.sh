## bash files version 4.1-1

[ -z "$PS1" ] && return
[[ "$-" != *i* ]] && return

echo "# ${HOME}/.bash_config"


##
## Colors
##

# Локали (cygwin)
#export LANG=$(locale -uU)

# Подсветка директорий
if [ -f "/etc/DIR_COLORS" ]; then
  eval "$(dircolors -b /etc/DIR_COLORS)"
fi

# Основная строка приглашения
#   user@host:server and current_directory
# PS1='\[\e]0;\w\a\]\n\[\e[32m\]server \u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
# 
# С переводом на новую строчку
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '

# Без перевода на новую строчку
#PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\$ '

# Эффективно для рута, подсвечивает красным супераользователя
# PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[31;01m\]\u\[\e[0m\]@\h:\w\$ '
# 
# Для самого рута
# PS1="\[\e[31m\]\u\[\e[0m\]@\h: \w\a# "
# 
# Рут вошел через пользователя 
if [ "$(whoami)" = "root" ]; then
    echo "Welcome ROOT !"
    PS1='\[\e]0;\w\a\]\n\[\e[31;01m\]\u\[\e[0m\]\[\e[32m\]@\h \[\e[33m\]\w\[\e[0m\]\n\[\e[31;01m\]\$\[\e[0m\] '
fi
# -----------------------------------------------------------------------------


##
## bash_completion
##

# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f ~/.bash_completion ]] && . ~/.bash_completion

# [[ -f "/etc/bash_completion.d/git" ]] &&  . "/etc/bash_completion.d/git"

 
if [ -d ~/.local/bin ]; then 
  PATH="~/.local/bin:$PATH"
fi



##
## Shell Options
##

set meta-flag on
set convert-meta off
set input-meta on
set output-meta on

# Shell Options
# Make bash append rather than overwrite the history on disk
# shopt -s histappend


export EDITOR=vim

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# History Options
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:dir:www *:history*' # Ignore the ls command as well
export PROMPT_COMMAND="history -a"

# -----------------------------------------------------------------------------


##
## Aliases
##


# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias ls='ls --color=auto' #--file-type       # show differences in colour
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
# alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ll='ls -hAl -v --file-type --color=auto --group-directories-first --time-style=+%h\ %d\ %R'
# -----------------------------------------------------------------------------

# Functions

settitle ()
{
	echo -ne "\e]2;$@\a\e]1;$@\a";
}

# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
  local x2 the_new_dir adir index
  local -i cnt

  if [[ $1 ==  "--" ]]; then
    dirs -v
    return 0
  fi

  the_new_dir=$1
  [[ -z $1 ]] && the_new_dir=$HOME

  if [[ ${the_new_dir:0:1} == '-' ]]; then
    #
    # Extract dir N from dirs
    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
    adir=$(dirs +$index)
    [[ -z $adir ]] && return 1
    the_new_dir=$adir
  fi

  #
  # '~' has to be substituted by ${HOME}
  [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

  #
  # Now change to the new dir and add to the top of the stack
  pushd "${the_new_dir}" > /dev/null
  [[ $? -ne 0 ]] && return 1
  the_new_dir=$(pwd)

  #
  # Trim down everything beyond 11th entry
  popd -n +20 2>/dev/null 1>/dev/null

  #
  # Remove any other occurence of this dir, skipping the top of the stack
  for ((cnt=1; cnt <= 20; cnt++)); do
    x2=$(dirs +${cnt} 2>/dev/null)
    [[ $? -ne 0 ]] && return 0
    [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
    if [[ "${x2}" == "${the_new_dir}" ]]; then
      popd -n +$cnt 2>/dev/null 1>/dev/null
      cnt=cnt-1
    fi
  done

  return 0
}
alias cd=cd_func


_www_cd ()
{
    if [[ $1 != "" ]]; then
        cd /var/www/$1*
        # cd $1*
    else
        cd /var/www && return
    fi
}
alias www=_www_cd # cd localhost www dir


_pear_cd_dir ()
{
    if [[ $1 == "dir" ]]; then
        cd $(pear config-get php_dir)
        return 0
    fi

    pear $*
    return 0
}
alias pear=_pear_cd_dir
