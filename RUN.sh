#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

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

config() {
mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config
default_profile = "cli";
cli = {
lua_script = "$HOME/tdbot/bot.lua";
};

EOF
printf "\nConfig Has Been Saved.\n"
}

beyond() {
./tg | grep -v "{"
}

beyondcli() {
./tg -p cli --login --phone=${1}
} 

case $1 in
config)
print_logo
printf "Please wait...\n"
config ${2}
exit ;;

logcli)
print_logo
echo "Please Insert Your Phone Number..."
read phone_number
beyondcli ${phone_number}
echo 'Your Cli Bot Loged In Successfully.'
exit;;

install)
print_logo
install
exit;;

bd)

printf "New BDReborn is Launching...\n"
print_logo
beyond
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

 
