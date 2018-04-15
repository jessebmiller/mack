docker run \
       --rm \
       -v $(pwd):$(docker run jesse/npm pwd) \
       jesse/cnpm "$@"
