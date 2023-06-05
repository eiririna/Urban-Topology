FROM ruby:3.0.2

ENV BUNDLER_VERSION=2.3.24

RUN apt update -qq && apt install -y libmsgpack-dev postgresql-client

RUN gem install bundler -v 2.3.24

RUN mkdir /urban-topology
WORKDIR /urban-topology

ENV RAILS_ENV production

COPY Gemfile .
COPY Gemfile.lock .

RUN bundle install

COPY . .

EXPOSE 3000

RUN chmod +x docker.sh
CMD ./docker.sh