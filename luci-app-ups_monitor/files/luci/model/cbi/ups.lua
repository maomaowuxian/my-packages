local fs = require "nixio.fs"
local util = require "nixio.util"
local uci = luci.model.uci.cursor_state()
local net = require "luci.model.network"
local m, s, p, b

local running=(luci.sys.call("pidof ups.sh > /dev/null") == 0)
if running then
	m = Map("ups", translate("UPS状态"), translate("<strong><font color=\"green\">ups监测程序运行中</font></strong>"))
else
	m = Map("ups", translate("UPS状态"), translate("<strong><font color=\"red\">ups监测程序未运行</font></strong>"))
end

s = m:section(TypedSection, "ups", translate("停电自动关闭NAS"))
s.addremove = false
s.anonymous = true

--s:option(Flag, "enable", translate("启用流量限额"))---这样写的话，如果关闭则会删除此键值
--这样写即便是关闭，键值也不会被删除
enable = s:option(Flag, "enable", translate("启用"), translate("<font color=\"blue\">检测到市电停电会自动关闭NAS，以免突然断电损坏硬盘</font>"))
enable.default = false
enable.optional = false
enable.rmempty = false

--------------------------------------------------------------------------

s = m:section(TypedSection, "ups", translate("当前状态"))
s.addremove = false
s.anonymous = true
s:tab("basic",  translate(""))
--local upinfo= nil
IPT_VT = luci.sys.exec("upsc wifizoo input.voltage") --市电电压
OPT_VT = luci.sys.exec("upsc wifizoo output.voltage") --输出电压
BAT_VT = luci.sys.exec("upsc wifizoo battery.voltage") --电池电压
OPT_FREQ = luci.sys.exec("upsc wifizoo output.frequency") --输出频率

LD_AV = luci.sys.exec("upsc wifizoo ups.load") --负载
op = s:taboption("basic", DummyValue,  "", "<strong><font color=\"\">市电电压</font></strong>" .. IPT_VT .. "<strong><font color=\"\">V</font></strong>")
op = s:taboption("basic", DummyValue,  "", "<strong><font color=\"\">输出电压</font></strong>" .. OPT_VT .. "<strong><font color=\"\">V</font></strong>")
op = s:taboption("basic", DummyValue,  "", "<strong><font color=\"\">电池电压</font></strong>" .. BAT_VT .. "<strong><font color=\"\">V</font></strong>")
op = s:taboption("basic", DummyValue,  "", "<strong><font color=\"\">UPS输出负载</font></strong>" .. LD_AV .. "<strong><font color=\"\">%</font></strong>")
op = s:taboption("basic", DummyValue,  "", "<strong><font color=\"\">输出频率</font></strong>" .. OPT_FREQ .. "<strong><font color=\"\">Hz</font></strong>")
--按下应用按键启动监测进程

local apply = luci.http.formvalue("cbi.apply")
if apply then
    io.popen("/etc/ups/check_ups.sh check ")  
end

return m