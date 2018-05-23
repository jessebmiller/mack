docker run \
       -it \
       --rm \
       -v $(pwd):$(pwd) \
       --workdir $(pwd) \
       node node "$@"
