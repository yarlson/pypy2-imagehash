FROM pypy:2-5.9.0

MAINTAINER Yar Kravtsov <yarlson@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive ;\
    mkdir -p /var/www ;\
    cd /var/www  ;\
    mkdir media static logs ;\
    echo "deb http://ftp.lt.debian.org/debian/ jessie contrib" >> /etc/apt/sources.list ;\
    echo "deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" >> /etc/apt/sources.list ;\
    echo "deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" >> /etc/apt/sources.list ;\
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B ;\
    apt-get update ;\
    apt-get install libgeos-dev locales fontconfig-infinality pdftk cython -y ;\
    fc-cache ;\
    echo "en_US.UTF-8 UTF-8" > /etc/locale.gen ;\
    echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen ;\
    locale-gen ;\
    cd /etc/fonts/infinality/ ;\
    bash infctl.sh setstyle osx2 ;\
    apt-get autoremove -y ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ;\
    pip install --upgrade pip ;\
    pip install --no-cache-dir numpy==1.13.3 pandas==0.20.3

