# Dockerfile.tpl
# for making a Docker image which gives you a basic CentOS7 shell
# edit the .tpl file and not the derived Dockerfile file.


# centos7 latest by default
from centos:7

# add packages here
RUN yum -y install git

RUN groupadd -g 1000 paulm
RUN useradd -g 1000 -u 1000 paulm

CMD su - paulm

# end Dockerfile
