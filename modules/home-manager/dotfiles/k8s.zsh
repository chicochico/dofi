# K8s utils
# ---------
# https://kubernetes.io/docs/reference/kubectl/quick-reference/
#
# USAGE:
# $ kx # to switch context
# $ kn # to switch namespace
# $ k <verb> <flags>  <resource> <CTRL-T> # to fuzzy search resources (While in fzf CTRL-R to reload completions)
# ex: k get pods <CTRL-T> # will show all pods in the current namespace, is also aware of the option -n or --namespace

# k shows contexts if typed alone
# else it runs kubectl with arguments
alias k='f() { [ "$#" -eq 0 ] && kubectl config get-contexts || kubectl "$@"; }; f'
alias kc='kubectl config'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias kx='kubectl_use_context'
alias kn='kubectl_change_ns'


fzf_k8s_pick() {
  # $1 keybind for fzf
  # $2 promft message
  # $3 results to pick from
  fzf \
    --bind="$1" \
    --layout=reverse \
    --height=40% \
    --print0 \
    --header=$'Press CTRL-R to reload\n\n' \
    --header-lines=1 \
    --prompt="$2> " <<< "$3"
}

kubectl_change_ns() {
  local result reload_command selected namespace
  result=$(kubectl get ns)
  reload_command="ctrl-r:reload(kubectl get namespace 2>/dev/null)"
  selected=$(fzf_k8s_pick "$reload_command" "namespace" "$result")
  namespace=$(awk '{printf $1}' <<< "$selected")
  kubectl config set-context --current --namespace "$namespace"
}

kubectl_use_context() {
  local result reload_command selected context name
  result=$(kubectl config get-contexts)
  reload_command="ctrl-r:reload(kubectl config get-contexts 2>/dev/null)"
  selected=$(fzf_k8s_pick "$reload_command" "context" "$result")
  context=$(awk '{printf $1}' <<< "$selected")

  if [[ $selected == *"*"* ]]; then
    name=$(awk '{printf $2}' <<< "$selected")
    echo "Context \"$name\" is active."
  else
    context=$(awk '{printf $1}' <<< "$selected")
    kubectl config use-context "$context"
  fi
}

_fzf_complete_k8s_pick() {
  local args resource ns result reload_command
  args="$*"
  resource=$(echo "$args" | awk '{print $NF}')
  ns=$(echo "$args" | grep -oP '(?<=-n|--ns)\s+\K\S+' | head -1)

  case "$args" in
    *' explain '*)
      result=$(kubectl api-resources)
      reload_command="kubectl api-resources"
        ;;
    *)
      result=$([[ -z "$ns" ]] && kubectl get "$resource" 2>/dev/null || kubectl get "$resource" -n "$ns" 2>/dev/null)
      reload_command=$([[ -z $ns ]] && echo "kubectl get $resource 2>/dev/null" || echo "kubectl get $resource -n $ns 2>/dev/null")
        ;;
  esac

  _fzf_complete \
    --bind="ctrl-r:reload($reload_command)" \
    --reverse \
    --height=40% \
    --header=$'Press CTRL-R to reload\n\n'  \
    --header-lines=1 -- "$@" < <(echo "$result")
}

_fzf_complete_kubectl() { _fzf_complete_k8s_pick "$@"; }
_fzf_complete_k() { _fzf_complete_k8s_pick "$@"; }
_fzf_complete_kg() { _fzf_complete_k8s_pick "$@"; }
_fzf_complete_kd() { _fzf_complete_k8s_pick "$@"; }
_fzf_complete_kl() { _fzf_complete_k8s_pick "$@"; }

# this picks the resource name from first column
# is post process from all calls to _fzf_complete_k8s_pick
_fzf_complete_k8s_pick_post() { awk '{printf $1}'; }
