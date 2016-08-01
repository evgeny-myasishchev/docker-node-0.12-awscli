FROM node:0.12

RUN apt-get update && apt-get install -y python-pip zip && pip install awscli
RUN mkdir -p /root/.ssh
ADD ssh_config /root/.ssh/config
RUN chmod 0600 /root/.ssh/config
ADD bin/aws-s3-kms-decrypt.sh /bin/aws-s3-kms-decrypt.sh
RUN chmod a+x /bin/aws-s3-kms-decrypt.sh
