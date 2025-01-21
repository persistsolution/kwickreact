# Use the official Node.js image as a base image
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the build files into the container
COPY build/ ./build/

# Install a simple HTTP server to serve the app
RUN npm install -g serve

# Expose the port 5173 (matching your desired configuration)
EXPOSE 5173

# Command to serve the app on port 5173
CMD ["serve", "-s", "build", "-l", "5173"]
