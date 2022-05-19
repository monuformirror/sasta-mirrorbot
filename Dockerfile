FROM debian:buster

RUN apt-get update && apt-get install curl unzip ca-certificates fuse openssh-client gnupg2 -y && \
curl https://mega.nz/linux/MEGAsync/Debian_10.0/amd64/megacmd-Debian_10.0_amd64.deb --output megacmd.deb && \
echo path-include /usr/share/doc/megacmd/* > /etc/dpkg/dpkg.cfg.d/docker && \
apt install ./megacmd.deb -y && \
wget wget -qO- https://rclone.org/install.sh | bash && \
apt-get remove -y curl && \
apt-get clean

ENV USERNAME NOBODY
ENV PASSWORD CHANGEME

ADD *.sh /

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
