FROM docker:latest

RUN apk --upgrade add curl --no-cache && \
    curl -L -o /usr/local/bin/clair-scanner https://github.com/arminc/clair-scanner/releases/download/v8/clair-scanner_linux_amd64 && \
    chmod 755 /usr/local/bin/clair-scanner

COPY clair-scan.sh /opt/clair-scan.sh

CMD ["sh", "-c", "/opt/clair-scan.sh $IMG"]
