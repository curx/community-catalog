version: '2'
services:
  wekandb:
    image: mongo
    command: mongod --smallfiles --oplogSize 128
    ports:
      - 27017

  wekan:
    image: mquandalle/wekan
    links:
      - wekandb:wekandb
    environment:
      - MONGO_URL=mongodb://wekandb/wekan
      - ROOT_URL=${WEKAN_ROOT_URL}:${WEKAN_PORT}
    ports:
      - ${WEKAN_PORT}:{WEKAN_PORT}
