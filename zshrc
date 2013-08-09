# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="jonathan" # daveverwer frisk gentoo jonathan josh robbyrussel 
ZSH_THEME="daveverwer"

# Set aliases
alias bc='bc -l'
alias la='ls -a'
alias ll='ls -lh'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias open='xdg-open'
alias getwd='pwd | tr -d "\n" | pbcopy'

# Set options
setopt AUTO_CD              # enables fast dir switching
setopt AUTOPUSHD            # forces cd to behave as pushd
setopt CORRECT              # enables spelling correction
setopt HIST_IGNORE_ALL_DUPS # ignore duplicate history entries
setopt HIST_IGNORE_SPACE    # ignore commands starting with a space in the hist
setopt INC_APPEND_HISTORY   # write new history lines as they get entered
setopt NUMERIC_GLOB_SORT    # sort globs with numbers
setopt SHARE_HISTORY        # retrieve hist file every time hist is called

# Export variables
export EDITOR="vim"
export TERM="xterm-256color"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system -- who knows what this does (comes as default)
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' hosts off  # do not complete from hosts file
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
