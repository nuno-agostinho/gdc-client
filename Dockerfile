FROM ubuntu
MAINTAINER Nuno Agostinho <nunodanielagostinho@gmail.com>

RUN apt-get update

ENV SW=/root/software
WORKDIR ${SW}

ENV gdc=gdc-client
ADD ${gdc}.zip ${gdc}.zip
RUN apt-get install -y --no-install-recommends unzip
RUN unzip ${gdc}.zip
RUN rm ${gdc}.zip

ENV PATH="${PATH}:${SW}"