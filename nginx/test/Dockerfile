FROM python:3.7.3

RUN pip install \
  requests==2.21.0

WORKDIR /test
COPY test.py .
CMD python test.py
