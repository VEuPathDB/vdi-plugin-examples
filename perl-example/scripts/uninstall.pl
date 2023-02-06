#!/usr/bin/perl

use strict;
use warnings;

use VDI;

#
# Parameter Handling
#

my ($vdiID) = @ARGV;

if (not defined $vdiID) {
  VDI::logMessage("VDI ID parameter was not provided!");
  exit VDI::EXIT_CODE_UNEXPECTED_ERROR;
}

VDI::verifyVDIID($vdiID);

my $db_host = VDI::requireEnv("DB_HOST");
my $db_port = VDI::requireEnv("DB_PORT");
my $db_name = VDI::requireEnv("DB_NAME");
my $db_user = VDI::requireEnv("DB_USER");
my $db_pass = VDI::requireEnv("DB_PASS");

#
# Script Body
#

# TODO: Do the uninstallation!