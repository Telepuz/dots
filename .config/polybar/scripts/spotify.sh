#!/usr/bin/env bash
PREV='󰑟'
PLAY='󰐊'
PAUSE='󰏤'
NEXT='󰈑  '
OFF_MESSAGE=''
STATUS=$(/usr/bin/playerctl --player=spotify status 2>&1)

prev() {
    echo "$PREV"
    if [[ "$1" == 'left' ]]; then
        /usr/bin/playerctl --player=spotify previous
    fi
}

cent() {
    if [[ "$1" == '' ]] && [[ "$STATUS" == 'Playing' ]]; then
        echo "$PAUSE"
    elif [[ "$1" == '' ]] && [[ "$STATUS" == 'Paused' ]]; then
        echo "$PLAY"
    elif [[ "$1" == '' ]] && [[ "$STATUS" == 'Stopped' ]]; then
        echo "$PLAY"
    fi

    if [[ "$1" == 'left' ]]; then
        /usr/bin/playerctl --player=spotify play-pause
    fi
}

next() {
    echo "$NEXT"
    if [[ "$1" == 'left' ]]; then
        /usr/bin/playerctl --player=spotify next
    fi
}

right() {
    MESSAGE_HEAD="$(playerctl --player=spotify metadata --format '{{ artist }}')"
    MESSAGE_BODY="$(playerctl --player=spotify metadata --format '{{ title }}')"
    /usr/bin/notify-send "$MESSAGE_HEAD" "$MESSAGE_BODY"
}

main() {
    if [[ "$STATUS" == 'No players found' ]]; then
        case "$1" in
            'prev')
                echo
            ;;
            'cent')
                echo "$OFF_MESSAGE"
            ;;
            'next')
                echo
            ;;
            *) exit 0
        esac
        exit 0
    fi

    case "$1" in
        'prev')
            prev "$2"
        ;;
        'cent')
            cent "$2"
        ;;
        'next')
            next "$2"
        ;;
        'right')
            right "$2"
        ;;
        *) exit 0
    esac
}
main "$@"
