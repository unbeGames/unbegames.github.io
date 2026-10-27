# Converting Steam articles to blog posts

## Inputs

Use the English and Russian Steam BBCode sources. Preserve their wording and language; only convert formatting.

## Post files

Create one post per language:

```text
_posts/en/YYYY/YYYY-MM-DD-slug.md
_posts/ru/YYYY/YYYY-MM-DD-slug.md
```

Use the same date, time, slug, images, game, and release-note reference for both posts.

```yaml
---
author: Arugin
title: "Article title"
date: YYYY-MM-DD HH:MM:SS +0300
categories: [Rocket Science, Update]
tags: [rocket science]
image: https://clan.cloudflare.steamstatic.com/images/CLAN_ID/IMAGE.png
game: rocket-science
release_notes: rocket-science/vVERSION
---
```

For Russian posts, use the translated title and `categories: [Rocket Science, Обновление]`.

## Preview image

Get the preview image from the article card on the game's Steam News Hub:

1. Open `https://store.steampowered.com/news/app/APP_ID`.
2. Find the card with the exact article title.
3. Copy the card's background-image URL. Do not use the large event-page background from the article page.
4. Remove the `_400x225` suffix from the filename to use the original image.
5. Replace the CDN host with `clan.cloudflare.steamstatic.com`.

Example:

```text
https://clan.akamai.steamstatic.com/images/34094219/HASH_400x225.png
→ https://clan.cloudflare.steamstatic.com/images/34094219/HASH.png
```

## BBCode to Markdown

Convert Steam markup as follows:

| Steam | Markdown |
| --- | --- |
| `[h2]Title[/h2]` | `## Title` |
| `[h3]Title[/h3]` | `### Title` |
| `[p]Text[/p]` | `Text` surrounded by blank lines |
| `[i]Text[/i]` | `_Text_` |
| `[img src="URL"][/img]` | `![](URL)` |
| `{STEAM_CLAN_IMAGE}` | `https://clan.cloudflare.steamstatic.com/images` |

Remove empty `[p][/p]` blocks. Keep paragraphs and headings separated by blank lines.

## Image captions

Place an italic caption immediately after its image, with no blank line:

```markdown
![](https://example.com/image.png)
_Image caption_
```

The theme converts this adjacent emphasis into a centered, smaller, non-italic caption. A blank line creates a normal paragraph and breaks the caption styling.

Apply this format to every image caption, even when the Steam source did not italicize it.

Don't forget to add post address to `skip_locale.yml` if it has only english locale.

## Release notes

Remove the `vVERSION release notes` section from both article bodies. Create the English release-note document separately:

```text
_release_notes/rocket-science/vVERSION/en.md
```

```yaml
---
game: rocket-science
version: "VERSION"
type: update
name: 'Release name'
release_date: YYYY-MM-DD
lang: en
title: 'vVERSION "Release name" Release Notes'
permalink: /en/games/rocket-science/releases/vVERSION/
---
```

Convert each `🔸` release-note entry to a Markdown list item (`-`). Do not create a Russian release-note file when its contents are an exact English copy. The release-note plugin automatically falls back to English for the Russian post.
Release name in the Release Notes should be added in case of update. In case of patch notes it should be omited because patches usually don't have names.

## Verification

- Confirm the requested publication timestamp and `+0300` offset.
- Confirm both posts reference the same release version.
- Confirm the release-note section is absent from the post files.
- Confirm no Steam BBCode or `{STEAM_CLAN_IMAGE}` placeholders remain.
- Confirm every caption directly follows its image.
- Run `bundle exec jekyll build` when Bundler is available.
