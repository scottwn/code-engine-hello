FROM python:3.8-slim-buster

RUN apt-get update \
 && apt-get install -y --no-install-recommends git=1:2.20.1-2+deb10u3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY *.py /
ENV FLASK_APP=main
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
