FROM ubuntu

#SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    python \
    python3-pip \
    supervisor

RUN pip install webssh && \
    apt-get remove -y python3-pip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./app /app

EXPOSE 8998

#ENTRYPOINT ["wssh", "--port=8998", "--logging=debug", "--encoding='utf-8'"]
#ENTRYPOINT ["wssh", "--port=8998", "--logging=debug"]

CMD ["supervisord", "-c", "/app/supervisord.conf"]