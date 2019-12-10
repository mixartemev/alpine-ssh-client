FROM alpine:3.5
MAINTAINER Mike Artemiev <mixartemev@gmail.com>
RUN apk update && apk add openssh-client
# COPY id_rsa /root/.ssh/id_rsa
COPY id_ed25519 /root/.ssh/id_ed25519
RUN chmod 400 /root/.ssh/id_ed25519
# Security fix for CVE-2016-0777 and CVE-2016-0778; disable hostame confirm
RUN echo -e 'Host *\nUseRoaming no\nStrictHostKeyChecking no\n' >> /etc/ssh/ssh_config
