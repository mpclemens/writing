
all: paperback epub

paperback: TheRealJoyG.pdf
epub: TheRealJoyG.epub

.PHONY: TheRealJoyG.pdf
TheRealJoyG.pdf: TheRealJoyG.md paperback.yaml
	pandoc --standalone \
		--defaults=paperback.yaml \
		TheRealJoyG.md


.PHONY: TheRealJoyG.epub
TheRealJoyG.epub: TheRealJoyG.md epub.yaml
	pandoc --standalone \
		--defaults=epub.yaml \
		TheRealJoyG.md
