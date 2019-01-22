#IDIR =../include
IDIR =./include/
CC=gcc
CFLAGS=-I$(IDIR)

ODIR=obj
#LDIR =../lib
LDIR =./lib

LIBS=-lm

_DEPS = hellomake.h
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = hellomake.o hellofunc.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

TARGETS :=hellomake
all: clean $(TARGETS)
	./$(TARGETS)


$(ODIR)/%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

hellomake: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)
	@echo "OBJ below "
	@echo $(OBJ)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 
