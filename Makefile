TYPST := $(shell command -v typst 2>/dev/null)
MKDOCS := .venv/bin/mkdocs
PDFDIR := docs/pdfs

TYP_FILES := $(shell find . -name '*.typ' ! -name '_*.typ' ! -path './.git/*' ! -path './docs/*' ! -path './site/*')
PDF_FILES := $(patsubst ./%.typ,$(PDFDIR)/%.pdf,$(TYP_FILES))

.PHONY: all clean serve build-mkdocs help

all: $(PDF_FILES)

$(PDFDIR)/%.pdf: ./%.typ
	@mkdir -p "$(dir $@)"
	@if [ -n "$(TYPST)" ]; then \
		typst compile "$<" "$@"; \
	else \
		echo "ERROR: typst not installed"; exit 1; \
	fi

serve: all
	@if [ -n "$(MKDOCS)" ]; then \
		mkdocs serve; \
	else \
		echo "ERROR: mkdocs not installed"; exit 1; \
	fi

build-mkdocs: all
	@if [ -n "$(MKDOCS)" ]; then \
		mkdocs build; \
	else \
		echo "ERROR: mkdocs not installed"; exit 1; \
	fi

help:
	@echo "Targets:"
	@echo "  all          Build all PDFs from .typ sources"
	@echo "  serve        Build PDFs and start mkdocs dev server"
	@echo "  build-mkdocs Build PDFs and build static mkdocs site"
	@echo "  clean        Remove generated PDFs"

clean:
	rm -rf $(PDFDIR)/* site/
