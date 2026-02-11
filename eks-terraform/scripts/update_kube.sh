#!/bin/bash

# Variables
REGION="us-east-1"
CLUSTER_NAME="learning-eks"
PROFILE="terraform-user"

echo "Updating kubeconfig for cluster: $CLUSTER_NAME..."
aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME --profile $PROFILE

echo "Getting nodes..."
kubectl wait --for=condition=Ready nodes --all --timeout=600s
kubectl get nodes

