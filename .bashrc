# Read /etc/bashrc, if present.
[ -f /etc/bashrc ] && source /etc/bashrc

# TERM
export TERM=xterm-256color

# Aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lla='ll -a'
alias md='mkdir -p'

# PATH
[ -d /usr/local/bin ]                 && export PATH="/usr/local/bin:$PATH"
[ -d ~/Workspace/LOS/platform-tools ] && export PATH="~/Workspace/LOS/platform-tools:$PATH"
[ -d /usr/local/opt/go/libexec ]      && export PATH="$PATH:/usr/local/opt/go/libexec/bin"


##
## Add-On & Extra
##

# tmux
if hash tmux 2>/dev/null; then
  # macOS require reattach-to-user-namespace
  if [[ "$OSTYPE" == "darwin"* ]]; then
    hash reattach-to-user-namespace 2>/dev/null \
      || echo "To install reattach-to-user-namespace: https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard"
  fi
else
  echo "To install tmux: https://github.com/tmux/tmux"
fi


# fzf
if [ -f ~/.fzf.bash ]; then
  source ~/.fzf.bash
else
  echo "To install fzf: https://github.com/junegunn/fzf#using-git"
fi


# ag -- silver searche for fzf
if hash ag 2>/dev/null && hash fzf 2>/dev/null; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
else
  echo "To install silver searcher: https://github.com/ggreer/the_silver_searcher"
fi


# bash-completion
if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
else
  echo "To install bash-completion: https://github.com/scop/bash-completion"
fi


# bash-git-prompt
if [ -f ~/.bash-git-prompt/gitprompt.sh  ]; then
  GIT_PROMPT_ONLY_IN_REPO=0
  GIT_PROMPT_FETCH_REMOTE_STATUS=0
  GIT_PROMPT_IGNORE_SUBMODULES=1
  GIT_PROMPT_WITH_VIRTUAL_ENV=0
  GIT_PROMPT_SHOW_UPSTREAM=0
  GIT_PROMPT_SHOW_UNTRACKED_FILES=no
  GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
  GIT_PROMPT_THEME=Custom # (default ~/.git-prompt-colors.sh)
  source ~/.bash-git-prompt/gitprompt.sh
else
  echo "To install bash-git-prompt: https://github.com/magicmonty/bash-git-prompt"
fi

##
## Private Stuff
##

# Read any private stuff, e.g. tokens, keys, if present.
[ -f ~/.bashrc.private ] && source ~/.bashrc.private

