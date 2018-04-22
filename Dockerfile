FROM ruby:2.4-alpine

LABEL maintaner="alex@kudashkin.pro"

RUN apk add --update --no-cache \
  build-base \
  nodejs \
  tzdata \
  postgresql-dev \
  && rm -rf /var/cache/apk/*

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/

CMD ["rails", "s", "-b", "0.0.0.0"]
