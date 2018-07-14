#!/bin/bash
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

SCRIPTDIR="$( cd "$(dirname $0)" && pwd )"

apt-get update
system="debian_stretch"
arch="amd64"

# put date or current
cversion="20180714"

function downloadModule {
	wget https://homegear.eu/downloads/nightlies/${1} || exit 1
}

function installModule {
	dpkg -i ${1}
	if [ $? -ne 0 ]; then
		apt-get -y -f install || exit 1
		dpkg -i ${1} || exit 1
	fi
}

TEMPDIR=$(mktemp -d)
cd $TEMPDIR
rm -f homegear*.deb
rm -f libhomegear*.deb

wget https://homegear.eu/downloads/nightlies/libhomegear-base_${cversion}_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/libhomegear-node_${cversion}_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/libhomegear-ipc_${cversion}_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear_${cversion}_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-nodes-core_${cversion}_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-nodes-extra_${cversion}_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-licensing_${cversion}_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-easy-licensing_${cversion}_${system}_${arch}.deb || exit 1

downloadModule homegear-homematicbidcos_${cversion}_${system}_${arch}.deb
#downloadModule homegear-homematicwired_${cversion}_${system}_${arch}.deb
#downloadModule homegear-insteon_${cversion}_${system}_${arch}.deb
#downloadModule homegear-max_${cversion}_${system}_${arch}.deb
#downloadModule homegear-philipshue_${cversion}_${system}_${arch}.deb
#downloadModule homegear-sonos_${cversion}_${system}_${arch}.deb
#downloadModule homegear-kodi_${cversion}_${system}_${arch}.deb
#downloadModule homegear-ipcam_${cversion}_${system}_${arch}.deb
#downloadModule homegear-beckhoff_${cversion}_${system}_${arch}.deb
#downloadModule homegear-knx_${cversion}_${system}_${arch}.deb
#downloadModule homegear-enocean_${cversion}_${system}_${arch}.deb
#downloadModule homegear-intertechno_${cversion}_${system}_${arch}.deb
#downloadModule homegear-rs2w_${cversion}_${system}_${arch}.deb
#downloadModule homegear-rsl_${cversion}_${system}_${arch}.deb
#downloadModule homegear-zwave_${cversion}_${system}_${arch}.deb
#downloadModule homegear-mbus_${cversion}_${system}_${arch}.deb
downloadModule homegear-ccu2_${cversion}_${system}_${arch}.deb
#downloadModule homegear-easycam_${cversion}_${system}_${arch}.deb
#downloadModule homegear-easyled_${cversion}_${system}_${arch}.deb
#downloadModule homegear-easyled2_${cversion}_${system}_${arch}.deb
downloadModule homegear-management_${cversion}_${system}_${arch}.deb
#downloadModule homegear-influxdb_${cversion}_${system}_${arch}.deb

dpkg -i libhomegear-base_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i libhomegear-base_${cversion}_${system}_${arch}.deb || exit 1
fi

dpkg -i libhomegear-node_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i libhomegear-node_${cversion}_${system}_${arch}.deb || exit 1
fi

dpkg -i libhomegear-ipc_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i libhomegear-ipc_${cversion}_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear_${cversion}_${system}_${arch}.deb
	if [ $? -ne 0 ]; then
		apt-get -y -f install || exit 1
		dpkg -i homegear_${cversion}_${system}_${arch}.deb || exit 1
	fi
fi

dpkg -i homegear-nodes-core_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-nodes-core_${cversion}_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear-nodes-extra_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-nodes-extra_${cversion}_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear-licensing_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-licensing_${cversion}_${system}_${arch}.deb || exit 1
fi

dpkg -i homegear-easy-licensing_${cversion}_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1
	dpkg -i homegear-easy-licensing_${cversion}_${system}_${arch}.deb || exit 1
fi

installModule homegear-homematicbidcos_${cversion}_${system}_${arch}.deb
#installModule homegear-homematicwired_${cversion}t_${system}_${arch}.deb
#installModule homegear-insteon_${cversion}_${system}_${arch}.deb
#installModule homegear-max_${cversion}_${system}_${arch}.deb
#installModule homegear-philipshue_${cversion}_${system}_${arch}.deb
#installModule homegear-sonos_${cversion}_${system}_${arch}.deb
#installModule homegear-kodi_${cversion}_${system}_${arch}.deb
#installModule homegear-ipcam_${cversion}_${system}_${arch}.deb
#installModule homegear-beckhoff_${cversion}_${system}_${arch}.deb
#installModule homegear-knx_${cversion}_${system}_${arch}.deb
#installModule homegear-enocean_${cversion}_${system}_${arch}.deb
#installModule homegear-intertechno_${cversion}_${system}_${arch}.deb
#installModule homegear-rs2w_${cversion}_${system}_${arch}.deb
#installModule homegear-rsl_${cversion}_${system}_${arch}.deb
#installModule homegear-zwave_${cversion}_${system}_${arch}.deb
#installModule homegear-mbus_${cversion}_${system}_${arch}.deb
installModule homegear-ccu2_${cversion}_${system}_${arch}.deb
#installModule homegear-easycam_${cversion}_${system}_${arch}.deb
#installModule homegear-easyled_${cversion}_${system}_${arch}.deb
#installModule homegear-easyled2_${cversion}_${system}_${arch}.deb
#installModule homegear-management_${cversion}_${system}_${arch}.deb
#installModule homegear-influxdb_${cversion}_${system}_${arch}.deb

rm -f /etc/homegear/dh1024.pem
rm -f /etc/homegear/homegear.key
rm -f /etc/homegear/homegear.crt

cd $SCRIPTDIR
rm -Rf $TEMPDIR
rm -f /InstallNightly.sh

#service homegear stop
#sync
#sleep 10

#systemctl enable homegear-management
#systemctl enable homegear-influxdb

