FROM python:3.9.16-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt /tmp/requirements.txt

COPY . /app/

RUN set -ex && \
  pip install --upgrade pip && \
  pip install -r /tmp/requirements.txt && \
  rm -rf /root/.cache/


EXPOSE 8080

CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
