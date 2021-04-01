FROM node:14

WORKDIR /app/stub/puller

# Set locale and timezone
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV TZ=Asia/Seoul

# Docker client for privilege to restart other containers
ENV DOCKERVERSION=19.03.12
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz
RUN tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker
RUN rm docker-${DOCKERVERSION}.tgz

# Package for deployment
RUN npm install --silent -g nodemon

# Install dependencies
COPY package.json .
RUN npm install --silent

# Run app
EXPOSE 9999
CMD [ "npm", "run", "start" ]

