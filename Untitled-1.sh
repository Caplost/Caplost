#!/bin/bash

# 定义要遍历的目录数组
directories=(
    "appStore"
    "appStoreApi"
    "ceph"
    "go-paas-front"
    "ingress"
    "middleware"
    "middlewareApi"
    "pod"
    "podApi"
    "prometheus"
    "route"
    "routeApi"
    "svc"
    "svcApi"
    "volume"
    "volumeApi"
)

# 遍历目录
for dir in "${directories[@]}"; do
    # 检查目录是否存在
    if [ -d "$dir" ]; then
        echo "Entering $dir"
        cd "$dir" || exit

        # 在这里执行你的操作，比如一个命令或一系列命令
        # 例如: ls 或者你想执行的任何命令
            rm -rf ./idea
	git add .
	git commit -m "init"
	git remote remove origin
	git remote add origin git@github.com:Caplost/$dir.git
	echo "git@github.com:Caplost/$dir.git"
	git branch -M main
	git push -u origin main

        # 返回到原始目录
        cd ..
    else
        echo "Directory $dir not found."
    fi
done
