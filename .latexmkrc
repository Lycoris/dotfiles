#!/usr/bin/perl
$latex         = 'uplatex %O -halt-on-error -interaction=nonstopmode %S';
$bibtex        = 'upbibtex %O %B';
$dvipdf        = 'dvipdfmx %O -o %S';
$makeindex     = 'mendex %O -o %D %S';
$pdf_mode      = 3; # use dvipdf
$pdf_update_method = 4;
$pdf_update_command = 'open -ga Preview %S';
