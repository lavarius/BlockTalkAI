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

'hot reloading': `-v $(pwd):/app` maps the current directory (`$(pwd)`) to the `/app` directory in the container, allowing for live updates. (Note: not sure how well this will work since any contract changes will likely need rebuilding, any other case like web UI changes or API endpoints will be live right away)

- `docker run -d -p 5000:5000 -v $(pwd):/app my-stellar-app`

Access the container and verify installations

- `docker exec -it <container_id> /bin/bash`
