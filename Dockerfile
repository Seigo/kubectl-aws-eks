FROM amazon/aws-cli

#https://dl.k8s.io/v1.19.0/kubernetes-client-linux-amd64.tar.gz
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/1.19.0/bin/linux/amd64/kubectl && \
    curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x /usr/local/bin/aws-iam-authenticator && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/bin/kubectl 

RUN kubectl version --client
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
