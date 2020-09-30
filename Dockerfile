FROM land007/n2n:latest

MAINTAINER Jia Yiqiu <yiqiujia@hotmail.com>

ENV GROUP=openwrt \
	KEY=1234567 \
	IP=192.168.11.20 \
	MASK=255.255.255.0 \
	CONNECT=127.0.0.1:30151

EXPOSE 30151/udp 5645/udp

RUN echo "supernode -l 30151 -f -v &" >> /start.sh && \
	echo 'edge -d n2n -c ${GROUP} -k ${KEY} -a ${IP} -l ${CONNECT} -v -f' >> /start.sh

#docker build -t land007/n2n-supernode:latest .
#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/n2n-supernode:latest --push .
#docker rm -f n2n-supernode ; docker run -it --privileged --network host --restart=always -p 30151:30151/udp --log-opt max-size=1m --log-opt max-file=1 -e "IP=192.168.11.110" --name n2n-supernode land007/n2n-supernode:latest
