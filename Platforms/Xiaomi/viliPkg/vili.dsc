##
#  Copyright (c) 2011 - 2022, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2020, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#  Copyright (c) Microsoft Corporation.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = vili
  PLATFORM_GUID                  = 1EAD32CE-3165-49EB-A92D-E88A42572002
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/viliPkg
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = RELEASE|DEBUG
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = viliPkg/vili.fdf
  USE_CUSTOM_DISPLAY_DRIVER      = 0
  AB_SLOT_SUPPORT                = 1
  HAS_BUILD_IN_KEYBOARD          = 0

  #
  # 0 = SM8350
  # 1 = SM8350-AB
  # 2 = SM8350-AC
  #
  SOC_TYPE                       = 0

[BuildOptions]
  *_*_*_CC_FLAGS = -DSOC_TYPE=$(SOC_TYPE) -DAB_SLOT_SUPPORT=$(AB_SLOT_SUPPORT) -DHAS_BUILD_IN_KEYBOARD=$(HAS_BUILD_IN_KEYBOARD)

[LibraryClasses]
  DeviceMemoryMapLib|viliPkg/Library/DeviceMemoryMapLib/DeviceMemoryMapLib.inf
  DeviceConfigurationMapLib|viliPkg/Library/DeviceConfigurationMapLib/DeviceConfigurationMapLib.inf
  DevicePrePiLib|viliPkg/Library/DevicePrePiLib/DevicePrePiLib.inf

[PcdsFixedAtBuild]
  # DDR Start Address
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000 

  # Device Maintainer
  gSiliciumPkgTokenSpaceGuid.PcdDeviceMaintainer|"No Maintainer"

  # CPU Vector Address
  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x9FF8C000

  # UEFI Stack Addresses
  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x9FF90000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000 

  # SmBios
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemVendor|"Xiaomi Inc"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemModel|"11T Pro"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"vili"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"11T_Pro_vili"
  gSiliciumPkgTokenSpaceGuid.PcdSmbiosBoardModel|"11T Pro"

  # Simple FrameBuffer
  gSiliciumPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1080
  gSiliciumPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2400
  gSiliciumPkgTokenSpaceGuid.PcdMipiFrameBufferColorDepth|32

  # XBL Protocol
  gQcomPkgTokenSpaceGuid.PcdScheduleInterfaceAddr|0x9FC37980

  # Dynamic RAM Start Address
  gQcomPkgTokenSpaceGuid.PcdRamPartitionBase|0xECA00000

  # Memory Protection
  gQcomPkgTokenSpaceGuid.PcdMemoryProtection|TRUE

  # SD Card Slot
  gQcomPkgTokenSpaceGuid.PcdInitCardSlot|FALSE

  # USB Controller
  gQcomPkgTokenSpaceGuid.PcdStartUsbController|TRUE

[PcdsDynamicDefault]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|2400
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|2400
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|126
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|126

!include SM8350Pkg/SM8350Pkg.dsc.inc
