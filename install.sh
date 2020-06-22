#!/bin/bash
##User Validation
user=`id | cut -d" " -f1 | cut -d"(" -f2 | cut -d")" -f1`
if [ "$user" != "root" ] 
then
	echo -e "\e[1m\e[31mNOTE: You don't have admin privilegies, execute the script as root.\e[0m\e[0m"
	exit 0
fi
mkdir Target



##WebAppInstaller

#nmap
apt-get install nmap -y

#dnsenum
apt-get install dnsenum -y

#sublister
git clone https://github.com/aboul3la/Sublist3r.git webApp/sublister
cd webApp/sublister
pip install -r requirements.txt
cd -

#nikto
apt-get install nikto -y

#xsscrapy
git clone https://github.com/DanMcInerney/xsscrapy.git webApp/xsscrapy
cd webApp/xsscrapy
pip install -r requirements.txt
cd -

#DSJS
git clone https://github.com/stamparm/DSJS.git webApp/DSJS

#A2SV
git clone https://github.com/hahwul/a2sv.git webApp/a2sv
cd webApp/a2sv
pip install argparse
pip install netaddr
apt-get install openssl -y
cd -

#joomlavs
git clone https://github.com/rastating/joomlavs.git webApp/joomlavs
cd webApp/joomlavs
sudo gem install bundler && bundle install
cd -
