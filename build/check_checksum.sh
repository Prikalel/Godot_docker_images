#!/bin/sh

if [ $# -eq 0 ]
then
  echo "No arguments supplied"
  exit 1
fi

CHECKSUMS_FILE="SHA512-SUMS.txt"
GODOT_ZIP_FILE=$1

if [ -f "$CHECKSUMS_FILE" ]
then
  echo "File $CHECKSUMS_FILE exists, but must be downloaded"
  exit 2
else
  echo "File $CHECKSUMS_FILE does not exist and will be downloaded..."
  wget https://downloads.tuxfamily.org/godotengine/4.2/beta3/mono/$CHECKSUMS_FILE
fi

ACTUAL_SHA512=$(sha512sum $GODOT_ZIP_FILE)
LOADED_SHA512=$(cat $CHECKSUMS_FILE | grep $GODOT_ZIP_FILE)

if [ "$LOADED_SHA512" = "$ACTUAL_SHA512" ]
then
  echo "all OK"
else
  echo -e "no match, Local:"$LOADED_SHA512"\nRemote:"$ACTUAL_SHA512
  exit 3
fi

rm -f $CHECKSUMS_FILE