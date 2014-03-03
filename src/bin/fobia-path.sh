#!/bin/sh

# Добавлят пут в список
# Удаляет дублирующии путь (в приоритетак первый найденый)

helpMessage()
{
    echo "Usage: $0 [PATH | -d PATH] ... "
    echo "  PATH     добавить путь в список"
    echo "  -d PATH  удалить путь из списка"
}

_epath()
{
    local PATH="$1"
    local DIR="$2"

# for arg in "$@"; do
#     case ${arg} in
#         --server_ip=* ) SERVER_IP=${arg/--server_ip=/} ;;
#         --server=* ) SERVER=${arg/--server=/} ;;
#     esac
# done

    edel=$(echo $DIR | sed 's/\//\\\//g') 
    
    # echo $e 
    echo ":$PATH:" | sed \
        -e "s/:${e}:/:/g" \
        -e "s/^:/${DIR}/" -e 's/:$//' 
}




_epath "$PATH" "/usr/bin" 

while [[ "$#" != 0 ]]; do
    case "$1" in
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

# echo ":$PATH:" | sed \
#  -e 's/:\/usr \/bin:/:/' \
#  -e 's/:\/usr\/sbin:/:/' \
#  -e 's/^://' \
#  -e 's/:$//' 


# PATH_TMP="$PATH:"
# while [[ "$#" != 0 ]]; do
#     case "$1" in
#         -d )  
#             shift
#             TMP=${PATH_TMP//:$1/:}
#             PATH_TMP="$TMP"
#             unset TMP
#             ;;
#          * )
#             PATH_TMP="$1:$PATH_TMP"
#             ;;     
#     esac
#     shift
# done

 # PATH_LIST=$(echo ${PATH_TMP//::/:} | sed 's/:/\n/g')