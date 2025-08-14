# Create a new project
oc new-project dataload

# Create a secret for MySQL 
oc create secret generic mysql-secret --from-literal=password=myStrongPass
