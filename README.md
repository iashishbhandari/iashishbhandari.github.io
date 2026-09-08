# grubbite.com

Static site for **GrubBite**, served by GitHub Pages from this repository at `https://www.grubbite.com/`.

```
index.html          brand homepage — lists the available guides
robots.txt          site-wide crawl rules
sitemap.xml         site-wide sitemap
serve.sh / .bat     local preview (serves the whole site, including subfolders)
.nojekyll           serve files as-is, no Jekyll build

money-reset/        The Money Reset — https://www.grubbite.com/money-reset/
```

## Adding another guide

Each guide is a self-contained folder with its own `index.html`, `thank-you.html` and `assets/`, using paths relative to that folder. Create the folder, add a card to the homepage, and add the URL to `sitemap.xml`. No other configuration is needed — the custom domain is site-level and applies to every path beneath it.

Do not add a `CNAME` file inside a guide folder; the custom domain is configured once, for the whole site.

## Local preview

```bash
./serve.sh          # then open http://localhost:8080
```

Browse to `http://localhost:8080/money-reset/` to check a guide at its real path.
