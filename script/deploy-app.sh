source "$(dirname "$0")"/config

cd "$(dirname "$0")"/..

CONTAINER_NAME=april-app-${BRANCH}

docker stop ${CONTAINER_NAME} 2>/dev/null

docker build --tag ${CONTAINER_NAME}-image .

docker run -d --rm \
		   -v "${PWD}"/src:/app/src \
		   -v "${PWD}"/public:/app/public \
		   -p ${APP_PORT}:3000 \
		   --name ${CONTAINER_NAME} \
		   ${CONTAINER_NAME}-image

