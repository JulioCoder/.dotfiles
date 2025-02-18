# HOST_NAME=PWD
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
ZSH_DISABLE_COMPFIX="true"
source ~/.nvm/nvm.sh
nvm use --lts
#nvm use stable
#nvm use 17

setopt autocd
setopt appendhistory
setopt sharehistory
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt PROMPT_SUBST
#setopt EXTENDED_HISTORY

export PATH=$PATH:$HOME/bin
export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export TERM=xterm-256color

#use export in front of each line of this block when not using zsh.
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
HISTFILESIZE=10000

# Bind Option+Left/Right to move backward/forward by word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word

# Bind Command+Left/Right to move to beginning/end of line
bindkey "^[[1;9D" beginning-of-line
bindkey "^[[1;9C" end-of-line


export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# FD FDFIND
if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
elif command -v fdfind >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'
fi

# BAT BATCAT
if command -v bat >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}'"
elif command -v batcat >/dev/null 2>&1; then
  export FZF_DEFAULT_OPTS="--preview 'batcat --color=always {}'"
fi

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("🎲" "🌍" "🌵" "⚡" "🌕")

EMOJI=${emojis[$RANDOM % ${#emojis[@]}+1]}
#Line below was after home=$HOME
#dir=${dir/"$HOME"/"~"}

HOST_NAME=$EMOJI

precmd () {
    dir=$PWD
    home=$HOME
    printf "\n $txtred%s $bldpur%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
    fc -AI
}


PROMPT_COMMAND=precmd
# PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# PS1="$EMOJI >"
PS1=">"


#fortune | cowsay -f tux
#buckle &
#neofetch

function mkcd()
{
	mkdir $1 && cd $1
}
alias v='nvim'
alias python='python3'
alias ls='ls --color=auto' # List files in current directory
alias ll="ls -al -h" # List all files in current directory in long list format
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ff='find / -name'
alias f='find . -name'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip -c'
alias pacman='pacman --color=auto'
alias pactree='pactree --color'
alias vdir='vdir --color=auto'
alias watch='watch --color'
alias buckle='buckle -f -p /usr/local/share/bucklespring/wav &'
alias 🍺="git checkout -b drunk"
alias a='code .'
alias c='code .'
alias reveal-md="reveal-md --theme night --highlight-theme hybrid --port 1337"
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias o="open ." # Open the current directory in Finder
alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # MACBOOK
# #source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# #source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# #[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
#
# # LINUX
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# [ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh


# Determine the operating system
if [[ "$(uname)" == "Darwin" ]]; then

  # macOS ##########: Source plugins installed via Homebrew (typically in /opt/homebrew)
  
  if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  else
    echo "zsh-autosuggestions not found at /opt/homebrew/share/zsh-autosuggestions/"
  fi

  if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  else
    echo "zsh-syntax-highlighting not found at /opt/homebrew/share/zsh-syntax-highlighting/"
  fi
  # On Apple Silicon (M1/M2)      /opt/homebrew/etc/profile.d/autojump.sh.
  # On Intel Macs the path may be  /usr/local/etc/profile.d/autojump.sh
  # Run the command: brew info autojump
  if [ -f /opt/homebrew/etc/profile.d/autojump.sh ]; then
    source /opt/homebrew/etc/profile.d/autojump.sh
  else
    echo "autojump not found at /opt/homebrew/etc/profile.d/"
  fi

elif [[ "$(uname)" == "Linux" ]]; then

  # zsh-autosuggestions
  if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  elif [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
  else
    echo "zsh-autosuggestions not found on Linux"
  fi

  # zsh-syntax-highlighting
  if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  elif [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  else
    echo "zsh-syntax-highlighting not found on Linux"
  fi

  # autojump (location may vary)

  if [ -f /usr/share/autojump/autojump.sh ]; then
    source /usr/share/autojump/autojump.sh
  elif [ -f /usr/local/etc/profile.d/autojump.sh ]; then
    source /usr/local/etc/profile.d/autojump.sh
  else
    echo "autojump not found on Linux"
  fi

fi

# --------------------- 
# Replace "/Users/anto" by "/Users/yourUserName" in the following lines.
# ---------------------

# opam configuration
[[ ! -r /Users/anto/.opam/opam-init/init.zsh ]] || source /Users/anto/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/anto/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/anto/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/anto/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/anto/google-cloud-sdk/completion.zsh.inc'; fi

#LINUX
export PATH="$PATH:/home/ubuntu/lua-language-server/bin"

# LINUX
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
