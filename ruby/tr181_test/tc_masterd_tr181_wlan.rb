#!/usr/bin/ruby -w
# coding: utf-8

require "test/unit"
require "net/telnet"

require_relative "tc_masterd_tr181"

class TestMasterdTr181Wlan < TestMasterdTr181
    def test_basic
	puts "start test_addobject"
	assert(mib_add("Device.WiFi.AccessPoint", 2))
	assert(mib_eq("Device.WiFi.AccessPointNumberOfEntries", "2"))
	assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.DeviceOperationMode", "InfrastructureAccessPoint"))

	assert(mib_add("Device.WiFi.EndPoint", 1))
	assert(mib_eq("Device.WiFi.EndPointNumberOfEntries", "1"))
	assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.DeviceOperationMode", "WirelessStation"))

	assert(mib_add("InternetGatewayDevice.LANDevice.1.WLANConfiguration", 4))
	assert(mib_eq("Device.WiFi.AccessPointNumberOfEntries", "3"))
	assert(mib_eq("Device.WiFi.AccessPoint.3.SSIDReference", "Device.WiFi.SSID.4."))
	assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.4.DeviceOperationMode", "WirelessStation"))
	assert(mib_eq("Device.WiFi.EndPointNumberOfEntries", "2"))
	assert(mib_eq("Device.WiFi.AccessPointNumberOfEntries", "2"))
	assert(!mib_get("Device.WiFi.AccessPoint.3"))
	assert(mib_get("Device.WiFi.EndPoint.2"))
	assert(mib_eq("Device.WiFi.EndPoint.2.SSIDReference", "Device.WiFi.SSID.4."))
	assert(mib_add("Device.WiFi.EndPoint.2.Profile", 1))
	assert(mib_set("Device.WiFi.EndPoint.2.Profile.1.Priority", "0"))

	puts "start test_set"
	assert(mib_set("Device.WiFi.SSID.2.SSID", "tr181-1"))
	assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.SSID", "tr181-1"))
	assert(mib_set("Device.WiFi.SSID.3.SSID", "tr181-2"))
	assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.SSID", "tr181-2"))
	assert(mib_set("Device.WiFi.EndPoint.1.Enable", "1"))
	assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.Enable", "1"))

	puts "start test_delobject"
	assert(mib_del("Device.WiFi.AccessPoint.2"))
	assert(mib_eq("Device.WiFi.AccessPointNumberOfEntries", "1"))
	assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.DeviceOperationMode"))

	assert(mib_del("InternetGatewayDevice.LANDevice.1.WLANConfiguration.4"))
	assert(!mib_get("Device.WiFi.EndPoint.2"))
	assert(!mib_get("Device.WiFi.EndPoint.2.Profile.1.Priority"))

	puts "start test_reset"
	assert(mib_reset)
	assert(mib_eq("Device.WiFi.AccessPointNumberOfEntries", "1"))
	assert(mib_eq("Device.WiFi.EndPointNumberOfEntries", "0"))
	assert(!mib_get("Device.WiFi.AccessPoint.2"))
	assert(!mib_get("Device.WiFi.EndPoint.1"))
	assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.DeviceOperationMode"))
	assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.DeviceOperationMode"))
	assert(mib_eq("Device.WiFi.AccessPoint.1.SSIDReference", "Device.WiFi.SSID.1."))
    end

    def test_endpoint_profile
        assert(!mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.ProfileReference", "Device.WiFi.EndPoint.1.Profile.1"))
        assert(!mib_add("InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.Profile", 1))

	assert(mib_add("Device.WiFi.EndPoint", 1))
        assert(mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2"))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3"))
        assert(!mib_get("Device.WiFi.AccessPoint.2"))
        assert(mib_get("Device.WiFi.SSID.2"))
        assert(!mib_get("Device.WiFi.SSID.3"))
	assert(mib_eq("Device.WiFi.EndPointNumberOfEntries", "1"))
	assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.DeviceOperationMode", "WirelessStation"))

	assert(mib_add("Device.WiFi.EndPoint.1.Profile", 1))
	assert(mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.1"))
        assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.ProfileReference", "Device.WiFi.EndPoint.1.Profile.1"))
        assert(mib_eq("Device.WiFi.EndPoint.1.ProfileReference", "Device.WiFi.EndPoint.1.Profile.1"))
        assert(!mib_get("Device.WiFi.EndPoint.1.Profile.2"))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.2"))

        assert(mib_set("Device.WiFi.EndPoint.1.Profile.1.SSID", "tr181-1"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.1.SSID", "tr181-1"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.SSID", "tr181-1"))
        assert(mib_eq("Device.WiFi.SSID.2.SSID", "tr181-1"))
        assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.1.Security.WEPKey", "passd"))
        assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Security.ModeEnabled", "WEP_64"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.WEPKey.1.WEPKey", "passd"))
        assert(mib_eq("Device.WiFi.EndPoint.1.Profile.1.Security.WEPKey", "passd"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.1.Security.ModeEnabled", "WEP_64"))
        assert(mib_eq("Device.WiFi.EndPoint.1.Profile.1.Security.ModeEnabled", "WEP_64"))

	assert(mib_add("Device.WiFi.EndPoint.1.Profile", 2))
        assert(mib_add("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile", 3))
        assert(mib_eq("Device.WiFi.EndPoint.1.ProfileNumberOfEntries", "3"))
        assert(mib_eq("Device.WiFi.EndPoint.1.ProfileReference", "Device.WiFi.EndPoint.1.Profile.1"))
        assert(mib_get("Device.WiFi.EndPoint.1.Profile.3"))
        assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.2.Security.WEPKey", "xxxxxxxxxxxxx"))
        assert(mib_set("Device.WiFi.EndPoint.1.Profile.2.Security.ModeEnabled", "WEP_128"))
        assert(mib_eq("Device.WiFi.EndPoint.1.Profile.2.Security.WEPKey", "xxxxxxxxxxxxx"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.WEPKey.1.WEPKey", "passd"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.2.Security.ModeEnabled", "WEP_128"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Security.ModeEnabled", "WEP_64"))

        assert(mib_set("Device.WiFi.EndPoint.1.ProfileReference", "Device.WiFi.EndPoint.1.Profile.2"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.WEPKey.1.WEPKey", "xxxxxxxxxxxxx"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Security.ModeEnabled", "WEP_128"))
        assert(mib_set("Device.WiFi.EndPoint.1.ProfileReference", "Device.WiFi.EndPoint.1.Profile.1"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.WEPKey.1.WEPKey", "passd"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Security.ModeEnabled", "WEP_64"))

        assert(mib_del("Device.WiFi.EndPoint.1.Profile.3"))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.3"))
        assert(mib_del("Device.WiFi.EndPoint.1.Profile.2"))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.2"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.WEPKey.1.WEPKey", "passd"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Security.ModeEnabled", "WEP_64"))
        assert(mib_eq("Device.WiFi.EndPoint.1.ProfileReference", "Device.WiFi.EndPoint.1.Profile.1"))

	assert(mib_q([["add", "InternetGatewayDevice.LANDevice.1.WLANConfiguration", "3"]]))
	assert(mib_q([["set", "InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.DeviceOperationMode", "WirelessStation"]]))
        assert(mib_get("Device.WiFi.EndPoint.2"))
        assert(mib_get("Device.WiFi.SSID.3"))
        assert(mib_eq("Device.WiFi.EndPointNumberOfEntries", "2"))
	assert(!mib_set("Device.WiFi.EndPoint.2.ProfileReference", "Device.WiFi.EndPoint.2.Profile.1"))
	assert(mib_add("Device.WiFi.EndPoint.2.Profile", 1))
	assert(!mib_eq("Device.WiFi.EndPoint.2.ProfileReference", "Device.WiFi.EndPoint.2.Profile.1"))
	assert(mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.Profile.1"))
	assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.Profile.2"))
        assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.ProfileReference", "Device.WiFi.EndPoint.2.Profile.1"))
        assert(mib_eq("Device.WiFi.EndPoint.2.ProfileReference", "Device.WiFi.EndPoint.2.Profile.1"))
        assert(mib_set("Device.WiFi.SSID.3.SSID", "tr181-1"))
        assert(mib_eq("Device.WiFi.EndPoint.2.Profile.1.SSID", "tr181-1"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.Profile.1.SSID", "tr181-1"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.SSID", "tr181-1"))
        assert(mib_add("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.Profile", 2))
        assert(mib_eq("Device.WiFi.EndPoint.2.ProfileNumberOfEntries", "2"))
        assert(mib_eq("Device.WiFi.EndPoint.2.ProfileReference", "Device.WiFi.EndPoint.2.Profile.1"))
        assert(mib_get("Device.WiFi.EndPoint.2.Profile.2"))
        assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.ProfileReference", "Device.WiFi.EndPoint.2.Profile.2"))
        assert(mib_eq("Device.WiFi.EndPoint.2.ProfileReference", "Device.WiFi.EndPoint.2.Profile.2"))
        assert(mib_set("Device.WiFi.EndPoint.2.Profile.2.Security.KeyPassphrase", "1234567890"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.KeyPassphrase", "1234567890"))
        assert(mib_del("Device.WiFi.EndPoint.2"))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3"))
        assert(mib_add("Device.WiFi.EndPoint", 2))
        assert(mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3"))
        assert(!mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.ProfileReference", "Device.WiFi.EndPoint.2.Profile.2"))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.Profile"))

        assert(mib_set("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.DeviceOperationMode", "InfrastructureAccessPoint"))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.1"))
        assert(!mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.ProfileReference", "Device.WiFi.EndPoint.1.Profile.1"))
        assert(!mib_get("Device.WiFi.EndPoint.1"))
        assert(mib_get("Device.WiFi.AccessPoint.2"))
        assert(mib_set("Device.WiFi.SSID.2.SSID", "tr181-2"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.SSID", "tr181-2"))
        assert(mib_set("Device.WiFi.AccessPoint.2.Security.PreSharedKey", "scdrfbgtyh"))
        assert(mib_eq("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.PreSharedKey.1.PreSharedKey", "scdrfbgtyh"))

	assert(mib_reset)
	assert(mib_eq("Device.WiFi.AccessPointNumberOfEntries", "1"))
	assert(mib_eq("Device.WiFi.EndPointNumberOfEntries", "0"))
	assert(!mib_get("Device.WiFi.AccessPoint.2"))
	assert(!mib_get("Device.WiFi.EndPoint.1"))
	assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.DeviceOperationMode"))
	assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.3.DeviceOperationMode"))
	assert(mib_eq("Device.WiFi.AccessPoint.1.SSIDReference", "Device.WiFi.SSID.1."))
        assert(!mib_get("InternetGatewayDevice.LANDevice.1.WLANConfiguration.2.Profile.1"))
        #change to ap
        #unmap profile
        #multi profile
    end
end
