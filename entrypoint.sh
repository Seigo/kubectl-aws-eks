#!/bin/sh

set -e

echo "asdasdasd $KUBE_CONFIG_DATA"

echo "$KUBE_CONFIG_DATA" | base64 -d > /tmp/config
export KUBECONFIG=/tmp/config

sh -c "kubectl config current-context"

sh -c "kubectl $*"
