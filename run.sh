#!/bin/bash
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR
STORMCLI() {
./tg -p cli --login --phone=${1}
} 
case $1 in
config)
echo -e "\e[1;35m ==>[ Installation completed successfully ]\e[00;39;40m"
sleep 1
mkdir $HOME/.telegram-bot; cat <<EOF > $HOME/.telegram-bot/config
default_profile = "cli";
cli = {
lua_script = "$HOME/tdbot/STORM.lua";
};
EOF
cat <<EOF > $HOME/tdbot/SM
#!/bin/bash
while(true) do
screen -S run -X kill
screen -S run ./run.sh run
done
EOF
printf "\nConfig Has Been Saved.\n"
sleep 1
echo -e "\e[1;35m ==>[ Please Insert Your Phone Number... ]\e[00;39;40m"
read phone_number
STORMCLI ${phone_number}
chmod +x SM
exit;;
run)
echo -e "\e[1;35m ==>[ The Bot Is Run  ]\e[00;39;40m"
./tg | grep -v "{"
esac
exit 0

 



 
