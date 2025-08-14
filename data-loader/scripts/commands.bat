
# Create a secret for MySQL 
oc apply -f mysql-secret.yaml
# Create a persistent volume claim for MySQL
oc apply -f mysql-pvc.yaml
