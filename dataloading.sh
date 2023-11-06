#! /bin/bash


export BASE_FOLDER="/mnt/c/Users/khaph/OneDrive/Desktop/Data_Science/Data_Engineer/Phase1/Week1/project1"
export INPUT_FOLDER="/mnt/c/Users/khaph/OneDrive/Desktop/Data_Science/Data_Engineer/Phase1/Week1/project1/input"

cd ${BASE_FOLDER}

echo 'start download data'

for year in {2018..2022}
do
    wget -N --content-disposition "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=48369&Year=${year}&Month=2&Day=12&timeframe=1&submit= Download+Data" -O ${INPUT_FOLDER}/${year}.csv;
done


RC=$?
if [ $[RC] != 0 ]
then
    echo 'dowload data failed'
    echo '[ERROR:] return code ${RC}, refer to log for detail'
    exit 1
fi

echo 'run python script to concatenate data'

python3 ${BASE_FOLDER}/python_script.py

RC=$?
if [ ${RC} != 0 ]
then
    echo 'failed to run python script'
    echo '[ERROR:] return code ${RC}, refer to log for more detail'
    exit 1
fi

echo "it's successfully downloaded"