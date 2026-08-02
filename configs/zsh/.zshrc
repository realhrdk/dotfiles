# --- OMARCHY CUSTOM CONFIG ---
# Add zsh-completions to fpath
if [ -d /usr/share/zsh/site-functions ]; then
  fpath=(/usr/share/zsh/site-functions $fpath)
fi

# Fix for Arrow-key completion menu
zstyle ':completion:*' menu select
autoload -Uz compinit && compinit
# Case-insensitive completion (so 'cd downloads' works for 'Downloads')
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Colorize the completion menu to match your 'ls' colors
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Group results by category (files, directories, etc.)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
# Load Arch-native plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Your salvaged Aliases
alias gs='git status'
alias ll='ls -lah --color=auto'
alias pacinstall='sudo pacman -S'
alias update='sudo pacman -Syu'
alias v='nvim'
alias ..='cd ..'
alias oc='opencode'
alias lg='lazygit'
alias em='eisenhowermatrix'
# yt-dlp custom aliases
alias ytmp3='yt-dlp -x --audio-format mp3 --audio-quality 0'
alias ytmp4='yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]" --merge-output-format mp4'

# Power Management for ASUS X515
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

# Initialize Starship Prompt (The fast, modern look)
eval "$(starship init zsh)"

# Path for your local binaries (if you have them)
export PATH="$HOME/.local/bin:$PATH"
export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/cuda-12.6/lib64
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
