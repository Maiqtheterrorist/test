#!/bin/sh
echo -ne '\033c\033]0;BallServer\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/BallServer.x86_64" "$@"
