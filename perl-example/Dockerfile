FROM veupathdb/vdi-handler-server:latest

# Install perl and cpan
RUN apk add --no-cache perl perl-utils \
  && mkdir "/opt/veupathdb"

# TODO copy perl scripts into target locations

COPY scripts/import.pl /opt/veupathdb/import
COPY scripts/install-data.pl /opt/veupathdb/install-data
COPY scripts/install-meta.pl /opt/veupathdb/install-meta
COPY scripts/uninstall.pl /opt/veupathdb/uninstall

RUN chmod +x \
  /opt/veupathdb/import \
  /opt/veupathdb/install-meta \
  /opt/veupathdb/install-data \
  /opt/veupathdb/uninstall