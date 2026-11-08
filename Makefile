
PAPER = paper
TEX := $(wildcard *.tex)
BIB := $(wildcard *.bib)
OUTPUTS=$(subst .pdf,%,$(PLOTS))

LATEX = pdflatex
BIBTEX = bibtex


$(OUTPUTS) : $(INPUTS) $(SCRIPTS)
	gnuplot plots.gpi


all:
	make all -C figs
	make $(PAPER).pdf

paper:
	make $(PAPER).pdf

%.pdf : %.tex
	$(LATEX) $<
	$(BIBTEX) $(subst .tex,,$<)
	$(LATEX) $<
	$(LATEX) $<

clean:
	make clean -C figs
	rm -f $(PAPER).aux $(PAPER).bbl $(PAPER).blg $(PAPER).log $(PAPER).out $(PAPER).pdf

clean_paper:
	rm -f $(PAPER).aux $(PAPER).bbl $(PAPER).blg $(PAPER).log $(PAPER).out $(PAPER).pdf

