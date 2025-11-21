## Quick Reference
```bash
# Start in background
docker compose up -d

# View logs
docker compose logs -f
# (Ctrl+C exits logs, containers still run)

# Get shell inside web container
docker compose exec web bash

# Get shell inside database container
docker compose exec db bash
# or: docker compose exec db mysql -u root -prootpassword

# Check status
docker compose ps

# Restart a service (e.g., after code change)
docker compose restart web

# Rebuild and restart
docker compose up -d --build

# Stop everything
docker compose down

# Stop everything and wipe data
docker compose down -v
```
## Example Workflow
```bash
# Start containers in background
docker compose up -d --build

# Check they're running
docker compose ps

# Test the app
curl http://localhost:8080

# Oh, there's an error! Let's check logs
docker compose logs web

# Need to investigate inside the container
docker compose exec web bash
# (now inside container)
ls -la /var/www/html
cat /var/log/apache2/error.log
exit

# Fixed the issue, let's restart
docker compose restart web

# All good! Stop when done
docker compose down
```

# 5 Core Commands

```bash
# 1. BUILD an image from a Dockerfile
docker build -t myapp:v1 .
# -t = tag (name) the image
# . = look for Dockerfile in current directory

# 2. RUN a container from an image
docker run -d -p 8080:80 --name web myapp:v1
# -d = detached (background)
# -p = port mapping (host:container)
# --name = give it a friendly name

# 3. LIST running containers
docker ps
docker ps -a  # include stopped ones

# 4. VIEW logs from a container
docker logs <container-id>
docker logs -f <container-id>  # follow (like tail -f)

# 5. STOP and REMOVE
docker stop <container-id>
docker rm <container-id>
```

# Connect to MySQL container
docker exec -it 2af5a4d27abf mysql -u appuser -plocalpassword appdb

# Run a query
mysql> SELECT NOW();
mysql> exit


ecr repo URL = 631353662337.dkr.ecr.us-east-1.amazonaws.com/ecs-app-app

631353662337.dkr.ecr.us-east-1.amazonaws.com