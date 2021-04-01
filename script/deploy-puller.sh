source "$(dirname "$0")"/config

cd "$(dirname "$0")"/..

CONTAINER_NAME=april-puller-${BRANCH}

docker stop ${CONTAINER_NAME} 2>/dev/null

docker build --tag ${CONTAINER_NAME}-image stub/puller

docker run -d --rm \
		   -v "${PWD}"/:/app/ \
		   -v ~/.ssh:/root/.ssh \
		   -v /var/run/docker.sock:/var/run/docker.sock \
		   -p ${PULLER_PORT}:9999 \
		   --name ${CONTAINER_NAME} \
		   ${CONTAINER_NAME}-image

