package script;

import java.io.File;

public class Main {
  private final static int EXIT_CODE_UNEXPECTED_ERROR = 1;

  public static void main(String[] args) {
    if (args.length < 2) {
      logMessage("called with too few arguments, callers must provide a VDI dataset ID and an input directory");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }

    var vdiID = args[0];
    var inputDir = new File(args[1]);

    verifyVDIID(vdiID);
    verifyDir(inputDir);

    verifyEnv("DB_HOST", System.getenv("DB_HOST"));
    verifyEnv("DB_PORT", System.getenv("DB_PORT"));
    verifyEnv("DB_NAME", System.getenv("DB_NAME"));
    verifyEnv("DB_USER", System.getenv("DB_USER"));
    verifyEnv("DB_PASS", System.getenv("DB_PASS"));

    runInstall(inputDir);
  }

  private static void runInstall(File inputDir) {
    // TODO: do the things needed to install a dataset
  }

  private static void logMessage(String message) {
    System.err.println(message);
  }

  private static void verifyDir(File dir) {
    if (!dir.exists()) {
      logMessage("target directory " + dir + " does not exist");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }

    if (!dir.isDirectory()) {
      logMessage("target directory " + dir + " is not a directory");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }
  }

  private static void verifyVDIID(String id) {
    if (id == null || id.isBlank()) {
      logMessage("vdi_id parameter was blank");
    }
  }

  private static void verifyEnv(String name, String value) {
    if (value == null || value.isBlank()) {
      logMessage("required environment variable " + name + " is blank or unset");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }
  }
}
