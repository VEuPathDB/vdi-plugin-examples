#!/usr/bin/perl

use strict;
use warnings;

use File::Copy;
use File::Basename;
use VDI;

#
# Utilities
#

sub printWarning {
  my $line = $_[0];

  print STDOUT "$line\n";
}

#
# Parameter Handling
#

my ($inputDir, $outputDir) = @ARGV;

if (not defined $inputDir) {
  VDI::logMessage("Input directory was not specified");
  exit VDI::EXIT_CODE_UNEXPECTED_ERROR;
}
if (not defined $outputDir) {
  VDI::logMessage("Output directory was not specified");
  exit VDI::EXIT_CODE_UNEXPECTED_ERROR;
}

VDI::verifyDir($inputDir);
VDI::verifyDir($outputDir);

#
# Script body
#

VDI::logMessage("Here's a log message that will be printed to STDERR");

my @inputFiles = <$inputDir/*>;
foreach my $file (@inputFiles) {
  VDI::logMessage("Copying $file to $outputDir");
  printWarning("Here's a validation warning about $file that will be printed to STDOUT");
  copy($file, $outputDir . "/" . basename($file));
}