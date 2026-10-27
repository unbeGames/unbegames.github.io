# Repository instructions

## Project overview

This is the source for `blog.unbegames.com`, a bilingual English/Russian static
site for unbeGames and its games. It is built with Jekyll, Ruby 3.3.3, the
Chirpy theme, and `jekyll-paginate-v2`.

- Blog posts: `_posts/en` and `_posts/ru`.
- Game pages: `_games`.
- Versioned game release notes: `_release_notes`, rendered by the custom
  `_plugins/release_notes.rb` plugin.
- Shared content/configuration: `_data`, `_includes`, `_layouts`, and `_sass`.
- Steam article conversion rules: `docs/steam-convert.md`.
- Primary validation command: `bundle exec jekyll build`.

## WSL tooling

This repository runs in WSL. Invoke repository tools through WSL rather than
against the UNC path with Windows tooling.

The Ruby environment is initialized by the WSL login shell. If `bundle` is not
found from PowerShell or a non-login WSL command, do not install Ruby, Bundler,
or Jekyll. Retry through a login shell:

```powershell
wsl.exe -d Ubuntu --cd /home/arugin/projects/unbegames.github.io bash -lic 'bundle exec jekyll build'
```

Use WSL Git to avoid Windows Git ownership warnings. If Codex `apply_patch`
rejects the UNC workspace as a reparse point, use `git apply` inside WSL. Do not
add a Windows Git `safe.directory` exception for this repository.
