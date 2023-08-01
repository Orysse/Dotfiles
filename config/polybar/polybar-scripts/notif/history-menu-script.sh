#!/usr/bin/env sh
# Rofi extension for Dunst history

NAME="$(basename "$0")"
VERSION="0.0.1"

dunstctl history \
  | jq '.data | .[] | .[] | { appname:.appname.data, summary:.summary.data, icon_path:.icon_path.data, body:.body.data } |to_entries[]|(.key+" "+.value)' \
  | tr -d '"' \
  | while read line;
do
  type=$(echo $line | awk '{print $1;}')
  body=$(echo $line | cut -d' ' -f2-)
  if [[ $type == "appname" ]];
  then
    icon=""
    echo -en "[$body] "
  elif [[ $type == "summary" && $body != "" ]];
  then
    echo -en "$body: "
  elif [[ $type == "body" && $body != $type ]];
  then
    echo -e "$body$icon"
  elif [[ $type == "icon_path" && $body != $type ]]; then
    icon="\0icon\x1f$body"
  fi
done
