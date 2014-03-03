#!/bin/bash

set -e

for arg in "$@"; do
    case ${arg} in
        --server_ip=* ) SERVER_IP=${arg/--server_ip=/} ;;
        --server=* ) SERVER=${arg/--server=/} ;;
    esac
done


echo $SERVER