/* packet-PROTOABBREV.c
 * Routines for PROTONAME dissection
 * Copyright 201x, YOUR_NAME <YOUR_EMAIL_ADDRESS>
 *
 * $Id$
 *
 * Wireshark - Network traffic analyzer
 * By Gerald Combs <gerald@wireshark.org>
 * Copyright 1998 Gerald Combs
 *
 * Copied from WHATEVER_FILE_YOU_USED (where "WHATEVER_FILE_YOU_USED"
 * is a dissector file; if you just copied this from README.developer,
 * don't bother with the "Copied from" - you don't even need to put
 * in a "Copied from" if you copied an existing dissector, especially
 * if the bulk of the code in the new dissector is your code)
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#if 0
/* Include only as needed */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#endif

#include <glib.h>

#include <epan/packet.h>
#include <epan/prefs.h>

/* IF PROTO exposes code to other dissectors, then it must be exported
   in a header file. If not, a header file is not needed at all. */
#if 0
#include "packet-PROTOABBREV.h"
#endif

/* Forward declaration we need below (if using proto_reg_handoff...
   as a prefs callback)       */
void proto_reg_handoff_lltdfxp(void);

/* Initialize the protocol and registered fields */
static int proto_lltdfxp = -1;
static int hf_lltdfxp_Demultiplex_Version = -1;
static int hf_lltdfxp_Demultiplex_TOS = -1;
static int hf_lltdfxp_Demultiplex_Reserved = -1;
static int hf_lltdfxp_Demultiplex_Function = -1;
static int hf_lltdfxp_Base_DMAC = -1;
static int hf_lltdfxp_Base_SMAC = -1;
static int hf_lltdfxp_Base_Xid_Seq = -1;
static int hf_lltdfxp_Generation_Number = -1;
static int hf_lltdfxp_Number_of_Stations = -1;
static int hf_lltdfxp_Stations = -1;
static int hf_lltdfxp_Host_Id = -1;
static int hf_lltdfxp_Current_Mapper = -1;
static int hf_lltdfxp_Apparent_Mapper = -1;
static int hf_lltdfxp_Characteristics_P = -1;
static int hf_lltdfxp_Characteristics_X = -1;
static int hf_lltdfxp_Characteristics_F = -1;
static int hf_lltdfxp_Characteristics_M = -1;
static int hf_lltdfxp_Characteristics_L = -1;
static int hf_lltdfxp_Physical_Medium = -1;
static int hf_lltdfxp_ipv4_address = -1;
static int hf_lltdfxp_ipv6_address = -1;
static int hf_lltdfxp_link_speed = -1;
static int hf_lltdfxp_QoS_Characteristics_E = -1;
static int hf_lltdfxp_QoS_Characteristics_Q = -1;
static int hf_lltdfxp_QoS_Characteristics_P = -1;
static int hf_lltdfxp_TLV_Type = -1;
static int hf_lltdfxp_QueryLargeTlv_Offset = -1;
static int hf_lltdfxp_QueryLargeTlvResp_More = -1;

/* Global sample preference ("controls" display of numbers) */
static gboolean gPREF_HEX = FALSE;
/* Global sample port pref */
static guint gLLTD_ETH_TYPE = 0x88d9;

/* Initialize the subtree pointers */
static gint ett_lltdfxp = -1;
static gint ett_lltdfxp_base_header = -1;
static gint ett_lltdfxp_discover_upper_header = -1;
static gint ett_lltdfxp_discover_stations = -1;
static gint ett_lltdfxp_hello_upper_header = -1;
static gint ett_lltdfxp_hello_Characteristics = -1;
static gint ett_lltdfxp_hello_QoS_Characteristics = -1;
static gint ett_lltdfxp_queryLargeTlv_upper_header = -1;
static gint ett_lltdfxp_queryLargeTlvResp_upper_header = -1;

static const value_string lltdfxp_TOS_name[] = {
    { 0, "Topology discovery" },
    { 1, "Quick discovery" },
    { 2, "QoS diagnostics" },
    { 0, NULL }
};

static const value_string lltdfxp_function_name[] = {
    { 0, "Discover" },
    { 1, "Hello" },
    { 2, "Emit" },
    { 3, "Train" },
    { 4, "Probe" },
    { 5, "Ack" },
    { 6, "Query" },
    { 7, "QueryResp" },
    { 8, "Reset" },
    { 9, "Charge" },
    { 0xa, "Flat" },
    { 0xb, "QueryLargeTlv" },
    { 0xc, "QueryLargeTlvResp" },
    { 0, NULL }
};

