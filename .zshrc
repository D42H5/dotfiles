# Setting usual stuff to PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Very nice options to have set
setopt autocd
setopt promptsubst

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

# Source git and vcs_info
source '/usr/local/share/zsh_sources/git.zsh';
source '/usr/local/share/zsh_sources/vcs_info.zsh';

# Source useful command line tools
source '/usr/local/share/zsh_sources/history.zsh';

# source '/usr/local/share/zsh_sources/completion.zsh';

# Possibly yoink stuff from
# source '/usr/local/share/zsh_sources/key-bindings.zsh';

# Other nice exports to have
export TERM=xterm-kitty
export MANPATH="/usr/local/man:$MANPATH"
export LESSHISTFILE=-
export XDG_CONFIG_HOME=$HOME/.config

# Fix loading shared libraries issue
LD_LIBRARY_PATH=/usr/local/lib
export LD_LIBRARY_PATH

# Aliases
source '/usr/local/share/zsh_sources/zsh_aliases'

# Start ssh-agent for retaining keys
# [ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# Themes to maybe yoink from if customizing theme in the future: 
# 	amuse
# 	bira

# Sourcing theme and theme relevant tool
source '/usr/local/share/zsh_sources/theme-and-appearance.zsh';
source '/usr/local/share/zsh_sources/warmblood.zsh-theme'

# Source my user defined functions
FUNC_PATH=/usr/local/share/zsh_sources/functions.zsh
if [[ -f $FUNC_PATH ]]; then
	source $FUNC_PATH
fi

# Always source zsh-syntax-completion after plugin sources
source '/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
