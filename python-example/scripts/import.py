#!/usr/bin/env python3

import os
import shutil
import sys

#
# Exit Codes
#

EXIT_CODE_VALIDATION_ERROR = 1
EXIT_CODE_TRANSFORMATION_ERROR = 2
EXIT_CODE_UNEXPECTED_ERROR = 3

#
# Utilities
#


def log_message(*args):
    print(*args, file=sys.stderr)


def print_warning(msg):
    print(msg)


def verify_dir(path):
    if path == "" or path is None:
        log_message("required directory parameter was blank or absent")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)

    if not os.path.isdir(path):
        log_message(f"directory {path} does not exist or is not a directory")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)

#
# Parameter Handling
#


if len(sys.argv) < 3:
    log_message("called with too few arguments, callers must provide an input and output directory")
    sys.exit(EXIT_CODE_UNEXPECTED_ERROR)

verify_dir(sys.argv[1])
verify_dir(sys.argv[2])

INPUT_DIR = sys.argv[1]
OUTPUT_DIR = sys.argv[2]

#
# Script Body
#

log_message("Here's a log message that will be printed to STDERR")

for file in os.listdir(INPUT_DIR):
    log_message(f"copying {file} to {OUTPUT_DIR}")
    print_warning(f"Here's a validation warning about {file} that will be printed to STDOUT")
    shutil.copy2(os.path.join(INPUT_DIR, file), os.path.join(OUTPUT_DIR, file))
