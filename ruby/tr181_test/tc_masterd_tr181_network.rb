#!/usr/bin/ruby -w
# coding: utf-8

require "test/unit"
require "net/telnet"

require_relative "tc_masterd_tr181"

class TestMasterdTr181Wlan < TestMasterdTr181
    def test_tr181_udm_map
        assert(mib_add("Device.IP.Interface", 1))
        assert(mib_add("Device.IP.Interface", 2))
        assert(mib_add("Device.IP.Interface", 3))
        assert(mib_add("Device.IP.Interface.2.IPv4Address", 1))
        assert(mib_add("Device.IP.Interface.2.IPv4Address", 2))
        assert(mib_add("Device.IP.Interface.2.IPv4Address", 3))
        assert(mib_set("Device.IP.Interface.2.IPv4Address.2.IPAddress", "192.168.1.10"))
	assert(mib_set("udm.Device.IP.Interface.2.IPv4Address.2.AddressingType", "DHCP"))
	assert(mib_eq("Device.IP.Interface.2.IPv4Address.2.AddressingType", "DHCP"))
	assert(mib_set("udm.Device.IP.Interface.2.Stats.BytesSent", "1000"))
	assert(mib_eq("Device.IP.Interface.2.Stats.BytesSent", "1000"))
        assert(mib_get("udm.Device.IP.Interface.1"))
        assert(mib_get("udm.Device.IP.Interface.2"))
        assert(mib_get("udm.Device.IP.Interface.3"))
        assert(mib_get("udm.Device.IP.Interface.2.IPv4Address.1"))
        assert(mib_get("udm.Device.IP.Interface.2.IPv4Address.2"))
        assert(mib_get("udm.Device.IP.Interface.2.IPv4Address.3"))
        assert(mib_eq("udm.Device.IP.Interface.2.IPv4Address.2.IPAddress", "192.168.1.10"))
        assert(mib_del("Device.IP.Interface.1"))
        assert(!mib_get("udm.Device.IP.Interface.1"))
        assert(mib_get("udm.Device.IP.Interface.2"))
        assert(mib_get("udm.Device.IP.Interface.3"))
        assert(mib_del("Device.IP.Interface.2"))
        assert(!mib_get("udm.Device.IP.Interface.2"))
        assert(mib_get("udm.Device.IP.Interface.3"))
        assert(mib_del("Device.IP.Interface.3"))
        assert(!mib_get("udm.Device.IP.Interface.3"))
    end
=begin
    def test_bridge
        assert(mib_reset)
        #make sure physical port exist before test
        (1..5).each {|idx| assert(mib_get("Device.Ethernet.Interface.#{idx}"))}
        assert(mib_get("Device.WiFi.SSID.1"))

	assert(mib_add("Device.Bridging.Bridge", 1))
        assert(mib_eq("Device.Bridging.BridgeNumberOfEntries", "1"))
        #check default values of new created bridge
	assert(mib_eq("Device.Bridging.Bridge.1.Enable", "0"))
        assert(mib_eq("Device.Bridging.Bridge.1.Status", "Disabled"))
	assert(mib_eq("Device.Bridging.Bridge.1.Standard", "802.1D-2004"))
        assert(mib_eq("Device.Bridging.Bridge.1.PortNumberOfEntries", "0"))
        assert(mib_eq("Device.Bridging.Bridge.1.VLANNumberOfEntries", "0"))
        assert(mib_eq("Device.Bridging.Bridge.1.VLANPortNumberOfEntries", "0"))
        (1..6).each do |idx|
	    #add port to bridge
            assert(mib_add("Device.Bridging.Bridge.1.Port", idx))
            #make sure ManagementPort is not supported
            assert(!mib_set("Device.Bridging.Bridge.1.Port.#{idx}.ManagementPort", "1"))
            assert(mib_set("Device.Bridging.Bridge.1.Port.#{idx}.LowerLayers", ((idx == 6) ? "Device.WiFi.SSID.1" : "Device.Ethernet.Interface.#{idx}")))
            assert(mib_set("Device.Bridging.Bridge.1.Port.#{idx}.DefaultUserPriority", "0"))
            assert(mib_set("Device.Bridging.Bridge.1.Port.#{idx}.PriorityRegeneration", "0,0,0,0,0,0,0"))
            assert(mib_set("Device.Bridging.Bridge.1.Port.#{idx}.PVID", "1"))
            assert(mib_eq("Device.Bridging.Bridge.1.Port.#{idx}.AcceptableFrameTypes", "AdmitAll"))
            assert(mib_eq("Device.Bridging.Bridge.1.Port.#{idx}.IngressFiltering", "0"))
            assert(mib_eq("Device.Bridging.Bridge.1.Port.#{idx}PriorityTagging", "0"))
            assert(mib_set("Device.Bridging.Bridge.1.Port.#{idx}.Enable", "1"))
            assert(!mib_eq("Device.Bridging.Bridge.1.Port.#{idx}.PortState", "Disabled"))
            assert(mib_eq("Device.Bridging.Bridge.1.PortNumberOfEntries", "#{idx}"))
        end

	assert(mib_eq("Device.InterfaceStack.1.HigherLayer", "Device.WiFi.SSID.1"))
	assert(mib_eq("Device.InterfaceStack.1.LowerLayer", "Device.WiFi.Radio.1"))

        lowerLayers = ""
        1.upto(5) {|idx| lowerLayers += "Device.Bridging.Bridge.1.Port.#{idx},"}
        lowerLayers += "Device.WiFi.SSID.1"
	assert(mib_eq("Device.InterfaceStack.2.HigherLayer", "Device.Bridging.Bridge.1"))
	assert(mib_eq("Device.InterfaceStack.2.LowerLayer", lowerLayers))

        (3..8).each do |idx|
	    assert(mib_eq("Device.InterfaceStack.#{idx}.HigherLayer", "Device.Bridging.Bridge.1.Port.#{idx-2}"))
	    assert(mib_eq("Device.InterfaceStack.#{idx}.LowerLayer", ((idx == 8) ? "Device.WiFi.SSID.1" : "Device.Ethernet.Interface.#{idx-2}")))
        end

	#delete port from bridge
	assert(mib_del("Device.Bridging.Bridge.1.Port.5"))
	assert(mib_eq("Device.Bridging.Bridge.1.PortNumberOfEntries", "5"))
        lowerLayers = ""
        1.upto(4) {|idx| lowerLayers += "Device.Bridging.Bridge.1.Port.#{idx},"}
        lowerLayers += "Device.WiFi.SSID.1"
        assert(mib_eq("Device.InterfaceStack.2.LowerLayer", lowerLayers))
	assert(!mib_get("Device.InterfaceStack.7"))

	assert(mib_reset)
    end
=end
    def test_ethernet
    end
end
