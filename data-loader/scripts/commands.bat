
# Create a secret for MySQL 
oc apply -f mysql-secret.yaml
# Create a persistent volume claim for MySQL
oc apply -f mysql-pvc.yaml
# Create a deployment for MySQL
oc apply -f mysql-deployment.yaml
# Create a service for MySQL
oc apply -f mysql-service.yaml

