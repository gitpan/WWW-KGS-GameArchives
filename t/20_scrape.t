use strict;
use warnings;
use WWW::KGS::GameArchives;
use Test::More tests => 1;

open my $fh, '<:encoding(UTF-8)', 't/input.html';
my $input = join q{}, <$fh>;
close $fh;

my $archives = WWW::KGS::GameArchives->new;
my $got = $archives->scrape( \$input, $archives->base_uri );

my $expected = do 't/expected.pl';

is_deeply $got, $expected;
