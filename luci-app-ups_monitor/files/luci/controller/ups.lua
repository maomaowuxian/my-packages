module("luci.controller.ups", package.seeall)

function index()
	entry( {"admin","services","ups"},cbi("ups"), _("UPS状态"),1)

end