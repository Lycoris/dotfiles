#!/usr/bin/perl
$latex         = 'uplatex -halt-on-error -interaction=nonstopmode';
$bibtex        = 'pbibtex';
$biber         = 'biber --bblencoding=utf8 -u -U --output_safechars';
$dvipdf        = 'dvipdfmx %O %S';
$makeindex     = 'mendex %O -U -o %D %S';
$pdf_mode      = 3; # use dvipdfmx
$max_repeat    = 5;
$pdf_update_method = 4;
$pvc_view_file_via_temporary = 0;
$pdf_previewer    = 'open -ga /Applications/Skim.app';
