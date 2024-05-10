TARGET := macosx:clang::10.9

SIMBLTWEAK_NAME = QEMUBackground
QEMUBackground_FILES = Tweak.x Tweak_Sonoma.x
QEMUBackground_CFLAGS = -fobjc-arc
QEMUBackground_LIBRARIES = dobby_mac

ADDITIONAL_CFLAGS += -Wno-error=unused-variable -Wno-error=unused-function -Wno-error=unused-value -include Prefix.pch

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/simbltweak.mk
