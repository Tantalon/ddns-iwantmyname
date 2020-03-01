FROM alpine:latest
RUN apk add --no-cache curl bind-tools
COPY ./ddns-iwantmyname.sh /usr/local/bin/
CMD /usr/local/bin/ddns-iwantmyname.sh
