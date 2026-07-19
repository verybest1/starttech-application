#!/bin/bash
echo "Initiating application rollback..."

# Rollback deployment objects to the previous version
kubectl rollout undo deployment/starttech-frontend -n starttech
kubectl rollout undo deployment/starttech-backend -n starttech

# Monitor the recovery status
echo "Monitoring rollback status..."
kubectl rollout status deployment/starttech-frontend -n starttech --timeout=60s
kubectl rollout status deployment/starttech-backend -n starttech --timeout=60s

echo "Rollback successfully completed."