# Git prompt stuff
git_dirty_symbol=⚡
git_clean_symbol=
ZSH_THEME_GIT_PROMPT_PREFIX='%F{red}[%F{white}%B'
ZSH_THEME_GIT_PROMPT_SUFFIX='%F{reset}%F{red}%b]'
ZSH_THEME_GIT_PROMPT_DIRTY=' %F{yellow}'$git_dirty_symbol$'%b'
ZSH_THEME_GIT_PROMPT_CLEAN=' %F{cyan}%B'$git_clean_symbol$'%b'

# icon = nf-linux-archlinux
# prompt_symbol=󰀫

makePrompt() {
	prompt_symbol=󰁥

	# Root prompt symbol
	if [ $EUID -eq 0 ]
	then
		#icon = nf-md-omega
		prompt_symbol=󰏉
	fi

	# User and host names
	UHNAME="%F{red}[%F{white}%B%n%b%F{magenta}"$prompt_symbol"%F{white}%B%m%b%F{red}]"
	
	# Directory
	DIR="%F{red}[%F{white}%B%~%b%F{red}]"
	
	# Status code stuff
	STATUS="%(?,,%F{red}[%F{white}%B%?%b%F{red}])"

	VENV="%F{red}(%F{white}$(virtualenv_info)%F{red})"

	row1="%F{red}┌"$UHNAME" "$DIR
	if [ $VIRTUAL_ENV ]; then
		row2="\n%F{red}└$(git_prompt_info)"$VENV"> %F{reset}"
	else
		row2="\n%F{red}└$(git_prompt_info)> %F{reset}"
	fi
	
	# row2 with status
	#row2="\n%F{red}└$(git_prompt_info)"$STATUS"> %F{reset}"

	print $row1$row2
}

PROMPT='$(makePrompt)'
PS2=$' %F{red}|>%F{reset} '

