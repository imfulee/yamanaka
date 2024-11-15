used-space() {
  local dir=$1
  if [ -z "$1" ]; then
    dir="."
  fi

  du -c -d 1 -h "$dir" | sort -h
}
