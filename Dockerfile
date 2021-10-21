FROM python:3.10.0-bullseye
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB \
 && mkdir usr/local/share/keyrings \
 && mv GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB usr/local/share/keyrings/ \
 && echo "deb [signed-by=/usr/local/share/keyrings/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB] https://apt.repos.intel.com/oneapi all main" \
 | tee /etc/apt/sources.list.d/oneAPI.list \
 && apt update \
 && apt -y install cmake pkg-config build-essential intel-basekit \
 && apt-get update \
 && apt-get install --no-install-recommends -y libgeos-dev=3.9.0-1 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY *.py /
ENV FLASK_APP=main
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
