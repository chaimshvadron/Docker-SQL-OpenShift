
# Create a secret for MySQL 
oc apply -f mysql-secret.yaml
# Create a persistent volume claim for MySQL
oc apply -f mysql-pvc.yaml
# Create a deployment for MySQL
oc apply -f mysql-deployment.yaml
# Create a service for MySQL
oc apply -f mysql-service.yaml
# Get the MySQL pod
oc get pod -n chaims-dev -l app=mysql
# Copy the SQL scripts to the MySQL pod
oc cp ..\..\scripts\create_data.sql  -n chaims-dev mysql-8489dbcf89-2cf4j:/tmp/create_data.sql
# Copy the insert_data.sql script to the MySQL pod
oc cp ..\..\scripts\insert_data.sql  -n chaims-dev mysql-8489dbcf89-2cf4j:/tmp/insert_data.sql
# Execute the SQL scripts in the MySQL pod
oc exec -it -n chaims-dev deploy/mysql -- bash
# List the files in the /tmp directory
ls -la /tmp

# Execute the SQL scripts
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /tmp/create_data.sql
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /tmp/insert_data.sql