export VIRTUAL_ENV_DISABLE_PROMPT=1

function activate() {
	if [[ -d .venv ]]
	then
		source .venv/bin/activate
	else
		echo "No venv found"
	fi
}

# opam configuration
test -r /home/tom/software/opam/opam-init/init.zsh && . /home/tom/software/opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="/home/tom/.local/bin:$PATH"

# pnpm
export PNPM_HOME="/home/tom/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Man with syntax highlighting
export MANPAGER="sh -c 'col -bx | bat -pl man'"
export MANROFFOPT="-c"


source ${ZDOTDIR:-~}/antidote/antidote.zsh
antidote load

bindkey '^[[A' history-substring-search-up 
bindkey '^[[B' history-substring-search-down
