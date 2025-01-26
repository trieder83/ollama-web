#!/bin/sh

#OLLAMA_IP=$(kubectl get svc ollama-service-internal -o jsonpath='{.spec.clusterIP}')
#echo $OLLAMA_IP

# mxbai-embed-large
# snowflake-arctic-embed2
# all-minilm
MODEL=snowflake-arctic-embed2
curl http://localhost:31480/api/embeddings -d '{
  "model": "'${MODEL}'",
  "prompt": "The sky is blue because of Rayleigh scattering"
}'
