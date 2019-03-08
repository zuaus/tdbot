#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

if [ "$1" = "config" ]; then

mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config

default_profile = "cli";

cli = {

lua_script = "$HOME/tdbot/bot.lua";

};

EOF

cat <<EOF > $HOME/tdbot/INFO.lua

do

local INFO = {

sudo = 'SUDO',

bot = 'BOT',		my = 'USERNAME'

}

return INFO

end

--[[

taha

]]--

EOF

echo -e "\e[1;33m ==>[ Ok Send Id Sudo   ]\e[00;39;40m"

read -rp ' ' ID

sed -i 's/SUDO/'$ID'/g' INFO.lua

echo -e "\e[1;33m ==>[ Ok Send The Id Bot ]\e[00;39;40m"
read -rp ' ' BOT

sed -i 's/BOT/'$BOT'/g' INFO.lua

echo -e "\e[1;33m ==>[ Ok Send UserName Sudo ]\e[00;39;40m"

read -rp ' ' USERNAME

sed -i 's/USERNAME/'$USERNAME'/g' INFO.lua

fi

install() {

wget https://valtman.name/files/telegram-bot-180116-nightly-linux

mv telegram-bot-180116-nightly-linux tg

chmod +x tg

}

red() {
echo -e "\e[1;35m ==>[ Installation completed successfully ]\e[00;39;40m"
}

green() {

printf '\e[1;32m%s\n\e[0;39;49m' "$@"

}

white() {

printf '\e[1;37m%s\n\e[0;39;49m' "$@"

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

config)

printf "Please wait...\n"

exit ;;

logcli)
echo -e "\e[1;35m ==>[ Please Insert Your Phone Number... ]\e[00;39;40m"

read phone_number

STORMCLI ${phone_number}

echo 'Your Cli Bot Loged In Successfully.'

exit;;

install)

install
red
exit;;

run)
echo -e "\e[1;35m ==>[ The Bot Is Run  ]\e[00;39;40m"
STORM

exit;;

reset)

printf "Please wait for delete telegram-bot...\n"

deltgbot

sleep 1

config

exit;;

esac

exit 0

 
