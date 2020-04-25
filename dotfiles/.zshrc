export MACKPATH=$HOME/mack
source $MACKPATH/commands/command_not_found_handler.sh
source ~/.zsh_prompt
source ~/.zshenv
source ~/.zsh_secrets

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/bin/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi

. /Users/jesse/.nix-profile/etc/profile.d/nix.sh

eval $(thefuck --alias)

# git autocompletion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

