#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=4G-module-supports
PKG_VERSION:=4.500
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/4G-module-supports
  SECTION:=utils
  CATEGORY:=Network
  DEPENDS:=+kmod-usb-net +kmod-usb-net-cdc-ether +kmod-usb-net-huawei-cdc-ncm \
	    +kmod-usb-net-cdc-mbim +kmod-usb-net-qmi-wwan +kmod-usb-net-rndis \
	    +kmod-usb-net-sierrawireless +kmod-usb-ohci +kmod-usb-serial \
	    +kmod-usb-serial-option +kmod-usb-serial-sierrawireless \
	    +kmod-usb-uhci +kmod-usb2 +luci-proto-3g +luci \
	    +usb-modeswitch +wireless-tools +wpad-mini
  TITLE:=3G/4G support for usbmodems
  PKGARCH:=all
endef

define Package/4G-module-supports/description
  Helper scripts to enable 4G to manage usb modem interfaces
endef


define Build/Compile
endef

define Package/4G-module-supports/install
	$(CP) ./files/* $(1)/


endef

$(eval $(call BuildPackage,4G-module-supports))
