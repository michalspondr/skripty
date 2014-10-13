#!/usr/bin/python

# Displays coordinates from your Google location history
# (download it here: https://www.google.com/settings/takeout
# Only coordinates with accuracy 50 and lower

# Usage:
# - download the JSON file with geolocation history
# - rename it to location.json
# - run: python locations.py >coordinates
# - display in i.e. gnuplot: gnuplot -e "plot 'coordinates' lt 0; pause -1"

import json

json_data=open("location.json").read()
loc = json.loads(json_data)

for data in loc["locations"]:
	if "accuracy" in data and data["accuracy"] < 50:
		print data["longitudeE7"], data["latitudeE7"] 

