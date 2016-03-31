#/bin/bash

if [ $# -ne 1 ]
then
  echo "Expected syntax is: backup.sh s3://bucket/folder"
  exit 1
fi

s3uri=$1
archivename="backup_$(date '+%Y-%m-%d-%H-%M').tar.gz"

echo "----------------------------------"
echo "Stopping servers"
echo "----------------------------------"
sudo /opt/bitnami/ctlscript.sh stop

echo "----------------------------------"
echo "Creating backup archive $archivename"
echo "----------------------------------"
sudo tar -pczvf "$archivename" /opt/bitnami

echo "----------------------------------"
echo "Restarting servers"
echo "----------------------------------"
sudo /opt/bitnami/ctlscript.sh start

echo "----------------------------------"
echo "Pushing $archivename to $s3uri"
echo "----------------------------------"
sudo aws s3 cp $archivename $s3uri

echo "----------------------------------"
echo "Deleting $archivename from local"
echo "----------------------------------"
sudo rm $archivename

echo "Done!"
