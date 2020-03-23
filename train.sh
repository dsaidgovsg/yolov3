#!/bin/bash

export mntdir='/mlflow'
export BATCH='64'
export SUBD='16'
export HEIGHT='832'
export WIDTH='832'
export LEARN_RATE='0.001'
export BURN_IN='1000'
export STEPS='9600,10800'
export CLASSES='80'
export ANCHORS='10,13,  16,30,  33,23,  30,61,  62,45,  59,119,  116,90,  156,198,  373,326'
export ANCHORS_NUM='9'

python3 train.py --project_name sample-proj-name-coco --run_name sample-run --data data/coco1.data --weights weights/yolov3.weights
