FROM minustime/with-vim:ubuntu-bionic

LABEL maintainer="vic@minustime.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG TERM=xterm
ARG WORKDIR=/opt/workspace

USER root

# Install essentials
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ruby \
       ruby-all-dev \
       zlib1g-dev \
       libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Rails
RUN gem install rails --no-ri --no-rdoc

USER ${USER}

CMD ["sleep", "infinity"]
