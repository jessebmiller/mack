docker run \
       -it \
       --rm \
       -v $(pwd):$(pwd) \
       --workdir $(pwd) \
       --net host \
       $(env | cut -f1 -d= | sed 's/^/-e /') \
       node node "$@"
