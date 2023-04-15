FROM ubuntu:22.04
WORKDIR /root/
COPY . .
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
# Install honeypots dependencies
RUN apt-get install postgresql  libpq-dev python3-pip git -y
RUN pip3 install requests==2.20.1
RUN pip3 install .

# Start base honeypot as backgroud process and the honeypots as main
#ENTRYPOINT ["/usr/local/bin/honeypots", "--setup", "http:80"]
ENTRYPOINT ["/usr/local/bin/honeypots"]
#CMD "/usr/local/bin/honeypots --setup http:80"
CMD ["--setup", "http:80", "--termination-strategy", "signal"]
