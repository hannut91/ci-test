#!/bin/bash

# 실패한 명령이 있을 경우 바로 스크립트 종료
set -e

# 현재 브랜치를 변수에 저장
current_branch=$(git branch --show-current)

# 빌드 명령 실행
npm run build

# 배포할 브랜치로 변경
git switch gh-pages

# 현재 디렉토리의 모든 파일 삭제 (깃, 배포 폴더, 노드 모듈 제외)
find . ! -path './dist/*' ! -path './.git/*' ! -path './node_modules/*' -delete

# dist폴더 아래에 있는 파일들을 현재 위치로 옮기기
rsync -a dist/ .

# dist 폴더 삭제
rm -r dist

# 모든 파일 스테이징 (노드 모듈 제외)
git add . ':!node_modules'

# 커밋 생성
git commit -m "Deploy to GitHub Pages"

# 원격 저장소에 브랜치 푸시
git push origin gh-pages

# 이전 브랜치로 돌아가기
git switch $current_branch
