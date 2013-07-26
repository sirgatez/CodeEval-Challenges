#!/usr/bin/perl
open(INFILE, "<$ARGV[0]") or die("Cannot open file $ARGV[0] for reading: $!");	# Open file to read from
while(my $line = <INFILE>) {							# While not EOF, read one line into buffer
	$line =~ s/(^s|s*$)//g;							# Remove leading and trailing spaces
    if (length($line) > 0) {							# If line has data continue
        print lc($line);							# Print lowercase version of string
    }
}
close(INFILE);									# Close file

