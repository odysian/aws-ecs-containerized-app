#!/bin/bash
set -e

# Configuration
AWS_REGION="us-east-1"
AWS_ACCOUNT_ID="631353662337"
ECR_REPO_NAME="ecs-app-app"
IMAGE_TAG="latest"

# Full ECR URL
ECR_URL="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}"

echo "Authenticating to ECR..."
aws ecr get-login-password --region ${AWS_REGION} | \
    docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com

echo "Building Docker image..."
docker build -t ${ECR_REPO_NAME}:${IMAGE_TAG} .

echo "Tagging image for ECR..."
docker tag ${ECR_REPO_NAME}:${IMAGE_TAG} ${ECR_URL}:${IMAGE_TAG}

echo "⬆Pushing to ECR..."
docker push ${ECR_URL}:${IMAGE_TAG}

echo "Done! Image pushed to:"
echo "   ${ECR_URL}:${IMAGE_TAG}"