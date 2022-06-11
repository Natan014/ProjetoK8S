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
    apt-get install -y kubeadm kubelet kubectl && \
    kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.10.127 && \
    mkdir -p /home/vagrant/.kube && cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config &&  chown vagrant:vagrant /home/vagrant/.kube/config && \
    echo $(kubeadm token create --print-join-command) > /vagrant/join.sh && export KUBECONFIG=/etc/kubernetes/admin.conf && \
    kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml