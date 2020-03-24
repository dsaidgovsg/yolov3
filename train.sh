#!/bin/bash
#mnt dir is tightly coupled with the train.py script
export mntdir='/experiment'
export ITERATIONS_STOP=1000

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

echo "Copying over data"
rm -rf /usr/src/app/data/*
cp -r /${mntdir}/data/* /usr/src/app/data/
export DATA=$(basename $(ls -t /usr/src/app/data/*.data | head -n 1))

echo "Copying over weights"
rm -rf /usr/src/app/weights/*
cp -r /${mntdir}/weights/* /usr/src/app/weights/
export WEIGHTS=$(basename $(ls -t  /usr/src/app/weights/ | head -n 1))

python3 /usr/src/app/train.py --epochs ${ITERATIONS_STOP} --project_name seafari --run_name replicating_yv3_exp01 --data data/${DATA} --weights weights/${WEIGHTS}

cp /usr/app/src/cfg/yolov3_train.cfg ${mntdir}/
