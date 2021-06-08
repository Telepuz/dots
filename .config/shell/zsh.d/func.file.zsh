# Extract archive
function extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.7z)      local b=$(basename "$1" .7z);      7zr x "$1"      && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.bz2)     local b=$(basename "$1" .bz2);     bunzip2 "$1"    && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.deb)     local b=$(basename "$1" .deb);     ar x "$1"       &&                             return 0 ;;
      *.gz)      local b=$(basename "$1" .gz);      gunzip "$1"     && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.lrz)     local b=$(basename "$1" .lrz);     lrunzip "$1"    && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.rar)     local b=$(basename "$1" .rar);     unrar e "$1"    && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.bz2) local b=$(basename "$1" .tar.bz2); bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.gz)  local b=$(basename "$1" .tar.gz);  bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.lrz) local b=$(basename "$1" .tar.lrz); lrztar -d "$1"  && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar.xz)  local b=$(basename "$1" .tar.xz);  bsdtar Jxf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tar)     local b=$(basename "$1" .tar);     bsdtar xf "$1"  && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tbz2)    local b=$(basename "$1" .tbz2);    bsdtar xjf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.tgz)     local b=$(basename "$1" .tgz);     bsdtar xzf "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.xz)      local b=$(basename "$1" .gz);      xz -d "$1"      && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.Z)       local b=$(basename "$1" .Z);       uncompress "$1" && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.zip)     local b=$(basename "$1" .zip);     unzip -qq "$1"  && [[ -d "$b" ]] && cd "$b" || return 0 ;;
      *.zst)     local b=$(basename "$1" .zst);     tar xf "$1"     &&                             return 0 ;;
      *) echo "Unknown format '$1'..."                              &&                             return 1 ;;
    esac
    return 0
  else
    echo "'$1' is not a valid file!"
    return 1
  fi
}

# Pack to archive
function pack() {
  if [ $1 ] ; then
    case $1 in
      tbz) tar cjvf $2.tar.bz2 $2                && return 0 ;;
      tgz) tar czvf $2.tar.gz  $2                && return 0 ;;
      txz) tar -caf $2.tar.xz  $2                && return 0 ;;
      tar) tar cpvf $2.tar  $2                   && return 0 ;;
      bz2) bzip $2                               && return 0 ;;
      gz)  gzip -c -9 -n $2 > $2.gz              && return 0 ;;
      zip) zip -r $2.zip $2                      && return 0 ;;
      7z)  7z a $2.7z $2                         && return 0 ;;
      *)   echo "'$1' Unknown archive format..." && return 0 ;;
    esac
    return 0
  else
    echo "'$1' is not a valid file!"
  fi
}
