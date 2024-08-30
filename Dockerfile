FROM python:3.8

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1

RUN apt-get update \
    && apt-get install netcat-openbsd
RUN apt-get upgrade -y && apt-get install postgresql-server-dev-all gcc python3-dev musl-dev -y

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

#COPY ./entrypoint.sh .

COPY . .

ENTRYPOINT ["/app/entrypoint.sh"]




#FROM python:3.8
#
#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1
#
#WORKDIR /usr/src/dm_rest
#
#COPY ./requirements.txt /usr/src/requirements.txt
#RUN pip install -r /usr/src/requirements.txt
#
#COPY . /usr/src/dm_rest
#
#EXPOSE 8000
##CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]