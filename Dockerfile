FROM ruby:2.2

RUN apt-get update -qq && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends vim build-essential aptitude curl git nginx mysql-client

ENV APP_HOME /opt/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ENV UPDATEDAT 18-06-2015-2038

ADD Gemfile* $APP_HOME/
RUN bundle install -j 8

# RUN rm /etc/nginx/sites-enabled/default
# ADD nginx.conf /etc/nginx/sites-enabled/app.conf
# RUN update-rc.d nginx defaults

EXPOSE 3000

# ENV ENV development
# CMD ["rs"]
