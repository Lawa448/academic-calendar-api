#Motivations
Image size
FROM node:20-bookworm-slim
Using small-sized official base image for node which decreases image size for less storage space and quicker image transfer. bookworm-slim is a linux based system based on Debian.

Caching image layers
Taking advantage of the docker cache we don't want to recrate npm install dependencies layer even if the app file changes only when package.json file changes. So we copy the package.json files first, install its dependencies then we can copy the app files. The order from most frequently changed to least changed optimisises the image building time as it uses the cache in each build

Multi-stage building 
By using two stages for building and production artifacts from the build stages specifically the dev tools such as linting and typescript are discarded during runtime. At runtime we start with a fresh node base image and only copy the runtime files such as the compiled Javascript output and production dependencies in package.json. This overall produces a smaller image that only contains necessary build components, increasing download speed and security.
