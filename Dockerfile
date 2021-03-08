FROM python:latest
ADD app.py /
RUN pip install flask
RUN pip install flask_restful
RUN python3 -m venv venv
RUN export FLASK_APP=app.py
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "app.py"]

