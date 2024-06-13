#!/bin/bash

# Browser shortcuts to use from the terminal or 
# with a karabiner keybinding

ff() {
    /Applications/Firefox.app/Contents/MacOS/firefox "$@"
}

if [ "$#" -eq 0 ]; then 
    ff --new-tab about:blank
else
    shortcut="$1"
    search_query=$(perl -MURI::Escape -e 'print uri_escape($ARGV[0]);' "${*:2}")
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
        #
        # TR specific
        #
        "trpo")
            open "https://github.com/pulls?q=is%3Aopen+is%3Apr+archived%3Afalse+user%3Atraderepublic+$search_query"
            ;;
        "trpc")
            open "https://github.com/pulls?q=is%3Apr+archived%3Afalse+user%3Atraderepublic+is%3Aclosed+$search_query"
            ;;
        "trr")
            open "https://github.com/search?q=org%3Atraderepublic+$search_query&type=repositories"
            ;;
        "trc")
            open "https://github.com/search?q=org%3Atraderepublic+$search_query&type=code"
            ;;
        "c")
            open "https://traderepublic.atlassian.net/wiki/search?text=$search_query"
            ;;
        "j")
            open "https://traderepublic.atlassian.net/issues/?jql=text%20~%20%22$search_query%2A%22"
            ;;
        *)
            open "https://duckduckgo.com/?t=ffab&q=$shortcut%20$search_query"
            ;;
    esac
fi
