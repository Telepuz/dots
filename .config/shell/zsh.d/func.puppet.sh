# Functions for puppet
function pup() {
    if [[ "$1" == "" ]]; then
        puppet agent --test
    else
        ssh "$1" "sudo puppet agent -t"
    fi
}

function pupch() {
    puppet-check check
}

function pupf() {
    if [[ "$1" == "" ]]; then
        echo "Host is empty. Aborting..."
    else
        ssh "$1" "sudo puppet-enable; sudo puppet agent -t"
    fi
}

function pupdis() {
    if [[ "$2" == "" ]]; then
        TIME="100500 hours"
    else
        TIME="$2"
    fi
    if [[ "$1" == "" ]]; then
        puppet-disable "Belov" "$TIME"
    else
        ssh "$1" "sudo puppet-disable \"Belov\" \"$TIME\""
    fi
}
