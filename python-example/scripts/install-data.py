#!/usr/bin/env python3
import os
import sys


#
# Utilities
#


def log_message(*args):
    print(*args, file=sys.stderr)


def verify_dir(path):
    if path == "" or path is None:
        log_message("required directory parameter was blank or absent")
        sys.exit(1)

    if not os.path.isdir(path):
        log_message(f"directory {path} does not exist or is not a directory")
        sys.exit(1)


def require_env(name):
    out = os.getenv(name)
    if out == "" or out is None:
        log_message(f"required environment variable {name} is blank or unset")
        sys.exit(1)
    return out


#
# Input Handling
#

if len(sys.argv) < 2:
    log_message("called with too few arguments, callers must provide an input directory")
    sys.exit(1)

INPUT_DIR = sys.argv[1]

verify_dir(INPUT_DIR)

DB_HOST = require_env("DB_HOST")
DB_PORT = require_env("DB_PORT")
DB_NAME = require_env("DB_NAME")
DB_USER = require_env("DB_USER")
DB_PASS = require_env("DB_PASS")

#
# Script Body
#

# TODO: call some commands and do the things needed to install a dataset
