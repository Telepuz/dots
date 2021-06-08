# Basic operation
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp -iv'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias mkdir='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -I --preserve-root'

# Location
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias l='ls'
alias la='ls -la'
alias lf='ls -lFh | grep "^-"'
alias ll='ls -lAFh'
alias lr='ls -tRFh'
alias ls='ls -F --color=auto --group-directories-first'

# Pipeline command
alias -g G='| grep'
alias -g GC='| grep -v "^#\|^$"'
alias -g H='| head'
alias -g L='| less'
alias -g T='| tail'
alias -g W='| wc -l'
alias -g J='| jq'

# BookMarks
alias dl='cd $HOME/Downloads; la'
alias doc='cd $HOME/Documents; la'
alias yan='cd $HOME/yandex; la'
alias flash='cd /mnt/flash; la'

# Network
alias ip='ip -color'
alias ports='netstat -tunlp'
if (( $(lsb_release -r | awk '{print $2}') < 9 )); then
    alias ip='ip'
fi
alias wget='wget -c'

# System
alias cx='chmod +x'
alias psa='ps aux'
alias psag='ps aux | grep -v grep | grep'
alias tmux='tmux -f $XDG_CONFIG_HOME/tmux.conf'
alias sudoi='sudo -E zsh'

# SpellBook
alias kk='ll'
alias vf='cd'
alias xs='cd'

# Other
alias cat='bat --style=plain'
alias iftop='LC_ALL=en iftop'
alias iack='unset LC_ALL; iack'
alias rdp_win='xfreerdp +clipboard /cert-ignore -compression /bpp:32 /u:telepuz /f'
alias chc='clickhouse client -u system'
if [ -x "$(command -v micro)" ]; then
    alias nano=$EDITOR
    alias vim=$EDITOR
fi
