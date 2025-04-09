#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


#fonts color
Green="\033[32m" 
Red="\033[31m" 
Yellow="\033[33m"
GreenBG="\033[42;37m"
RedBG="\033[41;37m"
Font="\033[0m"
 
#notification information
Info="${Green}[信息]${Font}"
OK="${Green}[OK]${Font}"
Error="${Red}[错误]${Font}"

#版本
nginx_dir="/etc/nginx"
nginx_openssl_src="/usr/local/src"
nginx_systemd_file="/etc/systemd/system/nginx.service"

#openssl_version="3.5.0-alpha1"
#--with-cc-opt="-Wno-error"   \

nginx_version="1.27.4"
openssl_version="3.5.0"
pcre2_version="10.45"

#libunwind_version="1.5.0"
#google_perftools_version="2.9.1"
#jemalloc_version="5.2.1"


mvgp() {

    systemctl stop nginx

    if [[ -d /etc/nginx/conf/conf.d ]]; then
          rm -rf /mvgpop && cd / && mkdir mvgpop
          mv /etc/nginx/conf/nginx.conf /mvgpop
          mv /etc/nginx/conf/conf.d /mvgpop
    fi

}
mvgpasd() {

    if [[ -d /mvgpop ]]; then
        rm -rf /etc/nginx/conf/nginx.conf

        mv /mvgpop/nginx.conf /etc/nginx/conf

        mv /mvgpop/conf.d /etc/nginx/conf

        rm -rf /mvgpop
    fi

    if [[ -d /etc/nginx/conf/conf.d ]]; then
    chown -R www:www /etc/nginx
    chown root:www /etc/nginx/sbin/nginx

    systemctl daemon-reload && systemctl restart nginx.service
    judge "nginx 启动 1"

    chown -R www:www /etc/nginx
    chown root:www /etc/nginx/sbin/nginx

    systemctl daemon-reload && systemctl restart nginx.service
    judge "nginx 启动 2"

    systemctl enable nginx.service

    systemctl status nginx.service -l

    fi

}

