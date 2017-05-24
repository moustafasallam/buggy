FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /buggy
WORKDIR /buggy
ADD Gemfile /buggy/Gemfile
ADD Gemfile.lock /buggy/Gemfile.lock
RUN bundle install
ADD . /buggy