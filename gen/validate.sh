#!/bin/sh

echo "WARNING: This script only validates your password."
echo "It does not check that the private key is valid for your wallet."

echo "Encrypted key: (Press CTRL-D when done)"
ENC_KEY=`cat`

echo "$ENC_KEY" | openssl enc -aes-256-cbc -d -salt -a > /dev/null
RES=$?

if [ "$RES" == "0" ]
then
		echo "Password is valid"
else
		echo "FAIL! Password doesn't match"
		exit 1
fi
