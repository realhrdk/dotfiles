#!/bin/bash
# stow.sh - Link selected configs from configs/ directory

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIGS_DIR="$DOTFILES_DIR/configs"

echo "🔗 Stowing configurations..."

if [ ! -d "$CONFIGS_DIR" ]; then
    echo "  → Config directory not found: $CONFIGS_DIR"
    exit 1
fi

cd "$CONFIGS_DIR"

if [ "$#" -gt 0 ]; then
    packages=("$@")
else
    packages=()
    for package in */; do
        packages+=("${package%/}")
    done
fi

if [ "${#packages[@]}" -eq 0 ]; then
    echo "  → No config packages found in $CONFIGS_DIR"
    exit 0
fi

for package_name in "${packages[@]}"; do
    if [ ! -d "$package_name" ]; then
        echo "  → Skipping missing package: $package_name"
        continue
    fi

    echo "  → Stowing: $package_name"
    stow -v -t "$HOME" "$package_name" 2>&1 | sed 's/^/    /'
done

echo "✅ Requested configurations linked"
