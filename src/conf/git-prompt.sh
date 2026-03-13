# Author: Arthur Lui
# Last modified: 5 March 2026

is_git_repo() { git rev-parse --is-inside-work-tree &> /dev/null; }
git_branch() { git branch --show-current; }
git_state() { [[ -z $(git status -s) ]] || echo '+'; }
git_info() { ! is_git_repo || echo " $(git_branch)$(git_state)"; }

# Create PS1 prompt with git info
_() {
  local NOCOLOR='\[\e[0m\]'
  local PROMPT_GIT_COLOR='\[\e[1;38;5;9m\]' # light red
  local PROMPT_DIR_COLOR='\[\e[1;38;5;245m\]' # grey
  local ARROW=$'\xe2\x9d\xaf'

  # NOTE: PS1 contains the *names* of functions and not their
  # return values. An echo of PS1 will make this clear. This is why the
  # prompt can be updated with git info without restarting the prompt each
  # time.
  # PS1=$CORAL'$(git_info)'$NOCOLOR${PS1}
  PS1=${PROMPT_DIR_COLOR}'\W'${PROMPT_GIT_COLOR}'$(git_info)'${PROMPT_DIR_COLOR}${ARROW}' '${NOCOLOR}
} && _
