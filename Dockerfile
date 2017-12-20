FROM ruby:2.4.1-alpine3.6

LABEL maintainer="cuihaiqin@gmail.com"
LABEL geminabox_version="0.13.11"

WORKDIR /geminabox
ADD . /geminabox

RUN apk add --no-cache --virtual .gem-build gcc libc-dev make \
    && bundle --without development test \
    && apk del .gem-build

VOLUME /geminabox/data
EXPOSE 9292
CMD rackup --host 0.0.0.0 --env production
