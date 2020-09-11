FROM alpine

ENV CONFIG=https://gist.githubusercontent.com/loop963/07ec76d557be9736ce46812b0b2e23e5/raw/7ece1347569cc11853950371a7744770e7dc287f/config.json

RUN apk update && apk --no-cache add ca-certificates unzip && \
    wget -c https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && rm -f v2ray-linux-64.zip && \
    chmod 700 v2ray v2ctl
    
CMD ./v2ray -config $CONFIG
