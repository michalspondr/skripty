#!/bin/sh
# Get last listened music from last.fm and store it in actual_track.txt file

# API call
# you need you to set your api_key and username here
# https://www.last.fm/api/account/create - create API key here
# I know this is an overkill for this but I tried to play with Last.fm API :-)

API_KEY="63fecc0f5ef6ac54fc5494aadc283114" # something like that
USERNAME="m1c4a1"       # something like that
URL="http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=$USERNAME&limit=1&api_key=$API_KEY"
responsefile="response.xml"

rm -f $responsefile

wget -t 3 -q -O $responsefile "http://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=m1c4a1&limit=1&api_key=63fecc0f5ef6ac54fc5494aadc283004"
artist=`grep "<artist" response.xml | sed -e 's/^.*<artist mbid=".*">\(.*\)<\/artist>/\1/'`
name=`grep "<name" response.xml | sed -e 's/^.*<name>\(.*\)<\/name>/\1/'`
echo "$artist - $name" >actual_track.txt

# clean
rm -f $responsefile
