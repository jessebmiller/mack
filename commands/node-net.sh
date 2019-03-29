port=$1
shift
docker run \
       -it \
       --rm \
       -v $(pwd):$(pwd) \
       --workdir $(pwd) \
       -p $port:$port \
       node node "$@"
