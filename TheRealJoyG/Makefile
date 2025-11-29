
all: paperback ebook

.PHONY: paperback.pdf
paperback: paperback.pdf
paperback.pdf: paperback.md paperback.yaml
	pandoc --standalone --defaults=paperback.yaml

.PHONY: ebook.epub
ebook: ebook.epub
ebook.epub: ebook.md ebook.yaml
	pandoc --standalone --defaults=ebook.yaml
