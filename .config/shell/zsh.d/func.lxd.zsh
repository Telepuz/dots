# Completion for LXC
compdef _lxc lxc-attach lxc-autostart lxc-cgroup lxc-checkconfig lxc-checkpoint lxc-config lxc-console lxc-copy lxc-remove lxc-create lxc-destroy lxc-device lxc-execute lxc-freeze lxc-info lxc-monitor lxc-snapshot lxc-start lxc-stop lxc-unfreeze lxc-unshare lxc-update-config lxc-usernsexec lxc-wait
compdef _lxc_ls lxc-ls
compdef _lxc_containers_all lxc-info lxc-copy lxc-destroy lxc-device lxc-execute lxc-monitor lxc-snapshot lxc-wait
compdef _lxc_containers_active lxc-stop lxc-console lxc-attach
compdef _lxc_containers_stopped lxc-start
compdef _lxc_containers_remove lxc-remove

_lxc() {
    local line

    _arguments -C \
        "-o[Output log to FILE instead of stderr]" \
        "--logfile=FILE[Output log to FILE instead of stderr]" \
        "-q[Don't produce any output]" \
        "--quiet[Don't produce any output]" \
        "-P[Use specified container path]" \
        "--lxcpath=PATH[Use specified container path]" \
        "--help[Give this help list]" \
        "--usage[Give a short usage message]" \
        "--version[Print the version number]"
}

_lxc_containers_all() {
    local line

    _arguments -C \
        "-n[Container name]:host:->hosts"

    case "$state" in
        hosts)
            _values , $(_lxc_hosts_all)
        ;;
    esac
}

_lxc_containers_active() {
    local line

    _arguments -C \
        "-n[Container name]:host:->hosts"

    case "$state" in
        hosts)
            _values , $(_lxc_hosts_active)
        ;;
    esac
}

_lxc_containers_stopped() {
    local line

    _arguments -C \
        "-n[Container name]:host:->hosts"

    case "$state" in
        hosts)
            _values , $(_lxc_hosts_stopped)
        ;;
    esac
}

_lxc_containers_remove() {
    local line

    _arguments -C \
        "-y[Container name]:host:->hosts"

    case "$state" in
        hosts)
            _values , $(_lxc_hosts_stopped)
        ;;
    esac
}

_lxc_ls() {
    _arguments -C \
        "-1[show one entry per line]" \
        "--line[show one entry per line]" \
        "-f[use a fancy, column-based output]" \
        "--fancy[use a fancy, column-based output]" \
        "-F[comma separated list of columns to show in the fancy output valid columns are: NAME, STATE, PID, RAM, SWAP, AUTOSTART, GROUPS, INTERFACE, IPV4 and IPV6, UNPRIVILEGED]" \
        "--fancy-format[comma separated list of columns to show in the fancy output valid columns are: NAME, STATE, PID, RAM, SWAP, AUTOSTART, GROUPS, INTERFACE, IPV4 and IPV6, UNPRIVILEGED]" \
        "-g[comma separated list of groups a container must have to be displayed]" \
        "--groups[comma separated list of groups a container must have to be displayed]" \
        "--active[list only active containers]" \
        "--running[list only running containers]" \
        "--frozen[list only frozen containers]" \
        "--stopped[list only stopped containers]" \
        "--defined[list only defined containers]"
}

# Additional function
_lxc_hosts_all() {
    CONTAINERS=()
    if [[ -f /usr/bin/lxc-ls ]]; then
        CONTAINERS=( $(lxc-ls -1 | xargs) )
    fi
    print $CONTAINERS
}

_lxc_hosts_active() {
    CONTAINERS=()
    if [[ -f /usr/bin/lxc-ls ]]; then
        CONTAINERS=( $(lxc-ls -1 --active | xargs) )
    fi
    print $CONTAINERS
}

_lxc_hosts_stopped() {
    CONTAINERS=()
    if [[ -f /usr/bin/lxc-ls ]]; then
        CONTAINERS=( $(lxc-ls -1 --stopped | xargs) )
    fi
    print $CONTAINERS
}
