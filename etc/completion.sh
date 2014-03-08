## bash files version 4.1-1

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


##
## bash_completion
##

# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f ~/.bash_completion ]] && . ~/.bash_completion

[[ -f "/etc/bash_completion.d/git" ]] &&  . "/etc/bash_completion.d/git"
[[ -f "/etc/bash_completion.d/yandex-disk-completion.bash" ]] &&  . "/etc/bash_completion.d/yandex-disk-completion.bash"

 
if [ -d ~/.local/bin ]; then 
  PATH="~/.local/bin:$PATH"
fi

