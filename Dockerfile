FROM python:3
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY *.py /
ENV FLASK_APP=main
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
