command_not_found_handler() {
    if [ -f "$MACKPATH/commands/$1.sh" ]; then
        $(which zsh) "$MACKPATH/commands/$1.sh" "${@:2}"
    else
        echo "$1: command not found"
        return 127
    fi
}
