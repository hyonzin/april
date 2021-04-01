FROM python:3.8-slim-buster

WORKDIR /app

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copy sources
COPY . .

# Run app
CMD [ "python3", "-c", "print('hi')" ]

