package vdi

import (
	"fmt"
	"os"
)

const (
	EXIT_CODE_VALIDATION_ERROR     = 1
	EXIT_CODE_TRANSFORMATION_ERROR = 2
	EXIT_CODE_UNEXPECTED_ERROR     = 255
)

func LogMessage(message string) {
	_, _ = fmt.Fprintln(os.Stderr, message)
}

func VerifyDir(path string) {
	info, err := os.Stat(path)

	if err != nil {
		if os.IsNotExist(err) {
			LogMessage("path " + path + " does not exist")
			os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		} else {
			LogMessage("unexpected error: " + err.Error())
			os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		}
	}

	if !info.IsDir() {
		LogMessage("path " + path + " is not a directory")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}
}

func VerifyFile(path string) {
	info, err := os.Stat(path)

	if err != nil {
		if os.IsNotExist(err) {
			LogMessage("path " + path + " does not exist")
			os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		} else {
			LogMessage("unexpected error: " + err.Error())
			os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		}
	}

	if info.IsDir() {
		LogMessage("path " + path + " is a directory!")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}
}

func VerifyVDIID(vdiID string) {
	if vdiID == "" {
		LogMessage("VDI ID parameter was blank or absent")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}

	if len(vdiID) != 32 {
		LogMessage("Invalid VDI dataset ID")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}

	for _, c := range vdiID {
		if c < '0' || c > 'f' || (c > '9' && c < 'A') || (c > 'F' && c < 'a') {
			LogMessage("Invalid VDI dataset ID")
			os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		}
	}
}

func RequireEnv(key string) string {
	if val, ok := os.LookupEnv(key); !ok || val == "" {
		LogMessage("required environment variable " + key + " was blank or unset")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		return ""
	} else {
		return val
	}
}
