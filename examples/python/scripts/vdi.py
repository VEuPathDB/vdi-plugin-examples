import os
import re
import sys


EXIT_CODE_VALIDATION_ERROR = 1
EXIT_CODE_TRANSFORMATION_ERROR = 2
EXIT_CODE_UNEXPECTED_ERROR = 255


def log_message(*args):
    print(*args, file=sys.stderr)


def verify_dir(path):
    if path == "" or path is None:
        log_message("required directory parameter was blank or absent")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)

    if not os.path.isdir(path):
        log_message(f"directory {path} does not exist or is not a directory")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)


def verify_file(path):
    if path == "" or path is None:
        log_message("required directory parameter was blank or absent")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)

    if not os.path.isfile(path):
        log_message(f"file {path} does not exist or is not a regular file")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)


def require_env(name):
    out = os.getenv(name)
    if out == "" or out is None:
        log_message(f"required environment variable {name} is blank or unset")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)
    return out


def verify_vdi_id(vdi_id):
    if not re.match(r"^[0-9a-fA-F]{32}$"):
        log_message("VDI ID parameter was not a valid VDI dataset ID")
        sys.exit(EXIT_CODE_UNEXPECTED_ERROR)