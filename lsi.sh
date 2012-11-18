!#/bin/bash


#the mail that error will send
lsi_mail="mohamed.hassan.saraya"

# make sure the utiliy is installed
if rpm -q MegaCli &>/dev/null ; then


# run  MegaCli64 to give info about it and run lsi.awk prog on it
lsitestresult=$(/opt/MegaRAID/MegaCli/MegaCli64 -PDList -aAll|awk -f ./lsi.awk)

# IF (1)
if [ -n "$lsitestresult" ]
then
# send mail if there any error
echo -e "$lsitestresult" | /bin/mail -s "CRITICAL: LSI CONTROLLER: Physical Drives Error" "$lsi_mail"
fi

else echo "LSI untility is not installed on $HOSTNAME" | /bin/mail -s "LSI untility is not installed on $HOSTNAME" "$lsi_mail"

fi
