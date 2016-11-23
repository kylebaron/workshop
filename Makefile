SHELL := /bin/bash
#LIBDIR=${HOME}/Rlibs/lib
PACKAGE=workshop
VERSION=$(shell grep Version DESCRIPTION |awk '{print $$2}')
TARBALL=${PACKAGE}_${VERSION}.tar.gz
PKGDIR=.
CHKDIR=Rchecks

## Set libPaths:
export R_LIBS=${LIBDIR}

travis_build:
	make doc
	make build
	make install

all:
	make doc
	make build
	make install


.PHONY: doc
doc:
	Rscript -e 'library(devtools)' -e 'document()'


build:
	R CMD build --md5 $(PKGDIR)

install:
	R CMD INSTALL --install-tests ${TARBALL}

install-build:
	R CMD INSTALL --build --install-tests ${TARBALL}

check:
	make doc
	make build
	R CMD check ${TARBALL} -o ${CHKDIR}

qcheck: 
	make doc
	make build 
	R CMD check ${TARBALL} -o ${CHKDIR} --no-manual --no-codoc


check-cran:
	make doc
	make build
	R CMD check --as-cran ${TARBALL} -o ${CHKDIR}



