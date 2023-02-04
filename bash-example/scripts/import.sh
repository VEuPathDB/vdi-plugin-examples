#!/usr/bin/env sh

#
# Exit Codes
#

EXIT_CODE_VALIDATION_ERROR=1
EXIT_CODE_TRANSFORMATION_ERROR=2
EXIT_CODE_UNEXPECTED_ERROR=3

#
# Utilities
#

logMessage() {
  >&2 echo "$1"
}

printWarning() {
  echo $1
}

verifyDir() {
  if [ -z "$1" ]; then
    logMessage "required directory parameter was blank or absent"
    return 1
  fi

  if [ ! -d "$1" ]; then
    logMessage "directory $1 does not exist or is not a directory"
    return 1
  fi

  return 0
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
  cp "${file}" "${OUTPUT_DIR}"
done
