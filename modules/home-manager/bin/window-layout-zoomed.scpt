-- Get screen dimensions
tell application "Finder"
    set screenBounds to bounds of window of desktop
end tell

set screenWidth to item 3 of screenBounds
set screenHeight to item 4 of screenBounds

-- Resize and maximize all visible windows
tell application "System Events"
    set appList to (every process whose visible is true)
    repeat with appProc in appList
        tell appProc
            try
                set winList to windows
                repeat with win in winList
                    set position of win to {0, 0}
                    set size of win to {screenWidth, screenHeight}
                end repeat
            end try
        end tell
    end repeat
end tell
