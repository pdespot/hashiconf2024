#!/usr/bin/bash

cd "$(dirname "$0")"
echo '[myhosts]' > ansible/inventory.ini
terraform output ip_address | sed -n 's/^.*"\([0-9.]*\)".*$/\1/p' >> ansible/inventory.ini
