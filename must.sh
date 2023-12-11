#!/bin/bash

# 启动 SSH 服务
service ssh start

# 启动 Shellinabox
/usr/bin/shellinaboxd -t -s /:LOGIN

# 保持容器运行
tail -f /dev/null
