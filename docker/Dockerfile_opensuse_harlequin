FROM opensuse:13.2
MAINTAINER Ross McDonald <mcdonaldrossc+docker@gmail.com>

RUN zypper -n in ansible

ENV PROJECT_DIR /root
RUN mkdir -p $PROJECT_DIR

WORKDIR $PROJECT_DIR
VOLUME $PROJECT_DIR
ENTRYPOINT [ "ansible-playbook", "-M", "/root", "-c", "local", "-e", "is_docker=true", "-i", "localhost," ]
