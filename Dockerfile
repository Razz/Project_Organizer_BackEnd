FROM ruby:2.6.1-alpine
MAINTAINER Carlos Nunez <dev@carlosnunez.me>

COPY . /app
WORKDIR /app
RUN apk add --no-cache ruby-dev  ruby-nokogiri build-base libxml2-dev \
libxslt-dev postgresql-dev sqlite sqlite-libs sqlite-dev less
RUN gem install rails && \
    bundle install
ENTRYPOINT [ "rails", "server" ]
