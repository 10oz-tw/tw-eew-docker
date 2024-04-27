FROM jlesage/baseimage-gui:ubuntu-22.04-v4

COPY startapp.sh /startapp.sh
COPY entrypoint.sh /entrypoint.sh
COPY settings.json /config/xdg/config/oxwu/settings.json

RUN \
	apt update && \
	apt install -yqq software-properties-common && \
	add-apt-repository ppa:appimagelauncher-team/stable --yes && \
	apt install -yqq appimagelauncher curl wget xterm fuse3 libnss3-dev libasound2 fonts-ubuntu ttf-mscorefonts-installer

WORKDIR /root
RUN \
	wget https://eew.earthquake.tw/releases/linux/x64/oxwu-linux-x86_64.AppImage && \
	chmod +x oxwu-linux-x86_64.AppImage && \
	ail-cli integrate ./oxwu-linux-x86_64.AppImage && \
	mkdir -p /root/.pki/nssdb && chown -R 1000:1000 /root/.pki/nssdb && \
	chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

