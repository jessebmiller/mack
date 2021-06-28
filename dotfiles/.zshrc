export MACKPATH=$HOME/mack
source $MACKPATH/commands/command_not_found_handler.sh
source ~/.zsh_prompt
source ~/.zshenv
source ~/.zsh_secrets
source ~/.zprofile

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi


export PATH=$PATH:/home/jesse/bin
export PATH=$PATH:"$HOME/.radicle/bin:$PATH"
export PATH=$PATH:"$HOME/.yarn/bin:$PATH"

source '/home/jesse/lib/azure-cli/az.completion'

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
