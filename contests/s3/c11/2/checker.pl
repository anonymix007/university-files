#!/usr/bin/perl

my $document = qx/$ARGV[0]/;

my @array = split ' ', $document;

my ($pidp) = $array[0] =~ /(\d+)/;
my ($pidc) = $array[1] =~ /(\d+)/; 
 
my $condition = qx/.\/ParsePidMap.jar pidtree.bin 'gchild($pidp,$pidc)'/;
chomp($condition);


if ($condition eq "true"){
    print "OK\n";
} else {
    print "WA\n$pidc is not a grandchild of $pidp","evaluated: $condition\n";
    #print qx/pstree -p $pidp/;
}

print $array[2], "\n";
unlink("pidtree.bin");
