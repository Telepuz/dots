# kubectl
[ -x "$(command -v kubectl)" ] && {
    alias k='kubectl'
    source <(kubectl completion zsh)
}

# kubeadm
[ -x "$(command -v kubeadm)" ] && {
    source <(kubeadm completion zsh)
}
