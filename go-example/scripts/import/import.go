package main

import (
	"fmt"
	"os"
	"path/filepath"
)

//
// Exit Codes
//

const (
	EXIT_CODE_VALIDATION_ERROR     = 1
	EXIT_CODE_TRANSFORMATION_ERROR = 2
	EXIT_CODE_UNEXPECTED_ERROR     = 3
)

//
// Utilities
//

func logMessage(message string) {
	_, _ = fmt.Fprintln(os.Stderr, message)
}

func printWarning(message string) {
	fmt.Println(message)
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

func copyFile(from, to string) {
	read, err := os.Open(from)
	if err != nil {
		logMessage("unexpected error: " + err.Error())
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}
	defer read.Close()

	write, err := os.Create(to)
	if err != nil {
		logMessage("unexpected error: " + err.Error())
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}
	defer write.Close()

	write.ReadFrom(read)
}

//
// Parameter Handling
//

func main() {
	if len(os.Args) < 3 {
		logMessage("called with too few arguments, callers must provide an input and output directory")
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}

	inputDirectory := os.Args[1]
	outputDirectory := os.Args[2]

	verifyDir(inputDirectory)
	verifyDir(outputDirectory)

	runImport(inputDirectory, outputDirectory)
}

//
// Script Body
//

func runImport(inputDir, outputDir string) {
	logMessage("Here's a log message that will be printed to STDERR")

	files, err := os.ReadDir(inputDir)
	if err != nil {
		logMessage("unexpected error: " + err.Error())
		os.Exit(EXIT_CODE_UNEXPECTED_ERROR)
	}

	for _, file := range files {
		logMessage("Copying " + file.Name() + " to " + outputDir)
		printWarning("Here's a validation warning about " + file.Name() + " that will be printed to STDOUT")
		copyFile(filepath.Join(inputDir, file.Name()), filepath.Join(outputDir, file.Name()))
	}
}
