cd "$(dirname "$0")"/..

docker stop april-puller 2>/dev/null

docker build --tag april-puller-image stub/puller

docker run -d --rm \
		   -v "${PWD}"/:/app/ \
		   -p 9999:9999 \
		   --name april-puller \
		   april-puller-image

