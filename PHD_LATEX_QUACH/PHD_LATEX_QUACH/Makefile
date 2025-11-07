# ======================================================================
# Makefile for LaTeX manuscripts using manuscript.cls
# ======================================================================

# Name of your main LaTeX file (without .tex)
MAIN=main

# PDF output
PDF=$(MAIN).pdf

# Default target
all: $(PDF)

# Compile PDF (runs pdflatex + bibtex + pdflatex twice)
$(PDF): $(MAIN).tex references.bib
	@echo "Running pdflatex..."
	pdflatex $(MAIN).tex
	@echo "Running bibtex..."
	bibtex $(MAIN)
	@echo "Running pdflatex twice..."
	pdflatex $(MAIN).tex
	pdflatex $(MAIN).tex
	@echo "Done. PDF generated: $(PDF)"

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	rm -f *.aux *.bbl *.blg *.log *.toc *.out *.lof *.lot

# Clean everything including PDF
cleanall: clean
	@echo "Removing PDF file..."
	rm -f $(PDF)

# Just compile without bibtex
nocite:
	@echo "Running pdflatex only..."
	pdflatex $(MAIN).tex
	pdflatex $(MAIN).tex

# Phony targets
.PHONY: all clean cleanall nocite
