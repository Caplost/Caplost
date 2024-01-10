#!/bin/bash

# 你的 GitHub 用户名
GITHUB_USERNAME="Caplost"

# 你的 GitHub 访问令牌
GITHUB_TOKEN="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"

# 目录列表，作为仓库名称
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

# 输出开始信息
echo "Starting to create GitHub repositories..."

# 遍历目录名称列表并为每个名称创建 GitHub 仓库
for dir in "${directories[@]}"; do
    echo "Creating repository: $dir"

    # 使用 GitHub API 创建仓库
    response=$(curl -s -X POST -H "Authorization: token $GITHUB_TOKEN" \
         -d "{\"name\": \"$dir\"}" \
         "https://api.github.com/user/repos")

    # 检查仓库是否创建成功
    if [[ "$response" == *"created_at"* ]]; then
        echo "Repository $dir created successfully."
    else
        echo "Failed to create repository $dir."
    fi
done

# 输出结束信息
echo "Repository creation process completed."