static const value_string lltdfxp_function_qos_name[] = {
    { 0, "QosInitializeSink" },
    { 1, "QosReady" },
    { 2, "QosProbe" },
    { 3, "QosQuery" },
    { 4, "QosQueryResp" },
    { 5, "QosReset" },
    { 6, "QosError" },
    { 7, "QosAck" },
    { 8, "QosCounterSnapshot" },
    { 9, "QosCounterResult" },
    { 0xa, "QosCounterLease" },
    { 0, NULL }
};

static const value_string lltdfxp_tlv_type_name[] = {
    { 0, "End" },
    { 1, "Host Id" },
    { 2, "Characteristics" },
    { 3, "Physical Medium" },
    { 4, "Wireless Mode" },
    { 5, "BSSID" },
    { 6, "SSID" },
    { 7, "Ipv4 Address" },
    { 8, "Ipv6 Address" },
    { 9, "802.11 Max Operational Rate" },
    { 0xa, "Performance Counter Frequency" },
    { 0xc, "Link Speed"},
    { 0xd, "RSSI"},
    { 0xe, "Icon Image"},
    { 0x11, "Friendly Name"},
    { 0x13, "Hardware ID"},
    { 0x16, "AP Association Table"},
    { 0x18, "Detailed Icon Image"},
    { 0x1a, "Component Table"},
    { 0x1c, "Repeater AP Table"},
    { 0, NULL }
};

