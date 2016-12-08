FROM centos:latest

MAINTAINER silvertoken <silvertoken99@gmail.com>

# Add mono repository
# Update and install mono
RUN yum install -y \
		yum-utils \
		epel-release \
		unzip \
		wget && \
	rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" && \
	yum-config-manager --add-repo "http://download.mono-project.com/repo/centos/" && \
	yum -y update && \
	yum -y install mono-complete && \
	yum clean all

#Copy start script
COPY start.sh /start

# Download and install TShock
ENV TSHOCK_VERSION=pre1-4.3.21-1.26-2.0.0.9 \
    TSHOCK_FILE=tshock_mintaka_prere_1

RUN mkdir /world /config /logs /plugins && \
	wget https://github.com/NyxStudios/TShock/releases/download/mintaka-$TSHOCK_VERSION/$TSHOCK_FILE.zip && \
	unzip $TSHOCK_FILE.zip && \
	rm $TSHOCK_FILE.zip && \
	mv $TSHOCK_FILE /tshock && \
	chmod +x /tshock/TerrariaServer.exe && \
	chmod +x /start

# Allow for external data
VOLUME ["/world", "/logs", "/config" "/plugins"]

# Set working directory to server
WORKDIR /tshock

# run the server
ENTRYPOINT [ "/start" ]