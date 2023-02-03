#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;
use File::Basename;

#
# Exit Codes
#

use constant EXIT_CODE_VALIDATION_ERROR => 1;
use constant EXIT_CODE_TRANSFORMATION_ERROR => 2;
use constant EXIT_CODE_UNEXPECTED_ERROR => 3;

#
# Utilities
#

sub logMessage {
  my $line = $_[0];

  print STDERR "$line\n";
}

sub printWarning {
  my $line = $_[0];

  print STDOUT "$line\n";
}

sub verifyDir {
  my $dir = $_[0];

  if (! -d $dir) {
    logMessage("directory $dir does not exist or is not a directory!");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }
}

#
# Parameter Handling
#

my ($inputDir, $outputDir) = @ARGV;

if (not defined $inputDir) {
  logMessage("Input directory was not specified");
  exit EXIT_CODE_UNEXPECTED_ERROR;
}
if (not defined $outputDir) {
  logMessage("Output directory was not specified");
  exit EXIT_CODE_UNEXPECTED_ERROR;
}

verifyDir($inputDir);
verifyDir($outputDir);

#
# Script body
#

logMessage("Here's a log message that will be printed to STDERR");

my @inputFiles = <$inputDir/*>;
foreach my $file (@inputFiles) {
  logMessage("Copying $file to $outputDir");
  printWarning("Here's a validation warning about $file that will be printed to STDOUT");
  copy($file, $outputDir . "/" . basename($file));
}