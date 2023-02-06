#!/usr/bin/env python3

import sys
import vdi

#
# Input Handling
#

if len(sys.argv) < 3:
    vdi.log_message("called with too few arguments, callers must provide a VDI dataset ID and an input directory")
    sys.exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)

VDI_ID = sys.argv[1]
INPUT_DIR = sys.argv[2]

vdi.verify_dir(INPUT_DIR)

DB_HOST = vdi.require_env("DB_HOST")
DB_PORT = vdi.require_env("DB_PORT")
DB_NAME = vdi.require_env("DB_NAME")
DB_USER = vdi.require_env("DB_USER")
DB_PASS = vdi.require_env("DB_PASS")

#
# Script Body
#

# TODO: call some commands and do the things needed to install a dataset
