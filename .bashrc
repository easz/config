##  Note: Manual Installation Steps
##
##  AG              -- https://github.com/ggreer/the_silver_searcher
##  FZF             -- https://github.com/junegunn/fzf#using-git
##  BASH-GIT-PROMPT -- https://github.com/magicmonty/bash-git-prompt

# Read /etc/bashrc, if present.
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# Read any private stuff, if present.
if [ -f ~/.bashrc.private ]; then
  source ~/.bashrc.private
fi

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
export PATH="/usr/local/bin:$PATH"
export PATH="~/Workspace/LOS/platform-tools:$PATH"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ag -- silver searche for fzfr
if hash ag 2>/dev/null; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

## bash-git-prompt
GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_IGNORE_SUBMODULES=1
GIT_PROMPT_WITH_VIRTUAL_ENV=0
GIT_PROMPT_SHOW_UPSTREAM=0
GIT_PROMPT_SHOW_UNTRACKED_FILES=no
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
GIT_PROMPT_THEME=Custom # (default ~/.git-prompt-colors.sh)
source ~/.bash-git-prompt/gitprompt.sh

