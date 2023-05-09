#############################
# Zim
#############################
export ZIM_HOME="$HOME/software/zim"
export ZIM_CONFIG_FILE="$ZDOTDIR/.zimrc"

#############################
# Programming languages
#############################

# Cargo / Rust
export RUSTUP_HOME="$HOME/software/rustup"
export CARGO_HOME="$HOME/software/cargo"
. "$HOME/software/cargo/env"

# Go
export GOPATH="$HOME/software/go"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Opam / OCaml
export OPAMROOT="$HOME/software/opam"

# npm cache dir
export NPM_CONFIG_CACHE="$HOME/.cache/npm"

#############################
# Other stuff
#############################

export EDITOR="/usr/bin/nvim"
export MOZ_ENABLE_WAYLAND=1
