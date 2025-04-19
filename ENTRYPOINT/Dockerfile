FROM almalinux:8
RUN yum install nginx -y
RUN rm -rf /usr/share/nginx/html/index.html
RUN echo "Hello, welcome to Dockerfile. A way of creating own images" > /usr/share/nginx/html/index.html
ENTRYPOINT [ "nginx", "-g", "daemon off;" ] #daemon off command makes our container running and attached to screen
