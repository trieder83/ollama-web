#!/bin/sh

# kubectl exec -i ${pod}  -n default --  ollama create comint -f /root/model/Modelfile

# First, find the pod name
kubectl get pods -l app=ollama -n default
pod=$(kubectl get pods -n default -l app=ollama -o=jsonpath='{.items[0].metadata.name}')

# Then execute the command
#kubectl exec -it $pod -n default -- ollama pull mxbai-embed-large
kubectl exec -it $pod -n default -- ollama pull all-minilm
