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

# Expose the application port for `test` (5176)
EXPOSE 5176

# Command to serve the app using the dynamic port
CMD ["sh", "-c", "serve -s build -l ${PORT:-5176}"]
