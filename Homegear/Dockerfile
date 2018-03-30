FROM debian:stretch
MAINTAINER Sathya Laufer <sathya@homegear.email>

RUN \
   apt-get update && apt-get -y install apt-transport-https apt-utils wget ca-certificates gnupg \
&& wget https://homegear.eu/packages/Release.key && apt-key add Release.key && rm Release.key \
&& echo 'deb https://homegear.eu/packages/Debian/ stretch/' >> /etc/apt/sources.list.d/homegear.list

COPY *.sh /

RUN \
   chmod +x /installNightly.sh 
RUN /installNightly.sh 
RUN \
   rm -f /etc/homegear/dh1024.pem /etc/homegear/homegear.crt /etc/homegear/homegear.key \
&& cp -R /etc/homegear /etc/homegear.config \
&& cp -R /var/lib/homegear /var/lib/homegear.data \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& chmod +x /start.sh

CMD /start.sh

EXPOSE 2001 2002 2003
