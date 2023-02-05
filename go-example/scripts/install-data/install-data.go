package main

import (
	"fmt"
	"os"
)

//
// Exit Codes
//

const EXIT_CODE_UNEXPECTED_ERROR = 1

//
// Utilities
//

func logMessage(message string) {
	_, _ = fmt.Fprintln(os.Stderr, message)
}

func verifyVDIID(vdiID string) {
	if vdiID == "" {
		logMessage("vdi_id parameter was blank or absent")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}
}

func verifyDir(path string) {
	info, err := os.Stat(path)

	if err != nil {
		if os.IsNotExist(err) {
			logMessage("path " + path + " does not exist")
			os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		} else {
			logMessage("unexpected error: " + err.Error())
			os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		}
	}

	if !info.IsDir() {
		logMessage("path " + path + " is not a directory")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}
}

func requireEnv(key string) string {
	if val, ok := os.LookupEnv(key); !ok || val == "" {
		logMessage("required environment variable " + key + " was blank or unset")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
		return ""
	} else {
		return val
	}
}

//
// Parameter Handling
//

func main() {
	if len(os.Args) < 3 {
		logMessage("called with too few arguments, callers must provide a VDI ID as well as an input directory")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}

	vdiID := os.Args[1]
	inputDir := os.Args[2]

	verifyVDIID(vdiID)
	verifyDir(inputDir)

}

//
// Script Body
//

func runInstall(vdiID, inputDir string) {

}
