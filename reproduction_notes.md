# Reproduction Notes

## Starting out
* Create new tiny ubuntu instance on AWS.
* Create tiny RDS postgres DB.
* `ssh -i thekey.pem ubuntu@$HOST`
* get the code
```
$ sudo apt-get update
$ sudo apt-get install git
$ git clone https://github.com/alexbyrnes/FCC-Political-Ads.git
$ git clone https://github.com/alexbyrnes/FCC-Political-Ads_The-Code.git
$ cd FCC-Political-Ads_The-Code
```

## Install dependencies (scipy does not pip install for me)
```
$ sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose
$ sudo apt-get install poppler-utils

$ sudo apt-get install imagemagick parallel yagf python-skimage python-lxml
$ sudo apt-get install python-virtualenv
$ sudo apt-get install python-psycopg2
$ sudo apt-get install postgresql-client
```

## Setup and use a python virtual env (python 2.7). 
$ virtualenv env
$ source env/bin/activate
$ export PYTHONPATH=/usr/lib/python2.7/dist-packages

## Build dependencies
* Replace requirements file with
```
Pillow
SimpleCV==1.3
beautifulsoup4==4.3.2
clime==0.2.7
mock==1.0.1
nose==1.1.2
pygeocoder==1.2.5
python-sql==0.6
simplejson==2.3.2
titlecase==0.7.2
unittest2==0.8.0
```
* Then `pip install -r requirements.txt`

## Set up the DB
```
$ PGPASSWORD=$PASS psql -U postgres -h $HOST -p 5432
fcc=> create user fcc_worker with password 'REDACTED';
fcc=> \q
```
```
PGPASSWORD=$PASS psql -U fcc_worker -h $HOST -p 5432 fcc
fcc=> begin;
fcc=> \i schema.sql 
fcc=> commit;
fcc=> \q
```

## Get some data
...

