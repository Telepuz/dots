# ls colors
autoload -U colors && colors
(( $+commands[dircolors] )) && eval "$(dircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# git theming default: Variables for theming the git info prompt
HOST_PROMPT_="%{$fg_bold[yellow]%}%(?..✖)%{$fg_bold[yellow]%}%(!.#.$)%{$fg_bold[red]%}%30<...<%~%<<"
GIT_PROMPT="%{$fg_bold[yellow]%}\$(git_prompt_info)%{$fg_bold[yellow]%} % %{$reset_color%}"
PROMPT="$HOST_PROMPT_$GIT_PROMPT"

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%})%{$fg[yellow]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%})"
