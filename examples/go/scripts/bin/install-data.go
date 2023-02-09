package main

import (
	"handlers/pkg/vdi"
	"os"
)

//
// Parameter Handling
//

func main() {
	if len(os.Args) < 3 {
		vdi.LogMessage("called with too few arguments, callers must provide a VDI ID as well as an input directory")
		os.Exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)
	}

	vdiID := os.Args[1]
	inputDir := os.Args[2]

	vdi.VerifyVDIID(vdiID)
	vdi.VerifyDir(inputDir)

	env := map[string]string{
		"DB_HOST": vdi.RequireEnv("DB_HOST"),
		"DB_PORT": vdi.RequireEnv("DB_PORT"),
		"DB_NAME": vdi.RequireEnv("DB_NAME"),
		"DB_USER": vdi.RequireEnv("DB_USER"),
		"DB_PASS": vdi.RequireEnv("DB_PASS"),
	}

	runInstall(vdiID, inputDir, env)
}

//
// Script Body
//

func runInstall(vdiID, inputDir string, env map[string]string) {

}
