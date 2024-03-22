# K8s utils
# ---------
# https://kubernetes.io/docs/reference/kubectl/quick-reference/

# k shows contexts if typed alone
# else it runs kubectl with arguments
alias k='f() { [ "$#" -eq 0 ] && kubectl config get-contexts || kubectl "$@"; }; f'
alias kc='kubectl config'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias kx='kubectl_use_context'
alias kn='kubectl_change_ns'


fzf_pick() {
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
    --prompt="namespace> " <<< "$result"
}

kubectl_change_ns() {
  local result=$(kubectl get ns)
  local reload_command="ctrl-r:reload(kubectl get namespace 2>/dev/null)"
  local selected=$(fzf_pick "$reload_command" "namespace" "$result")
  local namespace=$(awk '{printf $1}' <<< "$selected")
  kubectl config set-context --current --namespace "$namespace"
}

kubectl_use_context() {
  local result=$(kubectl config get-contexts)
  local reload_command="ctrl-r:reload(kubectl config get-contexts 2>/dev/null)"
  local selected=$(fzf_pick "$reload_command" "context" "$result")
  local context=$(awk '{printf $1}' <<< "$selected")

  if [[ $selected == *"*"* ]]; then
    local name=$(awk '{printf $2}' <<< "$selected")
    echo "Context \"$name\" is active"
  else
    local context=$(awk '{printf $1}' <<< "$selected")
    kubectl config use-context "$context"
  fi
}

_fzf_complete_k8s_pick() {
  local resource="$1"
  local args="$@"
  local result=$(kubectl get "$resource" 2>/dev/null)
  local reload_command="ctrl-r:reload(kubectl get \"$resource\" 2>/dev/null)"

  shift
  _fzf_complete \
    --bind="$reload_command" \
    --reverse \
    --height=40% \
    --header=$'Press CTRL-R to reload\n\n'  \
    --header-lines=1 \
    --prompt="$resource> " -- "$@" < <(echo "$result")
}


