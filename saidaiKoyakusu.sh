#!/bin/bash

# 引数チェック
if [ $# -ne 2 ]; then
  echo "使用方法: $0 数字1 数字2"
  exit 1
fi

# 引数が自然数かチェック
if ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]; then
  echo "二つの引数を自然数にしてください。"
  exit 1
fi

# 最大公約数の計算
saidaikoyakusu() {
  local num1=$1
  local num2=$2
  while [ $num2 -ne 0 ]; do
    local temp=$num2
    num2=$((num1 % num2))
    num1=$temp
  done
  echo $num1
}

result=$(saidaikoyakusu $1 $2)
echo "$1 と $2 の最大公約数は $result です"

