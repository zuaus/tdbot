#!/bin/bash
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
STORMCLI() {
./tg -p cli --login --phone=${1}
} 
if [ "$1" = "config" ]; then
echo -e "\e[1;35m ==>[ Installation completed successfully ]\e[00;39;40m"
sleep 1
mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config
default_profile = "cli";
cli = {
lua_script = "$HOME/tdbot/STORM.lua";
};
EOF
printf "\nConfig Has Been Saved.\n"
sleep 1
echo -e "\e[1;35m ==>[ Please Insert Your Phone Number... ]\e[00;39;40m"
read phone_number
STORMCLI ${phone_number}
sleep 2
if
echo -e "\e[1;35m ==>[ The Bot Is Run  ]\e[00;39;40m"
./tg | grep -v "{"
exit 0

 



 
