# targets for revising and edits

RAWTEXT_DIR = ${HOME}/Documents/Writing/Trouble/rawtext/Draft


all: paperback ebook

.PHONY: paperback.pdf
paperback: paperback.pdf
paperback.pdf: paperback.md paperback.yaml
	pandoc --standalone --defaults=paperback.yaml

.PHONY: paperback.tex
paperback.tex: paperback.md paperback.yaml
	pandoc --standalone --defaults=paperback.yaml --to=latex -o paperback.tex


.PHONY: ebook.epub
ebook: ebook.epub
ebook.epub: ebook.md ebook.yaml
	pandoc --standalone --template=ebook.pandoc --defaults=ebook.yaml --metadata-file=images.yaml

phrases:
	@# take an argument for the number of words in the phrase, 2 or more
	@ # extract all occurrences of the phrase without the filename, normalize the case, and count the occurrences of each unique phrase
	@read -p "Enter the number of words in the phrase: " n; \
	REPS=$$((n-1)); \
	grep -hEo "\b(\w+\s+){$$REPS}\w+\b" $(RAWTEXT_DIR)/*.txt | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn | head -n 20
