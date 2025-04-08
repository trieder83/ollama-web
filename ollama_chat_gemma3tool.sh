#!/bin/sh

# First, find the pod name
kubectl get pods -l app=ollama -n default
pod=$(kubectl get pods -n default -l app=ollama -o=jsonpath='{.items[0].metadata.name}')

##
kubectl exec -i ${pod}  -n default --  ollama create gemma3tool -f /root/model/ModelfileGemma3tool

# Then execute the command
kubectl exec -it $pod -n default -- ollama run gemma3tool
