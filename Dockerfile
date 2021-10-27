FROM python:3.10.0-bullseye
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB \
 && mkdir usr/local/share/keyrings \
 && mv GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB usr/local/share/keyrings/ \
 && echo "deb [signed-by=/usr/local/share/keyrings/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB] https://apt.repos.intel.com/oneapi all main" \
 | tee /etc/apt/sources.list.d/oneAPI.list \
 && apt-get update \
 && apt-get --no-install-recommends -y install \
  linux-headers-amd64=5.10.70-1 \
  cmake=3.18.4-2 \
  pkg-config=0.29.2-1 \
  build-essential=12.9 \
  intel-basekit=2021.4.0-3422 \
  libgeos-dev=3.9.0-1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY *.py /
ENV FLASK_APP=main
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
