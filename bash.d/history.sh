## bash files version 4.1-1

# History Options
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls:dir:www *:history*' # Ignore the ls command as well
export PROMPT_COMMAND="history -a"
