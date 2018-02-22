command_not_found_handler() {
    ls "$HOME/.commands/$1.sh"
    if [ -f "$HOME/.commands/$1.sh" ]; then
        $(which zsh) "$HOME/.commands/$1.sh" "${@:2}"
    else
        echo "$1: command not found"
        return 127
    fi
}
