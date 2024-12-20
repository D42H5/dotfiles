# Setting usual stuff to PATH if non-root user
if [[ $UID != 0 || $EUID != 0 ]];
then
	export PATH=$HOME/bin:/usr/local/bin:$HOME/.scripts:$PATH
fi

# Very nice options to have set/unset
setopt autocd
setopt promptsubst
unsetopt histverify

# Keybinds
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-

# Autocompletion
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit -d $HOME/.cache/zsh/zcompdump-$ZSH_VERSION

# Default editor
export EDITOR=/usr/bin/nvim

#Make it so git doesn't flag untracked files
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Convenient variable
ZSH_SOURCES_DIR=$HOME/.config/zsh_sources

# Source git and vcs_info
source $ZSH_SOURCES_DIR/git.zsh
source $ZSH_SOURCES_DIR/vcs_info.zsh;

# Source virtualenv prompt support stuff
source $ZSH_SOURCES_DIR/virtualenv.zsh;

# Source useful command line tools
source $ZSH_SOURCES_DIR/history.zsh;

# source $ZSH_SOURCES_DIR/completion.zsh;

# Possibly yoink stuff from
# source $ZSH_SOURCES_DIR/key-bindings.zsh;

# Other nice exports to have
# export TERM=xterm-kitty
export MANPATH="/usr/local/man:$MANPATH"
export LESSHISTFILE=-
export XDG_CONFIG_HOME=$HOME/.config

# Fix loading shared libraries issue
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

# Aliases
source $ZSH_SOURCES_DIR/aliases.zsh

# Start ssh-agent for retaining keys
# [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# Themes to maybe yoink from if customizing theme in the future: 
# 	amuse
# 	bira

# Sourcing theme and theme relevant tool, important to source after 
# virtualenv due to dependent function
source $ZSH_SOURCES_DIR/theme-and-appearance.zsh;
source $ZSH_SOURCES_DIR/warmblood.zsh-theme

# Source my user defined functions
FUNC_PATH=$ZSH_SOURCES_DIR/functions.zsh
if [[ -f $FUNC_PATH ]]; then
	source $FUNC_PATH
fi

# Fix valgrind (hopefully)
#source '/etc/profile.d/debuginfod.sh'

# Always source zsh-syntax-completion after plugin sources
source $ZSH_SOURCES_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zoxide stuff
export _ZO_DATA_DIR=$HOME/.cache/zoxide
eval "$(zoxide init --cmd cd zsh)"
