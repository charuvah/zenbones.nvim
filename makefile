UNAME_S := $(shell uname -s)
LUAJIT_CFLAGS ?= $(shell pkg-config --cflags luajit)
LUSH_RTP ?= $(HOME)/.local/share/nvim/lazy/lush.nvim
QUICKSILVER_EXTRA_RTP ?= $(LUSH_RTP)
QUICKSILVER_EXTRA_RTP_CMDS := $(foreach path,$(QUICKSILVER_EXTRA_RTP),--cmd 'set rtp+=$(path)')

ifeq ($(UNAME_S),Darwin)
QUICKSILVER_LDFLAGS := -bundle -undefined dynamic_lookup
else
QUICKSILVER_LDFLAGS := -shared
endif

QUICKSILVER_DIR := dist/quicksilver.nvim
QUICKSILVER_NATIVE := $(QUICKSILVER_DIR)/lua/quicksilver/native.so
QUICKSILVER_SOURCE := $(QUICKSILVER_DIR)/lua/quicksilver/native.c

make:
	nvim --headless -u NORC \
		--cmd 'set rtp+=.' \
		--cmd 'lua require("zenbones.shipwright").run()' \
		--cmd 'q'

quicksilver: quicksilver-generate quicksilver-compile

quicksilver-generate:
	nvim --headless -u NORC -i NONE \
		--cmd 'set rtp+=.' \
		$(QUICKSILVER_EXTRA_RTP_CMDS) \
		--cmd 'lua require("quicksilver.build").generate_or_exit()' \
		--cmd 'q'

quicksilver-compile: $(QUICKSILVER_SOURCE)
	cc -O2 -fPIC $(LUAJIT_CFLAGS) $(QUICKSILVER_LDFLAGS) \
		-o $(QUICKSILVER_NATIVE) $(QUICKSILVER_SOURCE)
