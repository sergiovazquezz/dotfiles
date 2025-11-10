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

export FZF_DEFAULT_OPTS=" \
    --color=fg:#cdcdcd \
    --color=bg:#141415 \
    --color=hl:#f3be7c \
    --color=fg+:#aeaed1 \
    --color=bg+:#252530 \
    --color=hl+:#f3be7c \
    --color=border:#606079 \
    --color=header:#6e94b2 \
    --color=gutter:#141415 \
    --color=spinner:#7fa563 \
    --color=info:#f3be7c \
    --color=pointer:#aeaed1 \
    --color=marker:#d8647e \
    --color=prompt:#bb9dbd"

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

precmd () {print -Pn "\e]0;%~\a"}

export EDITOR=nvim

bindkey -e

export EZA_ICONS_AUTO=always
export EZA_ICON_SPACING=1
