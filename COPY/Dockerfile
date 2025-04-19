FROM nginx

# Install coreutils to get the 'chmod' command
RUN apk add --no-cache coreutils

# Remove the default index.html
RUN rm -rf /usr/share/nginx/html/index.html

# Copy the 'qi' folder contents into the Nginx HTML directory
COPY qi/ /usr/share/nginx/html/

# Set proper permissions for the files
RUN chmod -R 755 /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Run Nginx in the foreground
#CMD ["nginx", "-g", "daemon off;"]
