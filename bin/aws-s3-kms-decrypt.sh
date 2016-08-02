#!/bin/sh

# fail fast
set -e

CMD=`basename $0`
TMPFILE=`mktemp /tmp/${CMD}.XXXXXX` || exit 1

echo "Copying from S3 $1 to ${TMPFILE}"
aws s3 cp $1 ${TMPFILE}

echo "Decrypting ${TMPFILE} to $2"
base64 --decode ${TMPFILE} > ${TMPFILE}.plain
aws kms decrypt --ciphertext-blob fileb://${TMPFILE}.plain --query Plaintext --output text | base64 --decode > $2
