FROM python:3
ADD *.py /
RUN pip install -r requirements.txt
ENV FLASK_APP=main
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
