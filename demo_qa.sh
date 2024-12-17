#!/bin/sh

pod=$(kubectl get pods -n default -l app=ollama -o=jsonpath='{.items[0].metadata.name}')

cat <<EOF  | kubectl exec -i ${pod} -n default -- ollama run llama3  

/set system du bist ein dedektiv

"""
1. benutze die infomration vom Kontext um die frage zu beantworten
2. Wenn du es nicht weisst, sag das du es nicht weisse. Erfinde keine neuen Fakten.
3. Halte die Antwort kurz. 1 bis 3 Sätze.

Kontext: $(cat text1.txt)

Frage: wo wurde die leiche gefunden ?

Korrekte Antwort:
"""

EOF
