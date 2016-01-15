# 基于Centos的transmission容器

请使用以下命令使用容器：

```
git clone https://github.com/xiangjl/docker-transmission.git

cd docker-transmission/

docker build -t xiangjl/transmission .

docker run -d --cap-add=NET_ADMIN --name transmission \
-p 80:9091 -p 9091:9091 -p 51413:51413/tcp -p 51413:51413/udp \
-v /data/transmission/:/var/lib/transmission/ -v /data/transmission/downloads:/downloads \
--restart=always \
xiangjl/transmission
```

更多信息请参考：

 * http://www.transmissionbt.com/
