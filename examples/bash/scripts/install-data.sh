#!/usr/bin/env bash

# Get the current workspace directory.
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Include some common functionality
. "$SCRIPT_DIR/includes.sh"


#
# Input Handling
#

VDI_ID=$1
INPUT_DIR=$2

verifyVDIID "$VDI_ID" || exit $EXIT_CODE_UNEXPECTED_ERROR
verifyDir "$INPUT_DIR" || exit $EXIT_CODE_UNEXPECTED_ERROR

verifyEnv "DB_HOST" "$DB_HOST" || exit $EXIT_CODE_UNEXPECTED_ERROR
verifyEnv "DB_PORT" "$DB_PORT" || exit $EXIT_CODE_UNEXPECTED_ERROR
verifyEnv "DB_NAME" "$DB_NAME" || exit $EXIT_CODE_UNEXPECTED_ERROR
verifyEnv "DB_USER" "$DB_USER" || exit $EXIT_CODE_UNEXPECTED_ERROR
verifyEnv "DB_PASS" "$DB_PASS" || exit $EXIT_CODE_UNEXPECTED_ERROR

#
# Script Body
#

>&2 env
# TODO: Call some commands and do the things needed to install a dataset.