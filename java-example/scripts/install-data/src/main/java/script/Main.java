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
      VDI.logMessage("called with too few arguments, callers must provide a VDI dataset ID and an input directory");
      System.exit(VDI.EXIT_CODE_UNEXPECTED_ERROR);
    }

    var vdiID = args[0];
    var inputDir = new File(args[1]);

    VDI.verifyVDIID(vdiID);
    VDI.verifyDir(inputDir);

    var env = new HashMap<String, String>(5);

    env.put("DB_HOST", VDI.requireEnv("DB_HOST"));
    env.put("DB_PORT", VDI.requireEnv("DB_PORT"));
    env.put("DB_NAME", VDI.requireEnv("DB_NAME"));
    env.put("DB_USER", VDI.requireEnv("DB_USER"));
    env.put("DB_PASS", VDI.requireEnv("DB_PASS"));

    runInstall(vdiID, inputDir, env);
  }

  //
  // Script Body
  //

  private static void runInstall(String vdiID, File inputDir, HashMap<String, String> env) {
    // TODO: do the things needed to install a dataset
  }
}
