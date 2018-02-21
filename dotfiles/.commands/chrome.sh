#! /bin/zsh

# Try it
open "Google Chrome" $@
if [ $? -ne 0 ]
then # If it didn't work
    # Try to install it
    echo "Installing Google Chrome."
    brew cask install google-chrome

    # Then try it again
    open "Google Chrome"
fi
