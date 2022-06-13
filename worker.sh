#!/bin/bash
    apt-get update && \
    apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    swapoff -a && \
    apt-get install -y docker.io && \
    systemctl enable docker && systemctl start docker && \
    apt-get update && 
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -   && \
    apt-get update && \
    apt-get install -y kubeadm kubelet kubectl
    