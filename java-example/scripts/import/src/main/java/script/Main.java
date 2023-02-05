package script;

import java.io.*;
import java.util.Objects;

public class Main {
  private final static int EXIT_CODE_VALIDATION_ERROR = 1;
  private final static int EXIT_CODE_TRANSFORMATION_ERROR = 2;
  private final static int EXIT_CODE_UNEXPECTED_ERROR = 3;

  public static void main(String[] args) {
    if (args.length < 2) {
      logMessage("called with too few arguments, callers must provide an input and output directory");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }

    var inputDirectory = new File(args[0]);
    var outputDirectory = new File(args[1]);

    verifyDir(inputDirectory);
    verifyDir(outputDirectory);

    runImport(inputDirectory, outputDirectory);
  }

  private static void runImport(File inputDir, File outputDir) {
    logMessage("Here's a log message that will be printed to STDERR");

    var files = Objects.requireNonNull(inputDir.listFiles());
    for (var file : files) {
      logMessage("Copying " + file.getName() + " to " + outputDir);
      printWarning("Here's a validation warning about " + file.getName() + " that wil be printed to STDOUT");
      copyFile(file, new File(outputDir, file.getName()));
    }
  }

  private static void logMessage(String message) {
    System.err.println(message);
  }

  private static void printWarning(String message) {
    System.out.println(message);
  }

  private static void verifyDir(File dir) {
    if (!dir.exists() || !dir.isDirectory()) {
      logMessage("path " + dir + " does not exist or is not a directory");
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }
  }

  private static void copyFile(File from, File to) {
    try (
      var input  = new BufferedInputStream(new FileInputStream(from));
      var output = new BufferedOutputStream(new FileOutputStream(to))
    ) {
      input.transferTo(output);
      output.flush();
    } catch (Exception e) {
      logMessage("unexpected error: " + e.getMessage());
      System.exit(EXIT_CODE_UNEXPECTED_ERROR);
    }
  }
}
