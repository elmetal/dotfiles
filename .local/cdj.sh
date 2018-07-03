# cdj 
# enhanced cd
function cdj {
    ### cdj require env CDJ_DIR_MAP (array value)
    # CDJ_DIR_MAP example
    # diralias dirpath
#     export CDJ_DIR_MAP=(
#         dbox ~/Dropbox
#         cvs  ~/cvs
#         etc  /etc
#         );
    test -n "$DEBUG" && echo "DEBUG: dir arg=$arg #CDJ_DIR_MAP=${#CDJ_DIR_MAP[*]}" 
    declare arg=$1 \
            subarg=$2 \
            dir i key value warn
    if [ -z "$arg" -o "$arg" = "-h" ] || [ "$arg" = "-v" -a -z "$subarg" ] ; then
        ### help and usage mode
        echo "Usage: $FUNCNAME <directory_alias>"
        echo "       $FUNCNAME [-h|-v|-l <directory_alias>]"
        echo "-h: help"
        echo "-l: list defined lists"
        echo "-v <directory_alias>: view path specify alias."
        return
    elif [ "$arg" = "-v" -o "$arg" = "-l" ] ; then 
        ### view detail mode
        for (( i=0; $i<${#CDJ_DIR_MAP[*]}; i=$((i+2)) )) ; do
            key="${CDJ_DIR_MAP[$i]}"
            value="${CDJ_DIR_MAP[$((i+1))]}"
            if [ "$arg" = "-l" ] ; then
                if [ ! -d "$value" ] ; then
                    warn=" ***NOT_FOUND***"
                else
                    warn=""
                fi
                printf "%8s => %s%s\n" "$key" "$value" "$warn"
            elif [ "$arg" = "-v" ] ; then
                if [ "$key" = "$subarg" ] ; then
                    echo $value
                    return
                fi
            fi
        done
        return
    fi
    ### change directory mode
    for (( i=0; $i<${#CDJ_DIR_MAP[*]}; i=$((i+2)) )) ; do
        key="${CDJ_DIR_MAP[$i]}"
        value="${CDJ_DIR_MAP[$((i+1))]}"
        test -n "$DEBUG" && echo "$key => $value"
        if [ "$key" = "$arg" ] ; then
            if [ -n "$subarg" ] ; then
                dir="$value/$subarg"
            else
                dir="$value"
            fi
            cd "$dir"
            return
        fi
    done
    echo "directory alias \"$arg\" is not found"
    return 1
}

type cdj >/dev/null 2>&1 &&
_cdj()
{
    local cur prev opts i
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(for i in $(seq 0 2 $((${#CDJ_DIR_MAP[*]}-2)) ) ; do echo ${CDJ_DIR_MAP[$i]} ; done ; echo "-h -v -l")
    #echo ""
    #echo "> cur=$cur prev=$prev COMP_CWORD=$COMP_CWORD"
    #echo "> opts=$opts"
    #echo "> COMPWORDS=${COMP_WORDS[*]}"

    case ${prev} in
        -l)
            opts=$(for i in $(seq 0 2 $((${#CDJ_DIR_MAP[*]}-2)) ) ; do echo ${CDJ_DIR_MAP[$i]} ; done)
            COMPREPLY=( $(compgen -W "$opts" -- ${cur} ))
            return 0
            ;;
        *)
            ;;
    esac

    COMPREPLY=( $(compgen -W "$opts" -- ${cur} ))
    return 0
} &&
complete -F _cdj cdj
