#!/bin/sh

pandoc --smart --table-of-contents --number-sections --bibliography=src/bibliography.bib --csl=src/ieee.csl --output=tutorial.pdf src/tutorial.md
