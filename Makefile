# TARGET #

TARGET := 3DS
LIBRARY := 0

ifeq ($(TARGET),3DS)
    ifeq ($(strip $(DEVKITPRO)),)
        $(error "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro")
    endif

    ifeq ($(strip $(DEVKITARM)),)
        $(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
    endif
endif

# COMMON CONFIGURATION #

NAME := TIKdevil

BUILD_DIR := build
OUTPUT_DIR := output
INCLUDE_DIRS := include
SOURCE_DIRS := source

BUILD_FILTER := source/svchax/test/test.c

EXTRA_OUTPUT_FILES :=

LIBRARY_DIRS := $(DEVKITPRO)/libctru
LIBRARIES := ctru m

BUILD_FLAGS := -DVERSION_STRING="\"`git describe --tags --abbrev=0`\"" -DREVISION_STRING="\"`git rev-parse --short HEAD``git diff-index --quiet HEAD -- || echo ' (dirty)'`\""
RUN_FLAGS :=

VERSION_PARTS := $(subst ., ,$(shell echo "`git describe --tags --abbrev=0`.0.0" | cut -d "v" -f 2))
VERSION_MAJOR := $(word 1, $(VERSION_PARTS))
VERSION_MINOR := $(word 2, $(VERSION_PARTS))
VERSION_MICRO := $(word 3, $(VERSION_PARTS))

$(info Major Version: $(VERSION_MAJOR))
$(info Minor Version: $(VERSION_MINOR))
$(info Micro Version: $(VERSION_MICRO))
$(info )

# 3DS CONFIGURATION #

TITLE := $(NAME)
DESCRIPTION := Ticket Generator
AUTHOR := Kyraminol
PRODUCT_CODE := CTR-K-DEVIL
UNIQUE_ID := 0xD404

SYSTEM_MODE := 64MB
SYSTEM_MODE_EXT := Legacy

ICON_FLAGS :=

ROMFS_DIR := romfs
BANNER_AUDIO := audio.wav
BANNER_IMAGE := banner.png
ICON := icon.png

# INTERNAL #

include buildtools/make_base
