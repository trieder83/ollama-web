import streamlit as st
import requests
import os
import json

def query_ollama_service_stream(prompt):
    """Send a streaming query to the Ollama service."""
    ollama_service_url = os.getenv("OLLAMA_SERVICE_URL", "http://ollama-service.default.svc.cluster.local:8000/api/chat")
    try:
        payload = {
            "model": "llama3.2",
            "messages": [
                {"role": "user", "content": prompt}
            ],
            "stream": True
        }
        response = requests.post(ollama_service_url, json=payload, stream=True)
        if response.status_code == 200:
            for line in response.iter_lines():
                if line:
                    yield json.loads(line).get("content", "")
        else:
            yield f"Error: {response.status_code} - {response.text}"
    except Exception as e:
        yield f"An error occurred: {str(e)}"

# Streamlit app setup
st.title("Ollama Frontend")

st.write("Ask a question and get a streamed response from Ollama!")

# User prompt input
user_prompt = st.text_area("Enter your prompt:")

if st.button("Submit"):
    if user_prompt.strip():
        with st.spinner("Querying Ollama..."):
            response_placeholder = st.empty()
            response_text = ""
            for chunk in query_ollama_service_stream(user_prompt):
                #response_text += chunk.message.content
                response_text += chunk
                response_placeholder.text(response_text)
        st.write("### Final Response:")
        st.write(response_text)
    else:
        st.warning("Please enter a valid prompt.")

