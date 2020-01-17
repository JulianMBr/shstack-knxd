##
## knxd
##
MAINTAINER Julian Brenne <julbrenne@gmail.com

FROM ubuntu:18.04 as builder

COPY github_key .
RUN eval $(ssh-agent) && \
    ssh-add github_key && \
    ssh-keyscan -H github.com >> /etc/ssh/ssh_known_hosts && \
    git clone git@github.com:s1x/shstack-knxd.git /
WORKDIR /opt/knxd


FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/local/src
COPY --from=builder /opt/knxd/ /usr/local/src

## Choose between branches
ARG BRANCH=v0.14
RUN git clone https://github.com/knxd/knxd.git --single-branch --branch $BRANCH

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh  \
    && sed -i -e 's/\r$//' /entrypoint.sh

COPY knxd.ini /etc/knxd
#COPY knxd.ini /etc/knxd

EXPOSE 3672 6720
VOLUME /etc/knxd

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/etc/knxd/knxd.ini"]