FROM python:3.10.0-bullseye
RUN apt-get update && apt-get install --no-install-recommends -y libgeos-dev=3.9.1
RUN apt-get clean
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY *.py /
ENV FLASK_APP=main
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
