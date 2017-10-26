FROM pypy:2-5.9.0

MAINTAINER Yar Kravtsov <yarlson@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive ;\
    apt-get update ;\
    apt-get install libblas-dev liblapack-dev cython gfortran gfortran-4.9 libgfortran-4.9-dev -y ;\
    apt-get autoremove -y ;\
    apt-get clean ;\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ;\
    pip install --upgrade pip ;\
    pip install --no-cache-dir numpy==1.13.3 pandas==0.20.3 ;\
    pip install --no-cache-dir scipy==1.0.0 imagehash==3.7 
