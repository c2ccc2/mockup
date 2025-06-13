# windows 版本使用方法

## 0. 准备工作

请自行按照 mysql 和 redis
mysql 版本要求：5.7
redis 版本要求：3.0 或以上

## 1.创建数据库

在要使用的服务器上 mysql 数据库（8.0）后，创建 mockup 数据库。

数据库名称： pm_prod
字符集：utf8mb4
排序规则：utf8mb4_general_ci

## 2.导入数据库文件

将部署文件下的 inti.sql 文件导入到数据库中。

### 3.配置信息

打开 appsettings.Production.json 文件

修改 ConnectionConfigs 下的 ConnectionString 节点内容，将配置替换成自己的数据库链接信息。

修改 CacheConfig 下的 RedisConfig 节点内容，将配置替换成自己的 redis 信息。

### 3.运行程序

启动 server.exe 即可运行，运行后该窗口不可关闭。

如提示需要按照.net runtime ,请根据提示进行下载安装。

### 访问链接

管理端
http://IP:5000/

默认管理员
admin
12345678