nginx_install() {

    [[ -d /usr/local/src ]] && rm -rf /usr/local/src

    wget -nc --no-check-certificate https://nginx.org/download/nginx-${nginx_version}.tar.gz -P ${nginx_openssl_src}
    judge "Nginx 下载"
    wget -nc --no-check-certificate https://www.openssl.org/source/openssl-${openssl_version}.tar.gz -P ${nginx_openssl_src}
    judge "openssl 下载"

    wget -nc --no-check-certificate https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${pcre2_version}/pcre2-${pcre2_version}.tar.gz -P ${nginx_openssl_src}
    judge "PCRE2 下载"

    #wget -nc --no-check-certificate https://download.savannah.gnu.org/releases/libunwind/libunwind-${libunwind_version}.tar.gz -P ${nginx_openssl_src}
    #judge "libunwind 下载"

    #wget -nc --no-check-certificate https://github.com/gperftools/gperftools/releases/download/gperftools-${google_perftools_version}/gperftools-${google_perftools_version}.tar.gz -P ${nginx_openssl_src}

  #wget -nc --no-check-certificate https://github.com/gperftools/gperftools/releases/download/gperftools-2.9/gperftools-2.9.0.tar.gz -P /usr/local/src

    #judge "google-perftools 下载"


    #wget -nc --no-check-certificate https://github.com/jemalloc/jemalloc/releases/download/${jemalloc_version}/jemalloc-${jemalloc_version}.tar.bz2 -P ${nginx_openssl_src}
    #judge "jemalloc 下载"

    cd ${nginx_openssl_src}

    [[ -d jemalloc ]] && rm -rf jemalloc
    git clone "https://github.com/jemalloc/jemalloc.git"

    [[ -d nginx-"$nginx_version" ]] && rm -rf nginx-"$nginx_version"
    tar -zxvf nginx-"$nginx_version".tar.gz

    [[ -d openssl-"$openssl_version" ]] && rm -rf openssl-"$openssl_version"
    tar -zxvf openssl-"$openssl_version".tar.gz

    [[ -d pcre2-"$pcre2_version" ]] && rm -rf pcre2-"$pcre2_version"
    tar -zxvf pcre2-"$pcre2_version".tar.gz

    #[[ -d libunwind-"${libunwind_version}" ]] && rm -rf libunwind-"${libunwind_version}"
    #tar -zxvf libunwind-"${libunwind_version}".tar.gz

    #[[ -d gperftools-"${google_perftools_version}" ]] && rm -rf gperftools-"${google_perftools_version}"
    #tar -zxvf gperftools-"${google_perftools_version}".tar.gz

    #[[ -d jemalloc-"${jemalloc_version}" ]] && rm -rf jemalloc-"${jemalloc_version}"
    #tar -xvf jemalloc-"${jemalloc_version}".tar.bz2

    [[ -d "$nginx_dir" ]] && rm -rf "${nginx_dir}"

    echo -e "${OK} ${GreenBG} 即将开始编译安装 jemalloc ${Font}"
    sleep 2


    #cd libunwind-${libunwind_version}
    #CFLAGS=-fPIC ./configure
    #judge "libunwind 编译检查"
    #sleep 4
    #make CFLAGS=-fPIC
    #make CFLAGS=-fPIC install
    #judge "libunwind 编译安装"

    #cd ../gperftools-${google_perftools_version}
    #./configure
    #judge "gperftools 编译检查"
    #sleep 4
    #make && make install
    #judge "gperftools 编译安装"
    #echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local_lib.conf
    #ldconfig

    #cd ../pcre-${pcre_version}
    #./configure
    #judge "pcre 编译检查"
    #sleep 4
    #make && make install
    #judge "pcre 编译安装"

    #cd ../jemalloc-${jemalloc_version} || exit
    #./configure
    #judge "jemalloc 编译检查"
    #make && make install
    #judge "jemalloc 编译安装"
    #echo '/usr/local/lib' >/etc/ld.so.conf.d/local.conf
    #ldconfig

    cd jemalloc
    rm -rf .git
    ./autogen.sh
    judge "jemalloc 编译检查"
    sleep 3
    make && make install
    judge "jemalloc 编译安装"
    sleep 3
    echo '/usr/local/lib' >/etc/ld.so.conf.d/local.conf
    ldconfig


    echo -e "${OK} ${GreenBG} 即将开始编译安装 Nginx, 过程稍久，请耐心等待 ${Font}"
    sleep 4

    cd ../nginx-${nginx_version}

    ./configure --prefix="${nginx_dir}"                         \
        --with-http_ssl_module                                  \
        --with-http_sub_module                                  \
        --with-http_gzip_static_module                          \
        --with-http_stub_status_module                          \
        --with-http_realip_module                               \
        --with-http_flv_module                                  \
        --with-http_mp4_module                                  \
        --with-http_secure_link_module                          \
        --with-http_v2_module                                   \
        --without-http_limit_conn_module                        \
        --without-http_limit_req_module                         \
        --with-http_image_filter_module                         \
        --with-http_v3_module                           \
        --with-cc-opt='-O3'                                     \
        --with-ld-opt="-ljemalloc"                              \
        --with-pcre=../pcre2-"$pcre2_version"                   \
        --with-openssl=../openssl-"$openssl_version"


    judge "编译检查"
    sleep 3
    make && make install
    judge "Nginx 编译安装"

        #--with-pcre2       \
        #--with-pcre=../pcre2-"${pcre2_version}"
    #[[ -d /tmp/tcmalloc ]] && rm -rf /tmp/tcmalloc
    #mkdir /tmp/tcmalloc
    #chmod 777 /tmp/tcmalloc

    #--with-google_perftools_module      \

    #启用TCMalloc（可选）
    #创建一个线程目录，将文件放在/tmp/tcmalloc下面
    #mkdir /tmp/tcmalloc
    #chmod 777 /tmp/tcmalloc
    #修改nginx.conf配置文件，在pid这行下面添加配置如下信息：
    #google_perftools_profiles /tmp/tcmalloc;
    #然后使用 nginx -s reload 重新加载nginx，使用 lsof -n | grep tcmalloc 查看是否存在tcmalloc进程，如果存在的话就说明加载成功了。



    echo 'PATH=$PATH:/etc/nginx/sbin' | sudo tee -a /etc/profile
    echo 'export PATH' | sudo tee -a /etc/profile && source /etc/profile


    # 删除临时文件
    rm -rf ../pcre2-"${pcre2_version}"
    #rm -rf ../libunwind-"${libunwind_version}"
    #rm -rf ../gperftools-"${google_perftools_version}"
    rm -rf ../nginx-"${nginx_version}"
    rm -rf ../openssl-"${openssl_version}"
    rm -rf ../nginx-"${nginx_version}".tar.gz
    rm -rf ../openssl-"${openssl_version}".tar.gz
    rm -rf ../pcre2-"${pcre2_version}".tar.gz
    #rm -rf ../libunwind-"${libunwind_version}".tar.gz
    #rm -rf ../gperftools-"${google_perftools_version}".tar.gz


    # 添加配置文件夹，适配旧版脚本
    #mkdir ${nginx_dir}/conf/conf.d
}

