
all: paperback ebook

paperback: TheRealJoyG-paperback.pdf
ebook: TheRealJoyG-ebook.epub

.PHONY: TheRealJoyG-paperback.pdf
TheRealJoyG-paperback.pdf: TheRealJoyG-paperback.md paperback.yaml
	pandoc --standalone \
		--defaults=paperback.yaml \
		TheRealJoyG-paperback.md


.PHONY: TheRealJoyG-ebook.epub
TheRealJoyG-ebook.epub: TheRealJoyG-ebook.md ebook.yaml
	pandoc --standalone \
		--defaults=ebook.yaml \
		TheRealJoyG-ebook.md


.PHONY: basic.epub
basic.epub: basic.md ebook.yaml
	pandoc --standalone \
		--defaults=ebook.yaml \
		--output=basic.epub \
		basic.md
