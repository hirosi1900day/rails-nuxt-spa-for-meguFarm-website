FROM node:14.15.1-alpine

ARG WORKDIR
ARG API_URL
# ARG CONTAINER_PORT

ENV HOME=/${WORKDIR} \
    LANG=C.UTF-8 \
    TZ=Asia/Tokyo \
    HOST=0.0.0.0 \
    API_URL=${API_URL}

# RUN echo ${HOME}
# RUN echo ${CONTAINER_PORT}
COPY package*.json ./


RUN apk update && \
    apk upgrade && \
    apk add --no-cache make gcc g++ python && \
    # yarn installの記載場所を移動
    yarn install


COPY . .

RUN yarn run build


WORKDIR ${HOME}

# EXPOSE ${CONTAINER_PORT}