#
# Copyright (C) 2008-2014 The LuCI Team <luci@lists.subsignal.org>
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=usb support and auto mount.
LUCI_DEPENDS:=+kmod-usb-core +kmod-usb-ohci +kmod-usb-uhci +kmod-usb-storage +kmod-usb-storage-extras +kmod-usb2 +kmod-scsi-core +block-mount +badblocks +kmod-fs-ext4 +kmod-fs-vfat +kmod-fs-exfat +kmod-fs-ntfs +kmod-nls-cp437 +kmod-nls-iso8859-1 +kmod-nls-cp936 +kmod-nls-utf8 +fdisk +usbutils +ntfs-3g +blkid +kmod-usb-printer

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
