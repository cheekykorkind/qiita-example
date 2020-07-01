FROM amazonlinux:2

RUN yum -y install systemd procps openssh-server passwd sudo vim git wget unzip \
  && yum clean all

ARG UID
ARG GID

ENV UID ${UID}
ENV GID ${GID}

RUN useradd --uid ${UID} --create-home --shell /bin/bash -G wheel,root ec2-user
RUN echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# 「sshd: no hostkeys available -- exiting.」を防ぐために追加
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''

# Add a script to be executed every time the container starts.
COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]