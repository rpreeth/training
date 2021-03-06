FROM ubuntu:16.04

RUN apt-get update && apt-get install sudo && apt-get install -y openssh-server
RUN apt-get update && apt-get install -y default-jdk && apt-get install -y  maven
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd


EXPOSE 22
EXPOSE 80 
CMD ["/usr/sbin/sshd", "-D"]
