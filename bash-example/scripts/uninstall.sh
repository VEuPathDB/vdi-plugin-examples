#!/usr/bin/env bash

# Get the current workspace directory.
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Include some common functionality
. "$SCRIPT_DIR/includes.sh"

#
# Parameter Handling
#

VDI_ID="$1"

verifyVDIID "$VDI_ID" || exit $EXIT_CODE_UNEXPECTED_ERROR

#
# Script Body
#

# TODO: Do the uninstallation!