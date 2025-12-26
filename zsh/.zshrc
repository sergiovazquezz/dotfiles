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

# pnpm
export PNPM_HOME="/Users/sergio/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Zoxide (replacement for cd)
eval "$(zoxide init zsh)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
nvm alias default 'lts/*' > /dev/null 2>&1

# Bun
[ -s "/Users/sergio/.bun/_bun" ] && source "/Users/sergio/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

# Aliases
alias ls='eza'
alias cat='bat'
alias brewup='brew update && brew upgrade'
alias drizzle-studio='pnpm drizzle-kit studio --verbose'
alias prettier-write='pnpm dlx prettier . --write'
alias drizzle-studio-bun='bun drizzle-kit studio --verbose'
alias prettier-write-bun='bunx prettier . --write'
alias vim='nvim'
alias cd='z'
alias lg='lazygit'
alias mu-d="cargo build --bins && cargo run --bin mueve-daemon"
alias mu="cargo run --bin mueve"
alias my-ip="ip a | rg en0 -A 3"

precmd () {print -Pn "\e]0;%~\a"}

export EDITOR=nvim

bindkey -e

export EZA_ICONS_AUTO=always
export EZA_ICON_SPACING=1
