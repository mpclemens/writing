
all: paperback epub

paperback: TheRealJoyG.pdf
epub: TheRealJoyG.epub

.PHONY: TheRealJoyG.pdf
TheRealJoyG.pdf: TheRealJoyG-paperback.md paperback.yaml
	pandoc --standalone \
		--defaults=paperback.yaml \
		TheRealJoyG-paperback.md


.PHONY: TheRealJoyG.epub
TheRealJoyG.epub: TheRealJoyG-ebook.md epub.yaml
	pandoc --standalone \
		--defaults=epub.yaml \
		TheRealJoyG-ebook.md


.PHONY: basic.epub
basic.epub: basic.md epub.yaml
	pandoc --standalone \
		--defaults=epub.yaml \
		--output=basic.epub \
		basic.md
