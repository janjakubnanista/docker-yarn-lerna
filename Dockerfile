FROM node:12.13-alpine

## Install basic stuff (java needed for the OpenAPI generator)
RUN apk add --update -q --no-cache \
  bash \
  git \
  jq \
  openjdk8-jre

## Install global lerna
RUN yarn global add lerna

RUN echo -e "" \
  "git version:     $(git --version) \n" \
  "java version:    $(java -version 2>&1) \n" \
  "node version:    $(node -v) \n" \
  "npm version:     $(npm -v) \n" \
  "yarn version:    $(yarn -v) \n" \
  "lerna version:   $(lerna -v) \n"

# Create empty project directory
RUN mkdir -p /usr/src/project
WORKDIR /usr/src/project