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
		vdi.LogMessage("called with too few arguments, callers must provide a VDI ID as well as an dataset meta file path")
		os.Exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)
	}

	vdiID := os.Args[1]
	metaPath := os.Args[2]

	vdi.VerifyVDIID(vdiID)
	vdi.VerifyFile(metaPath)

	env := map[string]string{
		"DB_HOST": vdi.RequireEnv("DB_HOST"),
		"DB_PORT": vdi.RequireEnv("DB_PORT"),
		"DB_NAME": vdi.RequireEnv("DB_NAME"),
		"DB_USER": vdi.RequireEnv("DB_USER"),
		"DB_PASS": vdi.RequireEnv("DB_PASS"),
	}

	runInstallMeta(vdiID, metaPath, env)
}

//
// Script Body
//

func runInstallMeta(vdiID, metaPath string, env map[string]string) {

}
