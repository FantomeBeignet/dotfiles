virtual_env() {
	VENV=$(echo $VIRTUAL_ENV | awk -F '/' '{ print $NF }')
	if [ -z "$VENV" ]
	then
		VENV_PREFIX=""
		VENV_SUFFIX=""
	else
			VENV_PREFIX="["
		VENV_SUFFIX="]"
	fi
	echo "$VENV_PREFIX%B%F{006}$VENV%f%b$VENV_SUFFIX"
}


PROMPT='%B%F{012}%n%f - %b[%B%F{002}%2~%f%b] $(git_prompt_info)
%B>%b '
RPROMPT='%{$(echotc UP 1)%}$(virtual_env)%{$(echotc DO 1)%}'


ZSH_THEME_GIT_PROMPT_PREFIX="(%F{005}%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b)"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
