#!/bin/bash
gpt_file="/tmp/hide_gpt_window.txt"

function hide_gpt() {
	pid=$(hyprctl clients -j | jq '.[] | select(.title | test("ChatGPT — Mozilla Firefox")) | .pid')
	hyprctl dispatch movetoworkspacessilent 99,pid:"$pid"
	echo "$pid" >>"$gpt_file"
}

function show_gpt() {
	pid=$(tial -1 "$gpt_file" && sed -i '$d' "$gpt_file")
	[ "$pid" = "" ] && exit

	current_workspace=$(hyprctl activeworkspace -j | jq '.id')
	hyprctl dispatch movetoworkspacessilent "$current_workspace,pid:$pid"
}

if [ -n "$1" ]; then
	if [ "$1" == "h" ]; then
		hide_window >>/dev/null
	else
		show_window >>/dev/null
	fi
fi
