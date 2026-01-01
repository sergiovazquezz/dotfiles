case "$OSTYPE" in
  darwin*)
    [[ -f "$HOME/.zshrc-macos" ]] && source "$HOME/.zshrc-macos"
    ;;
  linux*)
    [[ -f "$HOME/.zshrc-arch"  ]] && source "$HOME/.zshrc-arch"
    ;;
esac

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
