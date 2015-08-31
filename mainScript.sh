#!/bin/bash
mkdir splitDumps
mkdir wholeDumps
username=
password=
end=$1
for ((  i = 0 ;  i < $end;  i++  ))
do

	startat=`expr $i \* 1000`

	curl -o wholeDumps/$i.json -D- -k -u $username:$password -X GET -H "Content-Type: application/json" "https://jira.paypal.com/jira/rest/api/2/search?startAt=${startat}&maxResults=1000&fields=created&fields=project&fields=components&fields=customfield_12536&fields=resolutiondate&fields=issuetype&fields=priority&fields=assignee&fields=reporter&fields=comment&fields=resolution&fields=customfield_10534&fields=status&jql=project%20=%20FLN%20AND%20status%20was%20in%20(Open,%20%22In%20Progress%22,%20Reopened)%20AND%20created%20%3E=%20-120d"

	mkdir splitDumps/$i	
	./splitFetch.py $i &
	
done
wait
./../mongodb/bin/mongo localhost:27017/mydb getUpdate.js
wait
rm -r wholeDumps/
rm -r splitDumps/
