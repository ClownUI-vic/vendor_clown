CLOWN_MOD_VERSION := Reborn
CLOWN_ANDROID = 15.1
CLOWN_BUILD_TYPE ?= COMMUNITY
CLOWN_MAINTAINER ?= UNKNOWN

# Internal version
LINEAGE_VERSION := ClownUI-$(CLOWN_MOD_VERSION)-$(CLOWN_ANDROID)-$(LINEAGE_BUILD)-$(CLOWN_BUILD_TYPE)-$(shell date +%Y%m%d)

# Display version
LINEAGE_DISPLAY_VERSION := v$(CLOWN_ANDROID)-$(shell date +%Y%m%d)
CLOWN_VERSION:= $(LINEAGE_VERSION)

# Official Devies
ifeq ($(CLOWN_BUILD_TYPE), OFFICIAL)
   LIST = $(shell cat official/clown.devices)
    ifeq ($(filter $(LINEAGE_BUILD), $(LIST)), $(LINEAGE_BUILD))
      IS_OFFICIAL=true
      CLOWN_BUILD_TYPE := OFFICIAL
    endif
    ifneq ($(IS_OFFICIAL), true)
       CLOWN_BUILD_TYPE := COMMUNITY
       $(error Device is not official "$(LINEAGE_BUILD)")
    endif
endif

# ClownUI version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.clown.version=$(CLOWN_MOD_VERSION) \
    ro.clown.buildtype=$(CLOWN_BUILD_TYPE) \
    ro.clown.device=$(LINEAGE_BUILD) \
    ro.clown.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.clown.android=$(CLOWN_ANDROID) \
    ro.modversion=$(CLOWN_MOD_VERSION) \
    ro.aosp.revision=$(AOSP_REVISION) \
    ro.clown.maintainer=$(CLOWN_MAINTAINER)
