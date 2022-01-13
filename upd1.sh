#!/usr/bin/env sh

set -x
cd user_data/ft-hyperopt-cloud-1
git pull
cd ..
cd ..
cp user_data/ft-hyperopt-cloud-1/bt1.sh ./
cp user_data/ft-hyperopt-cloud-1/ho1.sh ./
cp user_data/ft-hyperopt-cloud-1/dd1.sh ./
#cp user_data/ft-hyperopt-cloud-1/user_data/strategies/HFT_strvinmarvin.json user_data/HFT_strvinmarvin_new.json
rm user_data/strategies/HFT_strvinmarvin_spreads.json
cp user_data/ft-hyperopt-cloud-1/user_data/strategies/HFT_strvinmarvin_spreads.py user_data/strategies/HFT_strvinmarvin_spreads.py
cp user_data/ft-hyperopt-cloud-1/user_data/configbusd.json user_data
ls
rm tradesv3.dryrun.sqlite
#rm tradesv3.sqlite
