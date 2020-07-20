FROM ubuntu:18.04

LABEL title="tessract-api" \
      version="1.0" \
      description="Flask App server for tesseract api"

RUN apt-get update && apt-get install -y \
  python3.8 \
  python3-pip \
  tesseract-ocr-eng \
  && apt-get clean \
  && rm  -rf /var/lib/apt/lists/*

COPY requriment.txt  /tmp
RUN python3.8 -m pip install -r  /tmp/requriment.txt

WORKDIR /root

RUN mkdir static app test

VOLUME ["/root/static", "/root/app", "/root/test"]
EXPOSE 8888

ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0

CMD ["/bin/bash"]