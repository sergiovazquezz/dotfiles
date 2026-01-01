case "$OSTYPE" in
  darwin*)
    [[ -f "$HOME/.zshrc-macos" ]] && source "$HOME/.zshrc-macos"
    ;;
  linux*)
    [[ -f "$HOME/.zshrc-arch"  ]] && source "$HOME/.zshrc-arch"
    ;;
esac

bindkey -e

# Completion
autoload -Uz compinit
compinit

# History file and size
HISTFILE=~/.zsh_history
HISTSIZE=999
SAVEHIST=1000

# Prompt
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"

# Better cd
eval "$(zoxide init zsh)"

# Better ls
export EZA_ICONS_AUTO=always
export EZA_ICON_SPACING=1

# Aliases
alias ls='eza'
alias cat='bat'
alias vim='nvim'
alias cd='z'
alias lg='lazygit'
alias mu-d="cargo build --bins && cargo run --bin mueve-daemon"
alias mu="cargo run --bin mueve"

# Update terminal title
precmd () {print -Pn "\e]0;%~\a"}

export EDITOR=nvim

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