/* Setup list of header fields  See Section 1.6.1 for details*/
static hf_register_info hf[] = {
	{ &hf_lltdfxp_Demultiplex_Version,
		{ "Version",           "lltdfxp.version",
		FT_UINT8, BASE_DEC, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Demultiplex_TOS,
		{ "Type Of Service",           "lltdfxp.tos",
		FT_UINT8, BASE_DEC, VALS(lltdfxp_TOS_name), 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Demultiplex_Reserved,
		{ "Reserved",           "lltdfxp.reserved",
		FT_UINT8, BASE_DEC, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Demultiplex_Function,
		{ "Function",           "lltdfxp.function",
		FT_UINT8, BASE_DEC, VALS(lltdfxp_function_name), 0x0,
		"FIELDDESCR", HFILL }
	},
        { &hf_lltdfxp_Base_DMAC,
		{ "Real Destination Mac",           "lltdfxp.real_dmac",
		FT_ETHER, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Base_SMAC,
		{ "Real Source Mac",           "lltdfxp.real_smac",
		FT_ETHER, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Base_Xid_Seq,
		{ "Sequence Number/XID",           "lltdfxp.seq_xid",
		FT_UINT16, BASE_HEX, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Generation_Number,
		{ "Generation Number",           "lltdfxp.generation_number",
		FT_UINT16, BASE_HEX, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Number_of_Stations,
		{ "Number of Stations",           "lltdfxp.Number_of_Stations",
		FT_UINT16, BASE_DEC, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Stations,
		{ "Stations",           "lltdfxp.stations",
		FT_ETHER, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Current_Mapper,
		{ "Current Mapper",           "lltdfxp.hello.current_mapper",
		FT_ETHER, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Apparent_Mapper,
		{ "Apparent Mapper",           "lltdfxp.hello.apparent_mapper",
		FT_ETHER, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Host_Id,
		{ "TLV[Host_Id]",           "lltdfxp.hello.host_id",
		FT_ETHER, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Characteristics_P,
		{ "Public Side",           "lltdfxp.hello.characteristics.p",
		FT_BOOLEAN, 32, NULL, 0x80000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Characteristics_X,
		{ "Private Side",           "lltdfxp.hello.characteristics.x",
		FT_BOOLEAN, 32, NULL, 0x40000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Characteristics_F,
		{ "Full Duplex",           "lltdfxp.hello.characteristics.f",
		FT_BOOLEAN, 32, NULL, 0x20000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Characteristics_M,
		{ "Have Web",           "lltdfxp.hello.characteristics.m",
		FT_BOOLEAN, 32, NULL, 0x10000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Characteristics_L,
		{ "Loopback",           "lltdfxp.hello.characteristics.l",
		FT_BOOLEAN, 32, NULL, 0x8000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_Physical_Medium,
		{ "TLV[Physical Medium]",           "lltdfxp.hello.physical_medium",
		FT_UINT32, BASE_DEC, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_ipv4_address,
		{ "TLV[Ipv4 Address]",           "lltdfxp.hello.ipv4_address",
		FT_IPv4, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_ipv6_address,
		{ "TLV[Ipv6 Address]",           "lltdfxp.hello.ipv6_address",
		FT_IPv6, BASE_NONE, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_link_speed,
		{ "TLV[Link Speed]",           "lltdfxp.hello.link_speed",
		FT_UINT32, BASE_DEC, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_QoS_Characteristics_E,
		{ "Layer2 Forwarding",           "lltdfxp.hello.qos_characteristics.e",
		FT_BOOLEAN, 32, NULL, 0x80000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_QoS_Characteristics_Q,
		{ "Support 802.1q",           "lltdfxp.hello.qos_characteristics.q",
		FT_BOOLEAN, 32, NULL, 0x40000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_QoS_Characteristics_P,
		{ "Support 802.1p",           "lltdfxp.hello.qos_characteristics.p",
		FT_BOOLEAN, 32, NULL, 0x20000000,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_TLV_Type,
		{ "Type",           "lltdfxp.tlv_type",
		FT_UINT8, BASE_DEC, VALS(lltdfxp_tlv_type_name), 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_QueryLargeTlv_Offset,
		{ "Offset",           "lltdfxp.querylargetlv.offset",
		FT_UINT32, BASE_DEC, NULL, 0x0,
		"FIELDDESCR", HFILL }
	},
	{ &hf_lltdfxp_QueryLargeTlvResp_More,
		{ "More",           "lltdfxp.querylargetlvresp.more",
		FT_BOOLEAN, 16, NULL, 0x80000000,
		"FIELDDESCR", HFILL }
	},
};

/* Setup protocol subtree array */
static gint *ett[] = {
	&ett_lltdfxp,
        &ett_lltdfxp_base_header,
        &ett_lltdfxp_discover_upper_header,
        &ett_lltdfxp_discover_stations,
        &ett_lltdfxp_hello_upper_header,
        &ett_lltdfxp_hello_Characteristics,
        &ett_lltdfxp_hello_QoS_Characteristics,
        &ett_lltdfxp_queryLargeTlv_upper_header,
        &ett_lltdfxp_queryLargeTlvResp_upper_header
};

static int
dissect_lltdfxp_discover_upper_level_header(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, int offset)
{
    proto_item *ti;
    proto_tree *lltdfxp_tree;
    guint16 sta_num = tvb_get_ntohs(tvb, offset+2);
    int idx;

    ti = proto_tree_add_text(tree, tvb, offset, (4 + 6 * sta_num), "Discover");

    lltdfxp_tree = proto_item_add_subtree(ti, ett_lltdfxp_discover_upper_header);

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Generation_Number, tvb, offset, 2, ENC_BIG_ENDIAN);
    offset += 2;

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Number_of_Stations, tvb, offset, 2, ENC_BIG_ENDIAN);
    offset += 2;

    if(sta_num > 0)
    {
        ti = proto_tree_add_text(lltdfxp_tree, tvb, offset, (6 * sta_num), "Stations");

        lltdfxp_tree = proto_item_add_subtree(ti, ett_lltdfxp_discover_stations);

	for(idx = 0; idx < sta_num; idx++)
	{
            proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Stations, tvb, offset, 6, ENC_NA);
            offset += 6;
	}
    }
}

static int
dissect_lltdfxp_hello_upper_level_header(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, int offset)
{
    proto_item *ti;
    proto_tree *lltdfxp_tree;
    guint8 tlv_t, tlv_l;
    int idx;

    ti = proto_tree_add_text(tree, tvb, offset, -1, "Hello");

    lltdfxp_tree = proto_item_add_subtree(ti, ett_lltdfxp_hello_upper_header);

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Generation_Number, tvb, offset, 2, ENC_BIG_ENDIAN);
    offset += 2;

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Current_Mapper, tvb, offset, 6, ENC_BIG_ENDIAN);
    offset += 6;

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Apparent_Mapper, tvb, offset, 6, ENC_BIG_ENDIAN);
    offset += 6;

    for(tlv_t = tvb_get_guint8(tvb, offset); tlv_t != 0; tlv_t = tvb_get_guint8(tvb, offset))
    {
        offset += 1;

        tlv_l = tvb_get_guint8(tvb, offset);
        offset += 1;

        if(tlv_t == 1)
        {
            proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Host_Id, tvb, offset, 6, ENC_BIG_ENDIAN);
            offset += tlv_l;
        }
        else if(tlv_t == 2)
        {
            proto_item *flag_ti;
            proto_tree *flag_tree;

            flag_ti = proto_tree_add_text(lltdfxp_tree, tvb, offset, tlv_l, "TLV[Characteristics]");
            flag_tree = proto_item_add_subtree(flag_ti, ett_lltdfxp_hello_Characteristics);
            proto_tree_add_item(flag_tree, hf_lltdfxp_Characteristics_P, tvb, offset, tlv_l, ENC_BIG_ENDIAN);
            proto_tree_add_item(flag_tree, hf_lltdfxp_Characteristics_X, tvb, offset, tlv_l, ENC_BIG_ENDIAN);
            proto_tree_add_item(flag_tree, hf_lltdfxp_Characteristics_F, tvb, offset, tlv_l, ENC_BIG_ENDIAN);
            proto_tree_add_item(flag_tree, hf_lltdfxp_Characteristics_M, tvb, offset, tlv_l, ENC_BIG_ENDIAN);
            proto_tree_add_item(flag_tree, hf_lltdfxp_Characteristics_L, tvb, offset, tlv_l, ENC_BIG_ENDIAN);
            offset += tlv_l;
        }
        else if(tlv_t == 3)
        {
            proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_Physical_Medium, tvb, offset, 4, ENC_BIG_ENDIAN);
            offset += tlv_l;
        }
        else if(tlv_t == 7)
        {
            proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_ipv4_address, tvb, offset, 4, ENC_BIG_ENDIAN);
            offset += tlv_l;
        }
        else if(tlv_t == 8)
        {
            proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_ipv6_address, tvb, offset, 16, ENC_BIG_ENDIAN);
            offset += tlv_l;
        }
        else if(tlv_t == 0xc)
        {
            guint32 general_int = tvb_get_ntohl(tvb, offset);
            proto_tree_add_uint_format(lltdfxp_tree, hf_lltdfxp_link_speed, tvb, offset, 4, general_int, 
                                        "TLV[Link Speed] : %d bps", 100*general_int);
            offset += tlv_l;
        }
        else if(tlv_t == 0xf)
        {
            gchar *dev_host_name = tvb_get_unicode_string(tvb, offset, tlv_l, ENC_LITTLE_ENDIAN);
            proto_tree_add_text(lltdfxp_tree, tvb, offset, tlv_l, "TLV[Device Host Name] : %s", dev_host_name);
            g_free(dev_host_name);
            offset += tlv_l;
        }
        else if(tlv_t == 0x14)
        {
            proto_item *flag_ti;
            proto_tree *flag_tree;

            flag_ti = proto_tree_add_text(lltdfxp_tree, tvb, offset, tlv_l, "TLV[QoS Characteristics]");
            flag_tree = proto_item_add_subtree(flag_ti, ett_lltdfxp_hello_QoS_Characteristics);
            proto_tree_add_item(flag_tree, hf_lltdfxp_QoS_Characteristics_E, tvb, offset, tlv_l, ENC_BIG_ENDIAN);
            proto_tree_add_item(flag_tree, hf_lltdfxp_QoS_Characteristics_Q, tvb, offset, tlv_l, ENC_BIG_ENDIAN);
            proto_tree_add_item(flag_tree, hf_lltdfxp_QoS_Characteristics_P, tvb, offset, tlv_l, ENC_BIG_ENDIAN);

            offset += tlv_l;
        }
        else
        {
            offset += tlv_l;
        }
    }
}

static int
dissect_lltdfxp_queryLargeTlv_upper_level_header(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, int offset)
{
    proto_item *ti;
    proto_tree *lltdfxp_tree;

    ti = proto_tree_add_text(tree, tvb, offset, -1, "QueryLargeTlv");

    lltdfxp_tree = proto_item_add_subtree(ti, ett_lltdfxp_queryLargeTlv_upper_header);

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_TLV_Type, tvb, offset, 1, ENC_BIG_ENDIAN);
    offset += 1;

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_QueryLargeTlv_Offset, tvb, offset, 3, ENC_BIG_ENDIAN);
    offset += 3;
}

static int
dissect_lltdfxp_queryLargeTlvResp_upper_level_header(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree, int offset)
{
    proto_item *ti;
    proto_tree *lltdfxp_tree;
    guint16 resp_len = tvb_get_ntohs(tvb, offset);

    ti = proto_tree_add_text(tree, tvb, offset, -1, "QueryLargeTlvResp");

    lltdfxp_tree = proto_item_add_subtree(ti, ett_lltdfxp_queryLargeTlvResp_upper_header);

    proto_tree_add_item(lltdfxp_tree, hf_lltdfxp_QueryLargeTlvResp_More, tvb, offset, 2, ENC_BIG_ENDIAN);
    offset += 2;

}

/* Code to actually dissect the packets */
static int
dissect_lltdfxp(tvbuff_t *tvb, packet_info *pinfo, proto_tree *tree)
{

/* Set up structures needed to add the protocol subtree and manage it */
	proto_item *ti;
        proto_tree *lltdfxp_tree_root;
	proto_tree *lltdfxp_tree;
	int offset = 0;
        guint8 pkt_type = tvb_get_guint8(tvb, 1);
	guint8 pkt_func = tvb_get_guint8(tvb, 3);

/*  First, if at all possible, do some heuristics to check if the packet cannot
 *  possibly belong to your protocol.  This is especially important for
 *  protocols directly on top of TCP or UDP where port collisions are
 *  common place (e.g., even though your protocol uses a well known port,
 *  someone else may set up, for example, a web server on that port which,
 *  if someone analyzed that web server's traffic in Wireshark, would result
 *  in Wireshark handing an HTTP packet to your dissector).  For example:
 */
	/* Check that there's enough data */
	if (tvb_length(tvb) < 18 /* your protocol's smallest packet size */)
		return 0;

	/* Get some values from the packet header, probably using tvb_get_*() */
	if ( 0/* these values are not possible in PROTONAME */ )
		/*  This packet does not appear to belong to PROTONAME.
		 *  Return 0 to give another dissector a chance to dissect it.
		 */
		return 0;

/* Make entries in Protocol column and Info column on summary display */
	col_set_str(pinfo->cinfo, COL_PROTOCOL, "lltdfxp");

/* This field shows up as the "Info" column in the display; you should use
   it, if possible, to summarize what's in the packet, so that a user looking
   at the list of packets can tell what type of packet it is. See section 1.5
   for more information.

   If you are setting the column to a constant string, use "col_set_str()",
   as it's more efficient than the other "col_set_XXX()" calls.

   If you're setting it to a string you've constructed, or will be
   appending to the column later, use "col_add_str()".

   "col_add_fstr()" can be used instead of "col_add_str()"; it takes
   "printf()"-like arguments.  Don't use "col_add_fstr()" with a format
   string of "%s" - just use "col_add_str()" or "col_set_str()", as it's
   more efficient than "col_add_fstr()".

   If you will be fetching any data from the packet before filling in
   the Info column, clear that column first, in case the calls to fetch
   data from the packet throw an exception because they're fetching data
   past the end of the packet, so that the Info column doesn't have data
   left over from the previous dissector; do

	col_clear(pinfo->cinfo, COL_INFO);

   */
        col_clear(pinfo->cinfo,COL_INFO);
        col_add_fstr(pinfo->cinfo, COL_INFO, "%s",
             val_to_str(pkt_type, lltdfxp_TOS_name, "Unknown (0x%02x)"));

/* A protocol dissector may be called in 2 different ways - with, or
   without a non-null "tree" argument.

   If the proto_tree argument is null, Wireshark does not need to use
   the protocol tree information from your dissector, and therefore is
   passing the dissector a null "tree" argument so that it doesn't
   need to do work necessary to build the protocol tree.

   In the interest of speed, if "tree" is NULL, avoid building a
   protocol tree and adding stuff to it, or even looking at any packet
   data needed only if you're building the protocol tree, if possible.

   Note, however, that you must fill in column information, create
   conversations, reassemble packets, build any other persistent state
   needed for dissection, and call subdissectors regardless of whether
   "tree" is NULL or not.  This might be inconvenient to do without
   doing most of the dissection work; the routines for adding items to
   the protocol tree can be passed a null protocol tree pointer, in
   which case they'll return a null item pointer, and
   "proto_item_add_subtree()" returns a null tree pointer if passed a
   null item pointer, so, if you're careful not to dereference any null
   tree or item pointers, you can accomplish this by doing all the
   dissection work.  This might not be as efficient as skipping that
   work if you're not building a protocol tree, but if the code would
   have a lot of tests whether "tree" is null if you skipped that work,
   you might still be better off just doing all that work regardless of
   whether "tree" is null or not.

   Note also that there is no guarantee, the first time the dissector is
   called, whether "tree" will be null or not; your dissector must work
   correctly, building or updating whatever state information is
   necessary, in either case. */
	if (tree) {

/* NOTE: The offset and length values in the call to
   "proto_tree_add_item()" define what data bytes to highlight in the hex
   display window when the line in the protocol tree display
   corresponding to that item is selected.

   Supplying a length of -1 is the way to highlight all data from the
   offset to the end of the packet. */

/* create display subtree for the protocol */
		ti = proto_tree_add_item(tree, proto_lltdfxp, tvb, 0, -1, ENC_NA);

		lltdfxp_tree_root = proto_item_add_subtree(ti, ett_lltdfxp);

/* add an item to the subtree, see section 1.6 for more information */
		proto_tree_add_item(lltdfxp_tree_root,
		    hf_lltdfxp_Demultiplex_Version, tvb, offset, 1, ENC_BIG_ENDIAN);
		offset += 1;

		proto_tree_add_item(lltdfxp_tree_root,
		    hf_lltdfxp_Demultiplex_TOS, tvb, offset, 1, ENC_BIG_ENDIAN);
		offset += 1;

		proto_tree_add_item(lltdfxp_tree_root,
		    hf_lltdfxp_Demultiplex_Reserved, tvb, offset, 1, ENC_BIG_ENDIAN);
		offset += 1;

		proto_tree_add_item(lltdfxp_tree_root,
		    hf_lltdfxp_Demultiplex_Function, tvb, offset, 1, ENC_BIG_ENDIAN);
                offset += 1;

		ti = proto_tree_add_text(lltdfxp_tree_root, tvb, offset, 14, "Base Header");

                lltdfxp_tree = proto_item_add_subtree(ti, ett_lltdfxp_base_header);

		proto_tree_add_item(lltdfxp_tree,
		    hf_lltdfxp_Base_DMAC, tvb, offset, 6, ENC_NA);
		offset += 6;

		proto_tree_add_item(lltdfxp_tree,
		    hf_lltdfxp_Base_SMAC, tvb, offset, 6, ENC_NA);
		offset += 6;

		proto_tree_add_item(lltdfxp_tree,
		    hf_lltdfxp_Base_Xid_Seq, tvb, offset, 2, ENC_BIG_ENDIAN);
                offset += 2;

/* Continue adding tree items to process the packet here */
                if((pkt_type == 0 || pkt_type == 1) && (pkt_func == 0))
                {
                        dissect_lltdfxp_discover_upper_level_header(tvb, pinfo, lltdfxp_tree_root, offset);
                }
                if((pkt_type == 0 || pkt_type == 1) && (pkt_func == 1))
                {
                        dissect_lltdfxp_hello_upper_level_header(tvb, pinfo, lltdfxp_tree_root, offset);
                }
                if((pkt_type == 0 || pkt_type == 1) && (pkt_func == 0xb))
                {
                        dissect_lltdfxp_queryLargeTlv_upper_level_header(tvb, pinfo, lltdfxp_tree_root, offset);
                }
                if((pkt_type == 0 || pkt_type == 1) && (pkt_func == 0xc))
                {
                        dissect_lltdfxp_queryLargeTlvResp_upper_level_header(tvb, pinfo, lltdfxp_tree_root, offset);
                }

	}

/* If this protocol has a sub-dissector call it here, see section 1.8 */

/* Return the amount of data this dissector was able to dissect */
	return tvb_length(tvb);
}


/* Register the protocol with Wireshark */

/* this format is require because a script is used to build the C function
   that calls all the protocol registration.
*/

void
proto_register_lltdfxp(void)
{
	module_t *lltdfxp_module;

/* Register the protocol name and description */
	proto_lltdfxp = proto_register_protocol("lltdfxp",
	    "lltdfxp", "lltdfxp");

/* Required function calls to register the header fields and subtrees used */
	proto_register_field_array(proto_lltdfxp, hf, array_length(hf));
	proto_register_subtree_array(ett, array_length(ett));

/* Register preferences module (See Section 2.6 for more on preferences) */
/* (Registration of a prefs callback is not required if there are no     */
/*  prefs-dependent registration functions (eg: a port pref).            */
/*  See proto_reg_handoff below.                                         */
/*  If a prefs callback is not needed, use NULL instead of               */
/*  proto_reg_handoff_lltdfxp in the following).                     */
	lltdfxp_module = prefs_register_protocol(proto_lltdfxp,
	    proto_reg_handoff_lltdfxp);

#if 0
/* Register preferences module under preferences subtree.
   Use this function instead of prefs_register_protocol if you want to group
   preferences of several protocols under one preferences subtree.
   Argument subtree identifies grouping tree node name, several subnodes can be
   specified usign slash '/' (e.g. "OSI/X.500" - protocol preferences will be
   accessible under Protocols->OSI->X.500-><PROTOSHORTNAME> preferences node.
*/
  lltdfxp_module = prefs_register_protocol_subtree("lltdfxp",
       proto_lltdfxp, proto_reg_handoff_lltdfxp);
#endif

/* Register a sample preference */
	prefs_register_bool_preference(lltdfxp_module, "show_hex",
	     "Display numbers in Hex",
	     "Enable to display numerical values in hexadecimal.",
	     &gPREF_HEX);

/* Register a sample port preference   */
	prefs_register_uint_preference(lltdfxp_module, "ethernet.type", "lltd type",
	     " lltd type if other than the default",
	     16, &gLLTD_ETH_TYPE);

}


/* If this dissector uses sub-dissector registration add a registration routine.
   This exact format is required because a script is used to find these
   routines and create the code that calls these routines.

   If this function is registered as a prefs callback (see prefs_register_protocol
   above) this function is also called by preferences whenever "Apply" is pressed;
   In that case, it should accommodate being called more than once.

   This form of the reg_handoff function is used if if you perform
   registration functions which are dependent upon prefs. See below
   for a simpler form  which can be used if there are no
   prefs-dependent registration functions.
*/
void
proto_reg_handoff_lltdfxp(void)
{
	static gboolean initialized = FALSE;
        static dissector_handle_t lltdfxp_handle;
        static int lltdType;

	if (!initialized) {

/*  Use new_create_dissector_handle() to indicate that dissect_lltdfxp()
 *  returns the number of bytes it dissected (or 0 if it thinks the packet
 *  does not belong to PROTONAME).
 */
		lltdfxp_handle = new_create_dissector_handle(dissect_lltdfxp,
								 proto_lltdfxp);
		initialized = TRUE;
	} else {

 		/*
		  If you perform registration functions which are dependent upon
		  prefs the you should de-register everything which was associated
		  with the previous settings and re-register using the new prefs
		  settings here. In general this means you need to keep track of
		  the lltdfxp_handle and the value the preference had at the time
		  you registered.  The lltdfxp_handle value and the value of the
		  preference can be saved using local statics in this
		  function (proto_reg_handoff).
		*/

		dissector_delete_uint("ethertype", lltdType, lltdfxp_handle);
	}

	lltdType = gLLTD_ETH_TYPE;

	dissector_add_uint("ethertype", lltdType, lltdfxp_handle);

}

#if 0
/* Simple form of proto_reg_handoff_lltdfxp which can be used if there are
   no prefs-dependent registration function calls.
 */

void
proto_reg_handoff_lltdfxp(void)
{
	dissector_handle_t lltdfxp_handle;

/*  Use new_create_dissector_handle() to indicate that dissect_lltdfxp()
 *  returns the number of bytes it dissected (or 0 if it thinks the packet
 *  does not belong to PROTONAME).
 */
	lltdfxp_handle = new_create_dissector_handle(dissect_lltdfxp,
							 proto_lltdfxp);
	dissector_add_uint("PARENT_SUBFIELD", ID_VALUE, lltdfxp_handle);
}
#endif


