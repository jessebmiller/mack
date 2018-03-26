#! /bin/zsh

# Try it
open -a iTerm "$@"

# If it didn't work
if [ $? -ne 0 ]; then

    # Try to install it
    echo "Installing iterm2"
    brew cask install iterm2

    # Then try it again
    open -a iTerm "$@"
fi

