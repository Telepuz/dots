#!/usr/bin/env zsh
# Function
function zzh() {
    tmux rename-window "$(echo $1 | cut -f1 -d'.')"
    ssh -o RequestTTY=Yes \
      -o LocalCommand='rsync --update -avz --copy-links -e "ssh -o PermitLocalCommand=no" %d/.config/ssh_dots/.* %r@%n:~ 2>&1 > /dev/null' \
      -o PermitLocalCommand=yes \
      $1 'zsh --login -c "sudo -E zsh"'
    tmux set-window-option automatic-rename "on" 1>/dev/null
}

# Completion
compdef _zzh zzh

_zzh() {
    local line
    _arguments -C \
        "1: :($(_zzh_hosts))" \
        "*::arg:->args"
}

_zzh_hosts() {
    HOSTS=()
    if [[ -f ~/.ssh/config ]]; then
        HOSTS=( $(grep -r '^Host' ~/.ssh/config{,.d} | grep -v "*" | awk '{first = $1; $1 = ""; print $0; }' | xargs) )
    fi
    print $HOSTS
}
