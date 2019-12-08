FROM python:3.7.3

RUN pip install --upgrade pip
RUN pip install \
  pytest==5.2.2 \
  pymongo==3.9.0 \
  requests==2.21.0

COPY app /app
WORKDIR /app
CMD tail -f /dev/null
