export MACKPATH=$HOME/mack
source $MACKPATH/commands/command_not_found_handler.sh
source ~/.zsh_prompt
source ~/.zshenv

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jesse/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jesse/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jesse/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jesse/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="/Applications/HoloSqape.app/Contents/MacOS:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
