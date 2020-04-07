#!/bin/bash
set -x
function rand() {
    min=$1
    max=$(($2-$min+1))
    num=$(date +%s)
    echo $(($num%$max+$min))
}

defaultCommit=(
"here's no commit desc, because the author was so lazy"
"hi"
"what time?"
"two monkey on the tree~~~ coding bugs every day~~ so happy so happy~~"
)
defaultCommitLen=${#defaultCommit[@]}

# Input
commitVal=${1:-""}

if [ -z $commitVal ]; then
    randIndex=`rand 1 ${defaultCommitLen}`
    commitVal=${defaultCommit[$randIndex]} # `date +"%Y/%m/%d %H:%M:%S"`
fi

git status
git add -A
git commit -m "$commitVal"
git push origin master
#git push
