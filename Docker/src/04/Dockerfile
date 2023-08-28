FROM nginx
USER root
COPY server/ home/server/

RUN apt-get update && \ 
    apt-get install -y gcc spawn-fcgi libfcgi-dev && \
    rm -rf /var/lib/apt/lists

WORKDIR /home/server/

ENTRYPOINT [ "sh", "./start_server.sh" ]
