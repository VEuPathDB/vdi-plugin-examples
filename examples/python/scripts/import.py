#!/usr/bin/env python3

import os
import shutil
import sys
import vdi

#
# Utilities
#


def print_warning(msg):
    print(msg)


#
# Parameter Handling
#

if len(sys.argv) < 3:
    vdi.log_message("called with too few arguments, callers must provide an input and output directory")
    sys.exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)

vdi.verify_dir(sys.argv[1])
vdi.verify_dir(sys.argv[2])

INPUT_DIR = sys.argv[1]
OUTPUT_DIR = sys.argv[2]

#
# Script Body
#

vdi.log_message("Here's a log message that will be printed to STDERR")

for file in os.listdir(INPUT_DIR):
    vdi.log_message(f"copying {file} to {OUTPUT_DIR}")
    print_warning(f"Here's a validation warning about {file} that will be printed to STDOUT")
    shutil.copy2(os.path.join(INPUT_DIR, file), os.path.join(OUTPUT_DIR, file))
