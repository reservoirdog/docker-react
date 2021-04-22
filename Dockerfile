# BUILD PHASE
# Set Image
FROM node:alpine
# Set working directory
WORKDIR '/app'
# Copy package details for dependencies
COPY package.json .
# Install dependencies
RUN npm install
# Copy all files over
COPY . . 
# Build the project
RUN npm run build

# RUN PHASE
# Set the running image
FROM nginx
# Open port 80 for ElasticBeanstalk
EXPOSE 80
# Copy the built files to the nginx server
COPY --from=0 /app/build /usr/share/nginx/html
