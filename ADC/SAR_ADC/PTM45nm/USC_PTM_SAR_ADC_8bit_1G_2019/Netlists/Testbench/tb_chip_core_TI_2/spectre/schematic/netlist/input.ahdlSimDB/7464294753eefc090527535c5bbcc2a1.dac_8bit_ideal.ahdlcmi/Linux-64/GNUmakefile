DELETE_CFILE := YES
BSRC_PRE_COMPILE := NO
AHDLCC := /home/Cadence/SPECTRE191/tools.lnx86/spectre/ahdlcmi/bin/64bit/ahdlcc
ENCRYPTED_MOD := 0
# -*- mode: makefile -*-
# -*- eval: font-lock-fontify-buffer -*-

# Copyright (c) 2003 Cadence Design Systems, Inc. All rights reserved.
# This work may not be copied, modified, re-published, uploaded, executed, or
# distributed in any way, in any medium, whether in whole or in part, without
# prior written permission from Cadence Design Systems, Inc.

# Environment is supplied by ahdlcmicompile; this is just for convenience
ifndef AHDLCMI_ROOT
    AHDLCMI_ROOT	:= $(shell cds_root spectre)
endif
ifndef NCROOT_OVERRIDE
    NCROOT_OVERRIDE	:= $(AHDLCMI_ROOT)
    export NCROOT_OVERRIDE
endif
ifndef AHDLCMI_PLATFORM
    ifdef WIN32
      AHDLCMI_PLATFORM	:= win32
    else
      AHDLCMI_PLATFORM	:= $(shell cds_plat)
    endif
endif
ifndef AHDLCMI_TOOLS
  AHDLCMI_TOOLS		:= $(AHDLCMI_ROOT)/tools.$(AHDLCMI_PLATFORM)
endif
ifndef AHDLCMI_OPTMODE
  AHDLCMI_OPTMODE := optimize
endif
ifndef AHDLCMI_GCCOPTTYPE 
    AHDLCMI_GCCOPTTYPE := AHDLCMI_OPTMODE 
endif
ifndef CMI_VERSION
   CMI_VERSION := 5.0
endif   
# CONFIG_ROOT is the directory containing the GNUmake configuration files
AHDLCMI		:= $(AHDLCMI_TOOLS)/spectre/ahdlcmi
CONFIG_ROOT	:= $(AHDLCMI)/etc

# Standard variables for platform and compiler
include $(CONFIG_ROOT)/ahdlcmi.variables

# OBJDIR is the platform dependent object hierarchy.
# remove one dir level AHDLCMI_SYSNAME, because we move the dir level to
# just below *.ahdlcmi, so source code and obj are all platform dependent 
OBJDIR := ./obj/$(AHDLCMI_OPTMODE)/$(CMI_VERSION)

# Make sure that all directories are created
dummy		 := $(shell [ -d $(OBJDIR) ] || $(MKDIR) $(OBJDIR))


default : all

# Ahdlcmi device library for ahdlcmi
DEVICELIST	:= ahdlcmidevicelist
ifdef DEVICENAME
	SHLIB_NAME	:= ahdlcmi_$(DEVICENAME)
else
	SHLIB_NAME	:= ahdlcmi
endif
SRCS := $(foreach bdev, $(shell cat $(DEVICELIST)), $(bdev).c)
OBJS := $(addprefix $(OBJDIR)/, $(SRCS:.c=.o))

# Standard rules for platform and compiler
include $(CONFIG_ROOT)/ahdlcmi.rules
