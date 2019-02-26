FROM minustime/with-vim:ubuntu-bionic

LABEL maintainer="vic@minustime.com"

ARG RUBY_VERSION=2.5.1
ARG RAILS_VERSION=5.2.2

ARG DEBIAN_FRONTEND=noninteractive
ARG TERM=xterm
ARG WORKDIR=/opt/workspace

USER root

# Install essentials
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git-core \
       libssl-dev \
       libreadline-dev \
       libyaml-dev \
       libsqlite3-dev \
       sqlite3 \
       mysql-client \
       libmysqlclient-dev \
       libxml2-dev \
       libxslt1-dev \
       libcurl4-openssl-dev \
       software-properties-common \
       libffi-dev \
       nodejs \
       yarn \
    && rm -rf /var/lib/apt/lists/*

SHELL ["/bin/zsh", "-c"]

USER ${USER}

RUN cd \
    && git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
    && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv \
    && echo 'eval "$(rbenv init -)"' >> ~/.zshenv \
    && source $HOME/.zshenv >> ~/.zshrc

RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build \
    && echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshenv \
    && source $HOME/.zshenv >> ~/.zshrc

# Install Ruby
RUN rbenv install ${RUBY_VERSION} \
    && rbenv global ${RUBY_VERSION}

# Install Rails
RUN gem install rails -v ${RAILS_VERSION}

CMD ["sleep", "infinity"]
