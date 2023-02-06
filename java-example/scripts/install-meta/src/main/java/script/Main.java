package script;

import vdi.VDI;

import java.io.File;
import java.util.HashMap;

public class Main {

  //
  // Input Handling
  //

  public static void main(String[] args) {
    if (args.length < 2) {
      VDI.logMessage("called with too few arguments, callers must provide a VDI dataset ID and the path to a dataset meta file");
      System.exit(VDI.EXIT_CODE_UNEXPECTED_ERROR);
    }

    var vdiID = args[0];
    var metaFile = new File(args[1]);

    VDI.verifyVDIID(vdiID);
    VDI.verifyFile(metaFile);

    var env = new HashMap<String, String>(5);

    env.put("DB_HOST", VDI.requireEnv("DB_HOST"));
    env.put("DB_PORT", VDI.requireEnv("DB_PORT"));
    env.put("DB_NAME", VDI.requireEnv("DB_NAME"));
    env.put("DB_USER", VDI.requireEnv("DB_USER"));
    env.put("DB_PASS", VDI.requireEnv("DB_PASS"));

    runMetaInstall(vdiID, metaFile, env);
  }

  //
  // Script Body
  //

  private static void runMetaInstall(String vdiID, File metaFile, HashMap<String, String> env) {
    // TODO: do the things!
  }
}
