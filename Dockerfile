FROM ruby:2.6.5

RUN mkdir /app
WORKDIR /app

# install the dependencies before adding the source to enable image caching
RUN sh -c "gem install nokogiri -v '1.10.8'"

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD lib/ /app/lib/

RUN bundle install

ADD . /app

ENTRYPOINT rails server