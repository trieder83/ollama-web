kubectl get pods \
    --field-selector="status.phase!=Succeeded,status.phase!=Running"

# Delete pods that matches the filter
kubectl delete pods \
    --field-selector="status.phase!=Succeeded,status.phase!=Running"
