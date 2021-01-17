
#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2020 StealthOSS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
PLATFORM_STEALTH_RELEASE := StealthOS 1.0
STEALTH_VERSION := $(PLATFORM_STEALTH_RELEASE).$(shell date +%m%d%H%M)

# Versioning System
STEALTH_BUILD_VERSION = 1.0
STEALTH_FLAVOUR = Alpha
STEALTH_BUILD_TYPE ?= UNOFFICIAL
STEALTH_BUILD_MAINTAINER ?= Unofficial maintainer

# Stealth Release
ifeq ($(STEALTH_BUILD_TYPE), OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat vendor/stealth/stealth.devices)
  FOUND_DEVICE =  $(filter $(STEALTH_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(STEALTH_BUILD))
      STEALTH_BUILD_TYPE := OFFICIAL
    else
      STEALTH_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(STEALTH_BUILD)")
    endif
endif

# System version
TARGET_PRODUCT_SHORT := $(subst stealth_,,$(STEALTH_BUILD_TYPE))

STEALTH_DATE_YEAR := $(shell date -u +%Y)
STEALTH_DATE_MONTH := $(shell date -u +%m)
STEALTH_DATE_DAY := $(shell date -u +%d)
STEALTH_DATE_HOUR := $(shell date -u +%H)
STEALTH_DATE_MINUTE := $(shell date -u +%M)

STEALTH_BUILD_DATE := $(STEALTH_DATE_YEAR)$(STEALTH_DATE_MONTH)$(STEALTH_DATE_DAY)-$(STEALTH_DATE_HOUR)$(STEALTH_DATE_MINUTE)
STEALTH_BUILD_FINGERPRINT := StealthOS/$(STEALTH_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(STEALTH_BUILD_DATE)
STEALTH_VERSION := StealthOS-$(PLATFORM_VERSION)-$(STEALTH_BUILD_VERSION)-$(STEALTH_BUILD_TYPE)-$(STEALTH_BUILD)-$(STEALTH_BUILD_DATE)


PRODUCT_GENERIC_PROPERTIES += \
  ro.stealth.device=$(STEALTH_BUILD) \
  ro.stealth.version=$(STEALTH_VERSION) \
  ro.stealth.build.version=$(STEALTH_BUILD_VERSION) \
  ro.stealth.build.type=$(STEALTH_BUILD_TYPE) \
  ro.stealth.build.date=$(STEALTH_BUILD_DATE) \
  ro.stealth.build.fingerprint=$(STEALTH_BUILD_FINGERPRINT) \
  ro.stealth.build.maintainer=$(STEALTH_BUILD_MAINTAINER) \
  ro.stealth.build.donate_url=$(STEALTH_BUILD_DONATE_URL) \
  ro.stealth.build.support_url=$(STEALTH_BUILD_SUPPORT_URL)
