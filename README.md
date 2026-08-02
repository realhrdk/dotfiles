# Dotfiles

Recovery source for an Arch / Omarchy machine. Everything managed by Omarchy itself (Hyprland, waybar, tmux, Neovim/LazyVim, alacritty, walker, mako, ...) is **not** tracked here — only the pieces that are yours.

## Setup On Arch / Omarchy (fresh machine)

```bash
# 1. Install Arch, then Omarchy (omarchy provides hyprland, tmux, nvim, alacritty, ...)
# 2. Clone and link
cd ~/dotfiles
sudo pacman -S --needed stow
./stow.sh
```

That links only what you actually maintain:

- `zsh` — your `~/.zshrc` (omarchy-native: arch zsh plugins, starship, aliases)
- `git` — `~/.gitconfig`, `~/.gitignore_global`
- `espanso` — text expansion (`@think`, `@math`, `@code`, `@u`, ...)
- `ruff` — `~/.config/ruff/ruff.toml`
- `prompts` — prompt library used by the picker
- `bin` — `~/.local/bin/prompt-picker` (walker + wl-copy; bind it in omarchy keybinds)

## Re-apply these Omarchy-managed tweaks

These are small edits on top of Omarchy defaults, kept out of stow so `omarchy update`/`refresh` can't clobber them and you don't fight the defaults:

- `tmux` (`~/.config/tmux/tmux.conf`): add `bind -n M-Enter split-window -v -c "#{pane_current_path}"` and `bind -n M-S-Enter split-window -h -c "#{pane_current_path}"`, and set `status-position bottom` (default is top)
- `alacritty` (`~/.config/alacritty/alacritty.toml`): font `JetBrainsMono Nerd Font` (no `Mono` suffix) at size 9, padding 14

## Selective Stow

`stow.sh` accepts package names, so you can link only what you want:

```bash
./stow.sh zsh
./stow.sh git espanso
./stow.sh
```

Running `./stow.sh` with no arguments links every package in `configs/`.

## Notes

- `~/.zshrc` is a symlink into this repo — edit it here.
- `~/.config/prompts` and `~/.local/bin/prompt-picker` are symlinks here too.
- COSMIC/Pop-era scripts, the old oh-my-zsh setup, and the pre-Omarchy nvim/tmux/alacritty configs were removed when moving to Omarchy.
