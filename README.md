# bitnami-aws-backup-restore
> Scripts for backuping and restoring Bitnami instances on AWS S3.

## Requirement
- [IAM user with Put and Get acces rights on S3](http://blogs.aws.amazon.com/security/post/Tx3VRSWZ6B3SHAV/Writing-IAM-Policies-How-to-grant-access-to-an-Amazon-S3-bucket)
- [AWS command-line client installed and configured](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)

## Usage
### Backup
```./backup.sh s3://bucket/folder```
### Restore
```./restore.sh archive-name s3://bucket/folder```
