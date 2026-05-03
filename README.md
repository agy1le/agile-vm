# AgileVM

A browser VM that runs Firefox entirely in your web browser via GitHub Codespaces — no installs, no admin rights needed.

## Desktop Setup

1. Go to [github.com/codespaces](https://github.com/codespaces) and create a **Blank** codespace.
2. In the terminal, run:

```bash
curl -O https://raw.githubusercontent.com/agy1le/school-vm/main/install.sh && chmod +x install.sh && ./install.sh
```

3. Open the **Ports** tab and click port **3000**.
4. Username: `abc` | Password: `agilevm`

## Phone Setup

1. Go to [github.com/codespaces](https://github.com/codespaces) and create a **Blank** codespace.
2. In the terminal, run:

```bash
curl -O https://raw.githubusercontent.com/agy1le/school-vm/main/install-mobile.sh && chmod +x install-mobile.sh && ./install-mobile.sh
```

3. Open the **Ports** tab, forward port **8080**, and open that URL on your phone.
4. Password: `agilevm`

## Switching Between Desktop and Mobile

Both versions use the same codespace — just run the other install command and it will swap automatically.

## Tips

- **Stop your codespace when done** at [github.com/codespaces](https://github.com/codespaces) — it uses your free hours even when the tab is closed.
- You can run a desktop and phone codespace at the same time by creating two separate blank codespaces.

## Features

- Full Firefox browser in your web browser
- Bypasses school network restrictions (runs on GitHub's servers)
- No downloads or admin access required
- Optimized for video playback (YouTube, etc.)
