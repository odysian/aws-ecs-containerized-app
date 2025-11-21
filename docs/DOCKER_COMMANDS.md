# Docker Quick Reference

## Local Development
```bash
# Build and test locally
docker compose up --build

# Stop
docker compose down
```

## Push to ECR
```bash
# Use the script
./scripts/build-and-push.sh

# Or manually:
# 1. Authenticate
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 631353662337.dkr.ecr.us-east-1.amazonaws.com

# 2. Build
docker build -t ecs-app-app:latest .

# 3. Tag
docker tag ecs-app-app:latest 631353662337.dkr.ecr.us-east-1.amazonaws.com/ecs-app-app:latest

# 4. Push
docker push 631353662337.dkr.ecr.us-east-1.amazonaws.com/ecs-app-app:latest
```

## Troubleshooting
- **Permission denied**: `sudo usermod -aG docker $USER && newgrp docker`
- **Auth failed**: Re-run ECR login command
- **Image not found**: Run `docker images` to see what's built locally