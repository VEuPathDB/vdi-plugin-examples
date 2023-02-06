#!/usr/bin/env bash

# Get the current workspace directory.
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# Include some common functionality
. "$SCRIPT_DIR/includes.sh"

#
# Utilities
#

printWarning() {
  echo "$1"
}

#
# Parameter Handling
#

INPUT_DIR=$1
OUTPUT_DIR=$2

verifyDir "${INPUT_DIR}"  || exit $EXIT_CODE_UNEXPECTED_ERROR
verifyDir "${OUTPUT_DIR}" || exit $EXIT_CODE_UNEXPECTED_ERROR

#
# Script Body
#

logMessage "Here's a log message that will be printed to STDERR"

for file in "${INPUT_DIR}"/*; do
  logMessage "Copying ${file} to ${OUTPUT_DIR}"
  printWarning "Here's a validation warning about ${file} that will be printed to STDOUT"
  # validate "$file" || exit $EXIT_CODE_VALIDATION_ERROR
  cp "${file}" "${OUTPUT_DIR}"
done
