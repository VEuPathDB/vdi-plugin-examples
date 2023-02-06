#!/usr/bin/env python3
import sys

import vdi

#
# Input Handling
#

if len(sys.argv) < 2:
    vdi.log_message("called with too few arguments, callers must provide a VDI dataset ID")
    sys.exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)

VDI_ID = sys.argv[1]

vdi.verify_vdi_id(VDI_ID)

DB_HOST = vdi.require_env("DB_HOST")
DB_PORT = vdi.require_env("DB_PORT")
DB_NAME = vdi.require_env("DB_NAME")
DB_USER = vdi.require_env("DB_USER")
DB_PASS = vdi.require_env("DB_PASS")

#
# Script Body
#

# TODO: uninstall the dataset!
