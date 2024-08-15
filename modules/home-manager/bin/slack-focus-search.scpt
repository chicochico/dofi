(*
 * Focus firefox on a slack tab, and focus on the search
 *
 * Usage: osascript firefox-focus-tab.scpt
 *)

tell application "Slack" to activate
tell application "System Events"
    keystroke "k" using command down
end tell
