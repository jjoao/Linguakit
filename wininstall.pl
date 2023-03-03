#!/usr/bin/env perl

my $base='/strawberry/perl/site/bin';
use strict;
use Cwd qw(cwd getcwd);
my $cur = getcwd();
#$cur =~ s!\\!/!g ; 
open(F,">", "$base/linguakit.bat") or die("cant create $base/linguakit.bat , $!");
print F 
#        qq(\@echo off \nperl -CDAS $cur), 
#        qq(\@echo off \nperl -Mutf8::all $cur), 
        qq(\@echo off \nperl $cur), 
        q(/linguakit.perl %*)  ;
close(F);

__END__
install2:

#	cpanm PerlIO::gzip  ## está a dar erro
	perl -E "say qq(\@echo off \nperl -CDAS ), $(curS) =~ s!\\!/!gr , q(/linguakit.perl %%*) " > $(BINS)/linguakit.bat


# for windows strawberry perl -- correr na bash (?)
BINS2=/c/strawberry/perl/site/bin
install3:
#	cpanm PerlIO::gzip  ## está a dar erro
	perl -E "say qq(\@echo off \nperl -CDAS ), $(curS) =~ s!\\\\!/!gr , q(/linguakit.perl %*) " > $(BINS2)/linguakit.bat

install-linux:
	perl -e 'print qq(#!/bin/bash\nperl $(cur)/linguakit.perl "\$$@"\n)' > $(BIN)/linguakit
	chmod +x $(BIN)/linguakit

deps:
	cpanm Getopt::ArgParse
	cpanm LWP::UserAgent
	cpanm HTTP::Request::Common
	cpanm PerlIO::gzip

test-me:
	echo "Olá mundo!" | linguakit tagger pt -nec
	echo "Hello world!." | linguakit tagger en -nec

## git clone  https://github.com/citiususc/Linguakit.git
## cd Linguakit
## sudo make deps
## sudo make install
## make test-me

