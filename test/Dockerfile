# Use an official Ruby runtime as a parent image
FROM ruby:2.4.2

# make and switch to the /app directory which will hold our app
RUN mkdir /test
WORKDIR /test

RUN echo "deb http://ppa.launchpad.net/mozillateam/firefox-next/ubuntu trusty main" > /etc/apt/sources.list.d//mozillateam-firefox-next-trusty.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys CE49EC21

RUN apt-get update && apt-get install -y xvfb firefox

# move over the Gemfile and Gemfile.lock before the rest of the app so that we can cache the installed gems
ADD Gemfile /test/Gemfile
ADD Gemfile.lock /test/Gemfile.lock

# install all gems specified by the Gemfile
RUN bundle install

ADD . /test

ADD xvfb.init /etc/init.d/xvfb
RUN chmod +x /etc/init.d/xvfb
RUN update-rc.d xvfb defaults
CMD (service xvfb start; export DISPLAY=:10; cd /test; rake features_headless)
