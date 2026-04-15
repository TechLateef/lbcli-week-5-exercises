# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

integer=4224679


hex=$(printf '%08x\n' $integer | sed 's/^\(00\)*//')
echo  $hex

lehex=$(echo $hex | sed 's/../& /g' | awk '{for(i=NF;i>=1;i--) printf "%s", $i; print ""}')
echo  $lehex

timePush="03$lehex"

publicKeyHash=$(echo $publicKey | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $NF}')
echo  $publicKeyHash


pkhPush="14$publicKeyHash"

script="${timePush}b27576a9${pkhPush}88ac"
echo  $script

# bitcoin-cli -regtest decodescript $script