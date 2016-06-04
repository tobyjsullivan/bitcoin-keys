#!/bin/sh

CYPHER=aes-256-cbc
JS_SCRIPT=new-key-pair.js

if [ ! -e "$JS_SCRIPT" ]
then
		echo "generate.sh must be run in directory with $JS_SCRIPT"
		exit 1
fi

npm install

OUT=`node $JS_SCRIPT`

ADDRESS=`echo "$OUT" | head -n 1`
PRIV_KEY=`echo "$OUT" | tail -n 1`
ENC_KEY=`echo "$PRIV_KEY" | openssl enc -$CYPHER -a -salt -e`

echo "Address: $ADDRESS" | head -n 1
# echo "DEBUG: Private Key: $PRIV_KEY"
echo "Encrypted private key:"
echo "$ENC_KEY"
echo "Cypher: $CYPHER"
echo "Decrypt with 'openssl enc -$CYPHER -a -salt -d'"
