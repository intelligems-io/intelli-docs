#!/bin/zsh

npm run build
aws s3 cp ./build/ s3://intelli-docs-prod --recursive
aws cloudfront create-invalidation --distribution-id E2X0LOZ4ZM7DZZ --paths "/*"