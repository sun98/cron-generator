# Cron Expression Generator

Static site: cron expression builder, guides, and examples.

## Deploy on Vercel (GitHub)

1. Push this repo to GitHub (already: `sun98/cron-generator`).
2. Open [Vercel Dashboard](https://vercel.com) → **Add New…** → **Project**.
3. **Import** the GitHub repository `sun98/cron-generator` (authorize GitHub if asked).
4. Configure:
   - **Framework Preset:** Other (or “No framework”).
   - **Root Directory:** `./` (default).
   - **Build Command:** leave empty.
   - **Output Directory:** leave empty (static files at repo root).
5. **Deploy**. Every push to `main` will trigger a new deployment.

No Vercel token is required in the repository; linking uses the Vercel ↔ GitHub integration in the dashboard.

### Custom domain

After deploy: Project → **Settings** → **Domains** → add your domain and follow DNS instructions.

## Local preview

```bash
python3 -m http.server 8080
# open http://127.0.0.1:8080
```
