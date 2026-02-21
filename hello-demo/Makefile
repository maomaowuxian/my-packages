include $(TOPDIR)/rules.mk

PKG_NAME:=hello-demo
PKG_RELEASE:=1
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/hello-demo
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Hello Demo script package
  PKGARCH:=all
endef

define Package/hello-demo/description
 A minimal custom package example that installs /usr/bin/hello-demo.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./files/hello-demo $(PKG_BUILD_DIR)/
endef

define Build/Compile
endef

define Package/hello-demo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/hello-demo $(1)/usr/bin/hello-demo
endef

$(eval $(call BuildPackage,hello-demo))
