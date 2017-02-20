CC = crystal
BINNAME = hl1_mapgen
BIN = bin/$(BINNAME)
SRC = src/hl1_mapgen.cr
COMPILE = $(CC) build $(SRC) -o $(BIN)
RELEASE = --release
DEBUG = --debug

all:
	$(COMPILE) $(RELEASE)

debug:
	$(COMPILE) $(DEBUG)

run:
	$(BIN)

clean:
	rm -f $(BIN)
