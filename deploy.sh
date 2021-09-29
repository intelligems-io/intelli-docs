#!/bin/zsh

npm run build
aws s3 cp ./build/ s3://intelli-docs-prod --recursive