# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:frepai' | chpasswd
RUN mkdir /root/.ssh
RUN echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsxMEnLgyw3GVW2phWtjbeFfZZ5cnETUWmf36NvKwUKU3XLF3sOEcFrdpIWb6+UO2cvmrCqrd/Bhhj2ZhfseIXdWo0FcVdfbB8T/KfrHyZ8PcDWJnio8fj4fDjc3PjfxhkgEuNXKdj1W/LvKrB80Qu5Tf3Gd9NcwgeG8gcWOIQ128RmIHX/jINvzshvqIl/xOCKSzTPk0dNHAlJaJrxoIOlHNgxL0iD/aUQxLDTB5+3RQbzv8JgIzK4SJpNT9lhS3ezlNAaUvvpH/LBcuUyjR2AYuRxEWgUSSUOrvU3fuA8d5K73rmYucQtI2X9EPQ8hnaGNw391cRVsxFMmqsb76N Henry@local' >> /root/.ssh/authorized_keys

# 暴露 22 端口
EXPOSE 22
EXPOSE 443

# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
