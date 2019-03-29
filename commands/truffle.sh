docker run \
       -it \
       --rm \
       --net=host \
       -v $(pwd):$(pwd) \
       --workdir $(pwd) \
       jesse/truffle truffle "$@"
