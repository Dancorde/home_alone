FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /home_alone
WORKDIR /home_alone
COPY Gemfile /home_alone/Gemfile
COPY Gemfile.lock /home_alone/Gemfile.lock
RUN bundle install
COPY . /home_alone
