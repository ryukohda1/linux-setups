#!/bin/bash

set -eu

# Resolving "sed -i" option deifference between linux(GNU) and macOS(BSD)
# Using linux(GNU sed)
# Ref: https://qiita.com/papinnie/items/4299c3e279fe33f7fca2
function sed(){
    if command sed --version 2>&1 | grep -q GNU; [ $? -ne 0 ] \
    && [ "${1:0:2}" == "-i" ]
    then
        BACKUP_EXT=${1:2}
        shift
        command sed -i "$BACKUP_EXT" "$@"
        return $?
    else
        command sed "$@"
        return $?
    fi
}

while read line
do
  set -- ${line}
    if [[ -z "${line}" ]]; then continue; fi
    if [[ ${1} == SSHD ]]; then
      sed -i -e "s/^#${2} .*/${2} ${3}/g" -e "s/^${2} .*/${2} ${3}/g" /etc/ssh/sshd_config
    fi
done < ./linux-setting.conf