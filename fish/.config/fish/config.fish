# Prompt
set -gx STARSHIP_CONFIG "$HOME/.config/starship/starship.toml"
starship init fish | source

# Zoxide (better cd)
zoxide init fish | source

# Eza (better ls)
set -gx EZA_ICONS_AUTO always
set -gx EZA_ICON_SPACING 1

# Editor
set -gx EDITOR nvim

# Man pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -gx MANROFFOPT "-c"

# PATH
fish_add_path "$HOME/opt/cross/bin"

# fzf
set -gx FZF_DEFAULT_OPTS_FILE ~/.config/fzf/fzf.conf

# Aliases
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias ls='eza'
alias ll='eza -l'
alias cat='bat'
alias cd='z'
alias lg='lazygit'
alias gdb='gdb -q'
alias zathura='zathura --fork'

# Keybindings
bind \cx edit_command_buffer

# sudo !!
function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# Terminal title
function fish_title
    prompt_pwd
end

# Fastfetch
if status is-interactive
    if command -q fastfetch
        fastfetch
    end
end
