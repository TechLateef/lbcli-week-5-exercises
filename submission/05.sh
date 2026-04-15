# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

integer=150
hex=$(printf '%08x\n' $integer | sed 's/^\(00\)*//')
echo $hex

# no need to convert to little endian its just one byte
timePush="01$hex"
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
publicKeyHash=$(echo "02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $NF}')
echo $publicKeyHash

pkhPush="14$publicKeyHash"
script="${timePush}b17576a9${pkhPush}88ac"
echo $script
# bitcoin-cli -regtest decodescript $script