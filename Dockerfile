FROM node:18

WORKDIR /src

COPY . /src

RUN npm install && \
    npm run bootstrap && \
    npm run build-all

FROM summerwind/actions-runner:ubuntu-20.04

COPY --from=0 /src/packages/k8s/dist/index.js /runnertmp/k8s/index.js
