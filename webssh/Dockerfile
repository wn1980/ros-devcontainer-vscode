FROM ubuntu

LABEL maintainer="Waipot Ngamsaad <waipotn@hotmail.com>"

#SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
    python3 \
    python3-pip 

RUN pip3 install webssh && \
    apt-get remove -y python3-pip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8998

#ENTRYPOINT ["wssh", "--port=8998", , "--encoding='utf-8'", "--logging=debug"]
ENTRYPOINT ["wssh", "--port=8998", "--encoding='utf-8'"]