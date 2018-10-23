FROM centos:7.5.1804

ADD shadowtunnel-run.sh /root/

RUN \
    echo "Asia/shanghai" > /etc/timezone && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo GOPROXY_VERSION=$(curl --silent "https://api.github.com/repos/snail007/goproxy/releases/latest" | grep tag_name | awk -F '"' '{print $4}') > /root/file && \
    echo SHADOW_VERSION=$(curl --silent "https://api.github.com/repos/snail007/shadowtunnel/releases/latest" | grep tag_name | awk -F '"' '{print $4}') >> /root/file && \
    source /root/file && \
    curl -OSL https://github.com/snail007/goproxy/releases/download/${GOPROXY_VERSION}/proxy-linux-amd64.tar.gz && \
    #curl -OSL https://github.com/snail007/goproxy/releases/download/v5.4/proxy-linux-amd64.tar.gz && \
    curl -OSL https://github.com/snail007/shadowtunnel/releases/download/${SHADOW_VERSION}/shadowtunnel-linux-amd64.tar.gz && \
    tar -C /usr/bin -xf proxy-linux-amd64.tar.gz && \
    tar -C /usr/bin -xf shadowtunnel-linux-amd64.tar.gz && \
    rm -f proxy-linux-amd64.tar.gz shadowtunnel-linux-amd64.tar.gz && \
    chmod +x /root/shadowtunnel-run.sh

CMD ["sh", "-c", "/root/shadowtunnel-run.sh"]
