#!/usr/bin/env bash

clear

while [ -z ${name} ]
do
  read -p "Please input your name : " name
  if [ -z ${name} ]
  then
    sleep .5
    echo "Don't leave your name blank"
    sleep 2
    clear
  fi
done

sleep .5

echo $name
