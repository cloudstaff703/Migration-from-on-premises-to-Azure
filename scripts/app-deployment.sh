#!/bin/bash

# Variables
RESOURCE_GROUP="example-resources"
APP_SERVICE_PLAN="example-app-service-plan"
WEB_APP="example-web-app"
DOCKER_IMAGE="example/image:latest"

# Step 1: Create a resource group
echo "Creating resource group..."
az group create \
    --name $RESOURCE_GROUP \
    --location "EAST US"

# Step 2: Create an App Service Plan
echo "Creating App Service Plan..."
az appservice plan create \
    --name $name $APP_SERVICE_PLAN \
    --resource-group $RESOURCE_GROUP \
    --sku B1 \
    --is-linux

# Step 3: Create a Web App
echo "Creating Web App..."
az webapp create \
    --resource-group $RESOURCE_GROUP \
    --plan $APP_SERVICE_PLAN \
    --name $WEB_APP \
    --deployment-container-image-name $DOCKER_IMAGE

# Step 4: Configure Web App
echo "Configuring Web App..."
az webapp config container set \
    --name $WEB_APP \
    --resource-group $RESOURCE_GROUP \
    --docker-custom-image-name $DOCKER_IMAGE

echo "App deployment complete."

