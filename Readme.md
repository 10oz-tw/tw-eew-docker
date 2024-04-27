# 地牛 Wake Up! (容器化)



ENV|Descriptyion|
---|---
TWEEW_CMD|串接執行Shell Script

Docker Image:
https://hub.docker.com/r/10oz/tweew

```
docker pull 10oz/tweew
```

Files:
* deploy.yml 用於 k8s 的 deployment
* settings.json 地牛 Wake Up! 設定檔


Example:
```
docker run -itd -p 5900:5900 -e TWEEW_CMD="curl https://example.com/?grade=$1&second=$2" 10oz/tweew
```