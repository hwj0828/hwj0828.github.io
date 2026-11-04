# Wenjie Hu's personal website

This is a Jekyll website based on al-folio. Most edits belong in **`_pages/`**, **`_bibliography/`**, or **`_sass/_custom.scss`**. You do not need to edit the theme's JavaScript or Liquid templates for normal content updates.

## Where to edit

| What you want to change | File | What to edit |
| --- | --- | --- |
| Biography, research interests, homepage text | [`_pages/about.md`](_pages/about.md) | Text below the second `---` line |
| Homepage sections and their order | [`_pages/about.md`](_pages/about.md) | The `sections` list at the top |
| Portrait position or shape | [`_pages/about.md`](_pages/about.md) | `profile.align`, `profile.image`, `profile.image_circular` |
| Portrait image | [`assets/img/prof_pic.jpg`](assets/img/prof_pic.jpg) | Replace this file, or change `profile.image` to another filename |
| Email, social profiles, CV link | [`_data/socials.yml`](_data/socials.yml) | Your actual contact details; remove a line to hide an icon |
| Downloadable CV | [`assets/pdf/myCV.pdf`](assets/pdf/myCV.pdf) | Replace this PDF with your latest CV, keeping the same filename |
| Publications and manuscript status | [`_bibliography/papers.bib`](_bibliography/papers.bib) | One BibTeX entry per paper |
| Papers featured on the homepage | [`_bibliography/papers.bib`](_bibliography/papers.bib) | Add or remove `selected={true}` in an entry |
| Publication page heading/introduction | [`_pages/publications.md`](_pages/publications.md) | `title`, `description`, and text around the bibliography tag |
| Talks, dates, venues, slide links | [`_bibliography/talks.bib`](_bibliography/talks.bib) | One BibTeX entry per talk |
| Teaching experience | [`_pages/teaching.md`](_pages/teaching.md) | Text below the second `---` line |
| News announcements | [`_news/`](_news/) | Add or edit a Markdown file; the `date` controls ordering |
| Blog posts | [`_posts/`](_posts/) | Add `YYYY-MM-DD-title.md`; example below |
| Blog title and subtitle | [`_config.yml`](_config.yml) | `blog_name`, `blog_description` |
| Menu titles, order, visibility | [`_pages/`](_pages/) | Each page's `title`, `nav`, `nav_order` |
| Site title, footer, width, feature switches | [`_config.yml`](_config.yml) | The commented settings at the top |
| Colors, font sizes, spacing, portrait width | [`_sass/_custom.scss`](_sass/_custom.scss) | Add CSS/Sass rules; examples are included |

A page's block between the first two `---` lines is called **front matter**. It controls the page's title, URL, menu entry and layout. The text below it is the page's content. Keep YAML indentation consistent and use spaces.

## Change the layout

### Homepage sections

Edit the list in `_pages/about.md`. The biography and portrait come first; the listed sections follow in order:

```yaml
sections:
  - news
  - selected_papers
  - social
```

Move a line up or down to reorder it. Remove a line to hide that section. Add `- latest_posts` to show recent blog posts. Set `sections: []` to show only the biography and portrait. The `announcements` and `latest_posts` settings control item limits and scrolling.

For the portrait, use `align: left` or `align: right`, and `image_circular: true` or `false`. Remove the `profile` block to hide it. You can add `more_info: "Your affiliation or office"` under `profile` for text below the image, or fill in `subtitle` for a line beneath your name.

### Navigation

For example, `_pages/teaching.md` contains:

```yaml
title: Teaching
permalink: /teaching/
nav: true
nav_order: 3
```

Lower `nav_order` numbers appear earlier, after the homepage link. Set `nav: false` to hide a menu entry; the page still exists at its `permalink`. Keep existing permalinks unless you intend to change public URLs. To add a page, copy `_pages/teaching.md`, give it a unique permalink, and replace its text.

### Width, colors and spacing

Change `max_width: 930px` in `_config.yml` for the overall content width. `navbar_fixed` and `footer_fixed` control whether the header/footer stay fixed to the window.

Put other style changes in `_sass/_custom.scss`, which is loaded **last**. It contains commented examples for accent colors, text size, line spacing and portrait width. Talks styling also lives here. For example:

```scss
body {
  font-size: 17px;
  line-height: 1.7;
}
```

For deeper structural changes, these are the relevant templates:

| Template | Controls |
| --- | --- |
| [`_layouts/default.liquid`](_layouts/default.liquid) | Shared page frame: header, main content, footer |
| [`_layouts/about.liquid`](_layouts/about.liquid) | Homepage portrait/biography and section rendering |
| [`_layouts/page.liquid`](_layouts/page.liquid) | Standard content pages |
| [`_layouts/blog.liquid`](_layouts/blog.liquid) | Blog listing; `_pages/blog.md` holds its editable settings |
| [`_layouts/post.liquid`](_layouts/post.liquid) | Individual blog posts and full news pages |
| [`_layouts/bib.liquid`](_layouts/bib.liquid) | How each publication looks |
| [`_layouts/talks.liquid`](_layouts/talks.liquid) | How each talk looks |
| [`_includes/header.liquid`](_includes/header.liquid) | Navigation markup |
| [`_includes/footer.liquid`](_includes/footer.liquid) | Footer markup |

