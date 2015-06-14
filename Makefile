TEX = latex --shell-escape -interaction=nonstopmode
BIB = bibtex

all: proposal.pdf

.PHONY: clean purge
	
proposal.pdf: proposal.ps
	ps2pdf $<

proposal.ps: proposal.dvi
	dvips $<

proposal.dvi: proposal.tex proposal.bib
	$(TEX) proposal.tex
	$(BIB) proposal.aux
	$(TEX) proposal.tex
	$(TEX) proposal.tex

.PHONY: clean mrproper

clean:
	@rm -f *.bbl *.dvi *.log *.ps *.aux *.blg *.out

mrproper: clean
	@rm -f proposal.pdf

purge: clean all
