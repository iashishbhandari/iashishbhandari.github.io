# grubbite.com

Static site for **GrubBite**, served by GitHub Pages at `https://www.grubbite.com/`.

```
index.html          brand homepage
robots.txt          crawl rules
sitemap.xml         sitemap
serve.sh / .bat     local preview
.nojekyll           serve files as-is

money-reset/        The Money Reset — https://www.grubbite.com/money-reset/
    index.html      sales page
    thank-you.html  post-payment confirmation
    assets/         cover images
```

## Adding another guide

Each guide is a self-contained folder with its own `index.html`, `thank-you.html` and `assets/`, using paths relative to that folder. Create the folder, add a card to the homepage, and add the URL to `sitemap.xml`.

Do not add a `CNAME` file inside a guide folder — the custom domain is configured once, site-wide.

## Local preview

```bash
./serve.sh          # http://localhost:8080
```
