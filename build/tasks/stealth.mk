#
# Copyright (C) 2018-2019 The Pixel3ROM Project
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2020 StormbreakerOSS
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

#
# Build system colors
#
# PFX: Prefix "target C++:" in yellow
# INS: Module "Install:" output color (cyan for ics)

ifneq ($(BUILD_WITH_COLORS),0)
  CL_PFX="\033[33m"
  CL_INS="\033[36m"
  CL_RED="\033[31m"
  CL_GRN="\033[32m"
  CL_YLW="\033[33m"
  CL_BLU="\033[34m"
  CL_MAG="\033[35m"
  CL_CYN="\033[36m"
  CL_RST="\033[0m"
endif

PLATFORM_STEALTH_RELEASE := StealthOS 1.0
STEALTH_VERSION := $(PLATFORM_STEALTH_RELEASE).$(shell date +%m%d%H%M)

TARGET_FILES_PACKAGE := $(PRODUCT_OUT)/$(STEALTH_VERSION).zip

.PHONY: stealth
stealth: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(TARGET_FILES_PACKAGE)
        @echo "Build Success! , Find the package at: $(TARGET_FILES_PACKAGE)" >&2

