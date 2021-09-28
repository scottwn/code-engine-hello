FROM python:3
ADD *.py /
RUN pip install Flask
ENV FLASK_APP=main
EXPOSE 8080
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
