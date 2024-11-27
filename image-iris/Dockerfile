#IRIS
FROM containers.intersystems.com/intersystems/irishealth-community:2024.2

USER root
RUN apt -y remove temurin-8-jdk*
RUN apt update
RUN apt install -y openjdk-11-jdk
RUN apt install unzip

USER irisowner
WORKDIR /dur
COPY --chown=irisowner:irisowner --chmod=700 ./image-iris/src /dur
COPY --chown=irisowner:irisowner --chmod=700 ./image-iris/src/IGPackages/coreIG/full-ig.zip /dur/FullIG/full-ig.zip
COPY --chown=irisowner:irisowner --chmod=700 ./image-iris/src/IGPackages/coreIG/package.tgz /dur/IGPackages/local/package.tgz
RUN find . -name '.DS_Store' -type f -delete

WORKDIR /dur/IGPackages
RUN ls *.tgz | xargs -n1 tar xzvf
WORKDIR /dur/IGPackages/local
RUN ls *.tgz | xargs -n1 tar xzvf
WORKDIR /dur/FullIG
RUN unzip full-ig.zip && rm full-ig.zip

WORKDIR /dur
RUN iris start $ISC_PACKAGE_INSTANCENAME &&\
    /dur/init/init.sh 

