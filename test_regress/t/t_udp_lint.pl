#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

top_filename("t/t_udp.v");

compile (
    # Unsupported: UDP Tables
    make_top_shell => 0,
    make_main => 0,
    v_flags2 => ["--lint-only"],
    verilator_make_gcc => 0,
    );

ok(1);
1;
