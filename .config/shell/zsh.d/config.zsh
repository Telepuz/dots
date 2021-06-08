# Variables
fpath=($ZSH/functions $ZSH/completions $ZSH $fpath)
WORDCHARS=''

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

# History
HISTSIZE=50000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME/zsh_history"

setopt append_history             # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history           # record timestamp of command in HISTFILE
setopt hist_expire_dups_first     # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups           # ignore duplicated commands history list
setopt hist_ignore_space          # ignore commands that start with space
setopt hist_reduce_blanks         # Delete empty line
setopt hist_verify                # show command with history expansion to user before running it
setopt inc_append_history         # add commands to HISTFILE in order of execution
setopt prompt_subst               # the prompt string is first subjected to parameter expansion, command substitution and arithmetic expansion
setopt share_history              # share command history data

# Options
autoload -U compaudit compinit    # Load all stock functions
setopt AUTO_CD                    # Change dir without cd-command
setopt no_beep                    # don't beep on error
setopt nomatch                    # Disable ZSH regexp
setopt NOTIFY                     # Notify for background process

# Time report
REPORTTIME=15

# Save the location of the current completion dump file.
if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${HOME}/.cache/zcompdump-${HOST}-${ZSH_VERSION}"
fi

if [[ $ZSH_DISABLE_COMPFIX != true ]]; then
  # Load only from secure directories
  compinit -i -d "${ZSH_COMPDUMP}"
else
  # If the user wants it, load from all found directories
  compinit -u -d "${ZSH_COMPDUMP}"
fi
