# Copyright (C) 2020 MSM-Xtended Project
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
LOCAL_PATH := $(call my-dir)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

DEVICE_PACKAGE_OVERLAYS += vendor/xtras/overlay/common
ifeq ($(EXTRA_FOD_ANIMATIONS),true)
DEVICE_PACKAGE_OVERLAYS += vendor/xtras/overlay/fod
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += vendor/xtras/overlay/fod
endif

# Include Xtended theme files
include vendor/xtras/themes/themes.mk

# Include Xtended font files
include vendor/xtras/fonts/fonts.mk

# Include Xtended QS Style files
include vendor/xtras/QS/qsstyle.mk

# Include Xtended Switch Styles
include vendor/xtras/Switch/switch.mk

# Include Xtended Qs Tile Styles
include vendor/xtras/QsThemes/qstheme.mk

# Include Gvm Styles
include vendor/xtras/Gvm/gvm.mk

# Xtended packages
PRODUCT_PACKAGES += \
    VinylMusicPlayer \
    GalleryPrebuilt \
    GBoardPrebuilt \
    SafetyHubPrebuilt \
    SettingsIntelligenceGooglePrebuilt \
    ViaBrowser

# Ship lawnchair instead of launcher3
ifeq ($(SHIP_LAWNCHAIR),true)

PRODUCT_PACKAGES += \
    Lawnchair

PRODUCT_COPY_FILES += \
    vendor/xtras/config/permissions/privapp-permissions-lawnchair.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-lawnchair.xml \
    vendor/xtras/config/permissions/lawnchair-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/lawnchair-hiddenapi-package-whitelist.xml

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/xtras/lawnchairoverlay

endif

#End
