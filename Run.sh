RED() {

  printf '\e[1;31m%s\n\e[0;39;49m' "$@"

}

if [ "$1" = "config" ]; then

mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config

default_profile = "main";

main = {

lua_script = "$HOME/tdbot/bot.lua";

};

EOF

cat <<EOF > $HOME/tdbot/Config.lua

do

local _ = {

        sudo = 'SUDO',

		bot = 'BOT',		my = 'USERNAME'

		}

return _

end

--[[

taha

]]--

EOF

    RED "ايدي المطور" 

	read -rp ' ' ID

	sed -i 's/SUDO/'$ID'/g' Config.lua

	RED "ايدي البوت" 

	read -rp ' ' BOT

	sed -i 's/BOT/'$BOT'/g' Config.lua

	RED "معرف المطوو" 

	read -rp ' ' USERNAME

	sed -i 's/USERNAME/'$USERNAME'/g' Config.lua

	fi

install() {

sudo rm /var/lib/apt/lists/lock

sudo rm /var/cache/apt/archives/lock

sudo rm /var/lib/dpkg/lock

sudo apt install openjdk-8-jre-headless

sudo apt-get update

sudo apt-get upgrade

sudo apt-get install git redis-server lua5.2 liblua5.2-dev lua-lgi libnotify-dev unzip tmux -y && add-apt-repository ppa:ubuntu-toolchain-r/test && sudo apt-get update && apt-get upgrade && sudo apt-get install libconfig++9v5 libstdc++6 && sudo apt autoremove

sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev libjansson* libpython-dev make unzip git redis-server g++ autoconf 

wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz

 tar zxpf luarocks-2.2.2.tar.gz

 cd luarocks-2.2.2

 ./configure; sudo make bootstrap

 sudo luarocks install redis-lua

cd ..

}

launchon(){

screen ./luaError.jpg

}

miladcli() {

./tg -p main --login --phone=${1}

}

case $1 in

login)

echo "ارسل رقمك "

read phone_number

miladcli ${phone_number}

exit;;

on)

launchon

exit;;

install)

install

exit;;

esac

exit 0
