#compdef dbaasctl
_dbaasctl_completion() {
  eval $(env _TYPER_COMPLETE_ARGS="${words[1,$CURRENT]}" _DBAASCTL_COMPLETE=complete_zsh dbaasctl)
}

compdef _dbaasctl_completion dbaasctl
