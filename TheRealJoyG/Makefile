
all: paperback ebook

paperback: TheRealJoyG.pdf
ebook: TheRealJoyG.epub

.PHONY: TheRealJoyG.pdf
TheRealJoyG.pdf: TheRealJoyG-paperback.md paperback.yaml
	pandoc --standalone \
		--defaults=paperback.yaml \
		TheRealJoyG-paperback.md


.PHONY: TheRealJoyG.epub
TheRealJoyG.epub: TheRealJoyG-ebook.md ebook.yaml
	pandoc --standalone \
		--defaults=ebook.yaml \
		TheRealJoyG-ebook.md


.PHONY: basic.epub
basic.epub: basic.md ebook.yaml
	pandoc --standalone \
		--defaults=ebook.yaml \
		--output=basic.epub \
		basic.md
