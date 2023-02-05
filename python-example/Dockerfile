FROM veupathdb/vdi-handler-server:latest

RUN apk add --no-cache python3; mkdir "/opt/veupathdb"

COPY scripts/import.py /opt/veupathdb/import
COPY scripts/install-meta.py /opt/veupathdb/install-meta
COPY scripts/install-data.py /opt/veupathdb/install-data
COPY scripts/uninstall.py /opt/veupathdb/uninstall

RUN chmod +x \
  /opt/veupathdb/import \
  /opt/veupathdb/install-meta \
  /opt/veupathdb/install-data \
  /opt/veupathdb/uninstall