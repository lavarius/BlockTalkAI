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


---
<!-- The following is the Frontend Template's README.md -->

# Soroban Frontend in Astro

A Frontend Template suitable for use with `soroban contract init --frontend-template`, powered by [Astro](https://astro.build/).

# Getting Started

- `cp .env.example .env`
- `npm install`
- `npm run dev`

# How it works

If you look in [package.json](./package.json), you'll see that the `start` & `dev` scripts first run the [`initialize.js`](./initialize.js) script. This script loops over all contracts in `contracts/*` and, for each:

1. Deploys to a local network (_needs to be running with `docker run` or `soroban network start`_)
2. Saves contract IDs to `.soroban/contract-ids`
3. Generates TS bindings for each into the `packages` folder, which is set up as an [npm workspace](https://docs.npmjs.com/cli/v10/configuring-npm/package-json#workspaces)
4. Create a file in `src/contracts` that imports the contract client and initializes it for the `standalone` network.

You're now ready to import these initialized contract clients in your [Astro templates](https://docs.astro.build/en/core-concepts/astro-syntax/) or your [React, Svelte, Vue, Alpine, Lit, and whatever else JS files](https://docs.astro.build/en/core-concepts/framework-components/#official-ui-framework-integrations). You can see an example of this in [index.astro](./src/pages/index.astro).
