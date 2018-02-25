docker run \
  --rm \
  -it \
  -v $HOME/org:/root/org \
  -v $HOME/.emacs.d:/root/.emacs.d \
  -v $HOME/.gitignore:/root/.gitignore \
  -v $HOME/.gitconfig:/root/.gitconfig \
  -v /:/host_root \
  --detach-keys "ctrl-@" \
  jesse/emacs emacs /host_root/$(pwd)/
