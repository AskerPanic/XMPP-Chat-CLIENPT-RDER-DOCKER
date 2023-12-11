# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 SSH 服务和 Shellinabox
RUN apt-get update && \
    apt-get install -y openssh-server shellinabox && \
    sudo apt install sudo git curl wget htop tree fdisk neofetch screen zsh htop atop vim openssh-server rsync zip unzip grep sed ncdu tar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:root' | chpasswd

# 暴露 22 和 4200 端口
EXPOSE 22
EXPOSE 4200

# 启动 SSH 服务和 Shellinabox
CMD ["/usr/sbin/sshd", "-D"]
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
