FROM veupathdb/vdi-handler-server:latest

# Install perl and cpan
RUN apk add --no-cache perl perl-utils

WORKSPACE /opt/veupathdb

COPY scripts/VDI.pm VDI.pm
COPY scripts/import.pl import
COPY scripts/install-data.pl install-data
COPY scripts/install-meta.pl install-meta
COPY scripts/uninstall.pl uninstall

RUN chmod +x \
  /opt/veupathdb/import \
  /opt/veupathdb/install-meta \
  /opt/veupathdb/install-data \
  /opt/veupathdb/uninstall