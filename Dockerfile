FROM docker:18.03.1-ce-git

RUN apk add --update make gcc git libffi-dev musl-dev openssl-dev perl py-pip python python-dev sshpass libffi-dev

RUN pip install --upgrade pip \
  && pip install ansible \
  && rm -rf /var/cache/apk/*

