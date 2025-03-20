#!/usr/bin/fish

set STATUS (playerctl status -p spotify)

switch $STATUS
case "No players found"
    set text 'Not Running'
case "Paused"
    set text 'Paused'
case "Playing"
    set text (playerctl metadata --player=spotify --format '{{artist}} - {{title}}')
    set tooltip (playerctl metadata --player=spotify --format '{{title}}\r{{artist}}\r{{album}}')
end


echo "{\"text\": \"$text \", \"tooltip\": \"$tooltip\", \"class\": \"$STATUS\"}" 