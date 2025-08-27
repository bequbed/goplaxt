# goplaxt (self-hosted Plex → Trakt scrobbler)

This is a working Docker + Compose setup for [goplaxt](https://github.com/XanderStrike/goplaxt),
modified to:

- Build for ARM64 (works on Oracle ARM, Raspberry Pi, etc.)
- Copy static assets (fixes the "static/index.html" panic)
- Run with Docker Compose + .env file
- Persist Trakt tokens in `./keystore/`

## Usage

1. Create a Trakt API app at https://trakt.tv/oauth/applications  
   - Redirect URI: `https://YOUR-HOSTNAME/authorize`  
   - Copy the Client ID + Secret.

2. Copy `.env.example` → `.env` and fill your values.

3. Start with Docker Compose:
   ```bash
   docker compose up -d --build
Authorize with Trakt:

Open https://YOUR-HOSTNAME/authorize in a browser.

Approve access. Tokens will be saved in ./keystore/.

In Plex (server owner account), go to Settings → Webhooks → Add Webhook:

cpp
Copy code
https://YOUR-HOSTNAME/
Now every Plex play/pause/stop event scrobbles instantly to Trakt.

Notes
The app listens on 8000 inside the container. Use HOST_PORT in .env to change the host port (default 8500).

Ensure ALLOWED_HOSTNAMES in .env matches your domain (hostname only, no https/port).

If you also use PlexTraktSync, disable its watched sync to avoid double scrobbles.

License
MIT (same as upstream)
EOF

yaml
Copy code

---

### 3) Initialize Git and commit
```bash
cd /opt/goplaxt
git init
git branch -m main
git remote add origin https://github.com/bequbed/goplaxt.git
git add Dockerfile docker-compose.yml .gitignore .env.example README.md
git commit -m "Working self-hosted goplaxt setup (arm64 build, compose, static fix)"
