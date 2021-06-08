#!/usr/bin/env bash
# Check install xbacklight
MAXVALUE="120000"
STEP="6000"
CURRENT="$(cat /sys/class/backlight/intel_backlight/brightness)"
ACTION="$1"

HELP_MESSAGE="""Script to managment backlight

Parameter:
inc   - Increase +5%
dec   - Decrease -5%
"""

# Main function
main () {
    case $ACTION in
        "inc")
            if [[ "$CURRENT" -ge "$MAXVALUE" ]]; then
                exit 0
            fi
            NEWVALUE=$(("$CURRENT" + "$STEP"))
            echo "$NEWVALUE" | sudo tee /sys/class/backlight/intel_backlight/brightness
            ;;
        "dec")
            if [[ "$CURRENT" -eq 0 ]]; then
                exit 0
            fi
            NEWVALUE=$(("$CURRENT" - "$STEP"))
            echo "$NEWVALUE" | sudo tee /sys/class/backlight/intel_backlight/brightness
            ;;
        *)
            echo "$HELP_MESSAGE"
            ;;
    esac
}
main "$@"
