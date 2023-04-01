BIN=/usr/local/bin
cur="$(shell pwd)"

# for windows strawberry perl
# for windows strawberry perl -- correr na pwsh (?)
# for windows strawberry perl -- correr na bash (?)

install:
	@ echo "Windows "
	@ echo "    winget strawberryperl.strawberryperl"
	@ echo "    gmake deps install-win test-me"
	@ echo "Windows WSL  "
	@ echo "    make  deps install-wsl test-me"
	@ echo "MAC    "
	@ echo "    make  deps install-mac test-me"
	@ echo "Linux  "
	@ echo "    sudo make deps install-linux test-me"

install-win:
	perl wininstall.pl

install-mac install-wsl install-linux:
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

