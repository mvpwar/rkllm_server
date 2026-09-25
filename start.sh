#!/bin/bash

model_path=/vol1/1000/rkllama/models/Qwen2.5-1.5B-Instruct/Qwen2.5-1.5B-Instruct-rk3588-w8a8-opt-0-hybrid-ratio-1.0.rkllm
work_path=/vol1/1001/rkllm_server

cd $work_path
ps -ef|grep $model_path|grep -v grep|awk '{print $2}'|xargs kill -9

. venv/bin/activate
nohup python3 ai.py --target_platform rk3588 --rkllm_model_path $model_path  & 
sleep 4

cat nohup.out
