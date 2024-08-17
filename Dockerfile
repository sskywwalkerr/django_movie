FROM python:3.8

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1

#RUN apt update && apt install postgresql-dev gcc python3-dev musl-dev



RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt


COPY . .




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