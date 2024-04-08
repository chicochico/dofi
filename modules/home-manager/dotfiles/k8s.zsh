# K8s utils
# ---------
# https://kubernetes.io/docs/reference/kubectl/quick-reference/
#
# USAGE:
# $ kx # to switch context
# $ kn # to switch namespace
# $ k <verb> <flags>  <resource> <CTRL-T> # to fuzzy search resources (While in fzf CTRL-R to reload completions)
# ex: k get pods <CTRL-T> # will show all pods in the current namespace, is also aware of the option -n or --namespace

# Color kubectl diff output
export KUBECTL_EXTERNAL_DIFF="colordiff -N -u"

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

_fzf_complete_k8s_generic() {
  local args resource result reload_command resource_from_cmd resource_with_name namespace k_cmd
  args="$*"
  # for comands like `kubectl -n default get pods` or
  # `kubectl get pods -n default` or `kubectl --namespace default get pods`
  # or `kubectl get pods --namespace default`
  # assign the namespace to $namespace
  # and pods to $resource
  namespace=$(echo "$args" | grep -oP -- '-n\s+\K[\w-]+' || echo "$args" | grep -oP -- '--namespace\s+\K[\w-]+')
  resource_from_cmd=$(echo "$args" | grep -oP -- 'get\s+\K\w+' || echo "$args" | grep -oP -- 'describe\s+\K\w+' || echo "$args" | grep -oP -- 'delete\s+\K\w+' || echo "$args" | grep -oP -- 'edit\s+\K\w+')

  # $prefix is passed by the caller and is the string on the cursor
  # This is for cases where the resource is typed with the name: `kubeclt logs pod/**`
  resource_with_name=$(echo "$prefix" | cut -d'/' -f1)

  # Use namespace scope if in the command
  ns_opt=""
  if [ -n "$namespace" ]; then
  ns_opt="--namespace $namespace"
  fi

  case "$args" in
    *' explain '*)
      result=$(kubectl api-resources)
      reload_command="kubectl api-resources"
        ;;
    *' logs '*|'kl'*)
      k_cmd="kubectl get pod $ns_opt"
      result=$(eval "$k_cmd" 2>/dev/null)
        ;;
    *)
      # If resource_with_name is not empty assign it to resource
      # Otherwhise assign $resource_from_cmd to $resource
      resource=${resource_with_name:-$resource_from_cmd} > /dev/null
      k_cmd="kubectl get $resource $ns_opt"
      result=$(eval "$k_cmd" 2>/dev/null)
        ;;
  esac

  _fzf_complete \
    --bind="ctrl-r:reload($k_cmd)" \
    --reverse \
    --height=40% \
    --header=$'Press CTRL-R to reload\n\n'  \
    --header-lines=1 -- "$@" < <(echo "$result")
}

_fzf_complete_kubectl() { _fzf_complete_k8s_generic "$@"; }
_fzf_complete_k() { _fzf_complete_k8s_generic "$@"; }
_fzf_complete_kg() { _fzf_complete_k8s_generic "$@"; }
_fzf_complete_kd() { _fzf_complete_k8s_generic "$@"; }
_fzf_complete_kl() { _fzf_complete_k8s_generic "$@"; }

# this picks the resource name from first column
# is post process from all calls to _fzf_complete_k8s_generic
_fzf_complete_k8s_generic_post() { awk '{printf $1}'; }


# ArgoCD applications
_fzf_complete_argocd_generic() {
  local args resource result reload_command resource_from_cmd resource_with_name namespace k_cmd
  args="$*"


  case "$args" in
    *' app '*)
      result=$(argocd app list)
      reload_command="argocd app list"
        ;;
    *' proj '*)
      result=$(argocd proj list)
      reload_command="argocd proj list"
        ;;
  esac

  _fzf_complete \
    --bind="ctrl-r:reload($reload_command)" \
    --reverse \
    --height=40% \
    --header=$'Press CTRL-R to reload\n\n'  \
    --header-lines=1 -- "$@" < <(echo "$result")
}

_fzf_complete_argocd() { _fzf_complete_argocd_generic "$@"; }
_fzf_complete_argocd_generic_post() { awk '{printf $1}'; }
