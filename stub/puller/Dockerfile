FROM node:14

WORKDIR /app/stub/puller

# Set locale and timezone
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV TZ=Asia/Seoul

# Package for deployment
RUN npm install --silent -g nodemon

# Install dependencies
COPY package.json .
RUN npm install --silent

# Run app
EXPOSE 9999
CMD [ "npm", "run", "start" ]

