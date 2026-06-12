if test (uname) != Darwin
    return
end

# ── Homebrew ──────────────────────────────────────────────────────────────────
/opt/homebrew/bin/brew shellenv | source

# ── Java ──────────────────────────────────────────────────────────────────────
fish_add_path "/opt/homebrew/opt/openjdk/bin"

# ── pnpm ──────────────────────────────────────────────────────────────────────
set -gx PNPM_HOME "/Users/sergio/Library/pnpm"
fish_add_path "$PNPM_HOME"

# ── Bun ───────────────────────────────────────────────────────────────────────
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"

# ── XDG ───────────────────────────────────────────────────────────────────────
set -gx XDG_CONFIG_HOME "$HOME/.config"

# ── Aliases ───────────────────────────────────────────────────────────────────
alias brewup='brew update && brew upgrade'
alias drizzle-studio='pnpm drizzle-kit studio --verbose'
alias prettier-write='pnpm dlx prettier . --write'
alias drizzle-studio-bun='bun drizzle-kit studio --verbose'
alias prettier-write-bun='bunx prettier . --write'
alias my-ip="ip a | rg en0 -A 3"
alias cc="gcc-15"
alias c++="g++-15"
alias mu-d="cargo build --bins && cargo run --bin mueve-daemon"
alias mu="cargo run --bin mueve"
