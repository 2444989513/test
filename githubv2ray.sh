#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


v2rayNG_version="1.4.1"
v2rayN_version="3.23"


gonexcwls() {

cd ~

ssh-keygen -t rsa -C "qq2444989513@gmail.com"
 
 
cat ./.ssh/id_rsa.pub


        read -r -p "请输入：" hhhhcha_OCSP
        case $hhhhcha_OCSP in
            [yY][eE][sS]|[yY])
                cwaicmwi
                ;;
            *)
                ;;
esac



        read -rp "日期（2020.06.23）:" port
        [[ -z ${port} ]] && port="2020.08.15"


        read -rp "v2ray（4.25.0）:" alterID
        [[ -z ${alterID} ]] && alterID="4.27.0"



}


cwaicmwi() {

cd ~

mkdir test && cd test

git clone git@github.com:2444989513/Backup-v2ray


}


scwnicw() {

cd Backup-v2ray

###
#rm -rf go.sh

#wget https://install.direct/go.sh

###


    if [[ -d ./.cache/bazel/_bazel_root/5571c66d5bb940674a99e2337ba11798/execroot/v2ray_core/bazel-out/k8-fastbuild/bin/release ]]; then

       rm -rf v2ray-kernel-1

       mv ./.cache/bazel/_bazel_root/5571c66d5bb940674a99e2337ba11798/execroot/v2ray_core/bazel-out/k8-fastbuild/bin/release ./test/Backup-v2ray/v2ray-kernel-1

       cd v2ray-kernel-1

       rm -rf "<derived root>"

       wget https://github.com/v2ray/v2ray-core/archive/master.zip

       cd ..
    fi



###

rm -rf Backup-v2rayNG

mkdir Backup-v2rayNG && cd Backup-v2rayNG


wget -nc --no-check-certificate https://github.com/2dust/v2rayNG/releases/download/${v2rayNG_version}/v2rayNG_${v2rayNG_version}.apk

wget -nc --no-check-certificate https://github.com/2dust/v2rayNG/releases/download/${v2rayNG_version}/v2rayNG_${v2rayNG_version}_arm64-v8a.apk

wget -nc --no-check-certificate https://github.com/2dust/v2rayNG/releases/download/${v2rayNG_version}/v2rayNG_${v2rayNG_version}_armeabi-v7a.apk

wget -nc --no-check-certificate https://github.com/2dust/v2rayNG/releases/download/${v2rayNG_version}/v2rayNG_${v2rayNG_version}_x86.apk

wget -nc --no-check-certificate https://github.com/2dust/v2rayNG/archive/${v2rayNG_version}.zip

wget -nc --no-check-certificate https://github.com/2dust/v2rayNG/archive/${v2rayNG_version}.tar.gz

cd .. 

####

rm -rf Backup-v2rayN

mkdir Backup-v2rayN && cd Backup-v2rayN


wget -nc --no-check-certificate https://github.com/2dust/v2rayN/releases/download/${v2rayN_version}/v2rayN-Core.zip

wget -nc --no-check-certificate https://github.com/2dust/v2rayN/releases/download/${v2rayN_version}/v2rayN.zip

wget -nc --no-check-certificate https://github.com/2dust/v2rayN/archive/${v2rayN_version}.zip

wget -nc --no-check-certificate https://github.com/2dust/v2rayN/archive/${v2rayN_version}.tar.gz

cd ..


}


ceurerbrkmv() {
        echo -e "完全重建版本库= n "
        read -r -p "请输入：" ceurerbrkmv
        case $ceurerbrkmv in
            [yY][eE][sS]|[yY])
                xwimcwmene
                ;;
            *)
                cnweuncwwivr
                ;;
            esac

}
cnweuncwwivr() {

rm -rf .git

git init

git add .

git commit -m " v2ray-/v "${alterID}"/"${port}" "

git remote add origin https://github.com/2444989513/Backup-v2ray.git

git push -f -u origin master

}
xwimcwmene() {

git add .

git commit -m " v2ray-/v "${alterID}"/"${port}" "

git push -u origin master

}



cvecazx() {

gonexcwls
cwaicmwi
scwnicw
ceurerbrkmv


}

cvecazx

