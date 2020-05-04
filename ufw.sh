#!/bin/bash

sudo ufw reset
sudo ufw default deny

while read line
do
  set -- ${line}
    if [[ -z "${line}" ]]; then continue; fi
    if [[ ${2} == Port ]]; then
      allowport=${3}
      sudo ufw allow ${3}
    elif [[ ${1} == ufw-allow ]]; then
      sudo ufw allow ${2}
    fi
done < ./linux-setting.conf

sudo ufw enable