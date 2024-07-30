# BlockTalkAI
Conversational nature of interviews with Blockchain focusing on communication

With Docker file and in the root directory of the repo, in a terminal and a Docker instance running:
Build the Docker container
- `docker build -t my-stellar-app .`
Increase build timeout to one hour for time to complete build
- `docker build --timeout 3600 -t my-stellar-app .`
Add build logs with `verbose`
- `docker build --timeout 3600 --verbose -t my-stellar-app .`
Run the Docker container
- `docker run -it my-stellar-app`
Run with live changes (if in `/app`)
- `docker run -d -p 5000:5000 -v $(pwd):/app my-stellar-app`
Access the container and verify installations
- `docker exec -it <container_id> /bin/bash`