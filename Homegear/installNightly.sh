#!/bin/bash
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1024
fi

SCRIPTDIR="$( cd "$(dirname $0)" && pwd )"

apt-get update
system="debian_stretch"
arch="amd64"

function downloadModule {
	wget https://homegear.eu/downloads/nightlies/${1} || exit 1212
}

function installModule {
	dpkg -i ${1}
	if [ $? -ne 0 ]; then
		apt-get -y -f install || exit 1210
		dpkg -i ${1} || exit 1211
	fi
}

TEMPDIR=$(mktemp -d)
cd $TEMPDIR
rm -f homegear*.deb
rm -f libhomegear*.deb

wget https://homegear.eu/downloads/nightlies/libhomegear-base_current_${system}_${arch}.deb || exit 1100
wget https://homegear.eu/downloads/nightlies/libhomegear-node_current_${system}_${arch}.deb || exit 1101
wget https://homegear.eu/downloads/nightlies/libhomegear-ipc_current_${system}_${arch}.deb || exit 1102
wget https://homegear.eu/downloads/nightlies/homegear_current_${system}_${arch}.deb || exit 1103
wget https://homegear.eu/downloads/nightlies/homegear-nodes-core_current_${system}_${arch}.deb || exit 1104
wget https://homegear.eu/downloads/nightlies/homegear-nodes-extra_current_${system}_${arch}.deb || exit 1105
wget https://homegear.eu/downloads/nightlies/homegear-licensing_current_${system}_${arch}.deb || exit 1106
wget https://homegear.eu/downloads/nightlies/homegear-easy-licensing_current_${system}_${arch}.deb || exit 1107

downloadModule homegear-homematicbidcos_current_${system}_${arch}.deb
downloadModule homegear-homematicwired_current_${system}_${arch}.deb
#downloadModule homegear-insteon_current_${system}_${arch}.deb
#downloadModule homegear-max_current_${system}_${arch}.deb
downloadModule homegear-philipshue_current_${system}_${arch}.deb
downloadModule homegear-sonos_current_${system}_${arch}.deb
#downloadModule homegear-kodi_current_${system}_${arch}.deb
downloadModule homegear-ipcam_current_${system}_${arch}.deb
#downloadModule homegear-beckhoff_current_${system}_${arch}.deb
#downloadModule homegear-knx_current_${system}_${arch}.deb
#downloadModule homegear-enocean_current_${system}_${arch}.deb
#downloadModule homegear-intertechno_current_${system}_${arch}.deb
#downloadModule homegear-rs2w_current_${system}_${arch}.deb
#downloadModule homegear-rsl_current_${system}_${arch}.deb
#downloadModule homegear-zwave_current_${system}_${arch}.deb
#downloadModule homegear-mbus_current_${system}_${arch}.deb
downloadModule homegear-ccu2_current_${system}_${arch}.deb
#downloadModule homegear-easycam_current_${system}_${arch}.deb
#downloadModule homegear-easyled_current_${system}_${arch}.deb
#downloadModule homegear-easyled2_current_${system}_${arch}.deb
#downloadModule homegear-influxdb_current_${system}_${arch}.deb

dpkg -i libhomegear-base_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1000
	dpkg -i libhomegear-base_current_${system}_${arch}.deb || exit 1001
fi

dpkg -i libhomegear-node_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1002
	dpkg -i libhomegear-node_current_${system}_${arch}.deb || exit 1003
fi

dpkg -i libhomegear-ipc_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1004
	dpkg -i libhomegear-ipc_current_${system}_${arch}.deb || exit 1005
fi

dpkg -i homegear_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1006
	dpkg -i homegear_current_${system}_${arch}.deb
	if [ $? -ne 0 ]; then
		apt-get -y -f install || exit 1007
		dpkg -i homegear_current_${system}_${arch}.deb || exit 1008
	fi
fi

dpkg -i homegear-nodes-core_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1009
	dpkg -i homegear-nodes-core_current_${system}_${arch}.deb || exit 1010
fi

dpkg -i homegear-nodes-extra_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1011
	dpkg -i homegear-nodes-extra_current_${system}_${arch}.deb || exit 1012
fi

dpkg -i homegear-licensing_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1013
	dpkg -i homegear-licensing_current_${system}_${arch}.deb || exit 1014
fi

dpkg -i homegear-easy-licensing_current_${system}_${arch}.deb
if [ $? -ne 0 ]; then
	apt-get -y -f install || exit 1015
	dpkg -i homegear-easy-licensing_current_${system}_${arch}.deb || exit 1016
fi

installModule homegear-homematicbidcos_current_${system}_${arch}.deb
installModule homegear-homematicwired_current_${system}_${arch}.deb
#installModule homegear-insteon_current_${system}_${arch}.deb
#installModule homegear-max_current_${system}_${arch}.deb
installModule homegear-philipshue_current_${system}_${arch}.deb
installModule homegear-sonos_current_${system}_${arch}.deb
#installModule homegear-kodi_current_${system}_${arch}.deb
installModule homegear-ipcam_current_${system}_${arch}.deb
#installModule homegear-beckhoff_current_${system}_${arch}.deb
#installModule homegear-knx_current_${system}_${arch}.deb
#installModule homegear-enocean_current_${system}_${arch}.deb
#installModule homegear-intertechno_current_${system}_${arch}.deb
#installModule homegear-rs2w_current_${system}_${arch}.deb
#installModule homegear-rsl_current_${system}_${arch}.deb
#installModule homegear-zwave_current_${system}_${arch}.deb
#installModule homegear-mbus_current_${system}_${arch}.deb
installModule homegear-ccu2_current_${system}_${arch}.deb
#installModule homegear-easycam_current_${system}_${arch}.deb
#installModule homegear-easyled_current_${system}_${arch}.deb
#installModule homegear-easyled2_current_${system}_${arch}.deb
#installModule homegear-influxdb_current_${system}_${arch}.deb

rm -f /etc/homegear/dh1024.pem
rm -f /etc/homegear/homegear.key
rm -f /etc/homegear/homegear.crt

cd $SCRIPTDIR
rm -Rf $TEMPDIR
rm -f /InstallNightly.sh
