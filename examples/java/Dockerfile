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

RUN ./gradlew test shadowJar

FROM veupathdb/vdi-handler-server:latest

RUN apk add --no-cache openjdk17; \
  mkdir /opt/veupathdb

COPY scripts/import/import.sh /opt/veupathdb/import
COPY scripts/install-data/install-data.sh /opt/veupathdb/install-data
COPY scripts/install-meta/install-meta.sh /opt/veupathdb/install-meta
COPY scripts/uninstall/uninstall.sh /opt/veupathdb/uninstall

COPY --from=build /project/scripts/import/build/libs/import.jar /opt/veupathdb/import.jar
COPY --from=build /project/scripts/install-data/build/libs/install-data.jar /opt/veupathdb/install-data.jar
COPY --from=build /project/scripts/install-meta/build/libs/install-meta.jar /opt/veupathdb/install-meta.jar
COPY --from=build /project/scripts/uninstall/build/libs/uninstall.jar /opt/veupathdb/uninstall.jar

RUN chmod +x \
  /opt/veupathdb/import \
  /opt/veupathdb/install-meta \
  /opt/veupathdb/install-data \
  /opt/veupathdb/uninstall