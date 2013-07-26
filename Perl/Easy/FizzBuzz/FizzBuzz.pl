!#/usr/bin/perl
my $i;											# Declare varible
my $line = "";										# " "
open(INFILE, "<$ARGV[0]") or die("Cannot open file $ARGV[0] for reading: $!");		# Open file from argument 1 to read data
while($line = <INFILE>) {								# While not EOF, read one line into buffer
    $line =~ s/^\s+//;									# Remove leading spaces from line
    $line =~ s/\s+$//;									# Remove trailing spaces from line
    if (length($line) > 0) {								# If line has data continue
        @mynum = split(' ', $line);							# Split line on spaces into array
											# Arg1 = Fizz divisor
											# Arg2 = Buzz divisor
											# Arg3 = Last rarget number to test
    	$i = 1;										# Reset counter
	$mystring = "";									# Clear output string
	while ($i <= $mynum[2]) {							# Loop while <= target number
		$Fizz = 0; $Bizz = 0;							# Zero Fizz & Bizz
		if (($i % $mynum[0]) == 0) {						# Fizzy?
			$Fizz = 1;
		}
		if (($i % $mynum[1]) == 0) {						# Bizzy?
			$Bizz = 1;
		}

		if (($Fizz == 1) && ($Bizz == 1)) {					# Fizzy & Bizzy!
			$mystring = $mystring . "FB ";
		} elsif ($Fizz == 1) {
			$mystring = $mystring . "F ";					# Fizzy!
		} elsif ($Bizz == 1) {
			$mystring = $mystring . "B ";					# Bizzy!
		} else {
			$mystring = $mystring . "$i ";					# Not Fizzy or Bizzy
		}
		$i++;									# Next number!
	}
	$mystring=~ s/^\s+//;								# Remove leading spaces
	$mystring=~ s/\s+$//;								# Remove trailing spaces
	print "$mystring\n";								# Print the final answer!
    }
}
close(INFILE);										# Close file. Fun is over.

