# Find and set branch name var if in git repo
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}

# set custom prompt
setopt prompt_subst
PS1='%F{40}[%t] %F{27}%n@%F{7}%B%m%b%f:%F{36}%~%F{93}$(git_branch_name) %f> '

# add things to PATH
export PATH="/opt/homebrew/bin:$PATH"

# add git zsh-completion
#  if type brew &>/dev/null; then
#    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
#
#    autoload -Uz compinit
#    compinit
#  fi

# aliases
alias ls='ls -G'
alias ll='ls -la'
alias l='ls -Cah'
alias m1jekyll='arch -arch x86_64 bundle exec jekyll serve'

# add GPG
export GPG_TTY=$(tty)
