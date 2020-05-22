help() {
    # Display helpful functions
    echo "dotfiles: reinstall dotfiles"
    echo "clone: clone stuff from your repo"
}

dotfiles() {
    # Reinstall dotfiles
    $(which zsh) $MACKPATH/dotfiles/install.sh
    $(which zsh)
}

clone() {
    # Clone a repo from your github
    # This really is only ever a dependancy for working with a repo locally
    # can this be abstracted furthur?
    git clone git@github.com:jessebmiller/$1.git
}

# use double quotes so the shell commands in the emacs command will execute
alias emacs="$(cat $MACKPATH/commands/emacs.sh)" # Whatever the emacs command is
alias ls='ls -G' # list with color
alias ll='ls -Ghl' # list with color, readable filesize, long format
alias la='ls -Ghla' # list with color, readable, long, and hidden
