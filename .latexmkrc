#!/usr/bin/perl
$latex         = 'platex %O -src-specials -kanji=utf8 -interaction=nonstopmode %S';
$bibtex        = 'pbibtex %O %B';
$dvipdf        = '/usr/local/bin/dvipdfmx %O %S';
$pdf_mode      = 3; # use dvipdf
$pdf_update_method = 0;
