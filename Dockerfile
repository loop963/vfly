FROM alpine

ENV CONFIG=https://gist.githubusercontent.com/loop963/07ec76d557be9736ce46812b0b2e23e5/raw/978a78900fc5f9b2710cb2da0ed2adaa8448d76f/config.json

RUN apk update && apk --no-cache add ca-certificates unzip && \
    wget -c https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && rm -f v2ray-linux-64.zip && \
    chmod 700 v2ray v2ctl
    
CMD ./v2ray -config $CONFIG
