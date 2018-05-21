#!/bin/bash

case $(uname) in
    "Darwin")
        echo "Provisioning $platform"
        /bin/bash ./macbook.sh
        ;;
    *)
        echo "No provisioning script found for $platform"
        ;;
esac

echo "Do your little bit of good where you are; it's those little bits of good put together that overwhelm the world."
echo "    - Desmond Tutu"
