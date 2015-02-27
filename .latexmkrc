#!/usr/bin/perl
$latex         = 'uplatex %O -halt-on-error -interaction=nonstopmode %S';
$bibtex        = 'pbibtex %O %B';
$biber         = 'biber --bblencoding=utf8 -u -U --output_safechars';
$dvipdf        = 'dvipdfmx %O %S';
$makeindex     = 'mendex %O %D %S';
$pdf_mode      = 3; # use dvipdf
$max_repeat    = 5;
$pdf_update_method = 4;
$pdf_update_command = 'open -ga Preview %S';
