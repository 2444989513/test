#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH


go_version="1.14.7"
#go_version="1.15"



apt-get_install() {

sudo apt-get update -y && sudo apt-get upgrade -y 

sudo apt-get install g++ unzip zip gnupg curl wget git -y

}



go_install() {

wget -nc --no-check-certificate https://dl.google.com/go/go${go_version}.linux-amd64.tar.gz

tar zxvf go${go_version}.linux-amd64.tar.gz

sudo mv go /usr/local/


echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
echo 'export GOROOT=/usr/local/go' >> ~/.profile
echo 'export GOPATH=~/go' >> ~/.profile && source ~/.profile && echo $GOPATH



go version


}



bazel_install() {


curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -

echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

sudo apt update && sudo apt install bazel -y

sudo apt update && sudo apt full-upgrade -y

sudo apt install openjdk-11-jdk -y

bazel version


}

v2ray() {

#go get -u -insecure v2ray.com/core/...
#go get -u -insecure v2ray.com/ext/...
#go install v2ray.com/ext/tools/build/vbuild

mkdir ./go

mkdir ./go/src

mkdir ./go/src/v2ray.com

cd ~

#wget https://github.com/2444989513/v2ray-core/archive/master.zip

#unzip master.zip

git clone https://github.com/2444989513/v2ray-core.git

cp -r /root/v2ray-core /root/go/src/v2ray.com/core

go get -v -t -d ./go/src/v2ray.com/core/...


# Build all installation packages
cd $GOPATH/src/v2ray.com/core

bazel build --action_env=GOPATH=$GOPATH --action_env=PATH=$PATH --action_env=GPG_PASS=${SIGN_KEY_PASS} --action_env=SPWD=$PWD --action_env=GOCACHE=$(go env GOCACHE) --spawn_strategy local //release:all

ls /root/.cache/bazel/_bazel_root/5571c66d5bb940674a99e2337ba11798/execroot/v2ray_core/bazel-out/k8-fastbuild/bin/release

}

aso() {

apt-get_install

go_install

bazel_install

v2ray

}


aso


