# Git utils
# ---------

g() { 
  # $ g # alone will do git status, otherwise will run git with arguments
  if [ "$#" -eq 0 ]; then 
    git status -s 
  else
    git "$@"
  fi
}

_fzf_git_branches() {
  local header format result
  header="HEAD\tBranch\tSHA\tSubject\n"
  format='%(*HEAD)\t%(refname:short)\t%(objectname:short)\t%(subject) (%(committerdate:relative))'
  result=$(git branch --sort=-committerdate --sort=-HEAD --format="$format")
  echo -e "$header$result" | column -ts$'\t'
}

_fzf_git_tags() {
  local header format result
  header="Tag\tSHA\tSubject\n"
  format='%(refname:short)\t%(objectname:short)\t%(subject) (%(committerdate:relative))'
  result=$(git tag --sort=-taggerdate --format="$format")
  echo -e "$header$result" | column -ts$'\t'
}

_fzf_git_commits() {
  git log --pretty=format:'%h -%d %s (%cr) <%an>' --abbrev-commit --date=relative
}

_fzf_git_worktrees() { git worktree list; }

_fzf_complete_git_pick() {
  # $1: result for fuzzy complete
  # $2: count of lines in the result
  # to lock as header_lines
  local result header_lines binds
  result=$1
  header_lines=$2
  binds="ctrl-d:reload(_fzf_git_branches),ctrl-f:reload(echo foo bar)"
  shift
  shift
   _fzf_complete \
     --bind="$binds" \
     --reverse \
     --header-lines="$header_lines" \
     --height=40% -- "$@" < <($result)
}

#custom fuzzy completions for git
_fzf_complete_fuzzy_git() {
  case "$1" in
    *' checkout '*|*' o '*)
        _fzf_complete_git_pick _fzf_git_branches 2 "$@"
        ;;
    *' worktree '*|*' wr '*|*' w '*)
        _fzf_complete_git_pick _fzf_git_worktrees 0 "$@"
        ;;
    *' show '*)
        _fzf_complete_git_pick _fzf_git_commits 0 "$@"
        ;;
    *)
        eval "zle ${fzf_default_completion:-expand-or-complete}"
        ;;
  esac
}

_fzf_complete_git() { _fzf_complete_fuzzy_git "$@"; }
_fzf_complete_g() { _fzf_complete_fuzzy_git "$@"; }

# Post process the result of the fzf completion
_fzf_complete_git_pick_post() { awk '{printf $1}'; }
