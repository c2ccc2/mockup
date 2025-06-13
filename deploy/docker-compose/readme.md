## 0. 准备工作

请自行安装 docker docker compose
docker 版本要求 18 或以上

## 1. 拷贝文件

将 compose 拷贝到服务器上，并进入

## 2. 配置和启动

配置权限和启动

```
chmod +x app/wait-for-it.sh
```

启动服务

```
docker compose up -d
```

## 3. 开始使用

```


 访问
 http://IP:80

 默认管理员
 admin
 12345678

```

## 3. 停止和删除

如需要停止服务

```
docker compose stop
```

如需要删除服务

```
docker compose down
```
