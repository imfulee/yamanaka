gitrm-non-remote() {
	git fetch -p
	for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do
		git branch -D $branch
	done
}

gitrm-branch() {
	if [ -z "$1" ]; then
		echo "usage: gitbranch-rm BRANCH"
		return 0
	fi

	branch_name=$1

	git branch -d $branch_name
	git push origin -d $branch_name
}

gitlogs() {
  if [ -z "$1" ]; then
    echo "usage: gitlogs PATH/TO/FILE"
    return 0
  fi

  file_path=$1
  git log --follow -p -- $file_path
}

gitstash() {
	git add .
	git stash
}
