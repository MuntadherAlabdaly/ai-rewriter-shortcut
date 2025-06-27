#!/bin/bash

API_KEY="PutYourAPIHere"

osascript <<EOF
tell application "System Events"
    keystroke "a" using {command down}
    delay 0.1
    keystroke "c" using {command down}
end tell
EOF

sleep 0.2

raw=$(pbpaste)

if [[ "$raw" == *"//"* ]]; then
  input=$(echo "$raw" | cut -d'/' -f1 | sed 's/[[:space:]]*$//')
  instruction=$(echo "$raw" | cut -d'/' -f3- | sed 's/^[[:space:]]*//')
else
  input="$raw"
  instruction="Refine this text, and return only the improved version. Do not explain anything. Keep the core meaning unchanged and preserve all original formatting, including newlines."
fi

prompt="$instruction: $input"

response=$(/opt/homebrew/bin/jq -n --arg text "$prompt" '{
  contents: [
    {
      parts: [
        {
          text: $text
        }
      ]
    }
  ]
}' | curl -s -X POST \
  -H "Content-Type: application/json" \
  -d @- \
  "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$API_KEY")

output=$(echo "$response" | /opt/homebrew/bin/jq -r '.candidates[0].content.parts[0].text // empty')

echo "$output" | pbcopy

if [[ -n "$output" ]]; then
  printf "✅ Refined text copied to clipboard:\n\n%s\n\n" "$output"
  osascript -e 'delay 0.3' -e 'tell application "System Events" to keystroke "v" using {command down}'
else
  echo "❌ Failed to extract Gemini response."
  echo "$response"
fi
