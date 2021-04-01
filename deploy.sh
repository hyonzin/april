docker build --tag april-image .

docker run --rm \
		   --name april-container \
		   --publish 8000:8000 \
		   april-image

