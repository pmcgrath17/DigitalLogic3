PROJECT=main

build/${PROJECT}.pdf: build/${PROJECT}.bbl
	pdflatex --output-directory=build ${PROJECT}

build/${PROJECT}.bbl: build/${PROJECT}.bcf
	biber build/${PROJECT}

build/${PROJECT}.bcf: ${PROJECT}.tex
	pdflatex --output-directory=build ${PROJECT}

open:
	cygstart build/${PROJECT}.pdf

clean:
	rm -f build/*