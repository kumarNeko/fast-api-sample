#!/bin/ash
cd "$(dirname $0)" || exit

cd /var/pipenv-lock-create
#lockを作成するには、まずは既存のlockを消さなければならない。
FILE="Pipfile.lock"
if test -e $FILE ;then
  rm -rf Pipfile.lock
fi

pipenv lock