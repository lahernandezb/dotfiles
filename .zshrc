export PATH="$HOME/.bin:$PATH"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"


setopt auto_cd
# Turn on spellling corrections for commands
setopt correct


if [ -f ~/.dotfiles/.aliases ]; then
    source ~/.dotfiles/.aliases
fi

if [ -f ~/.dotfiles/.functions ]; then
    source ~/.dotfiles/.functions
fi

precmd() {
  gitStatus="$(git symbolic-ref --short -q HEAD 2> /dev/null)"
  NEWLINE=$'\n'

  PROMPT="%~ %{$fg[yellow]%}${gitStatus}${NEWLINE}%{$fg[magenta]%}❯ %{$reset_color%}"
}

# PROMPT="%n %B%F{227}%1~%f%b ❯ "

# The following lines were added by compinstall

zstyle ':completion:*' matcher-list '+m:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[-]=** r:|=**'
zstyle :compinstall filename '/Users/luis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall