#!/usr/bin/perl

use strict;
use warnings;

#
# Exit Codes
#

use constant EXIT_CODE_UNEXPECTED_ERROR => 1;

#
# Utilities
#

sub logMessage {
  my $line = $_[0];

  print STDERR $line . "\n";
}

sub requireEnv {
  my $envName = $_[0];

  if (not defined $ENV{$envName} or $ENV{$envName} eq "") {
    logMessage("required environment variable $envName was blank or unset");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }

  return $ENV{$envName};
}

sub verifyDir {
  my $dir = $_[0];

  if (! -d $dir) {
    logMessage("directory $dir does not exist or is not a directory!");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }
}

sub verifyVDIID {
  my $vdiID = $_[0];

  if ($vdiID eq "") {
    logMessage("vdi_id parameter was blank or unset");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }
}

#
# Parameter Handling
#

my ($vdiID, $inputDir) = @ARGV;

if (not defined $vdiID) {
  logMessage("vdi id parameter was not provided!");
  exit EXIT_CODE_UNEXPECTED_ERROR;
}
if (not defined $inputDir) {
  logMessage("input directory was not provided!");
  exit EXIT_CODE_UNEXPECTED_ERROR;
}

verifyVDIID($vdiID);
verifyDir($inputDir);

my $db_host = requireEnv("DB_HOST");
my $db_port = requireEnv("DB_PORT");
my $db_name = requireEnv("DB_NAME");
my $db_user = requireEnv("DB_USER");
my $db_pass = requireEnv("DB_PASS");

#
# Script Body
#

# TODO: Do the installation!