## Add content

### A news announcement

Create `_news/announcement_4.md`:

```markdown
---
layout: post
date: 2026-11-04
inline: true
related_posts: false
---

Your announcement goes here.
```

Use the actual announcement date. `inline: true` displays the text directly in the news list. For a longer news article, use `inline: false` and add a `title`.

### A blog post

Create `_posts/2026-11-04-my-first-post.md`:

```markdown
---
layout: post
title: My first post
date: 2026-11-04
description: A short summary.
tags: research
categories: notes
---

Write your post in Markdown here.
```

Use your own title and publication date. Jekyll normally hides future-dated posts. Markdown, code highlighting, math, images and the existing chart helpers remain available. The blog shows "No posts yet." until you add a post. Its menu entry can be hidden with `nav: false` in `_pages/blog.md`.

### Publications and talks

Keep BibTeX entries in their respective bibliography files. Use `selected={true}` to feature a paper, `arxiv={...}` or `doi={...}` for publication links, and `pdf={filename.pdf}` or `slides={filename.pdf}` for files in `assets/pdf/`. External PDF/slide URLs are also supported. The talks page follows the order of entries in `talks.bib`; put newer talks first.

The CV link has one source: `cv_pdf` in `_data/socials.yml`, currently `/assets/pdf/myCV.pdf`. The homepage text, social icon and search menu all use it. If you rename the PDF, change that setting too.

## Preview and publish

The build uses Ruby **3.3.5** in GitHub Actions, Bundler, Node.js (for JavaScript minification), and ImageMagick (for responsive images). macOS's built-in Ruby 2.6 is too old for this project's dependencies.

With those dependencies installed, run from the repository root:

```sh
bundle install
bundle exec jekyll serve --livereload
```

Open the local URL printed by Jekyll, usually `http://localhost:4000`. Content and style changes rebuild automatically. **Restart Jekyll after editing `_config.yml`.** For a production check:

```sh
JEKYLL_ENV=production bundle exec jekyll build
```

If you use Docker instead:

```sh
docker compose up --build
```

Open `http://localhost:8080`. This builds the included Dockerfile. After changing `_config.yml`, restart the preview with `docker compose restart`.

Pushing changes to `main` or `master` runs [Deploy site](.github/workflows/deploy.yml), which builds and publishes `_site/` to the `gh-pages` branch. GitHub Pages should serve that branch's root directory. Pull requests build without publishing. The existing link, accessibility and CodeQL checks remain available.

Do not edit `_site/`: it is generated and your edits will be overwritten. Do not move `_pages`, `_layouts`, `_includes`, `_sass`, `_data`, or `_bibliography` casually; these names are part of this site's build conventions.

## Files you usually leave alone

- `_data/libraries.yml`: CDN URLs, library versions and integrity hashes, moved out of `_config.yml`.
- `assets/js/`, vendor CSS/fonts, `_sass/` files other than `_custom.scss`: theme implementation, including search, math, charts and icons.
- `_plugins/`, `Gemfile`: the Jekyll build and bibliography helpers.
- `_data/coauthors.yml`, `_data/venues.yml`: optional author/journal link mappings, now empty instead of containing Einstein examples.
- `_data/citations.yml`: generated citation cache. The scheduled workflow uses your `scholar_userid` from `_data/socials.yml`; it does not update paper titles, publication status or bibliography entries. A paper needs a matching `google_scholar_id` in BibTeX to show a citation badge. A normal workflow-token commit does not trigger the deploy workflow, so use **Deploy site → Run workflow** if you want to publish a citation-only update immediately.
- `package.json` and Prettier configuration: optional source formatting, not website content.

## What was cleaned up

Removed the Einstein profile, duplicate People page, sample project, sample book review, sample Plotly post, unused CV/resume templates, demo media/notebooks, template screenshots/reports, and unused newsletter/comment/external-feed integrations. Also removed upstream Docker-publishing, report and documentation-maintenance workflows, the duplicate Docker setup, and the old manual deployment script.

Your biography, papers, talks, teaching, news, contact details, portrait and linked PDF are retained. The CV is stored as `assets/pdf/myCV.pdf`. The existing publication statuses, old job-market news and contact email are also preserved; update those source files when you want to revise the content.

The original template's long setup/customization documents are replaced by this guide. Deleted files remain recoverable from Git history. The [al-folio license](LICENSE) is retained.
