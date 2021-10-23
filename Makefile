.phony: all clean

PRIV = $(MIX_APP_PATH)/priv
BUILD = $(MIX_APP_PATH)/obj
NIF = $(PRIV)/libnif.so

ifeq ($(CROSSCOMPILE),)
	ifneq ($(shell uname -s),Linux)
		LDFLAGS += -undefined dynamic_lookup -dynamiclib
	else
		LDFLAGS += -fPIC -shared
		CFLAGS += -fPIC
	endif
else
	LDFLAGS += -fPIC -shared
	CFLAGS += -fPIC
endif

ifeq ($(ERL_EI_INCLUDE_DIR),)
	ERLANG_PATH = $(shell elixir --eval ':code.root_dir |> to_string() |> IO.puts')
	ifeq ($(ERLANG_PATH),)
		$(error Could not find the Elixir installation. Check to see that 'elixir')
	endif
	ERL_EI_INCLUDE_DIR = $(ERLANG_PATH)/usr/include
	ERL_EI_LIB_DIR = $(ERLANG_PATH)/usr/lib
endif

ERL_CFLAGS ?= -I$(ERL_EI_INCLUDE_DIR)
ERL_LDFLAGS ?= -L$(ERL_EI_LIBDIR)

CFLAGS += -std=c11 -O3 -Wall -Wextra -Wno-unused-function -Wno-unused-parameter -Wno-missing-field-initializers

SRC = c_src/libnif.c c_src/monochrome16.c c_src/monochrome32.c c_src/monochrome32i.c c_src/monochrome32ip.c
OBJ = $(SRC:c_src/%.c=$(BUILD)/%.o)

ASM_arm64 = c_src/arm64/monochrome16.s c_src/arm64/monochrome32.s c_src/arm64/monochrome32i.s c_src/arm64/monochrome32ip.s
ASM_aarch64 = $(ASM_arm64)
ASM_x86_64 = 

ASM = ${ASM_$(shell uname -m)}

all: $(PRIV) $(BUILD) $(NIF) $(ASM)

$(PRIV) $(BUILD):
	mkdir -p $@

$(BUILD)/%.o: c_src/%.c
	@echo " CC $(notdir $@)"
	$(CC) -c $(ERL_CFLAGS) $(CFLAGS) -o $@ $<

ifeq ($(shell uname -m),arm64)
c_src/arm64/%.s: c_src/%.c
	$(CC) -S $(ERL_CFLAGS) $(CFLAGS) -o $@ $<
endif

ifeq ($(shell uname -m),aarch64)
c_src/arm64/%.s: c_src/%.c
	$(CC) -S $(ERL_CFLAGS) $(CFLAGS) -o $@ $<
endif

$(NIF): $(OBJ)
	@echo " LD $(notdir $@)"
	$(CC) -o $@ $(ERL_LDFLAGS) $(LDFLAGS) $^

clean:
	$(RM) $(NIF) $(OBJ)
