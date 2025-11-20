.PHONY: TheRealJoyG.pdf
TheRealJoyG.pdf: TheRealJoyG.md paperback.yaml
	pandoc --standalone \
		--defaults=paperback.yaml \
		TheRealJoyG.md

TheRealJoyG.tex:
	pandoc --standalone \
		--defaults=paperback.yaml \
		--output=TheRealJoyG.tex \
		TheRealJoyG.md

.PHONY: basic.tex
basic.tex:
	pandoc --standalone \
		--defaults=paperback.yaml \
		--output=basic.tex \
		basic.md

.PHONY: basic.pdf
basic.pdf:
	pandoc --standalone \
		--defaults=paperback.yaml \
		--output=basic.pdf \
		basic.md
