#!/bin/bash

# Добавлят пут в список
# Удаляет дублирующии путь (в приоритетак первый найденый)

helpMessage()
{
    echo "Usage: $0 [PATH | -d PATH] ... "
    echo "  PATH     добавить путь в список"
    echo "  -d PATH  удалить путь из списка"
}


PATH_TMP="$PATH:"
while [[ "$#" != 0 ]]; do
    case "$1" in
        -h|--help|help )
            helpMessage
            exit
            ;;
        -d )  
            shift
            TMP=${PATH_TMP//:$1/:}
            PATH_TMP="$TMP"
            unset TMP
            ;;
         * )
            PATH_TMP="$1:$PATH_TMP"
            ;;     
    esac
    shift
done

PATH_LIST=$(echo ${PATH_TMP//::/:} | sed 's/:/\n/g')
unset PATH_TMP

PATH_NEW=
for i in $PATH_LIST
do
    # echo "$i"
    if [[ "$PATH_NEW" != *:$i* ]]; then
        PATH_NEW="$PATH_NEW:$i"
    # else
        # echo "Повтор $i :: $PATH_NEW"
    fi
done
PATH=${PATH_NEW:1}
unset PATH_NEW PATH_TMP PATH_LIST


echo $PATH

