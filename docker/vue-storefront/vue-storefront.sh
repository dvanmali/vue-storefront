#!/bin/sh
set -e

yarn install || exit $?

if [ "$VS_ENV" = 'dev' ]; then
  # yarn build:client && yarn build:server && yarn build:sw || exit $?
  yarn dev
else
  yarn build || exit $?
  yarn start
fi
