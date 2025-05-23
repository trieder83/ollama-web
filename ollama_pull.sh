#!/bin/sh

# kubectl exec -i ${pod}  -n default --  ollama create comint -f /root/model/Modelfile

# multilingual embeddings
# * https://ollama.com/library/bge-m3
# * https://ollama.com/library/snowflake-arctic-embed2
# * https://ollama.com/library/paraphrase-multilingual

# First, find the pod name
kubectl get pods -l app=ollama -n default
pod=$(kubectl get pods -n default -l app=ollama -o=jsonpath='{.items[0].metadata.name}')

# Then execute the command
#kubectl exec -it $pod -n default -- ollama pull mxbai-embed-large
#kubectl exec -it $pod -n default -- ollama pull all-minilm
#kubectl exec -it $pod -n default -- ollama pull snowflake-arctic-embed2
# kubectl exec -it $pod -n default -- ollama pull mixtral:8x7b
#kubectl exec -it $pod -n default -- ollama pull codellama:7b
#kubectl exec -it $pod -n default -- ollama pull deepseek-r1
#kubectl exec -it $pod -n default -- ollama pull bge-m3:567m
#kubectl exec -it $pod -n default -- ollama pull all-minilm:33m
kubectl exec -it $pod -n default -- ollama pull qwen2.5:3b
kubectl exec -it $pod -n default -- ollama pull qwen2.5:7b
#kubectl exec -it $pod -n default -- ollama pull cas/mistral-instruct-v0.2-2x7b-moe
kubectl exec -it $pod -n default -- ollama run chanwit/flux-7b
kubectl exec -it $pod -n default -- ollama run qwen2:1.5b
