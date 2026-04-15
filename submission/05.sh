# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

integer=150
hex=$(printf '%08x\n' $integer | sed 's/^\(00\)*//')
# echo $hex

# no need to convert to little endian its just one byte
timePush="02$hex"
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

pkhPush="14$publicKeyHash"
script="${timePush}00b27521${publicKey}ac"
echo $script
# bitcoin-cli -regtest decodescript $script