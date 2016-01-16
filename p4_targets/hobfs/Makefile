################################################################
#
# Makefile for hobfs P4 project
#
################################################################

export TARGET_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

include ../../init.mk

ifndef P4FACTORY
P4FACTORY := $(TARGET_ROOT)/../..
endif
MAKEFILES_DIR := ${P4FACTORY}/makefiles

# This target's P4 name
export P4_INPUT := p4src/hobfs.p4
export P4_NAME := hobfs

# Common defines targets for P4 programs
include ${MAKEFILES_DIR}/common.mk

# Put custom targets in hobfs-local.mk
-include hobfs-local.mk

all:bm

