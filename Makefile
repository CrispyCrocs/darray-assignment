
CC = gcc
CFLAGS = -Wall -g


SRC_DIR = src
LIB_DIR = lib
BIN_DIR = bin
TEST_DIR = test
INCLUDE_DIR = include


LIBRARY = $(LIB_DIR)/libdarray.a
TEST_BINARY = $(BIN_DIR)/darray_test


SRC = $(SRC_DIR)/darray.c
OBJ = $(SRC:.c=.o)


all: $(LIBRARY) $(TEST_BINARY)
	@echo "Running unit tests:"
	./$(TEST_BINARY)


$(LIBRARY): $(OBJ)
	@mkdir -p $(LIB_DIR)
	ar rcs $(LIBRARY) $(OBJ)


$(TEST_BINARY): $(LIBRARY) $(TEST_DIR)/darray_test.c
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -o $(TEST_BINARY) $(TEST_DIR)/darray_test.c -L$(LIB_DIR) -ldarray


%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@


clean:
	rm -f $(SRC_DIR)/*.o $(LIB_DIR)/*.a $(BIN_DIR)/*

.PHONY: all clean
