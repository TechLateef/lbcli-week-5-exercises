# Create a CLTV script with a timestamp of 1495584032 and public key below:
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
integer=1495584032
hex=$(printf '%08x\n' $integer | sed 's/^\(00\)*//')
echo $hex

lehex=$(echo $hex | tac -rs .. | echo "$(tr -d '\n')")
echo $lehex
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
publicKeyHash=$(echo "02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $NF}')
echo $publicKeyHash

timePush="04$lehex"
pkhPush="14$publicKeyHash"
script="${timePush}b17576a9${pkhPush}88ac"
echo $script
# bitcoin-cli -regtest decodescript $script
