(*
 * Focus Slack and focus on the search
 *
 * Usage: osascript focus-slack-search.scpt
 *)

tell application "Slack" to activate
tell application "System Events"
    keystroke "k" using command down
end tell
