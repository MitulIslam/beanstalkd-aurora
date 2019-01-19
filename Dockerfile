FROM alpine
LABEL maintainer="mitulislam"

WORKDIR /app

ADD ./aurora.toml /app

RUN wget https://github.com/xuri/aurora/releases/download/2.2/aurora_linux_amd64_v2.2.tar.gz
RUN apk add tar
RUN tar xvzf aurora_linux_amd64_v2.2.tar.gz -C /tmp
RUN mv /tmp/aurora /app
RUN rm -rf /tmp/*

RUN chmod +x aurora

EXPOSE 3000

ENTRYPOINT [ "./aurora" ]