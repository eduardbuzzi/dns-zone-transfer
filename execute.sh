#!/bin/bash
echo
read -p "DOMAIN => " DOMAIN
echo
for server in $(host -t ns $DOMAIN | cut -d ' ' -f4);
do
VERIFICAR=$(host -l -a $DOMAIN $server | grep "found")
if [ ! -z "$VERIFICAR" ]
then
continue
else
host -l -a $DOMAIN $server;
fi
done
