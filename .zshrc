# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Disable completion waiting dots
COMPLETION_WAITING_DOTS="false"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Dim gray color for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Clean completion menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# ── Environment & PATH ──
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# ── Gaming / Heroic ──
alias rltas='heroic-run "$HOME/Games/Heroic/Prefixes/RocketLeague/pfx/drive_c/Program Files/BakkesMod/BakkesMod.exe"'

# ── Gentoo Core Package Management ──
# Complete system upgrade (Pure source, check build deps, deep slot calculations)
alias update='doas emerge -uDNavq --keep-going --fail-clean=y --with-bdeps=y --backtrack=30 @world'

# Install a specific package (Always shows prompts and verbose output)
alias install='doas emerge -av'

# Cleanly uninstall a package and automatically prune its orphaned dependencies
alias remove='doas emerge -C'

# Search the official repositories for a package name or description
alias search='emerge -s'

# ── System Hygiene & Pruning ──
# Removes unneeded dependencies and sweeps old logs
alias clean='doas emerge --depclean && doas eclean-pkg && doas eclean-dist'

# Check for and safely fix broken reverse dependencies or library links
alias fixlibs='doas revdep-rebuild'

# Quick configuration file merging tool (Crucial after a big system upgrade)
alias fixconf='doas dispatch-conf'

# ── Repository & Custom Overlay Syncing ──
# Fully sync the Gentoo tree AND all your external overlays
alias syncall='doas emaint sync --all'

# Check your unread Gentoo developer news articles
alias news='eselect news read'

# Load Powerlevel10k configuration if present
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
