PWD   = ${shell pwd}
TEX   = ${PWD}/tex
BUILD = ${PWD}/build

TEX_FILES = $(shell find ${TEX} -iname '*.tex')
PDF_FILES = $(TEX_FILES:${TEX}/%.tex=${BUILD}/%.pdf)

XELATEX_FLAGS  = -halt-on-error -file-line-error -output-directory ${BUILD}


all: ${PDF_FILES}

${BUILD}/%.pdf: ${TEX}/%.tex cheatsheet.sty
	xelatex ${XELATEX_FLAGS} $<

clean:
	rm -rf ${BUILD}/*
