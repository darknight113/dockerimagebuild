FROM centos AS server1

RUN mkdir /home/sample1

WORKDIR /home/sample1

RUN pwd

RUN yum update -y

RUN yum install wget -y

RUN wget www.google.com

RUN mv /home/sample1/index.html /home/sample1/google.html

FROM ubuntu AS server2

RUN mkdir /home/sample2

WORKDIR /home/sample2

RUN pwd

RUN apt-get update -y

RUN apt-get install wget -y

RUN wget www.facebook.com

RUN mv /home/sample2/index.html /home/sample2/facebook.html

FROM alpine AS server3

RUN mkdir /home/sample3

WORKDIR /home/sample3

RUN pwd

COPY --from=server1 /home/sample1/ .

COPY --from=server2 /home/sample2/ .

ENTRYPOINT ["sh"]
