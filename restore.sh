#/bin/bash

if [ $# -ne 2 ]
then
  echo "Expected syntax is: restore.sh archivename s3://bucket/folder"
  exit 1
fi

archivename="$1.tar.gz"
uri="$2/$archivename"

echo $archivename

echo "----------------------------------"
echo "Stopping servers"
echo "----------------------------------"
sudo /opt/bitnami/ctlscript.sh stop

echo "----------------------------------"
echo "Downloading archive from S3"
echo "----------------------------------"
sudo aws s3 cp $uri . 

echo "----------------------------------"
echo "Moving /opt/bitnami to /opt/bitnami.backup"
echo "----------------------------------"
sudo mv /opt/bitnami /opt/bitnami.backup

echo "----------------------------------"
echo "Restoring backup"
echo "----------------------------------"
sudo tar -pxzvf $archivename -C /

echo "----------------------------------"
echo "Restarting servers"
echo "----------------------------------"
sudo /opt/bitnami/ctlscript.sh start

echo "Done!"
