# OpenDNS, Cloudflare, Google
DNS=( "208.67.222.222" "208.67.220.220" "1.1.1.1" "1.0.0.1" "8.8.8.8" "8.8.4.4"  )
AMOUNT_OF_PINGS=250
DELAY_BETWEEN_PINGS=2
TIME_TOTAL=$(echo "${AMOUNT_OF_PINGS} * ${DELAY_BETWEEN_PINGS}/60" | bc) # minutes

for i in "${DNS[@]}"
do
    echo "pinging $i, AMOUNT_OF_PINGS=$AMOUNT_OF_PINGS, DELAY_BETWEEN_PINGS=$DELAY_BETWEEN_PINGS, TIME_TOTAL=$TIME_TOTAL mins"
    ping -c $AMOUNT_OF_PINGS -i $DELAY_BETWEEN_PINGS $i >> $i.log
done
echo "Done."
