# ai-rewriter-shortcut
🚀 AI Rewriter Shortcut for macOS Instantly rewrite or refine any selected text using Google Gemini — no copy-paste needed. Trigger it with a keyboard shortcut, and let AI handle the rest.

## ⚙️ How to Use

> **⚠️ macOS only** — This script uses `osascript` and shell commands specific to Mac.

### 🛠 Step-by-Step Setup

#### 1. 🖥 Create the Script

Open your terminal and run:

```bash
touch gem.sh
open -e gem.sh
Then paste the code into gem.sh, save, and close the editor.

2. ✅ Make It Executable
Back in the terminal:
chmod +x gem.sh

3. 🧠 Set Up the Shortcut
Open the Shortcuts app on your Mac

Click “+” to create a new shortcut

Search for “Run Shell Script” and drag it into your shortcut

In the script box, type:

bash
نسخ
تحرير
./gem.sh
Set the working directory to the folder where gem.sh is saved (or provide the full path)

4. 🎹 Add a Keyboard Trigger
Click the settings icon in the top-right → Add Keyboard Shortcut
For example: Fn + F2 or Cmd + Shift + R

✨ How It Works
In any text editor (Google Docs, Notion, VS Code, etc.), write your draft

Put your cursor anywhere in the paragraph

Press your keyboard shortcut

The script will:

Select the whole text

Copy it

Send it to Gemini for rephrasing

Automatically paste the improved version back in place

✏️ Custom Prompts (Optional)
By default, the script uses this instruction:

Refine this text, and return only the improved version...

But you can override it by adding // your prompt here in your text.
Example:

go
نسخ
تحرير
Our copy needs a boost // Rewrite this for a more persuasive tone
The script will use your custom prompt instead of the default.

🎥 Demo
🖼️ (Add a quick GIF or video here showing how the shortcut works from editor to final output)
