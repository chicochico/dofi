(*
 * Focus firefox on a tab using index
 *
 * Usage: firefox-focus-tab.scpt <tab_no>
 *
 * tab_no: The tab index to open
 *
 * Example: firefox-focus-tab.scpt 1
 *
 * This will open the first tab in Firefox
 *)

on run {tab_no}
    tell application "Firefox" to activate
    tell application "System Events"
        keystroke tab_no using command down
    end tell
end run
