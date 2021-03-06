FROM node:14

WORKDIR /app

# Set locale and timezone
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV TZ=Asia/Seoul

# Install dependencies
COPY package.json .
RUN npm install --silent

# Copy source
COPY . .

# Run app
EXPOSE 3000
CMD [ "npm", "run", "start" ]

