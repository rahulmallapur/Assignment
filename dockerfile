FROM ubuntu:12.04
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN echo 'bash /motd.sh' >> /etc/bash.bashrc
RUN echo 'Banner /etc/ssh/before-login-banner' >> /etc/ssh/sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN mkdir /root/.ssh
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
COPY before-login-banner /etc/ssh/
COPY motd.sh /
EXPOSE 22
CMD    ["/usr/sbin/sshd", "-D"]
