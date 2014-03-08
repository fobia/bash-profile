## bash files version 4.1-1


# Добавлят пут в список
# Удаляет дублирующии путь (в приоритетак первый найденый)

function _fobia_path()
{
    case "$1" in
        -h | --help | help )
            echo "Usage: $0 PATH | -d PATH "
            echo "  PATH     добавить путь в список"
            echo "  -d PATH  удалить путь из списка"
            return
            ;;
        -d )
            shift
            local DIR=""
            ;;
        * ) 
            local DIR="$1"
            ;;
    esac

    local e=$(echo $1 | sed 's/\//\\\//g' ) 
    
    echo "$DIR"$( echo ":$PATH:" | sed "s/:${e}:/:/g" ) | sed "s/^://" | sed "s/:$//" 
}

