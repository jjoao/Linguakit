BIN=/usr/local/bin
cur="$(shell pwd)"


# for windows strawberry perl
# for windows strawberry perl -- correr na pwsh (?)
# for windows strawberry perl -- correr na bash (?)
install-win:
	perl wininstall.pl

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

