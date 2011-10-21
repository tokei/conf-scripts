#
# Shell function to parse the git repository of the current directory 
# and return the branch name and a dirty marker depending on the state 
# of the repository. Useful to augment your prompt. Use 
#
#   \$(parse_git_branch)
#
# inside your PS1 string.
#
#
# TODO:
# - add a marker if untracked files are present
# - change color to green if repository is clean
#

parse_git_branch ()
{
if git rev-parse --git-dir >/dev/null 2>&1
then
	gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
	if git diff --quiet 2>/dev/null >&2 
	then
		gitver="[$gitver]"
	else
		gitver="[*$gitver]"
	fi
else
	return 0
fi
echo $gitver
}
