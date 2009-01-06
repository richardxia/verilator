#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003-2008 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# General Public License or the Perl Artistic License.

compile (
	 verilator_flags2 => [$Self->{v3}?'--sp --coverage-toggle --stats':''],
	 );

execute (
	 check_finished=>1,
	 );

# Read the input .v file and do any CHECK_COVER requests
inline_checks();

file_grep ($Self->{stats}, qr/Coverage, Toggle points joined\s+25/i);

ok(1);
1;