#custom fuzzy comletions for kubectl
fzf_custom_fuzzy_completions_kubectl() {
  case "$1" in
      *bindings*)
          _fzf_complete_k8s_pick bindings "$@"
          ;;
      *componentstatuses*|*cs*)
          _fzf_complete_k8s_pick componentstatuses "$@"
          ;;
      *configmaps*|*cm*)
          _fzf_complete_k8s_pick configmaps "$@"
          ;;
      *endpoints*|*ep*)
          _fzf_complete_k8s_pick endpoints "$@"
          ;;
      *events*|*ev*)
          _fzf_complete_k8s_pick events "$@"
          ;;
      *limitranges*|*limits*)
          _fzf_complete_k8s_pick limitranges "$@"
          ;;
      *namespaces*|*ns*)
          _fzf_complete_k8s_pick namespaces "$@"
          ;;
      *nodes*|*no*)
          _fzf_complete_k8s_pick nodes "$@"
          ;;
      *persistentvolumeclaims*|*pvc*)
          _fzf_complete_k8s_pick persistentvolumeclaims "$@"
          ;;
      *persistentvolumes*|*pv*)
          _fzf_complete_k8s_pick persistentvolumes "$@"
          ;;
      *pods*|*po*)
          _fzf_complete_k8s_pick pods "$@"
          ;;
      *podtemplates*)
          _fzf_complete_k8s_pick podtemplates "$@"
          ;;
      *replicationcontrollers*|*rc*)
          _fzf_complete_k8s_pick replicationcontrollers "$@"
          ;;
      *resourcequotas*|*quota*)
          _fzf_complete_k8s_pick resourcequotas "$@"
          ;;
      *secrets*)
          _fzf_complete_k8s_pick secrets "$@"
          ;;
      *serviceaccounts*|*sa*)
          _fzf_complete_k8s_pick serviceaccounts "$@"
          ;;
      *services*|*svc*)
          _fzf_complete_k8s_pick services "$@"
          ;;
      *mutatingwebhookconfigurations*)
          _fzf_complete_k8s_pick mutatingwebhookconfigurations "$@"
          ;;
      *validatingwebhookconfigurations*)
          _fzf_complete_k8s_pick validatingwebhookconfigurations "$@"
          ;;
      *customresourcedefinitions*|*crd*,*crds*)
          _fzf_complete_k8s_pick customresourcedefinitions "$@"
          ;;
      *apiservices*)
          _fzf_complete_k8s_pick apiservices "$@"
          ;;
      *controllerrevisions*)
          _fzf_complete_k8s_pick controllerrevisions "$@"
          ;;
      *daemonsets*|*ds*)
          _fzf_complete_k8s_pick daemonsets "$@"
          ;;
      *deployments*|*deploy*)
          _fzf_complete_k8s_pick deployments "$@"
          ;;
      *replicasets*|*rs*)
          _fzf_complete_k8s_pick replicasets "$@"
          ;;
      *statefulsets*|*sts*)
          _fzf_complete_k8s_pick statefulsets "$@"
          ;;
      *selfsubjectreviews*)
          _fzf_complete_k8s_pick selfsubjectreviews "$@"
          ;;
      *tokenreviews*)
          _fzf_complete_k8s_pick tokenreviews "$@"
          ;;
      *localsubjectaccessreviews*)
          _fzf_complete_k8s_pick localsubjectaccessreviews "$@"
          ;;
      *selfsubjectaccessreviews*)
          _fzf_complete_k8s_pick selfsubjectaccessreviews "$@"
          ;;
      *selfsubjectrulesreviews*)
          _fzf_complete_k8s_pick selfsubjectrulesreviews "$@"
          ;;
      *subjectaccessreviews*)
          _fzf_complete_k8s_pick subjectaccessreviews "$@"
          ;;
      *horizontalpodautoscalers*|*hpa*)
          _fzf_complete_k8s_pick horizontalpodautoscalers "$@"
          ;;
      *cronjobs*|*cj*)
          _fzf_complete_k8s_pick cronjobs "$@"
          ;;
      *jobs*)
          _fzf_complete_k8s_pick jobs "$@"
          ;;
      *certificatesigningrequests*|*csr*)
          _fzf_complete_k8s_pick certificatesigningrequests "$@"
          ;;
      *leases*)
          _fzf_complete_k8s_pick leases "$@"
          ;;
      *endpointslices*)
          _fzf_complete_k8s_pick endpointslices "$@"
          ;;
      *events*|*ev*)
          _fzf_complete_k8s_pick events "$@"
          ;;
      *flowschemas*)
          _fzf_complete_k8s_pick flowschemas "$@"
          ;;
      *prioritylevelconfigurations*)
          _fzf_complete_k8s_pick prioritylevelconfigurations "$@"
          ;;
      *ingressclasses*)
          _fzf_complete_k8s_pick ingressclasses "$@"
          ;;
      *ingresses*|*ing*)
          _fzf_complete_k8s_pick ingresses "$@"
          ;;
      *networkpolicies*|*netpol*)
          _fzf_complete_k8s_pick networkpolicies "$@"
          ;;
      *runtimeclasses*)
          _fzf_complete_k8s_pick runtimeclasses "$@"
          ;;
      *poddisruptionbudgets*|*pdb*)
          _fzf_complete_k8s_pick poddisruptionbudgets "$@"
          ;;
      *clusterrolebindings*)
          _fzf_complete_k8s_pick clusterrolebindings "$@"
          ;;
      *clusterroles*)
          _fzf_complete_k8s_pick clusterroles "$@"
          ;;
      *rolebindings*)
          _fzf_complete_k8s_pick rolebindings "$@"
          ;;
      *roles*)
          _fzf_complete_k8s_pick roles "$@"
          ;;
      *priorityclasses*|*pc*)
          _fzf_complete_k8s_pick priorityclasses "$@"
          ;;
      *csidrivers*)
          _fzf_complete_k8s_pick csidrivers "$@"
          ;;
      *csinodes*)
          _fzf_complete_k8s_pick csinodes "$@"
          ;;
      *csistoragecapacities*)
          _fzf_complete_k8s_pick csistoragecapacities "$@"
          ;;
      *storageclasses*|*sc*)
          _fzf_complete_k8s_pick storageclasses "$@"
          ;;
      *volumeattachments*)
          _fzf_complete_k8s_pick volumeattachments "$@"
          ;;
      *)
      eval "zle ${fzf_default_completion:-expand-or-complete}"
      ;;
  esac
}


_fzf_complete_kubectl() { fzf_custom_fuzzy_completions_kubectl "$@" }
_fzf_complete_k() { fzf_custom_fuzzy_completions_kubectl "$@" }
_fzf_complete_kg() { fzf_custom_fuzzy_completions_kubectl "$@" }
_fzf_complete_kd() { fzf_custom_fuzzy_completions_kubectl "$@" }
_fzf_complete_kl() { _fzf_complete_k8s_pick pod "$@" }

# this picks the resource name from first column
# is post process from all calls to _fzf_complete_k8s_pick
_fzf_complete_k8s_pick_post() { 
  awk '{printf $1}' 
}

