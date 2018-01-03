FROM ruby:2.3.6
RUN apt-get update -qq && apt-get --no-install-recommends install -y build-essential sqlite3 nodejs && rm -rf /var/lib/apt/lists/*
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
EXPOSE 3000
CMD bundle exec rails s -p 3000 -b '0.0.0.0'