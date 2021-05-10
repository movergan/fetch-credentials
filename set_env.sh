#!/bin/bash
for val in $(cat roles/infra/fetch-credentials/*/defaults/main.yml |awk '{print $4}'|awk -F"'" '{print $2}')
do
        #unset ${val}
        echo -n "Set Value for $val: "
        u=$(echo $val| tr '[:lower:]' '[:upper:]')
        if [[ $u =~ "PASSWORD" ]]
        then
                read -s value
                eval "$val=\$value"
                echo
        else
                read value
                eval "$val=\$value"
        fi
        export "$val"
done
