
LATEX=latex
RM=rm -fv

.PHONY: FORCE all mostlyclean clean distclean maintainer-clean \

all: m5bsp-mv.pdf FORCE

beispiele: alessia.pdf FORCE

%.dvi: %.tex
	latex $*

%.ps: %.dvi
	dvips $* -o

%.pdf: %.ps
	ps2pdf $*

%.pdf: %.tex
	pdflatex $*

%.pdf: beispiele/%.tex
	pdflatex $<

mostlyclean: FORCE
	@$(RM) -- .log *.log *.blg *.dlg *.ilg *.thm _region_.*
	@for F in *.prv; do test -d "$$F" && $(RM) -rf -- "$$F" || : ; done

clean: FORCE mostlyclean
	@$(RM) -- *.dvi *.ps

distclean: FORCE clean
	@$(RM) -- *.aux *.toc *.lof *.lot *.glo *.idx *.out *.ind *.pdf *.eps $(SYMLINKS)

maintainer-clean: FORCE distclean

FORCE:
