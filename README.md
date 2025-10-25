# ollama-web
ollama with web gui for air-gap envs


# download on podman  (win)
curl http://localhost:11434/api/tags | jq '.models[].name'
podman exec ollama ollama pull deepseek-r1:8b
podman exec ollama ollama pull deepseek-r1:14b
podman exec ollama ollama pull ollama3.3:70b
podman exec ollama ollama pull phy4:14b
podman exec ollama ollama pull mistral:7b
podman exec ollama ollama pull gemma2:9b
podman exec ollama ollama pull codelama:13b
podman exec ollama ollama pull llama3.2-vision:11b


# pull micork8s image
microk8s.ctr  i  pull vllm/vllm-openai:latest
