PWD   = ${shell pwd}
BUILD = ${PWD}/build


TEX_FILES = $(shell find ${PWD} -iname '*.tex')
STY_FILES = $(shell find ${PWD} -iname '*.sty')

PDF_FILES = $(TEX_FILES:%.tex=${BUILD}/%.pdf)


XELATEX_FLAGS  = -halt-on-error -file-line-error -output-directory ${BUILD}


all: ${PDF_FILES}

clean:
	rm -rf ${BUILD}/*


${BUILD}/%.pdf: %.tex ${STY_FILES}
	xelatex ${XELATEX_FLAGS} $<
