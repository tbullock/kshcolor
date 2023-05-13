.POSIX:

.PHONY: all clean install test

all: clean kshcolor.sh

ansicolours: preprocess_colours.sh
	@test -x preprocess_colours.sh || chmod +x preprocess_colours.sh
	./preprocess_colours.sh ansicolours

kshcolor.sh: colour_functions.sh ansicolours
	cat $? > $@

install: kshcolor.sh
	install -m 755 kshcolor.sh $(HOME)/bin/kshcolor.sh

test: kshcolor.sh
	@test -x test_colours.sh || chmod +x test_colours.sh
	./test_colours.sh

clean:
	rm -f ansicolours kshcolor.sh

