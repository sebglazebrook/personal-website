FROM ruby:2.2.5

RUN mkdir /app

WORKDIR /app

EXPOSE 9292

ADD Gemfile* /app/

RUN bundle install

ADD . /app/

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "9292"]
