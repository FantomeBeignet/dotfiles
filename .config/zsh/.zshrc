export VIRTUAL_ENV_DISABLE_PROMPT=1

# Aliases
alias burp='java -jar -Xmx6G BurpSuiteCommunity/burpsuite_community.jar &'
alias pgadmin='/usr/bin/psql &'
alias jd='java -jar /usr/bin/jd-gui.jar &'
alias jadx='/usr/bin/jadx/bin/jadx'
alias jadx-gui='/usr/bin/jadx/bin/jadx-gui'
alias ytdl='youtube-dl'
alias sn='shutdown now'
alias android-studio='~/android-studio/bin/studio.sh'
alias visual='/usr/local/bin/visual/VisUAL.sh &'

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

# Bat
alias cat=bat

# Man with syntax highlighting
export MANPAGER="sh -c 'col -bx | bat -pl man'"
export MANROFFOPT="-c"

# Better help commands
alias bathelp='bat --plain --language=help'
help() {
    "$@" --help 2>&1 | bathelp
}

alias vim=nvim

source ${ZDOTDIR:-~}/antidote/antidote.zsh
antidote load

bindkey '^[[A' history-substring-search-up 
bindkey '^[[B' history-substring-search-down

alias hxd=hexyl
