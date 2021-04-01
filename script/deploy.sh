cd "$(dirname "$0")"/..

docker stop april 2>/dev/null

docker build --tag april-image .

docker run -d --rm \
		   -v "${PWD}"/src:/app/src \
		   -v "${PWD}"/public:/app/public \
		   -p 3000:3000 \
		   --name april \
		   april-image

