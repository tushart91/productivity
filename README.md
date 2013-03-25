 INSTRUCTIONS
--------------
Pre-requisites:
MongoDB should be installed.
Python should be installed.

NOTE: Ensure that atleast 200MB space is availabe. Ensure that mongod is up and running. Change the mongo(d) parameters wherever necessary according to the connection type, database name and collection name.Add username:password wherever necessary.

1. Run the mainScript.sh file. Add a argument to while running this. The argument must be a number which multiplied by 1000 is the upper limit is the number of files. As an example for less than 6000 records.

		~$ ./mainScript.sh 6

2. The above script fetches the data. Inserts it into mongodb (see how to start mongod) and makes the necessary changes.

3. Run changelog.sh and obtain the changelog.csv file.
