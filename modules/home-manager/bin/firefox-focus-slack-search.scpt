(*
 * Focus firefox on a slack tab, and focus on the search
 *
 * Usage: osascript firefox-focus-tab.scpt
 *)

tell application "Firefox" to activate
tell application "System Events"
    keystroke "2" using command down
    keystroke "k" using command down
end tell
