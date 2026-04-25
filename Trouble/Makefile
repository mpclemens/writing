# targets for revising and edits

RAWTEXT_DIR = ${HOME}/Documents/Writing/Trouble/rawtext/Draft

phrases:
	@# take an argument for the number of words in the phrase, 2 or more
	@ # extract just the phrase without the filename, normalize the case, and count the occurrences of each unique phrase
	@read -p "Enter the number of words in the phrase: " n; \
	REPS=$$((n-1)); \
	grep -hEo "\b(\w+\s+){$$REPS}\w+\b" $(RAWTEXT_DIR)/*.txt | tr '[:upper:]' '[:lower:]' | sort | uniq -c | sort -rn | head -n 20
