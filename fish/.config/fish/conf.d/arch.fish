if test (uname) != Linux
    return
end

# PATH
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.cargo/bin"

# pnpm
set -gx PNPM_HOME "/home/sergio/.local/share/pnpm"
fish_add_path "$PNPM_HOME"

# Direnv
direnv hook fish | source

# libvirt
set -gx LIBVIRT_DEFAULT_URI "qemu:///system"

# Pacman
alias pac-update-all="sudo pacman -Syu && pacdiff"
alias pac-search="pacman -Ss"
alias pac-install="sudo pacman -S"
alias pac-info="pacman -Si"
alias pac-info-installed="pacman -Qin"
alias pac-remove="sudo pacman -Rns"
alias pac-clear-cache="sudo pacman -Sc"
alias pac-unused="pacman -Qtdqn"
alias pac-query-installed="pacman -Qsq"
alias pac-list-installed="pacman -Qn"

# Paru
alias paru-update-all="paru -Syu"
alias paru-search="paru -Ss"
alias paru-install="paru -S"
alias paru-info="paru -Si"
alias paru-info-installed="paru -Qim"
alias paru-remove="paru -Rns"
alias paru-unused="paru -Qtdqm"
alias paru-list-installed="paru -Qm"

# Misc
alias calc="bc -lq"
alias fm="nautilus . > /dev/null 2>&1 &"
