#!/bin/sh

pod=$(kubectl get pods -n default -l app=ollama -o=jsonpath='{.items[0].metadata.name}') 
IP=$(kubectl get svc ollama-service -n default  -o jsonpath='{.spec.clusterIP}')

#kubectl exec -it ${pod} -n default -- ollama run llama3 "Summarize this file in armenian. keep it short, about 2 to 4 senteces: $(cat text1.txt)"

echo -e $(curl -X POST http://$IP:11434/api/generate -d '{
  "model": "codellama:7b",
  "prompt": "Write me a function that outputs the fibonacci sequence in go",
  "stream": false
}'| jq '.response'  )
