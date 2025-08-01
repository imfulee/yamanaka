used-space() {
  local dir=$1
  if [ -z "$1" ]; then
    dir="."
  fi

  sudo du -c -d 1 -h "$dir" | sort -h
}

alias rsync-flagged="rsync -zhvP"

alias fnvim='nvim $(fzf)'

alias fcmd="history 0 | fzf"

format-json() {
  if [ -z "$1" ]; then 
    echo "usage: format-json FILE"
    return 0
  fi

  local filepath=$1

  if [ ! -f $filepath ]; then 
    echo "file $filepath not found"
    return 0
  fi

  jq . $filepath | sponge $filepath
}