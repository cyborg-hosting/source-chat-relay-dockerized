FROM debian:buster-slim

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install ca-certificates && \
    rm -rf /var/lib/apt/lists/*

ENV SCR_DL_URL=https://github.com/rumblefrog/source-chat-relay/releases/download/v2.2.0/scr-linux-amd64-v2.1.5-2-gd81f03c.tar.gz

WORKDIR /app

ADD ${SCR_DL_URL} scr-linux-amd64.tar.gz

RUN tar xzvf scr-linux-amd64.tar.gz --strip-components=1 -C ./ relay_server

VOLUME [ "/config" ]

ADD init.sh /app/init.sh
RUN chmod +x /app/init.sh

CMD [ "/app/init.sh" ]
