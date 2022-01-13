FROM golang:alpine as builder

RUN apk update && apk add --no-cache git bash wget curl
WORKDIR /o365
RUN wget https://github.com/vanyouseea/o365/releases/download/v.1.7.2/o365-1.7.2.jar /o365/o365-1.7.2.jar
FROM java:8 
EXPOSE 9527
EXPOSE 8443
ENTRYPOINT ["java","-jar","/o365/o365-1.7.2.jar"]
