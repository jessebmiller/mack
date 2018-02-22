#! /bin/zsh
echo "$@"
# Try it
open -a "Google Chrome" "$@"

# If it didn't work
if [ $? -ne 0 ]; then

    # Try to install it
    echo "Installing Google Chrome."
    brew cask install google-chrome

    # Then try it again
    open -a "Google Chrome" "$@"
fi
