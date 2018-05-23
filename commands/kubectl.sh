kubectl "$@"

if [ $? -ne 0 ]; then
    gcloud components install kubectl
    kubectl "$@"
fi
