NASM = nasm
LD = ld
NASMFLAGS = -f elf32 -I include/
LDFLAGS = -m elf_i386

SRC_DIR = src
TEST_DIR = tests
OBJ_DIR = obj

LIB_SRCS = $(filter-out $(SRC_DIR)/main.asm, $(wildcard $(SRC_DIR)/*.asm))
LIB_OBJS = $(patsubst $(SRC_DIR)/%.asm, $(OBJ_DIR)/%.o, $(LIB_SRCS))

TEST_OBJ = $(OBJ_DIR)/test_main.o

all: $(OBJ_DIR) program

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm
	$(NASM) $(NASMFLAGS) $< -o $@

$(TEST_OBJ): $(TEST_DIR)/main.asm
	$(NASM) $(NASMFLAGS) $< -o $@

program: $(LIB_OBJS) $(TEST_OBJ)
	$(LD) $(LDFLAGS) -o program $(LIB_OBJS) $(TEST_OBJ)

clean:
	rm -rf $(OBJ_DIR) program

.PHONY: all clean
