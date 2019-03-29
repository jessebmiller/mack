docker run \
       -it \
       --rm \
       -v $(pwd):$(pwd) \
       --workdir $(pwd) \
       $(echo $NPM_FLAGS) \
       node npm "$@"
