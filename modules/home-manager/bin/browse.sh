#!/bin/bash

# Browser shortcuts to use from the terminal or 
# with a karabiner keybinding

ff () {
    /Applications/Firefox.app/Contents/MacOS/firefox "$@"
}

if [ "$#" -eq 0 ]; then 
    ff --new-tab about:blank
else
    shortcut="$1"
    search_query="${*:2}"
    case $shortcut in
        "i")
            open "https://duckduckgo.com/?t=ffab&q=$search_query&iax=images&ia=images"
            ;;
        "g")
            open "https://github.com/search?q=$search_query"
            ;;
        "d")
            open "https://hub.docker.com/search?q=$search_query"
            ;;
        "en")
            open "https://translate.google.com/?sl=auto&tl=en&text=$search_query&op=translate"
            ;;
        "de")
            open "https://translate.google.com/?sl=auto&tl=de&text=$search_query&op=translate"
            ;;
        "cn")
            open "https://translate.google.com/?sl=auto&tl=zh-TW&text=$search_query&op=translate"
            ;;
        "nu")
            open "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=$search_query"
            ;;
        "y")
            open "https://www.youtube.com/results?search_query=$search_query"
            ;;
        "ym")
            open "https://music.youtube.com/search?q=$search_query"
            ;;
        "m")
            open "https://www.google.com/maps?q=$search_query"
            ;;
        "nf")
            open "https://www.netflix.com/search?q=$search_query"
            ;;
        *)
            open "https://duckduckgo.com/?t=ffab&q=$shortcut $search_query"
            ;;
    esac
fi
