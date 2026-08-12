#!/bin/bash
set -euo pipefail

usage() {
  echo "Usage: $0 input_video_file start_time"
  echo "Example: $0 \"myvideo.mp4\" 00:03:39"
  echo "Example: $0 myvideo.mp4 120"
  exit 1
}

if [ $# -ne 2 ]; then
  usage
fi

input="$1"
start="$2"

if [ ! -f "$input" ]; then
  echo "파일을 찾을 수 없습니다: '$input'"
  exit 1
fi

base="${input%.*}"
ext="${input##*.}"
if [ "$base" = "$input" ]; then
  # 확장자 없음
  tmp="${input}_tmp"
else
  tmp="${base}_tmp.${ext}"
fi

cnt=0
while [ -e "$tmp" ]; do
  cnt=$((cnt + 1))
  if [ "$base" = "$input" ]; then
    tmp="${input}_tmp${cnt}"
  else
    tmp="${base}_tmp${cnt}.${ext}"
  fi
done

mv -- "$input" "$tmp"

echo "임시 파일로 변경됨: '$tmp'"

if ! ffmpeg -ss "$start" -i "$tmp" -c copy -avoid_negative_ts 1 "$input"; then
  echo "ffmpeg 실행 실패. 임시 파일은 '$tmp'에 남아 있습니다."
  exit 1
fi

echo "완료: '$input' 생성됨"
rm -f -- "$tmp"
echo "임시 파일 삭제됨: '$tmp'"

