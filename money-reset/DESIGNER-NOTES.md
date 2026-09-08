# Designer notes

## Palette
| Token | Hex | Use |
|---|---|---|
| Ink | `#0C2B33` | Body text, dark comparison panel, buy section background. Pulled from the cover's deep teal so the page and cover read as one product. |
| Ink soft | `#3C5A61` | Secondary text, captions |
| Paper | `#FBFAF6` | Page background (warm off-white, not pure white) |
| Paper 2 | `#F2F0E9` | Alternating panels, final CTA band |
| Emerald | `#0F6A52` | Primary CTA buttons, checkmarks, timeline dots |
| Gold | `#E9B23C` | Accents only — chapter numerals, price, cover offset block, highlight underline |

Gold is deliberately rationed. It marks the "unaccounted spending" bar in the hero, chapter numerals, and the price. Nothing else.

## Type
- **Fraunces** (700) — headlines, chapter titles, the price, the rupee figure. Matches the high-contrast serif on the cover.
- **Inter** (400/500/600) — everything else. Body at 17px / 1.65, measure capped at 66ch.
- Sentence case throughout. No tracked-out all-caps labels; the eyebrow is an italic serif line instead.

## Layout
- Single column, max width 1120px, generous vertical rhythm (84px sections, 64px on mobile). Hairline dividers between sections rather than boxed cards.
- Hero is a two-column split: copy + the salary strip on the left, cover on the right with a gold block offset behind it.
- **The one bold element** is the hero "salary strip" — a bank-credit notification bar that splits ₹52,340 into a five-segment stacked bar, with the gold segment labelled *the part you can't account for*. That's the whole pitch in one graphic. Everything else on the page stays quiet on purpose.
- Chapters are a two-up list separated by rules, not identical rounded cards.
- The 30-day journey uses a vertical timeline (it genuinely is a sequence, so the ordered treatment earns its place).

## Image slots to replace
1. `[WORKBOOK PREVIEW]`, `[MONEY DASHBOARD PREVIEW]`, `[WORKSHEET MOCKUP]` — three dashed boxes in the worksheets section. Drop in cropped screenshots of pages 51–56 of the PDF, ~1200px wide, with a light drop shadow.
2. Optional: a second cover shot on a device (phone + printed worksheet) above the buy section.
3. Social share image is `assets/cover-large.jpg` — consider replacing with a 1200×630 landscape composition for better link previews.

## Copy placeholders
None remaining. Payment link, download link and support email are all live. Price (₹399) and author (GrubBite) are set. Payment runs through a Razorpay Payment Button — see RAZORPAY-SETUP.md.

## Accessibility & performance
- Focus rings on CTAs (gold, 3px offset), semantic `<details>` for FAQ and objections (works without JS), `prefers-reduced-motion` respected, contrast checked on all text/background pairs.
- Two images, no framework, no JS beyond a one-line copyright year. Should load in well under a second on 4G.

## Mobile
Hero stacks to copy → salary strip → cover (max 330px wide). Comparison table stacks to two stacked panels. Chapter grid collapses to one column. Pill list of worksheets wraps naturally.
