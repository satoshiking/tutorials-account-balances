#!/bin/bash
# wget -q -O polkadot_pathfix.sh https://denispotapov.ru/scripts/polkadot_pathfix.sh && chmod +x polkadot_pathfix.sh && /bin/bash polkadot_pathfix.sh

FILE32=node_modules/@polkadot/util-crypto/base32/bs32.d.ts
FILE58=node_modules/@polkadot/util-crypto/base58/bs58.d.ts
FILE64=node_modules/@polkadot/util-crypto/base64/bs64.d.ts

FILES=($FILE32 $FILE58 $FILE64)

search="../../../util/src/types"
replace="../../util/types"

function find_and_replace() {
	sed -i "s|$search|$replace|" $1
}

for FILE in ${FILES[*]}
do
	if [ -f "$FILE" ]; then
		find_and_replace $FILE
    		echo "$FILE was fixed"
	else 
    		echo "File $FILE not found. Make sure you are in the project folder"
	fi
    
done

echo $'\nDone!'
