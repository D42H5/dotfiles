CC:=clang
CFLAGS:=-Wall -g

# Source file variables
SRCS:=$(wildcard *.c)
SRCS_O:=$(SRCS:.c=.o)

# Getting specifically header files and corresponding source files
HEADER_FILES:=$(wildcard *.h)
HEADERS_O:=$(HEADER_FILES:.h=.o)

# LIB=name of final executable returned
LIB:=
BINS:= $(LIB) $(SRCS_O)

# Test file variables
TEST_DIR:=tests
TEST_SRCS:=$(wildcard $(TEST_DIR)/test*.c)
TEST_O:=$(TEST_SRCS:.c=.o)
TEST_EXES:=$(TEST_O:.o=)

# Default compile rule for .c files
%.o: %.c 
	@$(CC) $(CFLAGS) -c $< -o $@

%: %.o
	@#$(CC) $(CFLAGS) -o $@ $< $(LIB)
	@$(CC) $(CFLAGS) -o $@ $< $(HEADERS_O)

all: $(BINS)

$(LIB): $(SRCS_O)
	@#if [ -f ./$@ ]; then rm $@; fi
	@#ar -crvs $@ $(SRCS_O) 
	@$(CC) $(CFLAGS) -o $@ $(SRCS_O)

test: $(BINS) $(TEST_O) $(TEST_EXES)

# Run every test in TEST_DIR
runtest: test
	@for i in $(TEST_EXES); do\
		echo "===============================";\
		echo "Running ./$$i";\
		echo "";\
		./$$i && sleep 0.1;\
		echo "";\
	done

tar:
	tar cvzf %project_dir%.tgz README Makefile *.h *.c

clean:
	@rm -f $(BINS) $(TEST_O) $(TEST_EXES)

