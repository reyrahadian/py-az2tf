#escape=`
FROM microsoft/azure-cli
RUN apk add --update python2 python2-dev
RUN python2.7 -m ensurepip
RUN python2.7 -m pip install requests adal
RUN wget -qO- https://releases.hashicorp.com/terraform/0.12.4/terraform_0.12.4_linux_amd64.zip | busybox unzip - ; chmod +x terraform ; mv terraform /usr/bin

WORKDIR /opt/az2tf

ADD . .

LABEL "org.label-schema.description"="Tool to generate Terraform configuration files from an existing Azure Resources" `
    "org.label-schema.docker.cmd"="docker run -v ${HOME}/generated:/opt/ -it akqahub.azurecr.io/py-az2tf:linux" `
    "org.label-schema.license"="MIT" `
    "org.label-schema.name"="py-az2tf" `
    "org.label-schema.url"="https://github.com/reyrahadian/py-az2tf" `
    "org.label-schema.usage"="https://github.com/reyrahadian/py-az2tf/blob/master/README.md" `
    "org.label-schema.vcs-url"="https://github.com/reyrahadian/py-az2tf.git" `
    "org.label-schema.version"="1"