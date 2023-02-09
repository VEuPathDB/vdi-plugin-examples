FROM golang:1.20-alpine3.16 AS build

WORKDIR /project

COPY scripts ./

RUN \
  env CGO_ENABLED=0 GOOS=linux go build -o import bin/import.go; \
  env CGO_ENABLED=0 GOOS=linux go build -o install-data bin/install-data.go; \
  env CGO_ENABLED=0 GOOS=linux go build -o install-meta bin/install-meta.go; \
  env CGO_ENABLED=0 GOOS=linux go build -o uninstall bin/uninstall.go;

FROM veupathdb/vdi-handler-server:latest

RUN mkdir /opt/veupathdb

COPY --from=build [ \
  "/project/import", \
  "/project/install-data", \
  "/project/install-meta", \
  "/project/uninstall", \
  "/opt/veupathdb/" \
]
