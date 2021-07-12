FROM python:2
MAINTAINER Nuno Agostinho <nunodanielagostinho@gmail.com>

RUN apt-get update && apt-get install -y \
  unzip \
  python3-dev \
  && rm -rf /var/lib/apt/lists/*

RUN pip install virtualenv

ENV gdc=gdc-client
ADD ${gdc} ${gdc}
WORKDIR ${gdc}/bin
RUN ./package

RUN unzip -o *.zip
RUN rm *.zip

ENV PATH=/${gdc}/bin:$PATH

WORKDIR /home