#!/usr/bin/env bash

user=root
host=118.193.61.10
src=`pwd`"/"
des=/data/123/
now=`date +"%Y-%m-%d %H:%M:%S"`

rsync -vzrc --delete  --exclude ".git"  --exclude ".env"   --exclude ".circleci"   $src  $user@$host:$des

#ssh $user@$host "sudo chown -R www:www $des"

ssh $user@$host "chmod -R 775 $des/bootstrap/cache && chmod -R 775 $des/storage && cd $des && pwd && ls -al"

echo "$now update $host $des code"
