#!/bin/bash
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
STORMCLI() {
./tg -p cli --login --phone=${1}
} 
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get install g++-4.7 -y c++-4.7 -y
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
sudo apt-get install screen -y
sudo apt-get install tmux -y
sudo apt-get install libstdc++6 -y
sudo apt-get install lua-lgi -y
sudo apt-get install libnotify-dev -y
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install lua5.1 luarocks lua-socket lua-sec redis-server curl 
sudo luarocks install oauth 
sudo luarocks install redis-lua 
sudo luarocks install lua-cjson 
sudo luarocks install ansicolors 
sudo apt-get install libstdc++9
sudo apt-get install libconfig++9v5 libstdc++6
sudo luarocks install serpent 
sudo apt install speedtest-cli
wget https://valtman.name/files/telegram-bot-180116-nightly-linux
mv telegram-bot-180116-nightly-linux tg
chmod +x tg
echo -e "\e[1;35m ==>[ Installation completed successfully ]\e[00;39;40m"
sleep 1
mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config
default_profile = "cli";
cli = {
lua_script = "$HOME/tdbot/bot.lua";
};
EOF
printf "\nConfig Has Been Saved.\n"
sleep 1
echo -e "\e[1;35m ==>[ Please Insert Your Phone Number... ]\e[00;39;40m"
read phone_number
STORMCLI ${phone_number}
sleep 2
echo -e "\e[1;35m ==>[ The Bot Is Run  ]\e[00;39;40m"
screen ./tg | grep -v "{"
case $1 in
esac
exit 0

 



 
