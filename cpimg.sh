#!/bin/sh
SDIR=./rockdev
TDIR=~/tftp/lynx

# 대상 디렉토리가 없으면 생성
mkdir -p $TDIR

# rockdev의 각 파일을 순회
for file in $SDIR/*; do
	# 파일명만 추출
	filename=$(basename "$file")

	# 대상 파일 경로
	target="$TDIR/$filename"

	# 대상 파일이 없거나, md5sum이 다른 경우에만 복사
	if [ ! -f "$target" ] || ! cmp -s "$file" "$target"; then
		echo "Copying: $filename"
		\cp -avL "$file" "$target"
	else
		echo "Skipped: $filename (unchanged)"
	fi
done

