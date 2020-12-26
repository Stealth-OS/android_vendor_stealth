# Kernel
include vendor/stealth/config/BoardConfigKernel.mk

# Qcom-specific bits
ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/stealth/config/BoardConfigQcom.mk
endif

# Soong
include vendor/stealth/config/BoardConfigSoong.mk
