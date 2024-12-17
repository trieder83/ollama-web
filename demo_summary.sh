#!/bin/sh

pod=$(kubectl get pods -n default -l app=ollama -o=jsonpath='{.items[0].metadata.name}') 

kubectl exec -it ${pod} -n default -- ollama run llama3 "Summarize this file: $(cat text1.txt)"
kubectl exec -it ${pod} -n default -- ollama run llama3 "Summarize this file in french: $(cat text1.txt)"
kubectl exec -it ${pod} -n default -- ollama run llama3 "Summarize this file in armenian. keep it short, about 2 to 4 senteces: $(cat text1.txt)"
