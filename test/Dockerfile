# Use an official Ruby runtime as a parent image
FROM ruby:2.4.2

# make and switch to the /app directory which will hold our app
RUN mkdir /test
WORKDIR /test

RUN apt-get update && \
    apt-get install -y xvfb build-essential libffi-dev wget firefox-esr && \
    wget https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux64.tar.gz && \
    tar -zxvf geckodriver-v0.17.0-linux64.tar.gz && \
    chmod +x geckodriver && \
    mv geckodriver /usr/local/bin && \
    rm geckodriver-v0.17.0-linux64.tar.gz

# move over the Gemfile and Gemfile.lock before the rest of the app so that we can cache the installed gems
ADD Gemfile /test/Gemfile
ADD Gemfile.lock /test/Gemfile.lock

# install all gems specified by the Gemfile
RUN bundle install

ADD . /test

#ADD xvfb.init /etc/init.d/xvfb
#RUN chmod +x /etc/init.d/xvfb
#RUN update-rc.d xvfb defaults
#CMD (service xvfb start; export DISPLAY=:10; cd /test; rake features_headless)
#CMD (Xvfb :10 -ac & export DISPLAY=:10; rake features_headless)

CMD (DISPLAY=localhost:1.0 xvfb-run cucumber)

#CMD (rake features_headless)

