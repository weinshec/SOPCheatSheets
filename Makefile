TEX   = tex
BUILD = build

TEX_FILES = $(shell find ${TEX} -iname '*.tex')
PDF_FILES = $(TEX_FILES:${TEX}/%.tex=${BUILD}/%.pdf)

XELATEX_FLAGS  = -halt-on-error -file-line-error -output-directory ${BUILD}


all: ${PDF_FILES}

${BUILD}/%.pdf: ${TEX}/%.tex cheatsheet.sty | ${BUILD}
	xelatex ${XELATEX_FLAGS} $<

${BUILD}:
	mkdir -p ${BUILD}

clean:
	rm -rf ${BUILD}/*
