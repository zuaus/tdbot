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

printf "ايدي المطور" 

read -rp ' ' ID

sed -i 's/SUDO/'$ID'/g' INFO.lua

printf "ايدي البوت" 

read -rp ' ' BOT

sed -i 's/BOT/'$BOT'/g' INFO.lua

printf "معرف المطوو" 

read -rp ' ' USERNAME

sed -i 's/USERNAME/'$USERNAME'/g' INFO.lua

fi

install() {

wget https://valtman.name/files/telegram-bot-180116-nightly-linux

mv telegram-bot-180116-nightly-linux tg

chmod +x tg
echo -e "\e[1m\e[32m==> \e[97m The install good .. Telegram-Bot\e[0m"

}

red() {

printf '\e[1;31m%s\n\e[0;39;49m' "$@"

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

echo "Please Insert Your Phone Number..."

read phone_number

STORMCLI ${phone_number}

echo 'Your Cli Bot Loged In Successfully.'

exit;;

install)

install

exit;;

run)

printf "New is Launching...\n"

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

 
