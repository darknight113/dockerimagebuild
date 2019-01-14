FROM alpine

RUN apk update

RUN apk add wget -y

ENTRYPOINT ["sh"]
