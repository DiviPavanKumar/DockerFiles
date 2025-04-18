FROM almalinux:8
RUN yum install nginx -y
# RUN echo "Hello, welcome to Dockerfile. A way of creating own images" > /usr/share/nginx/html/hello.html
EXPOSE 80/tcp 
# EXPOSE is not adding any functionality to the image, it is just a documentation for the user. It is not a command, it is a directive. It is not mandatory to use EXPOSE in Dockerfile. It is just a good practice to use EXPOSE in Dockerfile.
# EXPOSE 80/tcp is used to expose port 80 of the container to the host machine. It is not mandatory to use EXPOSE in Dockerfile. It is just a good practice to use EXPOSE in Dockerfile.
CMD [ "nginx", "-g", "daemon off;" ]