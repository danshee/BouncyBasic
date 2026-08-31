# Default target if none is given
TARGET  ?= c64

PROGRAM  = bouncy-$(TARGET).prg
SOURCES  = bouncy.bas

PC       = petcat

# Commodore machines you can build with: make c64 / make c16 / ...
MACHINES = c64 c16 plus4 vic20

# VICE binary + extra flags for `make run`
ifeq ($(TARGET),c64)
EMU      = x64sc
EMUFLAGS =
BASIC    = 2
else ifeq ($(TARGET),c16)
EMU      = xplus4
EMUFLAGS = -model c16
BASIC    = 3
else ifeq ($(TARGET),plus4)
EMU      = xplus4
EMUFLAGS = -model plus4
BASIC    = 3
else ifeq ($(TARGET),vic20)
EMU      = xvic
EMUFLAGS =
BASIC    = 2
else
EMU      =
EMUFLAGS =
BASIC    = 2
endif

.PHONY: all clean run help $(MACHINES) $(addprefix run-,$(MACHINES))

all: $(PROGRAM)

$(PROGRAM): $(SOURCES)
	$(PC) -w$(BASIC) -o $(PROGRAM) -- $(SOURCES)

# make c64  /  make c16  /  ...
$(MACHINES):
	$(MAKE) TARGET=$@ all

clean:
	$(RM) bouncy-*.prg

run: $(PROGRAM)
ifeq ($(EMU),)
	$(error No VICE mapping for TARGET=$(TARGET). Start an emulator manually.)
endif
	$(EMU) $(EMUFLAGS) -autostart $(PROGRAM)

# make run-c64  /  make run-c16  /  ...
$(addprefix run-,$(MACHINES)):
	$(MAKE) TARGET=$(patsubst run-%,%,$@) run

help:
	@echo "Build:  make                 # default TARGET=$(TARGET)"
	@echo "        make TARGET=c16"
	@echo "        make c64 | c16 | plus4 | vic20"
	@echo "Run:    make run             # uses current/default TARGET"
	@echo "        make run TARGET=c16"
	@echo "        make run-c16"