#!/bin/bash
#writing a demo local file uploader
# This file uploader should be able to 
#recive passed on files as arguments and send to a local folder

# Set the bucket name and file path
bucket_name="clouduploadertds"
file_path=$1

# Upload the file to S3
function upload() {
    aws s3 cp $file_path s3://$bucket_name/
}


if [ -f $file_path ]; then
    upload
fi

# Check upload status
if [ $? -eq 0 ]; then
  echo "File uploaded successfully!"
else
  echo "Error occurred during upload."
fi

