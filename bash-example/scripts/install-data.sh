#!/usr/bin/env sh

#
# Utilities
#

logMessage() {
  >&2 echo "$1"
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

verifyEnv() {
  if [ -z "$2" ]; then
    logMessage "required environment variable $1 is blank or unset"
    return 1
  fi
}

#
# Input Handling
#

INPUT_DIR=$1

verifyDir "${INPUT_DIR}"

verifyEnv "DB_HOST" "$DB_HOST"
verifyEnv "DB_PORT" "$DB_PORT"
verifyEnv "DB_NAME" "$DB_NAME"
verifyEnv "DB_USER" "$DB_USER"
verifyEnv "DB_PASS" "$DB_PASS"

#
# Script Body
#

# TODO: Call some commands and do the things needed to install a dataset.