chrony_install() {
#    ${INS} -y install chrony
#    judge "安装 chrony 时间同步服务 "

    timedatectl set-ntp true

#    if [[ "${ID}" == "centos" ]]; then
#        systemctl enable chronyd && systemctl restart chronyd
#    else
        systemctl enable chrony && systemctl restart chrony
#    fi

    judge "chronyd 启动 "

    timedatectl set-timezone Asia/Shanghai

    echo -e "${OK} ${GreenBG} 等待时间同步 ${Font}"
    sleep 10

    chronyc sourcestats -v
    chronyc tracking -v
    date
    read -rp "请确认时间是否准确,误差范围±3分钟(Y/N): " chrony_install
    [[ -z ${chrony_install} ]] && chrony_install="Y"
    case $chrony_install in
    [yY][eE][sS] | [yY])
        echo -e "${GreenBG} 继续安装 ${Font}"
        sleep 2
        ;;
    *)
        echo -e "${RedBG} 安装终止 ${Font}"
        exit 2
        ;;
    esac
}

nginx_systemd() {

    rm -rf /etc/systemd/system/nginx.service
    rm -rf /etc/systemd/system/nginx.service.d/override.conf

    cat >$nginx_systemd_file <<EOF
[Unit]
Description=The NGINX HTTP and reverse proxy server
After=syslog.target network-online.target remote-fs.target nss-lookup.target
Wants=network-online.target
[Service]
Type=forking
PIDFile=/etc/nginx/logs/nginx.pid
ExecStartPre=/etc/nginx/sbin/nginx -t
ExecStart=/etc/nginx/sbin/nginx -c ${nginx_dir}/conf/nginx.conf
ExecReload=/etc/nginx/sbin/nginx -s reload
ExecStop=/etc/nginx/sbin/nginx -s stop
#CPUQuota=45%
# 官网示例如下，但个人使用的为上面两种，尚分不清好坏
# ExecReload=/bin/kill -s HUP $MAINPID
# ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true
[Install]
WantedBy=multi-user.target
EOF


mkdir -p /etc/systemd/system/nginx.service.d

cat >/etc/systemd/system/nginx.service.d/override.conf <<EOF
[Service]
ExecStartPost=/bin/sleep 0.6

EOF


    judge "Nginx systemd ServerFile 添加"
    systemctl daemon-reload
}

judge() {
    if [[ 0 -eq $? ]]; then
        echo -e "${OK} ${GreenBG} $1 完成 ${Font}"
        sleep 1
    else
        echo -e "${Error} ${RedBG} $1 失败${Font}"
        exit 1
    fi
}


asdwcza() {

chrony_install
mvgp
nginx_install
nginx_systemd
mvgpasd

}

judge
asdwcza

