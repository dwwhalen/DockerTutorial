# Use an official Ruby runtime as a parent image
FROM ruby:2.4.2

# make and switch to the /app directory which will hold our app
RUN mkdir /test
WORKDIR /test

# move over the Gemfile and Gemfile.lock before the rest of the app so that we can cache the installed gems
ADD Gemfile /test/Gemfile
ADD Gemfile.lock /test/Gemfile.lock

# install Chrome
RUN apt-get update && apt-get install -y xvfb chromium-browser curl unzip libgconf-2-4

RUN mv /usr/bin/chromium-browser /usr/bin/chromium-browser-real
ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser


# install Xvfb
#RUN apt-get update -y
#RUN apt-get install -y xvfb

# install all gems specified by the Gemfile
RUN bundle install

# copy over the rest of the test files
ADD . /test

CMD cd test
CMD rake features_headless