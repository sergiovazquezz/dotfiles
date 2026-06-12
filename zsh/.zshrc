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
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias ls='eza'
alias ll='eza -l'
alias cat='bat'
alias vim='nvim'
alias cd='z'
alias lg='lazygit'
alias gdb='gdb -q'
alias zathura='zathura --fork'

# Update terminal title
precmd () {print -Pn "\e]0;%~\a"}

export EDITOR=nvim

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

bindkey ' ' magic-space

# GCC cross compiler
export PATH="$HOME/opt/cross/bin:$PATH"

if [[ -o interactive ]] && (( $+commands[fastfetch] )); then
  fastfetch
fi
