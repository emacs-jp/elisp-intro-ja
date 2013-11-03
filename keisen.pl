#!/usr/local/bin/perl
$flag = 0;
while (<>) {
    chop && /\n$/;
    if (/\@c ascii diagram$/) {$flag = 1;}
    if (/\@c ascii diagram end$/) {$flag = 0;}
    if (($flag == 1) && (/^[^\@]/)) {s/^/\@d /;}
    if (($flag == 1) && (/^\@c/)) {
	unless (/^\@c ascii/) {
	    s/^\@c //;
	}
    }
    if (($flag == 1) && (/^\@d/)) {s/^\@d/\@c/;}
    print $_,"\n";
}
