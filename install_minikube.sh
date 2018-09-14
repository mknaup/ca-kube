#!/bin/bash

# Get and install minikube

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube

curl -Lo ~/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x ~/bin/kubectl
sudo cp ~/bin/kubectl /usr/bin/

export MINIKUBE_WANTUPDATENOTIFICATION=false
export MINIKUBE_WANTREPORTERRORPROMPT=false
export MINIKUBE_HOME=$HOME
export CHANGE_MINIKUBE_NONE_USER=true
export KUBECONFIG=$HOME/.kube/config

[[ ! -d ~/.kube ]] && mkdir ~/.kube
touch ~/.kube/config

sudo -E ./minikube start --vm-driver=none --extra-config=kubelet.cgroup-driver=systemd

docker ps

kubectl completion bash > ~/.kube_completion.sh && chmod 755 ~/.kube_completion.sh

