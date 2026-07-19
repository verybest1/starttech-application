#!/bin/bash
echo "Running application health checks..."

# Check Frontend Status
FRONTEND_STATUS=$(kubectl get deployment starttech-frontend -n starttech -o jsonpath='{.status.availableReplicas}')
if [ "$FRONTEND_STATUS" -gt 0 ]; then
    echo "Frontend is healthy ($FRONTEND_STATUS replicas running)."
else
    echo "Frontend deployment is unhealthy!"
    exit 1
fi

# Check Backend Status
BACKEND_STATUS=$(kubectl get deployment starttech-backend -n starttech -o jsonpath='{.status.availableReplicas}')
if [ "$BACKEND_STATUS" -gt 0 ]; then
    echo "Backend is healthy ($BACKEND_STATUS replicas running)."
else
    echo "Backend deployment is unhealthy!"
    exit 1
fi

echo "All services are operating normally."