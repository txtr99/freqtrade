#!/usr/bin/env sh

DATERANGE="20220105-20220106"
#DATERANGE="1641020400-1641106800"
STRATEGY="HTF_Strvinmarvin_spreads"
CONFIGFILE="user_data/configbusd.json"

COMMAND="backtesting"

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

printf "\n\n${NC}Hit {enter} to run the command below.  Press CTRL-C to cancel...\n${PINK}$ ${WHITE}docker-compose run freqtrade ${YELLOW}$COMMAND ${WHITE}-c ${CYAN}$CONFIGFILE ${WHITE}--timerange ${GREEN}$DATERANGE ${WHITE}--strategy ${PURPLE}$STRATEGY ${WHITE}--breakdown day ${WHITE}--stake-amount ${GREEN}100 ${WHITE}--fee ${PURPLE}0\n${NC}..." \
;read -r varuserinput

if [ "$varuserinput" = "" ]; then
    $"docker-compose" run freqtrade \
      ${COMMAND:-""} \
      --timerange ${DATERANGE:-""} \
      --strategy ${STRATEGY:-""} \
      -c ${CONFIGFILE:-""} \
      --breakdown day \
      --pairs BTC/BUSD
      #--fee 0 ;

else
    printf "Exiting..."
fi

