#!/bin/bash
# modules/zsh-setup.sh - Zsh, Oh My Zsh, Powerlevel10k, and plugins

set -euo pipefail

echo "🐚 Setting up Zsh..."

install_packages() {
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --needed --noconfirm zsh git curl
        return
    fi

    if command -v apt >/dev/null 2>&1; then
        sudo apt update
        sudo apt install -y zsh git curl
        return
    fi

    if command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y zsh git curl
        return
    fi

    echo "Unsupported package manager. Install zsh, git, and curl manually."
    exit 1
}

install_repo() {
    local repo_url="$1"
    local target_dir="$2"
    local label="$3"

    if [ -d "$target_dir/.git" ]; then
        echo "  → $label already installed"
    else
        echo "  → Installing $label..."
        git clone --depth=1 "$repo_url" "$target_dir"
    fi
}

install_packages

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "  → Installing Oh My Zsh..."
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes sh -c \
        "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "  ✓ Oh My Zsh installed"
else
    echo "  → Oh My Zsh already installed"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

install_repo \
    "https://github.com/romkatv/powerlevel10k.git" \
    "$ZSH_CUSTOM/themes/powerlevel10k" \
    "powerlevel10k"

install_repo \
    "https://github.com/zsh-users/zsh-autosuggestions" \
    "$ZSH_CUSTOM/plugins/zsh-autosuggestions" \
    "zsh-autosuggestions"

install_repo \
    "https://github.com/zsh-users/zsh-syntax-highlighting" \
    "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" \
    "zsh-syntax-highlighting"

zsh_path="$(command -v zsh)"
if [ "$SHELL" != "$zsh_path" ]; then
    echo "  → Setting zsh as default shell..."
    chsh -s "$zsh_path"
fi

echo "✅ Zsh setup complete"
