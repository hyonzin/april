cd "$(dirname "$0")"/..

docker stop april-puller 2>/dev/null

docker build --tag april-puller-image stub/puller

docker run -d --rm \
		   -v "${PWD}"/:/app/ \
		   -v ~/.ssh:/root/.ssh \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -p 9999:9999 \
		   --name april-puller \
		   april-puller-image

