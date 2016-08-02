# docker-node-0.12-awscli

Docker image with node 0.12, aws cli and some helper scripts. Useful as a bitbucket pipes image to build node 0.12 codebases with some secrets stored on AWS S3.

## Containers

Following ENV needs to be set when creating container:

* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_DEFAULT_REGION

## Tools

Download and decrypt KMS encrypted file from S3:

```
bin/aws-s3-kms-decrypt.sh s3://encrypted-secrets/secret-key1 ./secret-key-1
```

## Testing image locally

Build the image
```
docker build -t node-012-awscli:latest .
```

To run the image first create env file with required env vars, at least:

```
echo AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID >> container.env
echo AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY >> container.env
echo AWS_DEFAULT_REGION=eu-west-1 >> container.env
```
Assuming AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are set in your current shell.

Put more vars into the **container.env** if needed.

Run the image
```
docker run --env-file=container.env -it --rm node-012-awscli bash
```

## Testing image built by docker hub

Pull the image
```
docker pull evgenymyasishchev/docker-node-0.12-awscli
```

Have env file ready as explained above.

Run the image
```
docker run --env-file=container.env -it --rm  evgenymyasishchev/docker-node-0.12-awscli bash
```
