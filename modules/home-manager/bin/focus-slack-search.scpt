(*
 * Focus Slack and focus on the search
 *
 * Usage: osascript focus-slack-search.scpt
 *)

tell application "Firefox" to activate
tell application "System Events"
    keystroke "1" using command down
    keystroke "k" using command down
end tell
