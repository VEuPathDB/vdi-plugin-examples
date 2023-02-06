FROM veupathdb/vdi-handler-server:latest

RUN apk add --no-cache python3

WORKSPACE /opt/veupathdb

COPY scripts/vdi.py vdi.py
COPY scripts/import.py import
COPY scripts/install-meta.py install-meta
COPY scripts/install-data.py install-data
COPY scripts/uninstall.py uninstall

RUN chmod +x \
  /opt/veupathdb/import \
  /opt/veupathdb/install-meta \
  /opt/veupathdb/install-data \
  /opt/veupathdb/uninstall