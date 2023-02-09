package script;

import vdi.VDI;

import java.io.*;
import java.util.Objects;

public class Main {

  //
  // Utilities
  //

  private static void printWarning(String message) {
    System.out.println(message);
  }

  private static void copyFile(File from, File to) {
    try (
      var input  = new BufferedInputStream(new FileInputStream(from));
      var output = new BufferedOutputStream(new FileOutputStream(to))
    ) {
      input.transferTo(output);
      output.flush();
    } catch (Exception e) {
      VDI.logMessage("unexpected error: " + e.getMessage());
      System.exit(VDI.EXIT_CODE_UNEXPECTED_ERROR);
    }
  }

  //
  // Input Handling
  //

  public static void main(String[] args) {
    if (args.length < 2) {
      VDI.logMessage("called with too few arguments, callers must provide an input and output directory");
      System.exit(VDI.EXIT_CODE_UNEXPECTED_ERROR);
    }

    var inputDirectory = new File(args[0]);
    var outputDirectory = new File(args[1]);

    VDI.verifyDir(inputDirectory);
    VDI.verifyDir(outputDirectory);

    runImport(inputDirectory, outputDirectory);
  }

  //
  // Script Body
  //

  private static void runImport(File inputDir, File outputDir) {
    VDI.logMessage("Here's a log message that will be printed to STDERR");

    var files = Objects.requireNonNull(inputDir.listFiles());
    for (var file : files) {
      VDI.logMessage("Copying " + file.getName() + " to " + outputDir);
      printWarning("Here's a validation warning about " + file.getName() + " that wil be printed to STDOUT");
      copyFile(file, new File(outputDir, file.getName()));
    }
  }

}
