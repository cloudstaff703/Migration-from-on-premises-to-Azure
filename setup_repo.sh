#!/bin/bash

# Define the root directory for the project
ROOT_DIR="Migration-from-on-premises-to-Azure"

# Define the directory structure
DIRECTORIES=(
    "$ROOT_DIR/architecture-diagrams"
    "$ROOT_DIR/terraform"
    "$ROOT_DIR/scripts"
    "$ROOT_DIR/documentation"
)

FILES=(
    "$ROOT_DIR/architecture-diagrams/high-level-architecture.png"
    "$ROOT_DIR/architecture-diagrams/network-diagram.png"
    "$ROOT_DIR/architecture-diagrams/detailed-architecture.png"
    "$ROOT_DIR/terraform/main.tf"
    "$ROOT_DIR/terraform/variables.tf"
    "$ROOT_DIR/terraform/outputs.tf"
    "$ROOT_DIR/scripts/data-migration.sh"
    "$ROOT_DIR/scripts/app-deployment.sh"
    "$ROOT_DIR/documentation/project-plan.md"
    "$ROOT_DIR/documentation/risk-management.md"
    "$ROOT_DIR/documentation/migration-guide.md"
    "$ROOT_DIR/documentation/testing-plan.md"
    "$ROOT_DIR/documentation/operations-runbook.md"
)

# create the directories
for dir in "${DIRECTORIES[@]}"; do
    mkdir -p "$dir"
done

for file in "${FILES[@]}"; do
    touch "$file"
done