#!/bin/bash

# ArgoCD Installation Script
# This script installs ArgoCD on Kubernetes cluster

set -e  # Exit on any error

echo "======================================="
echo "ArgoCD Installation Script"
echo "======================================="
echo ""

# 1) Create argocd namespace
echo "[1/4] Creating argocd namespace..."
kubectl create namespace argocd
echo "✓ Namespace created successfully"
echo ""

# 2) Deploy argocd deployment resources by URL
echo "[2/4] Deploying ArgoCD resources..."
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
echo "✓ ArgoCD resources deployed successfully"
echo ""

# 3) Check running pods
echo "[3/4] Checking running pods in argocd namespace..."
echo "Waiting for pods to be ready (this may take a few minutes)..."
sleep 10
kubectl get pods -n argocd
echo ""

# 4) Open port for UI
echo "[4/4] Port forwarding ArgoCD server UI..."
echo "ArgoCD UI will be available at: https://localhost:8080"
echo "Press Ctrl+C to stop port forwarding"
echo ""
echo "To get the initial admin password, run:"
echo "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
echo ""
kubectl port-forward svc/argocd-server -n argocd 8080:443
