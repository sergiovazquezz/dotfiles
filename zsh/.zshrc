# Homebrew (package manager)
eval $(/opt/homebrew/bin/brew shellenv)

# Starship (theme)
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# History autocompletion
HISTFILE=$HOME/.zsh_history
HISTSIZE=999
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/sergio/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Zoxide (replacement for cd)
eval "$(zoxide init zsh)"

nvm alias default 'lts/*' > /dev/null 2>&1

# bun completions
[ -s "/Users/sergio/.bun/_bun" ] && source "/Users/sergio/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Fzf Catpuccin
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
# --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
# --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
# --color=selected-bg:#45475A \
# --color=border:#6C7086,label:#CDD6F4"

# Fzf Rose Pine Moon
export FZF_DEFAULT_OPTS="
  --color=fg:#908caa,bg:#232136,hl:#ea9a97
  --color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
  --color=border:#44415a,header:#3e8fb0,gutter:#232136
  --color=spinner:#f6c177,info:#9ccfd8
  --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

# Aliases
alias ls='eza -l'
alias cat='bat'
alias brewup='brew update && brew upgrade'
alias drizzle-studio='pnpm drizzle-kit studio --verbose'
alias prettier-write='pnpm dlx prettier . --write'
alias drizzle-studio-bun='bun drizzle-kit studio --verbose'
alias prettier-write-bun='bunx prettier . --write'
alias vim='nvim'
alias cd='z'
