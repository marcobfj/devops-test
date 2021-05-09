# stage git clone 
FROM ubuntu:18.04 as git_stage
RUN apt-get update && \        
     apt-get install -y git
RUN mkdir /home/gitProject && \      
           cd /home/gitProject && \        
           git clone https://github.com/alejorod18/devops-jr-test.git

# Stage build
FROM node:latest as build
WORKDIR /user/local/app
COPY  --from=git_stage /home/gitProject/devops-jr-test/ .
COPY script.sh .
RUN chmod +x /user/local/app/script.sh && \
          /user/local/app/script.sh
RUN npm install && \
          npm run build

# Stage serve app
FROM nginx:latest as serve
VOLUME [ "/etc/nginx/conf.d/" ]
COPY --from=build /user/local/app/dist/technical-test /usr/share/nginx/html
EXPOSE 80