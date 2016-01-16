################################################################
#
# Makefile for hp4t_l2_switch P4 project
#
################################################################

export TARGET_ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))

include ../../init.mk

ifndef P4FACTORY
P4FACTORY := $(TARGET_ROOT)/../..
endif
MAKEFILES_DIR := ${P4FACTORY}/makefiles

# This target's P4 name
export P4_INPUT := p4src/hp4t_l2_switch.p4
export P4_NAME := hp4t_l2_switch

# Common defines targets for P4 programs
include ${MAKEFILES_DIR}/common.mk

# Put custom targets in hp4t_l2_switch-local.mk
-include hp4t_l2_switch-local.mk

all:bm

