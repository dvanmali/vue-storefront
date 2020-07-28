FROM node:10-alpine

ENV VS_ENV dev

WORKDIR /var/www

COPY  package.json    \
  yarn.lock           \
  babel.config.js     \
  ecosystem.json      \
  .eslintignore       \
  .eslintrc.js        \
  lerna.json          \
  tsconfig.json       \
  tsconfig-build.json \
  shims.d.ts          \
  ./


RUN apk add --no-cache --virtual .build-deps ca-certificates wget python make g++ \
  && apk add --no-cache git \
  && yarn install --no-cache \
  && apk del .build-deps

COPY config/ /var/www/config/
COPY core/ /var/www/core/
COPY src/ /var/www/src/
COPY packages/ /var/www/packages/

COPY docker/vue-storefront/vue-storefront.sh /usr/local/bin/

CMD ["vue-storefront.sh"]