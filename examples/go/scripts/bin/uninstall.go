package main

import (
	"handlers/pkg/vdi"
	"os"
)

//
// Parameter Handling
//

func main() {
	if len(os.Args) < 2 {
		vdi.LogMessage("called with too few arguments, callers must provide a VDI dataset ID")
		os.Exit(vdi.EXIT_CODE_UNEXPECTED_ERROR)
	}

	vdiID := os.Args[1]

	vdi.VerifyVDIID(vdiID)

	env := map[string]string{
		"DB_HOST": vdi.RequireEnv("DB_HOST"),
		"DB_PORT": vdi.RequireEnv("DB_PORT"),
		"DB_NAME": vdi.RequireEnv("DB_NAME"),
		"DB_USER": vdi.RequireEnv("DB_USER"),
		"DB_PASS": vdi.RequireEnv("DB_PASS"),
	}

	runUninstall(vdiID, env)
}

//
// Script Body
//

func runUninstall(vdiID string, env map[string]string) {

}
