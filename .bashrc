# Read system bashrc, if present.
[ -f /etc/bashrc ] && source /etc/bashrc
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc

# locale
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# TERM
export TERM=xterm-256color

# No duplicated history
export HISTCONTROL=ignoreboth:erasedups

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
[ -d /usr/local/sbin ]                && export PATH="/usr/local/sbin:$PATH"
[ -d /usr/local/opt/go/libexec ]      && export PATH="$PATH:/usr/local/opt/go/libexec/bin"

##
## Add-On & Extra
##
# Note: the order matters

# bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_IGNORE_SUBMODULES=1
GIT_PROMPT_WITH_VIRTUAL_ENV=0
GIT_PROMPT_SHOW_UPSTREAM=0
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
GIT_PROMPT_THEME=Custom # (default ~/.git-prompt-colors.sh)
#
if [ -f ~/.bash-git-prompt/gitprompt.sh  ]; then
  source ~/.bash-git-prompt/gitprompt.sh
elif [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
  source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
else
  echo "To install bash-git-prompt: https://github.com/magicmonty/bash-git-prompt"
fi


# bash-completion
if [ -f "/usr/local/etc/bash_completion" ]; then
  source "/usr/local/etc/bash_completion"
elif [ -f " /usr/share/bash-completion/bash_completion" ]; then
  source " /usr/share/bash-completion/bash_completion"
elif [ -f "/etc/profile.d/bash_completion.sh" ]; then
  :
else
  echo "To install bash-completion: https://github.com/scop/bash-completion"
fi


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


# TPM
[ -d ~/.tmux/plugins/tpm ] || echo "To install tmux plugin manager: https://github.com/tmux-plugins/tpm"


# fzf
if [ ! -d ~/.fzf ]; then
  echo "To install fzf with vim: https://github.com/junegunn/fzf.vim"
else
  [ -f ~/.fzf.bash ] && source ~/.fzf.bash
  if hash fzf 2>/dev/null; then
    export FZF_TMUX=1
  else
    echo "To install fzf: https://github.com/junegunn/fzf"
  fi
fi


# ag -- silver searche for fzf
if hash ag 2>/dev/null; then
  if hash fzf 2>/dev/null; then
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
else
  echo "To install silver searcher: https://github.com/ggreer/the_silver_searcher"
fi

# python
# https://opensource.com/article/19/6/python-virtual-environments-mac
# https://opensource.com/article/19/5/python-3-default-mac#what-to-do
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
if command -v virtualenv 1>/dev/null 2>&1; then
  export WORKON_HOME=~/.virtualenvs
  mkdir -p $WORKON_HOME
  . $(pyenv which python3)/../virtualenvwrapper.sh
fi

##
## Private Stuff
##

# Read any private stuff, e.g. tokens, keys, if present.
[ -f ~/.bashrc.private ] && source ~/.bashrc.private

