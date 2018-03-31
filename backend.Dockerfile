FROM python:3.6.4-stretch

RUN mkdir /code
WORKDIR /code
ADD ./BiConnectBE/requirements.txt /code/
RUN pip install -r requirements.txt