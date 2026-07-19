#!/bin/bash
set -e

echo "Starting Backend Deployment..."

# Create the namespace if it doesn't exist
kubectl create namespace starttech --dry-run=client -o yaml | kubectl apply -f -

# Apply the Kubernetes manifests
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
kubectl apply -f k8s/ingress.yaml

# Rollout status check for backend
echo "Checking backend deployment status..."
kubectl rollout status deployment/starttech-backend -n starttech --timeout=90s

echo "Backend deployment completed successfully!"