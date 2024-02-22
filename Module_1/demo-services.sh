#!/usr/bin/bash

CleanUp() {

    # SendMessageToCI "kubectl delete deploy workload-dep" "Kubectl command:" "Command"
    kubectl delete deploy workload-dep
    # SendMessageToCI "kubectl delete svc workload-svc" "Kubectl command:" "Command"
    kubectl delete svc workload-svc
    exit
}

# Change to the demo folder
cd Services



read -p "Navigate to the Services page"
# SendMessageToCI "The following demo illustrates different types of Services in Kubernetes" "Services:" "Info"

read -p "Next Step - Create initial workload with a ClusterIP service"
# SendMessageToCI "kubectl apply -f workload-dep.yaml" "Kubectl command:" "Command"
kubectl apply -f workload-dep.yaml
# SendMessageToCI "kubectl apply -f svc-clusterip.yaml" "Kubectl command:" "Command"
kubectl apply -f workload-svc-clusterip.yaml
echo

read -p "Next Step - Upgrades the service to a NodePort"
# SendMessageToCI "type: NodePort" "Service YAML Changes:" "Code"
kubectl apply -f workload-svc-nodeport.yaml
echo

read -p "Next Step - Upgrades the service to a LoadBalancer"
# SendMessageToCI "type: LoadBalancer" "Service YAML Changes:" "Code"
kubectl apply -f workload-svc-loadbalancer.yaml
echo

read -p "Wait about a minute or two for the external IP to be available and active"
read -p "Click on the external IP to bring up the website"
read -p "Watch the website as it refreshes, showing how it reaches a different pod after refresh (internal load balancer working)"
echo

read -p "Next Step - Update the deployment to show how the services switches to new pods"
# SendMessageToCI "kubectl apply -f workload-dep-update.yaml --record" "Kubectl command:" "Command"
kubectl apply -f workload-dep-update.yaml
echo

CleanUp