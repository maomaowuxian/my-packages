#############################################################################################################################################################
# luci-app-ups_monitor is a luci app for UPS. It can be view ups data. When power cut, the app will auto poweroff the router to prevent harddisk damaged.
# written by ray 
# yukikolau@gmail.com
#############################################################################################################################################################


include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-ups_monitor
PKG_VERSION:=0.1
PKG_RELEASE:=1


PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-ups_monitor/Default
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for UPS monitor
	PKGARCH:=all
	DEPENDS:=+nut +nut-server +nut-upsc
endef

Package/luci-app-ups_monitor = $(call Package/luci-app-ups_monitor/Default)

define Package/luci-app-ups_monitor/description
	LuCI Support for UPS monitor.
endef


define Build/Configure
endef

define Build/Compile
endef


#define Package/luci-app-ups_monitor/conffiles
#/etc/config/ups
#endef

define Package/luci-app-ups_monitor/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/luci/controller/*.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./files/luci/model/cbi/*.lua $(1)/usr/lib/lua/luci/model/cbi/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_BIN) ./files/root/etc/config/ups $(1)/etc/config/ups
	$(INSTALL_DIR) $(1)/etc/crontabs
	$(INSTALL_BIN) ./files/root/etc/crontabs/root $(1)/etc/crontabs/root
	$(INSTALL_DIR) $(1)/etc/ups
	$(INSTALL_BIN) ./files/root/etc/ups/* $(1)/etc/ups/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/root/etc/init.d/ups $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,luci-app-ups_monitor))