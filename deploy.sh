#!/bin/bash
# 실패한 명령이 있을 경우 바로 스크립트 종료
set -e

# 빌드 명령 실행
npm run build

# 현재 디렉토리의 모든 파일 삭제 (깃, 배포 폴더, 노드 모듈 제외)
find . ! -path './dist/*' ! -path './.git/*' ! -path './node_modules/*' -delete

# dist폴더 아래에 있는 파일들을 현재 위치로 옮기기
rsync -a dist/ .

# dist 폴더 삭제
rm -r dist
