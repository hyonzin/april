FROM python:3.8-slim-buster

WORKDIR /app

# Set locale and timezone
RUN locale-gen ko_KR.UTF-8
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV TZ=Asia/Seoul

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copy sources
COPY . .

# Run app
EXPOSE 8000
CMD [ "python3", "manage.py", "runserver", "8000" ]

