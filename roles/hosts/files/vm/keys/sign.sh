#!/bin/sh

echo "Content-type: text/plain"
echo ""

host=$(echo "$QUERY_STRING" | sed 's/.*host=//g')
temp=$(mktemp --suffix=.pub)
cat > $temp
ssh-keygen -s /vm/keys/host_ca -I $host -h -n $host $temp
cat ${temp%.pub}-cert.pub
