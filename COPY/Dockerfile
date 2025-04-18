FROM nginx:alpine

# Remove the default index.html
RUN rm -rf /usr/share/nginx/html/index.html

# Copy the 'qi' folder contents into the container's Nginx web directory
COPY qi/ /usr/share/nginx/html/

# Expose port 80 for Nginx
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]