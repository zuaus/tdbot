#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

config() {

mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config

default_profile = "cli";

cli = {

lua_script = "$HOME/tdbot/bot.lua";

};

EOF

printf "\nConfig Has Been Saved.\n"

}

install() {

wget https://valtman.name/files/telegram-bot-180116-nightly-linux

mv telegram-bot-180116-nightly-linux tg

chmod +x tg

echo -e "\e[1;35m ==>[ Installation completed successfully ]\e[00;39;40m"

}

update() {

git pull

}

deltgbot() {

 rm -rf $HOME/.telegram-bot

}

STORM() {

./tg | grep -v "{"

}

STORMCLI() {

./tg -p cli --login --phone=${1}

} 

case $1 in

logcli)

echo -e "\e[1;35m ==>[ Please Insert Your Phone Number... ]\e[00;39;40m"

read phone_number

STORMCLI ${phone_number}

echo 'Your Cli Bot Loged In Successfully.'

exit;;

install)

install

sleep 1

config

sleep 1

logcli

exit;;

run)

echo -e "\e[1;35m ==>[ The Bot Is Run  ]\e[00;39;40m"

STORM

exit;;

esac

exit 0

 



 
