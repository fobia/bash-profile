#!/bin/sh


# echo "Color list:"



__f_getcolor()
{
    echo "\033[00;30m 00;30m \033[00m \033[02;30m 02;30m \033[00m \033[01;30m 01;30m \033[00m \033[01;40m 01;40m \033[00m"
    echo "\033[00;31m 00;31m \033[00m \033[02;31m 02;31m \033[00m \033[01;31m 01;31m \033[00m \033[01;41m 01;41m \033[00m"
    echo "\033[00;32m 00;32m \033[00m \033[02;32m 02;32m \033[00m \033[01;32m 01;32m \033[00m \033[01;42m 01;42m \033[00m"
    echo "\033[00;33m 00;33m \033[00m \033[02;33m 02;33m \033[00m \033[01;33m 01;33m \033[00m \033[01;43m 01;43m \033[00m"
    echo "\033[00;34m 00;34m \033[00m \033[02;34m 02;34m \033[00m \033[01;34m 01;34m \033[00m \033[01;44m 01;44m \033[00m"
    echo "\033[00;35m 00;35m \033[00m \033[02;35m 02;35m \033[00m \033[01;35m 01;35m \033[00m \033[01;45m 01;45m \033[00m"
    echo "\033[00;36m 00;36m \033[00m \033[02;36m 02;36m \033[00m \033[01;36m 01;36m \033[00m \033[01;46m 01;46m \033[00m"
    echo "\033[00;37m 00;37m \033[00m \033[02;37m 02;37m \033[00m \033[01;37m 01;37m \033[00m \033[01;47m 01;47m \033[00m"
}

pr_msg() {
    echo $*
}

setps1()
{

    case "$1" in
        1 )
            pr_msg "Основная строка приглашения"
            #   user@host:server and current_directory
            PS1='\[\e]0;\w\a\]\n\[\e[32m\]server \u@\h \[\e[33m\]\w\[\e[0m\]\n\$ ' ;;
        2 )
            pr_msg "С переводом на новую строчку"
            PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ ' ;;   
        3 )
            pr_msg "Без перевода на новую строчку"
            PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\$ ' ;;
        4 )
            pr_msg "Эффективно для рута, подсвечивает красным супераользователя"
            # PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\e[31;01m\]\u\[\e[0m\]@\h:\w\$ ' ;;
            PS1='\[\e]0;\w\a\]\n'
            PS1="$PS1["
            PS1="$PS1"'\[\e[31;01m\]\u'
            PS1="$PS1"'\[\e[0m\]@\h'
            PS1="$PS1"'\[\e[33m\]\w'
            PS1="$PS1"'\[\e[0m\]] $ ' 
            ;;

        5 )
             pr_msg "Для самого рута"
            PS1="\[\e[31m\]\u\[\e[0m\]@\h: \w\a# " ;;    
        6 )
            pr_msg "Рут вошел через пользователя" 
            # echo "Welcome ROOT !"
            PS1='\[\e]0;\w\a\]\n\[\e[31;01m\]\u\[\e[0m\]\[\e[32m\]@\h \[\e[33m\]\w\[\e[0m\]\n\[\e[31;01m\]\$\[\e[0m\] ' ;;

        * )
            pr_msg "default"
            PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ ' ;; 
    esac
    export PS1
}

# setps1 $*

# getcolor
# {
#     _color="$1"
#     _bg="$2"
# }

# black
# red
# green
# yellow
# blue
# pink
# bluel
# white

# __f_getcolor