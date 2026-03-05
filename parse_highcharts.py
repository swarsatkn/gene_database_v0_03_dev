import json
import re

with open('static/in-all-disputed.js', 'r', encoding='utf-8') as f:
    content = f.read()
    
# Extract the JSON payload using regex to match the bracket pairs
start_idx = content.find('{')
end_idx = content.rfind('}') + 1

try:
    data = json.loads(content[start_idx:end_idx])
    for feature in data.get("features", []):
        props = feature.get("properties", {})
        print(f"{props.get('hc-key', 'none')}: {props.get('name', 'none')}")
except Exception as e:
    print("Error:", e)
