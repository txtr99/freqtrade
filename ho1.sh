#!/usr/bin/env sh

DATERANGE="20211230-20220106"
STRATEGY="HTF_Strvinmarvin"
CONFIGFILE="user_data/configb.json"
LOSSTYPE="WinRatioAndProfitRatioLoss"
#LOSSTYPE="ShortTradeDurHyperOptLoss"
#LOSSTYPE="OnlyProfitHyperOptLoss"
#LOSSTYPE="MaxDrawDownHyperOptLoss"
#LOSSTYPE="SharpeHyperOptLoss"
#LOSSTYPE="SortinoHyperOptLoss"
#LOSSTYPE="CalmarHyperOptLoss"
#EPOCHS="192"
EPOCHS="100"
#SPACES="roi stoploss"
#SPACES="stoploss"
#SPACES="protection"
#SPACES="stoploss"
SPACES="buy stoploss"
JOBS="4"

COMMAND="hyperopt"

# https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
GRAY='\033[1;30m'
ORANGE='\033[0;33m'
WHITE='\033[1;37m'
RED='\033[0;31m'
PINK='\033[1;31m'
NC='\033[0m' # No Color
#printf "${BLUE}BLUE ${PURPLE}PURPLE ${CYAN}CYAN ${GREEN}GREEN ${YELLOW}YELLOW ${GRAY}GRAY ${ORANGE}ORANGE ${WHITE}WHITE ${RED}RED ${PINK}PINK ${NC}NC NO COLOR\n"

printf "\n\n${NC}Hit {enter} to run the command below.  Press CTRL-C to cancel...\n${PINK}$ ${WHITE}docker-compose run freqtrade ${YELLOW}$COMMAND ${WHITE}--hyperopt-loss ${ORANGE}$LOSSTYPE ${WHITE}-c ${CYAN}$CONFIGFILE ${WHITE}--timerange ${GREEN}$DATERANGE ${WHITE}-s ${PURPLE}$STRATEGY ${WHITE}-e ${YELLOW}$EPOCHS ${WHITE}--spaces ${GREEN}$SPACES ${WHITE}-j ${PURPLE}$JOBS ${WHITE}--print-all ${WHITE}--fee ${PURPLE}0\n${NC}..." \
#;read -r varuserinput
varuserinput=""

if [ "$varuserinput" = "" ]; then
    $"docker-compose" run freqtrade \
      ${COMMAND:-""} \
      --"hyperopt-loss" ${LOSSTYPE} \
      --timerange ${DATERANGE:-""} \
      -s ${STRATEGY:-""} \
      -c ${CONFIGFILE:-""} \
      -e ${EPOCHS:-""} \
      -j ${JOBS:-""} \
      --spaces ${SPACES:-""} \
      --print-all
      #--fee 0 ;

else
    printf "Exiting..."
fi

