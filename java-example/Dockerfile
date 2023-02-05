FROM veupathdb/alpine-dev-base:jdk-17 AS build

WORKDIR /project

COPY gradle gradle/
COPY [ \
  "build.gradle.kts", \
  "gradlew", \
  "settings.gradle.kts", \
  "./" \
]
COPY scripts scripts/

RUN ./gradlew test shadowJar && ls scripts

FROM veupathdb/vdi-handler-server:latest

RUN apk add --no-cache openjdk17

WORKDIR /opt/veupathdb

COPY scripts/import/import.sh import
COPY scripts/install-data/install-data.sh install-data
COPY scripts/install-meta/install-meta.sh install-meta
COPY scripts/uninstall/uninstall.sh uninstall

COPY --from=build /project/scripts/import/build/libs/import.jar import.jar
COPY --from=build /project/scripts/install-data/build/libs/install-data.jar install-data.jar
COPY --from=build /project/scripts/install-meta/build/libs/install-meta.jar install-meta.jar
COPY --from=build /project/scripts/uninstall/build/libs/uninstall.jar uninstall.jar

RUN chmod +x import install-meta install-data uninstall