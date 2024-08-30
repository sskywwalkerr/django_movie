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

ENTRYPOINT ["/app/entrypoint.prod.sh"]

