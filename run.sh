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
bot = 'BOT',		
my = 'USERNAME'
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
}

function print_logo() {
green ""
green ""
green ""
green ""
echo -e "\n\e[0m"
}

function logo_play() {
declare -A txtlogo
seconds="0.010"
txtlogo[1]=" "
txtlogo[2]=""
txtlogo[3]=""
txtlogo[4]=""
printf "\e[31m\t"
for i in ${!txtlogo[@]}; do
for x in `seq 0 ${#txtlogo[$i]}`; do
printf "${txtlogo[$i]:$x:1}"
sleep $seconds
done
printf "\n\t"
done
printf "\n"
echo -e "\e[0m"
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
print_logo
printf "Please wait...\n"

exit ;;

logcli)
print_logo
echo "Please Insert Your Phone Number..."
read phone_number
STORMCLI ${phone_number}
echo 'Your Cli Bot Loged In Successfully.'
exit;;

install)
print_logo
logo_play
install
exit;;

run)
printf "New is Launching...\n"
print_logo
logo_play
STORM
exit;;

reset)
print_logo
printf "Please wait for delete telegram-bot...\n"
deltgbot
sleep 1
config
exit;;
esac
exit 0

 

