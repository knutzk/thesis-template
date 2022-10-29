# PhD thesis template

This repository contains a template for a PhD thesis.
The typesetting and format is adjusted to the requirements at the University of Göttingen / GAUSS, but can in principle be adapted very quickly.

The `tex` subfolder the chapters of the thesis.
In addition, the main folder contains the following files necessary for compilation:

- `dissertation-bib.bib`: bibliography file for biblatex/biber
- `dissertation-defs.sty`: custom definitions (i.e. tex commands) used throughout the thesis
- `dissertation.tex`: the main document
- `ktxbbltx.sty`: package definition file for a custom bibliography format
- `ktxthss.cls`: class file used for the thesis

Compilation was tested with texlive 2018 and newer and worked in all scenarios.


## Requirements

The class file and bibliography configuration rely on the *basic scheme* of the texlive 2018 distribution plus the following packages:
- biber         -- Bibtex replacement for users of the biblatex package
- biblatex      -- Sophisticated bibliographies in latex
- etoolbox      -- e-tex tools for Latex (dependee: biblatex)
- logreq        -- Support for automation of the latex workflow (dependee: biblatex)
- booktabs      -- Publication-quality tables in latex
- caption       -- Customising captions in floating environments
- setspace      -- Set space between lines (used for settings of package caption)
- cleveref      -- Intelligent cross-referencing
- ec            -- Computer modern fonts in T1 and TS1 encodings
- csquotes      -- Context sensitive quotation facilities
- enumitem      -- Control layout of itemize, enumerate, description
- koma-script   -- A bundle of versatile classes and packages
- l3kernel      -- latex3 programming conventions (dependee: siunitx)
- l3packages    -- High-level latex3 concepts (dependee: siunitx)
- leading       -- Define leading with a length
- lm            -- Latin modern fonts in outline formats
- microtype     -- Subliminal refinements towards typographical perfection
- multirow      -- Create tabular cells spanning multiple rows
- siunitx       -- A comprehensive (SI) units package
- times         -- Adobe Times Roman (xfrac uses symbols from times with CM)
- xcolor        -- Driver-independent color extensions for latex and pdflatex
- xkeyval       -- Extension of the keyval package
- xstring       -- String manipulation for (la)tex


## Compiling the thesis

With all necessary requirements installed, the thesis can be compiled with:
```bash
pdflatex dissertation.tex
biber dissertation
pdflatex dissertation.tex
pdflatex dissertation.tex
```

## Setup in a docker image

The dissertation comes with a docker configuration file that includes the necessary texlive 2018 *basic scheme* plus the above list of packages.
The image build instructions are based on ubuntu 16.04.
The docker image is published on docker hub, but can also be generated with 
```bash
docker build -t knutzk/latex-basic:v0.1 .
```
