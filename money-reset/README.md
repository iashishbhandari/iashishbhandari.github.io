# The Money Reset — GrubBite

Static GitHub Pages site for **The Money Reset** by **GrubBite**.

## GitHub Pages target

This package is prepared for a **user site** repository named:

`iashishbhandari.github.io`

Published URL:

`https://iashishbhandari.github.io/`

GitHub Pages requires `index.html` at the top level of the publishing source.

## Before launch

No placeholders remain. Payment goes to the live Razorpay link
`https://rzp.io/rzp/bP9epxzM` (₹399); support email is `grubbite@gmail.com`.

Check that the Razorpay link's callback URL is set to
`https://www.grubbite.com/money-reset/thank-you.html` — see RAZORPAY-SETUP.md.

The PDF delivery link in `thank-you.html` is retained as supplied.

## Publish

1. Create a public repository named `iashishbhandari.github.io`.
2. Upload the **contents of this ZIP** to the repository root — do not upload the ZIP itself and do not create an extra `money-reset-site/` folder.
3. In **Settings → Pages**, choose **Deploy from a branch**, then select `main` and `/ (root)`.
4. Open `https://iashishbhandari.github.io/` after GitHub Pages finishes deploying.

GitHub may take a few minutes to publish the first deployment.

## Structure

```text
.
├── .nojekyll
├── index.html
├── thank-you.html
├── robots.txt
├── sitemap.xml
├── assets/
│   ├── cover.jpg
│   └── cover-large.jpg
├── DESIGNER-NOTES.md
├── RAZORPAY-SETUP.md
├── serve.bat
└── serve.sh
```
