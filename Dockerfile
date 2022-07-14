FROM python:3.8
USER root
# set work directory
#WORKDIR /usr/src/app/
# copy project
#COPY . /usr/src/app/
# install dependencies
RUN echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list
RUN echo "deb http://cz.archive.ubuntu.com/ubuntu bionic main universe" >> /etc/apt/sources.list
RUN echo "deb http://cz.archive.ubuntu.com/ubuntu bionic main" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu focal-security main" >> /etc/apt/sources.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
RUN apt-get update -y
RUN pip install playwright pyTelegramBotAPI TikTokApi
RUN apt-get install -y libsoup2.4-1\
          libgtk-3-0\
          libegl1\
          libnotify4\
          libopus0\
          libopengl0\
          libwoff1\
          libharfbuzz-icu0\
          gstreamer1.0-plugins-base\
          libgstreamer1.0-0\
          libgstreamer-gl1.0-0\
          gstreamer1.0-plugins-bad\
          libjpeg-turbo8\
          libatk1.0-0\
          libenchant1c2a\
          libsecret-1-0\
          libhyphen0\
          libxcomposite1\
          libxdamage1\
          libwayland-server0\
          libwayland-egl1\
          libwayland-client0\
          libxkbcommon0\
          libepoxy0\
          libevdev2\
          libatk-bridge2.0-0\
          libgles2\
          gstreamer1.0-libav
RUN playwright install
RUN playwright install-deps
#RUN python -m playwright install

# run app
CMD ["python", "main.py"]