#!/usr/bin/perl
open(INFILE, "<$ARGV[0]") or die("Cannot open file $ARGV[0] for reading: $!");
my $state = 0; my $counter = 0;my @data = ();
while($line = <INFILE>) {
	$line =~ s/^\s+//;
	$line =~ s/\s+$//;
	if (length($line) > 0) {
		if ($state == 0) {									# Is state 0?
			$counter = $line;								# Save argument count
			$state = 1;									# Next state
			if ($line eq "0") {								# Is not an end Of test case indicator?
				exit;
			}
		} else {
			@mydata = split(' ', $line);							# Split string by space
			push(@mydataA,$mydata[0]);							# Push X onto ArrayX
			push(@mydataB,$mydata[1]);							# Push Y onto ArrayY
			if ($counter == 1) {
				$counter = $#mydataA + 1;
				$state = 0;								# Reset state for later
				$cntA = 0;
				$lowestanswer = 999999999;						# Lowest set to ceiling
				while ($cntA < $counter) {						# Counter A
					$cntB = 0;
					while ($cntB < $counter) {					# Counter B
						if ($cntA ne $cntB) {					# Hey! Don't check yourself!
							$a = ($mydataA[$cntA]) - ($mydataA[$cntB]);	# Subtract X1 from X2
							$b = ($mydataB[$cntA]) - ($mydataB[$cntB]);	# "        Y1 "    Y2
							$a = $a ** 2; # OR $a * $a;			# Raise A to the second power
							$b = $b ** 2; # OR $b * $b;			# " "
							$myanswer = sprintf("%.4f", sqrt($a + $b));	# Round to nearest 4th decimal place
							if ($myanswer < $lowestanswer) {		# Is it less than our lowest?
								$lowestanswer = $myanswer;		# Keep it!
							}
						}
						$cntB++;
					}
					$cntA++;
				}
				while ($#mydataA >= 0) { pop @mydataA; }
				while ($#mydataB >= 0) { pop @mydataB; }
				if ($lowestanswer < 10000) {						# Are we under 10,000?
					print "$lowestanswer\n";					# Answer!
				} else {
					print "INFINITY\n";						# To infinity and beyond!
				}
			}
			$counter--;

		}
	}

}
close(INFILE);

