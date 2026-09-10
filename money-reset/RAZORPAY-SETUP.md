# Connecting Razorpay

**Current setup:** the buy button links to the live Razorpay Payment Link
`https://rzp.io/rzp/bP9epxzM` (₹399), opened in a new tab.

Check one thing in the Razorpay dashboard: the link needs a **callback / redirect
URL** of `https://www.grubbite.com/money-reset/thank-you.html`, otherwise buyers
finish on Razorpay's own confirmation screen and never reach the download page.
Open the link's settings and confirm it's set. If a payment link can't carry a
callback URL on your account, either switch to a Payment Button or a Payment Page
(both support redirect URLs — instructions below), or add the download link to the
receipt email Razorpay sends.

---

## Alternative: Payment Button embed

The site is a static page, so there's no server to verify payments. Razorpay's **Payment Button** is the right fit: one script tag, no backend, and it can send buyers to your download page after a successful payment.

Before you start you need a Razorpay account with KYC completed and a settlement bank account added. Test mode works without KYC; live mode does not.

---

## Step 1 — Delivery

The PDF is **emailed to the buyer as an attachment** by a Google Apps Script that
listens to Razorpay's `payment.captured` webhook. See the separate
`email-delivery/` setup guide for that piece.

The thank-you page no longer carries a download link — it just confirms the
payment and tells the buyer to check their inbox. That means the Drive file does
not need to be shared publicly.

## Step 2 — Create the Payment Button

1. Razorpay Dashboard → **Payment Button** → **+ Create Payment Button**.
2. Template: **Buy Now**.
3. Title (internal): `The Money Reset`. Button text: `Get the Money Reset — ₹399`. Amount: **399**, fixed.
4. Under customer details, keep **email** and **phone** as required fields. You'll want the email if a delivery ever fails.
5. In brand settings, set the button colour to `#E9B23C` with dark text, or `#0F6A52` with white text, so it matches the page.
6. On the **Button Created Successfully** screen, click **Configure** → **Redirect URL** and enter:
   `https://iashishbhandari.github.io/thank-you.html`
7. Copy the embed code.

Build the button in **test mode** first. Test-mode buttons do not work in live mode — you'll create a second one later and swap the ID.

## Step 3 — Paste it into the page

In `index.html`, find the block marked `RAZORPAY PAYMENT BUTTON` in the buy section and replace the placeholder `<form>` with Razorpay's:

```html
<form>
  <script src="https://checkout.razorpay.com/v1/payment-button.js"
          data-payment_button_id="pl_XXXXXXXXXXXX" async></script>
</form>
```

Keep it inside `<div class="pay-slot">` — that's what centres it.

## Step 4 — Add the download link

Done. `thank-you.html` points at your Google Drive file:

- Primary button: `https://drive.usercontent.google.com/download?id=1AACrFFmM7HkkvAXe48lMDnn83Re8pqkb&export=download` — starts the download directly, no Drive preview.
- Secondary link: the normal Drive view URL, as a fallback if the direct link ever misbehaves.

**Check the sharing setting.** In Drive, the file must be set to *Anyone with the link → Viewer*. If it's restricted to your account, buyers get a "request access" screen instead of the book — the single most common way this breaks.

Support email is set to `grubbite@gmail.com` in `thank-you.html` and in `index.html`'s FAQ.

## Step 5 — Test properly

1. With the test-mode button live, use Razorpay's test UPI ID `success@razorpay` or test card `4111 1111 1111 1111` with any future expiry and any CVV.
2. Confirm you land on `/thank-you.html` and the PDF actually downloads.
3. Then try a failed payment (`failure@razorpay`) and check you aren't redirected to the download page.
4. Create the live-mode button, swap the `data-payment_button_id`, and buy a copy yourself with a real ₹399 UPI payment before you promote anything. Refund it from the dashboard afterwards.

---

## The honest limitation

The redirect URL is a plain public page. Anyone who has the link — a buyer who shares it, or someone who guesses it — can reach the download without paying. `robots.txt` keeps it out of search results, but that's politeness, not security.

For a ₹399 ebook this is usually an acceptable trade-off; leakage costs you less than the engineering would. If you'd rather close it:

**Middle option (no code):** use Razorpay **Payment Pages** instead of a button and connect it to Zapier, Make or Pabbly Connect. On payment, email the buyer the download link automatically. Delivery becomes "link emailed within a minute" rather than instant, and the link is at least tied to a real payment.

**Proper option (a little code):** a serverless function — a Cloudflare Worker or Netlify Function — that receives Razorpay's `payment.captured` webhook, verifies the signature with your webhook secret, and issues a signed URL that expires in 15 minutes. The static site stays on GitHub Pages; only the function moves. About 40 lines. Ask and I'll write it.

## Two things worth knowing

- **Fees.** Razorpay charges a percentage per transaction plus GST on that fee. Check the current rate on their pricing page — it changes, and it comes out of your ₹399.
- **Tax.** Selling a digital product in India has GST implications that depend on your turnover and registration status. Worth a conversation with a CA before you're doing volume, not after.
