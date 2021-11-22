#!/usr/bin/perl

system("/bin/sh -c $ARGV[0] > tmp.txt");

my $file = "tmp.txt";
my $document = do {
    local $/ = undef;
    open my $fh, "<", $file
        or die "could not open $file: $!";
    <$fh>;
};

my @array = split ' ', $document;
my ($pid) = $array[0] =~ /(\d+)/;  
my ($pidd) = $array[1] =~ /(\d+)/;  
my ($pidm) = $array[3] =~ /(\d+)/; 
my ($pidy) = $array[5] =~ /(\d+)/; 

my $expr1 = qx/.\/ParsePidMap.jar pidtree.bin 'child($pidy,$pidm)'/;
my $expr2 = qx/.\/ParsePidMap.jar pidtree.bin 'child($pidm,$pidd)'/;
my $expr3 = qx/.\/ParsePidMap.jar pidtree.bin 'child($pidd,$pid)'/;

chomp($expr1);
chomp($expr2);
chomp($expr3);

if (($expr1 eq "true") and ($expr2 eq "true") and ($expr3 eq "true")){
    print "OK\n";
} else {
    print "WA\n";
    print "$pid $pidd $pidm $pidy\n";
    print "$expr1, $expr2, $expr3\n";
}

print $array[2],"\n",$array[4],"\n",$array[6],"\n";

#
unlink("pidtree.bin");
