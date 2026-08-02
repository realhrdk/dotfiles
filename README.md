# Dotfiles

Selective setup source for Arch / Omarchy. Stow only the configs you want, e.g. `zsh` and `tmux`.

## Recommended Setup On Arch / Omarchy

```bash
cd ~/dotfiles
./modules/zsh-setup.sh
sudo pacman -S --needed tmux stow
./stow.sh zsh tmux git
```

That gives you:

- `zsh` with Oh My Zsh
- `powerlevel10k`
- `zsh-autosuggestions`
- `zsh-syntax-highlighting`
- your tracked `~/.zshrc`
- your tracked `tmux` config
- your tracked `git` config

## Selective Stow

`stow.sh` accepts package names, so you can link only what you want:

```bash
./stow.sh zsh tmux
./stow.sh git
./stow.sh
```

Running `./stow.sh` with no arguments still links every package in `configs/`.

## Notes

- `configs/zsh/.zshrc` is cleaned up to avoid Ubuntu-only aliases on Arch.
- Powerlevel10k is installed by `modules/zsh-setup.sh`. If `~/.p10k.zsh` is missing, run `p10k configure` once after opening a new shell.
- Neovim config remains untouched so you can keep Omarchy defaults.
- COSMIC/Pop-era scripts and archived Hyprland configs were removed when moving to Omarchy; the live Hyprland setup is managed by omarchy itself.
