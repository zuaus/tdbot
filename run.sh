#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

wget https://valtman.name/files/telegram-bot-180116-nightly-linux

mv telegram-bot-180116-nightly-linux tg

chmod +x tg

sleep 1

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

bot = 'BOT',		my = 'USERNAME'}

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

sleep 1

echo "Please Insert Your Phone Number..."

read phone_number

STORMCLI ${phone_number}

echo 'Your Cli Bot Loged In Successfully.'

./tg -p cli --login --phone=${1}

sleep 3

./tg | grep -v "{"

case $1 in

esac

exit 0

 
