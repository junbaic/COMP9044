#!/bin/dash

for png in $@
do
  display "$png"
  echo -n "Address to e-mail this image to?"
  read address
  if test -n "$address"
  then
      echo -n "Message to accompany image?"
      read message
      echo "$message" | mutt -s 'image' -e 'set copy=no' -a "$png" -- "$address"
      echo "$png sent to $address"
  else
      echo "No email sent"
  fi
done
