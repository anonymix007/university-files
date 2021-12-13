#!/usr/bin/perl

use UUID::Generator::PurePerl;

sub create_search_id {
    my $this =shift;
    my $args=shift;
    my $ug = UUID::Generator::PurePerl->new();
    my $uuid1 = $ug->generate_v1();
    return $uuid1;
}

my ($N_FILES, $N, $CNT_MAX, $INC_MAX, $INIT_MAX) = @ARGV;

open(TEST, '>>', "test13-5.txt") or die $!;
print TEST "CMD/{";
for my $j (1..$N_FILES) {


    my $fuuid = create_search_id();
    open(FH, '>', "files/$fuuid.txt") or die $!;


    my $value = int(rand($INIT_MAX));

    for my $i (1..$N){
        my $cnt = int(rand($CNT_MAX));
        print FH "$value " x $cnt;
        $value += int(rand($INC_MAX));
    }
    print TEST "files/$fuuid.txt ";
}
print TEST "}/\n";
