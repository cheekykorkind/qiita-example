FROM ruby:2.7.1-slim

RUN apt update && apt upgrade -y && apt install -y curl gnupg && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt install -y libpq-dev sudo git make nodejs yarn tzdata cron cronutils g++

ARG UID
ARG GID

ENV UID ${UID}
ENV GID ${GID}

RUN useradd --uid $UID --create-home --shell /bin/bash -G sudo,root ec2-user
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /workspace/myapp
WORKDIR /workspace/myapp
COPY Gemfile /workspace/myapp/Gemfile
COPY Gemfile.lock /workspace/myapp/Gemfile.lock
COPY . /workspace/myapp

RUN bundle install
RUN yarn install --check-files