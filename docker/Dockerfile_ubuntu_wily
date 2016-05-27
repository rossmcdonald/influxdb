FROM ubuntu:wily
MAINTAINER Ross McDonald <mcdonaldrossc+docker@gmail.com>

RUN apt-get update && \
    apt-get install -y \
    python-apt \
    python-pip \
    python-dev \
    python-setuptools

RUN pip install ansible

ENV PROJECT_DIR /root
RUN mkdir -p $PROJECT_DIR

WORKDIR $PROJECT_DIR
VOLUME $PROJECT_DIR
ENTRYPOINT [ "ansible-playbook", "-M", "/root", "-c", "local", "-e", "is_docker=true", "-i", "localhost," ]
