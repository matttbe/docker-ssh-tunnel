# ssh-tunnel
#
# VERSION  0.0.1

FROM       ubuntu:14.04
MAINTAINER Matthieu Baerts "matttbe@gmail.com"

# Install SSH server (without root login)
RUN apt-get update && apt-get install -y openssh-server

# Create user tunnel without access to bash
RUN useradd -m tunnel
RUN echo 'tunnel:tunnel' | chpasswd
RUN chsh -s /bin/false tunnel
RUN printf "\nMatch User tunnel\n   AllowTcpForwarding yes\n   X11Forwarding no\n" >> /etc/ssh/sshd_config

RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
