-- Get screen dimensions
tell application "Finder"
    set screenBounds to bounds of window of desktop
end tell

set screenWidth to item 3 of screenBounds
set screenHeight to item 4 of screenBounds

-- Calculate new window dimensions
set newWidth to screenWidth * 0.67
set newHeight to screenHeight * 0.96
set newX to (screenWidth - newWidth) / 2
set newY to (screenHeight - newHeight) / 2

-- Resize and centralize all visible windows
tell application "System Events"
    set appList to (every process whose visible is true)
    repeat with appProc in appList
        tell appProc
            try
                set winList to windows
                repeat with win in winList
                    set position of win to {newX, newY}
                    set size of win to {newWidth, newHeight}
                end repeat
            end try
        end tell
    end repeat
end tell
