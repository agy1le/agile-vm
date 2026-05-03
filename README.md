# AgileVM

A browser VM that runs Firefox entirely in your web browser via GitHub Codespaces — no installs, no admin rights needed.

## Setup

1. Go to [github.com/codespaces](https://github.com/codespaces) and create a **Blank** codespace.
2. In the terminal, run:

```bash
curl -O https://raw.githubusercontent.com/YOUR_USERNAME/school-vm/main/install.sh
chmod +x install.sh
./install.sh
```

3. Open the **Ports** tab in Codespaces and click on port **3000**.
4. Password: `agilevm`

## Features

- Full Firefox browser in your web browser
- Bypasses school network restrictions (runs on GitHub's servers)
- No downloads or admin access required
- Persistent across sessions
