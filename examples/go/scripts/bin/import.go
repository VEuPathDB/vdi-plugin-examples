package main

import (
	"fmt"
	"handlers/pkg/vdi"
	"os"
	"path/filepath"
)

//
// Utilities
//

func printWarning(message string) {
	fmt.Println(message)
}

func copyFile(from, to string) {
	read, err := os.Open(from)
	if err != nil {
		vdi.LogMessage("unexpected error: " + err.Error())
		os.Exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)
	}
	defer read.Close()

	write, err := os.Create(to)
	if err != nil {
		vdi.LogMessage("unexpected error: " + err.Error())
		os.Exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)
	}
	defer write.Close()

	write.ReadFrom(read)
}

//
// Parameter Handling
//

func main() {
	if len(os.Args) < 3 {
		vdi.LogMessage("called with too few arguments, callers must provide an input and output directory")
		os.Exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)
	}

	inputDirectory := os.Args[1]
	outputDirectory := os.Args[2]

	vdi.VerifyDir(inputDirectory)
	vdi.VerifyDir(outputDirectory)

	runImport(inputDirectory, outputDirectory)
}

//
// Script Body
//

func runImport(inputDir, outputDir string) {
	vdi.LogMessage("Here's a log message that will be printed to STDERR")

	files, err := os.ReadDir(inputDir)
	if err != nil {
		vdi.LogMessage("unexpected error: " + err.Error())
		os.Exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)
	}

	for _, file := range files {
		vdi.LogMessage("Copying " + file.Name() + " to " + outputDir)
		printWarning("Here's a validation warning about " + file.Name() + " that will be printed to STDOUT")
		copyFile(filepath.Join(inputDir, file.Name()), filepath.Join(outputDir, file.Name()))
	}
}
