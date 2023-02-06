package VDI;
use strict;
use warnings FATAL => 'all';

use constant EXIT_CODE_VALIDATION_ERROR => 1;
use constant EXIT_CODE_TRANSFORMATION_ERROR => 2;
use constant EXIT_CODE_UNEXPECTED_ERROR => 255;

sub logMessage {
  my $line = $_[0];

  print STDERR "$line\n";
}

sub verifyDir {
  my $dir = $_[0];

  if (! -d $dir) {
    logMessage("path $dir does not exist or is not a directory!");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }
}

sub verifyFile {
  my $file = $_[0];

  if (! -f $file) {
    logMessage("path $file does not exist or is not a plain file!")
  }
}

sub requireEnv {
  my $envName = $_[0];

  if (not defined $ENV{$envName} or $ENV{$envName} eq "") {
    logMessage("required environment variable $envName was blank or unset");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }

  return $ENV{$envName};
}

sub verifyVDIID {
  my $vdiID = $_[0];

  if ($vdiID eq "") {
    logMessage("VDI ID parameter was blank or unset");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }

  if ($vdiID !=~ /^[0-9a-fA-F]{32}$/) {
    logMessage("VDI ID parameter was not a valid VDI dataset ID");
    exit EXIT_CODE_UNEXPECTED_ERROR;
  }
}

1;