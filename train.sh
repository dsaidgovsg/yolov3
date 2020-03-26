#!/bin/bash
#mntdir, projectname and runname is tightly coupled as environ variable with the train.py script
export MNTDIR='/experiment'
export PROJECT_NAME='seafari'
export RUN_NAME='replication_experiment_1'

export GPUS='1,2'
export EPOCHS=1000
export BATCH='64'
export SUBD='16'
export HEIGHT='832'
export WIDTH='832'
export LEARN_RATE='0.001'
export BURN_IN='1000'
export STEPS='9600,10800'
export CLASSES='6'
export ANCHORS='68,32, 140,59, 247,73, 199,143, 321,119, 484,101, 391,199, 597,142, 676,231'
export ANCHORS_NUM='9'

#echo "Copying over data"
rm -rf /usr/src/app/data/*
cp -r /${MNTDIR}/data/* /usr/src/app/data/
export DATA=$(basename $(ls -t /usr/src/app/data/*.data | head -n 1))

#echo "Copying over weights"
rm -rf /usr/src/app/weights/*
cp -r /${MNTDIR}/weights/* /usr/src/app/weights/
export WEIGHTS=$(basename $(ls -t  /usr/src/app/weights/ | head -n 1))

#new run
#python3 train.py --epochs ${EPOCHS} --data data/${DATA} --weights weights/${WEIGHTS} --device ${GPUS}

#resume run epochs = completed_epochs + new_epochs
#python3 train.py --epochs ${EPOCHS} --data data/${DATA} --resume "3bae73b41941472980114ccb04d97408" --device ${GPUS}

#retrieve cfg used
mv ./cfg/yolov3_train.cfg /${MNTDIR}/artifacts/${PROJECT_NAME}_${RUN_NAME}.cfg