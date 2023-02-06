package script;

import vdi.VDI;

import java.util.HashMap;

public class Main {

  public static void main(String[] args) {
    if (args.length < 1) {
      VDI.logMessage("called with too few arguments, callers must provide a VDI dataset ID");
      System.exit(VDI.EXIT_CODE_UNEXPECTED_ERROR);
    }

    var vdiID = args[0];

    VDI.verifyVDIID(vdiID);

    var env = new HashMap<String, String>(5);

    env.put("DB_HOST", VDI.requireEnv("DB_HOST"));
    env.put("DB_PORT", VDI.requireEnv("DB_PORT"));
    env.put("DB_NAME", VDI.requireEnv("DB_NAME"));
    env.put("DB_USER", VDI.requireEnv("DB_USER"));
    env.put("DB_PASS", VDI.requireEnv("DB_PASS"));

    runUninstall(vdiID, env);
  }

  private static void runUninstall(String vdiID, HashMap<String, String> env) {
    // TODO: do the uninstall!
  }
}
