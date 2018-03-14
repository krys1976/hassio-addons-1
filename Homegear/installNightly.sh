#!/bin/bash
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

SCRIPTDIR="$( cd "$(dirname $0)" && pwd )"

apt-get update
system="raspbian_stretch"
arch="armhf"

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

wget https://homegear.eu/downloads/nightlies/libhomegear-base_current_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/libhomegear-node_current_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/libhomegear-ipc_current_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear_current_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-nodes-core_current_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-nodes-extra_current_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-licensing_current_${system}_${arch}.deb || exit 1
wget https://homegear.eu/downloads/nightlies/homegear-easy-licensing_current_${system}_${arch}.deb || exit 1

downloadModule homegear-homematicbidcos_current_${system}_${arch}.deb
downloadModule homegear-homematicwired_current_${system}_${arch}.deb
