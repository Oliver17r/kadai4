#!/bin/bash

test_saidaikoyakusu(){
 local expected=$1
 shift
 local output=$(./saidaiKoyakusu.sh "$@")
 if [[ $output =~ $expected ]]; then
  echo "テストに成功しました $@"
 else
  echo "テストに失敗しました $@ 正解:　$expected,出力: $output"
  exit 1
 fi
}

test_saidaikoyakusu "2" 2 4
! ./saidaiKoyakusu.sh 2 && echo "引数１つのテストに成功"
! ./saidaiKoyakusu.sh 2 3 4 && echo "引数が3つ以上のテストに成功"
! ./saidaiKoyakusu.sh "a" "b" && echo "引数が文字のテストに成功"
! ./saidaiKoyakusu.sh 1.5 4.5 && echo "引数が小数のテストに成功" 
! ./saidaiKoyakusu.sh -2 -4 && echo "引数が負のテストに成功"
