FROM ubuntu:latest
RUN apt update -y > /dev/null 2>&1 && apt upgrade -y > /dev/null 2>&1 && apt install locales -y \
&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
RUN apt install ssh wget unzip -y > /dev/null 2>&1
#!/bin/bash
RUN pip3 install -U pip
#!/bin/bash
RUN curl -fssL https://deb.nodesource.com/setup_18.x | sudo -E bash - && sudo apt-get install nodejs -y && npm i -g npm
RUN wget -O ngrok.zip https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip ngrok.zip
RUN echo "./ngrok config add-authtoken 2LbRpOJ8aYNSaa9fzBkGorqsIjD_3NzuGu5CxH8DCns9frg5d &&" >>/1.sh
RUN echo "./ngrok tcp 22 &>/dev/null &" >>/1.sh
RUN mkdir /run/sshd
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo root:Nixa|chpasswd
#!/bin/bash
RUN service ssh start
#!/bin/bash
RUN chmod 755 /1.sh
#!/bin/bash
EXPOSE 80 8888 8080 443 5130 5131 5132 5133 5134 5135 3306
#!/bin/bash
CMD  /1.sh
