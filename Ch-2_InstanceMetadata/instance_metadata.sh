#!/bin/bash
data=${1^^}
meta_data_url=http://169.254.169.254/latest/meta-data/
roleProfile=$(curl -s http://169.254.169.254/latest/meta-data/iam/info \
    | grep -Eo 'instance-profile/([a-zA-Z.-]+)' | sed 's#instance-profile/##')
 
# auth values
get_sts_value() {
  echo -n $(curl -s http://169.254.169.254/latest/meta-data/iam/security-credentials/$roleProfile/ \
      | grep "$1" \
      | awk -F":" '{print $2}' \
      | sed 's/^[ ^t]*//;s/"//g;s/,//g')
}
 
case $data in
    HOSTNAME)
        result=$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)
        ;;
    ID|INSTANCEID)
        result=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
        ;;
    PRIVATEIP)
        result=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
        ;;
    PUBLICIP)
        result=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
        ;;
    ZONE)
    	result=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone/)
        ;;
    *)
        echo "Usage: $(basename $0) <argument>. Input is not case sensitive"
        grep -Eo '([A-Z.]+\))' $0 | sed 's/)//'
   	;;
esac
 
if [ ! -z "$result" ]; then
    echo "$result"
fi