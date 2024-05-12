FROM nodered/node-red:latest

# Install the Node-RED theme collection
RUN npm install @node-red-contrib-themes/theme-collection

# Ensure the user is root to perform privileged actions
USER root

# Create the /data directory
RUN mkdir -p /data

# Copy the settings.js file to a location in the container
COPY ./config/settings.js /data/settings.js

# Change the ownership of the settings.js to the node-red user
RUN chown 1000:1000 /data/settings.js

# Switch back to the node-red user for security
USER 1000