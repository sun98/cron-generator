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

Production URL: **https://cron-generator.nibius.cn**

In Vercel: Project → **Settings** → **Domains** → add `cron-generator.nibius.cn` (and optionally `www` if you use it). At your DNS provider (e.g. where `nibius.cn` is managed), add the **CNAME** or **A** records that Vercel shows—usually **CNAME** `cron-generator` → `cname.vercel-dns.com` (exact values are shown in the Vercel UI).

## Local preview

```bash
python3 -m http.server 8080
# open http://127.0.0.1:8080
```
