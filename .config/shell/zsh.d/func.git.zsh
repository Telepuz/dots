# Update all git repos, recursive
function update_git_repo() {
  # store the current dir
  local CUR_DIR=$(pwd)

  # Let the person running the script know what's going on.
  echo -e "\033[1mPulling in latest changes for all repositories...\033[0m"

  # Find all git repositories and update it to the master latest revision
  for i in $(find . -name ".git" | cut -c 3-); do
    # Check if .git file => submodule then skip this step
    if test -f "$i"; then
      continue
    fi

    echo "";
    echo -e "\033[33m"${i:0:-5}"\033[0m";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    # finally pull
    git pull;
    git status -sb;

    # Update submodules
    [[ ! -z $(git submodule status) ]] && git submodule update

    # lets get back to the CUR_DIR
    cd $CUR_DIR
  done

  echo -e "\n\033[32mComplete!\033[0m\n"
}

# Outputs current branch info in prompt format
function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS=''
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}
