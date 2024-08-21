# Use the official Node.js 16.14 image as the base image
FROM node:16.14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React app for production
RUN npm run build

# Use a lightweight web server to serve the built app
# You can use serve or any other static file server
RUN npm install -g serve

# Expose the port the app will run on
EXPOSE 3000

# Command to run the app
CMD ["serve", "-s", "dist"]
