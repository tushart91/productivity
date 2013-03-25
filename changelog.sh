#!/bin/bash

./../mongodb/bin/mongoexport --csv --db mydb --collection bugs -o changelog.csv --fields "_id","fields.components.0.name","fields.customfield_12536.value","fields.customfield_12536.child.value","fields.issuetype.name","fields.status.name","fields.reporter.displayName","fields.assignee.displayName","fields.created","fields.firstUpdate","fields.resolutiondate","fields.updateDifference","fields.resolutionDifference"


