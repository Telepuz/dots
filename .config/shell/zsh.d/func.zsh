# Mount\umount function
function mount-flash() {
  sudo umount /mnt/flash
  sudo mount "$1" /mnt/flash -o nosuid,nodev,relatime,uid=1000,gid=1000,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,showexec,utf8,flush,errors=remount-ro
}

function mount-iso() {
  sudo umount /mnt/cd
  sudo /bin/mount "$1" /mnt/cd --options loop
}

# Create a new directory and enter it
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# Find functions
function f() {
  grep -rni "$*" .
}

function ff() {
  find . -type f -name "$*"
}

function fdir() {
  find . -type d -name "$*"
}

zmodload zsh/langinfo

# Print collumn
function print_collumn {
  while read -r DATA; do
    echo "$DATA" | awk '{print $'$1'}'
  done
}
alias -g 'PC'='| print_collumn'