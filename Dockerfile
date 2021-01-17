# BUILD PHASE
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# RUN PHASE
FROM nginx:alpine
# set working directory to the one required by nginx
WORKDIR /usr/share/nginx/html
# Remove default nginx static assets
RUN rm -rf ./*
# copy files from the container created during the build phase to the working directory of this container
COPY --from=0 /app/build .
# Containers run nginx with global directives and daemon off
ENTRYPOINT ["nginx", "-g", "daemon off;"]
