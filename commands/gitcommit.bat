#! /usr/bin/env bash

cmdname=${0##*/}

helpmsg () {
    echo "Brief:"
    echo "    git add and commit on current branch"
    echo "Usage:"
    echo "    $cmdname [comment]"
    echo "Try again"
    echo ""
}

makesure() {
    read yes
    confirm=0
    if [[ $yes == "yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Yes" ]]; then
        confirm=1
    fi
    if [[ $yes == "Y" ]]; then
        confirm=1
    fi
    if [[ $yes == "y" ]]; then
        confirm=1
    fi
    if [[ $confirm -eq 0 || "$confirm" == "0" ]]; then
        echo "error: user not confirm"
        exit 1
    fi
}

# error 1: git comment is a must
if [[ $# -lt 1 ]]; then
    helpmsg
    exit 1
fi

comment="$@"

# error 2: not a git repository
if ! git status 1>/dev/null 2>&1; then
    echo "error: git repository not exist"
    helpmsg
    exit 1
fi

branch=$(git status | head -n 1 | awk '{print $3}')
echo "[lin-vim] git commit on branch: '$branch', comment: '$comment', path: '$PWD'"
echo -n "[devim] yes? "
makesure

git add -A .
git commit -m "$comment"