# SOAR website — executive UX preview

Static HTML/CSS preview for **Sierra Overlook Animal Rescue**. Donations, store checkout, cart, programs, and several CTAs open the **live** [sierraoverlookanimalrescue.org](https://www.sierraoverlookanimalrescue.org/) Wix flows in a new tab so demos can use real payments.

## GitHub Pages

1. Create a new repository (for example `soar-executive-redesign`) on GitHub and push this folder:

   ```bash
   cd soar-executive-redesign
   git init
   git add .
   git commit -m "SOAR executive preview with live checkout links"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/soar-executive-redesign.git
   git push -u origin main
   ```

2. In the repo on GitHub: **Settings → Pages → Build and deployment → Source**: **Deploy from a branch**, branch **main**, folder **/ (root)**.

3. After the first deploy, the site will be at `https://YOUR_USERNAME.github.io/soar-executive-redesign/` (exact URL is shown on the Pages settings screen).

## Assets

- Partner logos are in `images/partners/` (exported from the published Wix media URLs).
- Replace Unsplash hero/foster images with Dropbox photography when ready.
