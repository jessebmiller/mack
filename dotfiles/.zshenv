dotfiles() {
    # Reinstall dotfiles
    $(which zsh) $MACKPATH/dotfiles/install.sh
    $(which zsh)
}

help() {
    # Display helpful functions
    echo "dotfiles: reinstall dotfiles"
}

# use double quotes so the shell commands in the emacs command will execute
alias emacs="$(cat $MACKPATH/commands/emacs.sh)" # Whatever the emacs command is
alias ls='ls -G' # list with color
alias ll='ls -Ghl' # list with color, readable filesize, long format
alias la='ls -Ghla' # list with color, readable, long, and hidden
