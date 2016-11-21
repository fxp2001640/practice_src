#!/usr/bin/perl
use warnings;
#use strict;

use File::Basename;

my ($oops_file) = @ARGV;
my %reg_info;
%reg_info = ();
my @regs = qw/r0 r1 r2 r3 r4 r5 r6 r7 r8 r9 r10 fp
	      ip sp lr pc psr/;

my %hregs = ("r0"=>"r0",
	     "r1"=>"r1",
	     "r2"=>"r2",
	     "r3"=>"r3",
	     "r4"=>"r4",
	     "r5"=>"r5",
	     "r6"=>"r6",
	     "r7"=>"r7",
	     "r8"=>"r8",
	     "r9"=>"r9",
	     "r10"=>"r10",
	     "fp"=>"r11",
	     "ip"=>"r12",
	     "sp"=>"r13_svc",
	     "lr"=>"r14_svc",
	     "pc"=>"pc",
	     "psr"=>"cpsr");

sub parse_regs {
	open FLOG, "<", $oops_file
		or die "Could not open file $oops_file\n";

	while( $line = <FLOG>) {
getnext:
		if ($line =~ /\s+(\w+)\s*:\s(\[<)*([\da-f]{8})(>\])*/) {
			foreach $reg (@regs) {
				if ($1 eq $reg) {
			#		print "get $1  $3  $-[3] $+[3]\n" ;
					$reg_info{$reg} = $3;
					$line = substr $line, $+[3];
					goto getnext;
				}
			}
		}
	}

	close FLOG; 
}

sub reg2cmm {
	while (($reg, $val) = each %reg_info) {
		print "r.s $hregs{$reg} 0x$val\n";
	}

}


#########################################################
#                    Main                               #
#########################################################
if((not defined $oops_file)) {
	die "Invalid parameters\n";
}

parse_regs;
reg2cmm;








