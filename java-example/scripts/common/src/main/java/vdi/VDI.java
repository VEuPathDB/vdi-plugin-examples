package vdi;

import java.io.File;

public class VDI {

  public final static int EXIT_CODE_VALIDATION_ERROR = 1;
  public final static int EXIT_CODE_TRANSFORMATION_ERROR = 2;
  public final static int EXIT_CODE_UNEXPECTED_ERROR = 255;

  public static void logMessage(String message) {
    System.err.println(message);
  }

  public static void verifyDir(File dir) {
    if (!dir.exists() || !dir.isDirectory()) {
      logMessage("path " + dir + " does not exist or is not a directory");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }
  }

  public static void verifyFile(File file) {
    if (!file.exists() || !file.isFile()) {
      logMessage("path " + file + " does not exist or is not a regular file");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }
  }

  public static void verifyVDIID(String id) {
    if (id == null || id.isBlank()) {
      logMessage("VDI ID parameter was blank");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }

    if (id.length() != 32) {
      logMessage("invalid VDI dataset ID length");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }

    for (var i = 0; i < 32; i++) {
      if (!isHex(id.charAt(i))) {
        logMessage("invalid VDI dataset ID");
        System.exit(EXIT_CODE_UNEXPECTED_ERROR);
      }
    }
  }

  public static String requireEnv(String key) {
    var value = System.getenv(key);

    if (value == null || value.isBlank()) {
      logMessage("required environment variable " + key + " is blank or unset");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }

    return value;
  }

  public static boolean isHex(char c) {
    return (c >= '0' && c <= '9')
      || (c >= 'A' && c <= 'F')
      || (c >= 'a' && c <= 'f');
  }
}
