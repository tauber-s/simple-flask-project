# syntax=docker/dockerfile:1

FROM python:3.10.12-slim-bullseye
WORKDIR /usr/src/app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

CMD [ "python3", "-m" , "flask", "--app", "app", "run", "--host=0.0.0.0"]