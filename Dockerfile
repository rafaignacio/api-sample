FROM mcr.microsoft.com/dotnet/core/sdk:2.2 as builder

ARG configuration=Debug

WORKDIR /app
COPY ./src/api-sample . 

RUN dotnet publish -c ${configuration} -o output

FROM microsoft/dotnet:2.2-aspnetcore-runtime-alpine

RUN mkdir -p /var/opt/www /var/opt/certs /opt/apl
COPY --from=builder /app/output /opt/apl

RUN apk update
RUN apk add openrc --no-cache
RUN apk add nginx

RUN rm /etc/nginx/conf.d/default.conf
COPY ./files/api-sample.conf /etc/nginx/conf.d/
COPY ./files/cert.* /var/opt/certs/
COPY ./files/index.html /var/opt/www

RUN mkdir /run/nginx 

#CMD dotnet /opt/apl/api-sample.dll