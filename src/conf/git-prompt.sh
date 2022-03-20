# Author: Arthur Lui
# Last modified 31 August, 2019.

# Parse a git repo name, if possible.
parse_git_reponame() {
  basename `git rev-parse --show-toplevel 2> /dev/null` 2> /dev/null
}

# Parse the current branch of a git repo, if possible.
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# Check for any changes on git, if possible.
# If there are any changes, return a '+'.
check_for_git_changes() {
  git status -s 2> /dev/null | [[ $(wc -l) -gt 0 ]] && echo "+"
}

# Parse the branch and add flag(+) for changes.
parse_git_branch_and_changes() {
  local git_branch=`parse_git_branch`
  local git_has_changes=`check_for_git_changes`
  echo "$git_branch$git_has_changes"| sed -e 's/) +/+) /'
}

# Append git info to Prompt Statement 1 (PS1)
append_git_info_to_ps1() {
  local YELLOW='\[\e[0;33m\]'
  local BYELLOW='\[\e[1;33m\]'
  local NOCOLOR='\[\e[0m\]'

  # Note that PS1 will contain the *name* of the parser functions and not their
  # return values. An echo of PS1 will make this clear. This is why the prompt
  # can be updated with git info without restarting the prompt each time.
  PS1=$PS1$BYELLOW'$(parse_git_reponame)'
  PS1=$PS1$YELLOW'$(parse_git_branch_and_changes)'$NOCOLOR
}

append_git_info_to_ps1
