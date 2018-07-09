#/bin/bash

cd ~
  
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get install -y nano htop git
sudo apt-get install -y software-properties-common
sudo apt-get install -y build-essential libtool autotools-dev pkg-config libssl-dev
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libevent-dev
sudo apt-get install -y libminiupnpc-dev
sudo apt-get install -y autoconf
sudo apt-get install -y automake unzip
sudo add-apt-repository  -y  ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev
sudo apt-get install libzmq3-dev

cd

wget https://github.com/ZyX7/schain/releases/download/1.0.0/schain-1.0.0-x86_64-linux-gnu.tar.gz
tar -xzf schain-1.0.0-x86_64-linux-gnu.tar.gz

sudo apt-get install -y ufw
sudo ufw allow ssh/tcp
sudo ufw limit ssh/tcp
sudo ufw logging on
echo "y" | sudo ufw enable
sudo ufw status
sudo ufw allow 10021/tcp
  
cd
mkdir -p .schain
echo "staking=1" >> schain.conf
echo "rpcuser=user"`shuf -i 100000-10000000 -n 1` >> schain.conf
echo "rpcpassword=pass"`shuf -i 100000-10000000 -n 1` >> schain.conf
echo "rpcallowip=127.0.0.1" >> schain.conf
echo "listen=1" >> schain.conf
echo "server=1" >> schain.conf
echo "daemon=1" >> schain.conf
echo "logtimestamps=1" >> schain.conf
echo "maxconnections=256" >> schain.conf
echo "port=10021" >> schain.conf
mv schain.conf .schain

  
cd
./schaind -daemon
sleep 30
./schain-cli getinfo
sleep 5
./schain-cli getnewaddress
echo "Use the address above to send your SCHAIN coins to this server"

