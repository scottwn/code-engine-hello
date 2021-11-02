FROM intel/oneapi-basekit:2021.4-devel-ubuntu18.04

RUN apt-get update \
 && apt-get --no-install-recommends -y install \
  build-essential=12.9 \
  zlib1g-dev=1:1.2.11.dfsg-0ubuntu2 \
  libncurses5-dev=6.1-1ubuntu1.18.04 \
  libgdbm-dev=1.14.1-6 \
  libnss3-dev=2:3.35-2ubuntu2 \
  libssl-dev=1.1.0g-2ubuntu4 \
  libreadline-dev=7.0-3 \
  libffi-dev=3.2.1-8 \
  libsqlite3-dev=3.22.0-1 \
  wget=1.19.4-1ubuntu2 \
  libbz2-dev=1.0.6-8.1 \
  libgeos-dev=3.9.0-1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN wget https://www.python.org/ftp/python/3.10.0/Python-3.10.0.tgz -P /tmp
RUN tar -xf tmp/Python-3.10.*.tgz
WORKDIR /tmp/Python-3.10.*/
RUN ./configure --enable-optimizations && make -j 16 && make install

WORKDIR /
COPY requirements.txt requirements.txt
RUN pip3.10 install --upgrade pip==21.3.1 && pip3.10 install -r requirements.txt
COPY *.py /
ENV FLASK_APP=main
CMD [ "python3.10", "-m" , "flask", "run", "--host=0.0.0.0"]
