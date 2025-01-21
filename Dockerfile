# Use the official Node.js image as a base image
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies using npm
RUN npm install

# Copy the React build files into the container
COPY build/ ./build/

# Install a simple HTTP server to serve the app
RUN npm install -g serve

# Expose the application port (5173 for React)
EXPOSE 5173

# Command to serve the app
CMD ["serve", "-s", "build", "-l", "5173"]
