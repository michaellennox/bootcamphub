FROM phusion/passenger-ruby24:0.9.20

# set environment variables
ENV HOME /root
ENV app_name=bootcamphub
ENV APP_HOME=/home/app/bootcamphub

# use baseimage-docker’s init process
CMD [“/sbin/my_init”]

# install dependencies

RUN apt-get update -qq && apt-get install -y \
      build-essential \
      libpq-dev \
      nodejs &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# setup nginx
RUN rm -f /etc/service/nginx/down &&\
  rm /etc/nginx/sites-enabled/default
ADD config/docker/production/nginx.conf /etc/nginx/sites-enabled/${app_name}.conf
ADD config/docker/production/nginx_env.conf /etc/nginx/main.d/env.conf

# add application source to image
RUN mkdir -p /home/app/bootcamphub
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install --deployment

ADD . $APP_HOME

# compile assets and jekyll sites
RUN bundle exec rake assets:precompile
