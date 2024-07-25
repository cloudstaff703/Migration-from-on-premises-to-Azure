#!/bin/bash

# Variables
SOURCE_DB="on_prem_db"
TARGET_DB="azure_sql_db"
DUMP_FILE="db_dump.sql"

# Step 1: Dump the on-premises database
echo "Dumping the on-premises database..."
mysqldump -u root -p $SOURCE_DB > $DUMP_FILE

# Step 2: Transfer the dump file to Azure
echo "Transferring the dump file to Azure..."
az storage blob upload \
    --account-name <storage_account> \
    --container-name <container_name> \
    --name $DUMP_FILE \
    --file $DUMP_FILE

# Step 3: Restore the dump file to Azure SQL Database
echo "Restoring the dump file to Azure SQL Database..."
az sql db import \
    --resource-group <resource_group> \
    --server <server_name> \
    --name $TARGET_DB \
    --admin-user <admin_user> \
    --admin-password <admin_password> \
    --storage-uri "https://<storage_account>.blob.core.windows.net/<container_name>/$DUMP_FILE" \
    --storage-key <storage_key> 

echo "Data migration completed."