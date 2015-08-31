#!/usr/bin/env python

import json
import urllib2
import os
import sys

from pprint import pprint

mongoimport = "./../mongodb/bin/mongoimport"
def remove_key(obj):
    for key in obj.keys():
        new_key = key.replace('key','_id')
        if new_key != key:
            obj[new_key] = obj[key]
            del obj[key]
    return obj 

with open('wholeDumps/'+sys.argv[1]+'.json') as data_file:
        data = json.load(data_file,object_hook=remove_key)

for index in range(len(data['issues'])):
	DataFile = open("splitDumps/"+sys.argv[1]+"/"+str(index)+".json", "w")
	DataFile.write(json.dumps(data['issues'][index]))
	DataFile.close()
	os.system(mongoimport + " -d mydb -c bugs --file splitDumps/"+sys.argv[1]+"/"+str(index)+".json")
