#!/usr/bin/perl
my $line = ""; my $found = "";							# Declare variables
open(INFILE, "<$ARGV[0]") or die("Cannot open file $ARGV[0] for reading: $!");	# Open file from argument 1 to read data
while($line = <INFILE>) {							# While not EOF, read one line into buffer
	$line =~ s/^\s+//;							# Strip leading whitespace
	$line =~ s/\s+$//;							# Strip trailing whitepace
	if (length($line) > 0) {						# If line contains non whitespace continue
		$found = "";							# Clear variable
		@mywords = split(' ', $line);					# Split all words by space
		foreach my $myword (@mywords) {					# For each word in array loop
			$found = "$myword" . " " . "$found";			# Add word in front of last word found
		}
		$found=~ s/^\s+//;
		$found=~ s/\s+$//;
		print "$found\n";						# Print answer!
	}
}
close(INFILE);
