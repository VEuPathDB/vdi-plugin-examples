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


def verify_env(name, value):
    if value == "" or value is None:
        log_message(f"required environment variable {name} is blank or unset")
        sys.exit(1)


#
# Input Handling
#

if len(sys.argv) < 2:
    log_message("called with too few arguments, callers must provide an input and output directory")
    sys.exit(1)

INPUT_DIR = sys.argv[1]

verify_dir(INPUT_DIR)

verify_env("DB_HOST", os.getenv("DB_HOST"))
verify_env("DB_PORT", os.getenv("DB_PORT"))
verify_env("DB_NAME", os.getenv("DB_NAME"))
verify_env("DB_USER", os.getenv("DB_USER"))
verify_env("DB_PASS", os.getenv("DB_PASS"))


#
# Script Body
#

# TODO: call some commands and do the things needed to install a dataset
