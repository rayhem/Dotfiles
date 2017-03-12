# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam2 8bit blue

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
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

# Disable hostname completion
zstyle ':completion:*' hosts off

# auto rehash commands, esp. after apt install
# http://www.zsh.org/mla/users/2011/msg00531.html
zstyle ':completion:*' rehash true

if [ -f ~/.dotfiles/aliases ]; then
  source ~/.dotfiles/aliases
fi

##==CONFIGURE ENVIRONMENT===========================##
export EDITOR="vim"
export TERM=xterm-256color

##==OPTIONS=========================================##
setopt AUTO_CD              #Turns on Auto cd for fast dir switching
setopt AUTOPUSHD            #forces cd to behave as pushd
setopt CORRECT              #Enables spelling correction for commands
setopt HIST_IGNORE_ALL_DUPS #Ignores duplicate history entries
setopt NUMERIC_GLOB_SORT    #Sorts globs with numbers
