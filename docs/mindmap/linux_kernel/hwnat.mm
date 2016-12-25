<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1360249708896" ID="ID_1314578829" MODIFIED="1360249714958" TEXT="hwnat">
<node CREATED="1360249763494" ID="ID_1633528176" MODIFIED="1360249771365" POSITION="right" TEXT="init">
<node CREATED="1360249784574" ID="ID_458286148" MODIFIED="1360249785886" TEXT="athr_gmac_init">
<node CREATED="1360249802919" ID="ID_1843256901" MODIFIED="1360249804495" TEXT="athr_register_hwaccels">
<node CREATED="1360250697800" ID="ID_700713244" MODIFIED="1360250699664" TEXT="athr_reg_hwaccels">
<node CREATED="1360250807807" ID="ID_307682200" MODIFIED="1360252282869" TEXT="hw_accels-&gt;nat = athrs27_register_nat_ops();&#xa;             athr_nat_ops_t *hw_nat_api&#xa;                  (athrs_s27_nf_nat.c)">
<node CREATED="1360250910022" ID="ID_1710493701" MODIFIED="1360250912071" TEXT="hw_nat_api-&gt;init                 = athr_nat_init;"/>
<node CREATED="1360250925496" ID="ID_1465205699" MODIFIED="1360250929500" TEXT="hw_nat_api-&gt;down                 = athr_nat_down;"/>
<node CREATED="1360250937070" ID="ID_329903463" MODIFIED="1360250938181" TEXT="hw_nat_api-&gt;add_entry            = athr_hw_nat_add_entry;"/>
<node CREATED="1360250949378" ID="ID_1507317866" MODIFIED="1360250950354" TEXT="hw_nat_api-&gt;del_entry            = athr_hw_nat_del_entry;"/>
<node CREATED="1360250963651" ID="ID_551399751" MODIFIED="1360250964795" TEXT="hw_nat_api-&gt;lkp_entry            = athr_hw_nat_lookup_entry;"/>
<node CREATED="1360250976063" ID="ID_1898196547" MODIFIED="1360250977079" TEXT="hw_nat_api-&gt;set_wan_mac_addr     = athr_set_nat_wan_mac;"/>
<node CREATED="1360250988449" ID="ID_150051200" MODIFIED="1360250989965" TEXT="hw_nat_api-&gt;set_wan_ip_addr      = athr_set_nat_wan_ip;"/>
<node CREATED="1360251000921" ID="ID_301588658" LINK="#ID_780620238" MODIFIED="1360251214605" TEXT="hw_nat_api-&gt;reg_net_notifier     = athr_reg_net_notifcations;"/>
<node CREATED="1360251012578" ID="ID_1390040558" MODIFIED="1360251013901" TEXT="hw_nat_api-&gt;unreg_net_notifier   = athr_unreg_net_notifcations;"/>
<node CREATED="1360251025875" ID="ID_537264252" MODIFIED="1360251026730" TEXT="hw_nat_api-&gt;proc_init            = athr_nat_proc_init;"/>
<node CREATED="1360251036865" ID="ID_297536214" MODIFIED="1360251038189" TEXT="hw_nat_api-&gt;proc_remove          = athr_nat_proc_remove;"/>
<node CREATED="1360251049089" ID="ID_1481017974" MODIFIED="1360251050185" TEXT="hw_nat_api-&gt;cleanup              = athr_nat_cleanup;"/>
</node>
<node CREATED="1360253679382" ID="ID_115800439" MODIFIED="1360253842440" TEXT="&#x8c03;&#x7528;hw_nat_api-&gt;set_wan_mac_addr&#x8bbe;&#x7f6e;wan&#x53e3;&#x7684;mac&#x5730;&#x5740;&#xa;wan&#x53e3;&#x7684;mac&#x5730;&#x5740;&#x88ab;&#x4fdd;&#x5b58;&#x5728;&#x5168;&#x5c40;&#x53d8;&#x91cf;athrs_wan_if_mac_addr&#x4e2d;"/>
</node>
</node>
<node CREATED="1360249829511" ID="ID_1827576501" MODIFIED="1360250415561" TEXT="athr_register_hwaccels_notifiers">
<node CREATED="1360250727795" ID="ID_904902627" MODIFIED="1360252475166" TEXT="athr_setup_hwaccels_notifiers&#xa;(athrs_hw_accels.c)">
<node CREATED="1360251136979" ID="ID_780620238" MODIFIED="1360252537931" TEXT="hw_accels-&gt;nat-&gt;reg_net_notifier();&#xa;        athr_reg_net_notifcations&#xa;            (athrs_s27_nf_nat.c)">
<node CREATED="1360251310718" ID="ID_987131876" MODIFIED="1360251888921" TEXT="register_netdevice_notifier(&amp;athr_nat_netdev_notifier);&#xa;wan interface down&#x65f6;&#x7684;&#x52a8;&#x4f5c;">
<node CREATED="1360251855040" ID="ID_1897767701" MODIFIED="1360251856577" TEXT="athr_nat_down"/>
</node>
<node CREATED="1360251325633" ID="ID_1544442614" MODIFIED="1360252198498" TEXT="register_inetaddr_notifier(&amp;athr_nat_inetaddr_notifier);&#xa;wan interface&#x7684;ip&#x5730;&#x5740;&#x53d8;&#x5316;&#x65f6;&#x7684;&#x52a8;&#x4f5c;">
<node CREATED="1360252162426" ID="ID_1422784432" MODIFIED="1360252163657" TEXT="athr_set_nat_wan_ip">
<node CREATED="1360252355580" ID="ID_830299432" MODIFIED="1360252386661" TEXT="athr_reg_write_global_ip_address&#xa;&#x5c06;wan&#x53e3;ip&#x5730;&#x5740;&#x5199;&#x5165;&#x786c;&#x4ef6;&#x5bc4;&#x5b58;&#x5668;"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1360250610777" ID="ID_969179935" MODIFIED="1360250630432" TEXT="athr_gmac_open">
<node CREATED="1360250612698" ID="ID_1181502755" MODIFIED="1360250614848" TEXT="athr_init_hwaccels">
<node CREATED="1360250714212" ID="ID_392828588" MODIFIED="1360252578846" TEXT="athr_setup_hwaccels&#xa;(athrs_hw_accels.c)">
<node CREATED="1360252601572" ID="ID_1421641787" MODIFIED="1360252639393" TEXT="athr_nat_init&#xa;(athrs_s27_nf_nat.c)">
<node CREATED="1360252700118" ID="ID_1815140285" MODIFIED="1360259186579" TEXT="&#x8bbe;&#x7f6e;&#x53d8;&#x91cf;athr_nf_nat_ops_t *athr_nat_sw_ops&#xa;&#x6b64;&#x53d8;&#x91cf;&#x5b9a;&#x4e49;&#x5728;linux kernel tree/net/netfilter/nf_conntrack_core.c">
<node CREATED="1360252740890" ID="ID_515880236" MODIFIED="1360252825227" TEXT="athr_nat_sw_ops-&gt;nf_process_nat   = athr_nf_ct_process_ops"/>
<node CREATED="1360252753307" ID="ID_594678346" MODIFIED="1360261581327" TEXT="athr_nat_sw_ops-&gt;nf_find_get          = athr_nf_find_get&#xa;&#x5728;&#x5185;&#x6838;net&#x4e0b;&#x67e5;&#x627e;&#x4e00;&#x4e2a;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;">
<node CREATED="1360261546849" ID="ID_1638606324" MODIFIED="1360261722292" TEXT="&#x5f53;&#x5305;&#x662f;&#x4ece;wan&#x53e3;&#x8fdb;&#x6765;&#x65f6;,&#x5982;&#x679c;skb-&gt;ath_hw_nat_fw_flags == 3&#xa;&#x8868;&#x793a;&#x5df2;&#x5728;&#x786c;&#x4ef6;&#x4e2d;&#x505a;&#x8fc7;DNAT,&#x6545;&#x800c;&#x5176;&#x76ee;&#x7684;IP&#x5730;&#x5740;&#x5df2;&#x88ab;&#x4fee;&#x6539;&#x8fc7;&#x4e86;,&#x6240;&#x4ee5;&#x67e5;&#x627e;&#x8fde;&#x63a5;&#x65f6;&#x9700;&#x8981;&#x8c03;&#x7528;&#xa;athr_nat_sw_ops-&gt;get_wan_ipaddr&#x6765;&#x5c06;&#x76ee;&#x7684;IP&#x6062;&#x590d;&#x4e3a;wan&#x53e3;&#x7684;IP&#x5730;&#x5740;,&#x4ece;&#x800c;&#x4fdd;&#x8bc1;&#xa;&#x80fd;&#x8fdb;&#x884c;&#x6b63;&#x786e;&#x7684;CT&#x8fde;&#x63a5;&#x67e5;&#x627e;."/>
</node>
<node CREATED="1360252765635" ID="ID_931424464" MODIFIED="1360252845161" TEXT="athr_nat_sw_ops-&gt;get_wan_ipaddr   = athr_get_wan_ip_addr"/>
<node CREATED="1360252777831" ID="ID_736725660" MODIFIED="1360252854122" TEXT="athr_nat_sw_ops-&gt;nf_tuple_taken     = athr_nf_ct_tuple_taken"/>
<node CREATED="1360252788402" ID="ID_490050450" MODIFIED="1360264371238" TEXT="athr_nat_sw_ops-&gt;nf_alter_port        = athr_nf_ct_alter_port&#xa;&#x5904;&#x7406;icmp id&#x88ab;&#x6539;&#x53d8;&#x7684;&#x60c5;&#x51b5;"/>
<node CREATED="1360252800517" ID="ID_1406392292" MODIFIED="1360263194103" TEXT="athr_nat_sw_ops-&gt;check_layer2if      = athr_nf_ct_check_layer2if&#xa;&#x68c0;&#x67e5;&#x5305;&#x6240;&#x7ecf;&#x8fc7;&#x7684;&#x5e95;&#x5c42;L2 interface&#x662f;&#x4e0d;&#x662f;HWNAT&#x6240;&#x652f;&#x6301;&#x7684;interface">
<node CREATED="1360263261774" ID="ID_1868616256" MODIFIED="1360263349530" TEXT="&#x5f53;&#x5e95;&#x5c42;L2 interface&#x662f;ppp&#x63a5;&#x53e3;&#x65f6;&#x4e0d;&#x652f;&#x6301;hwnat&#xa;&#x6240;&#x4ee5;&#x8981;&#x5728;ct-&gt;status&#x4e0a;&#x8bbe;&#x7f6e;IPS_ATHR_HW_SRC_NAT_L2NOSUPPORT_BIT&#x6216;&#xa;IPS_ATHR_HW_DST_NAT_L2NOSUPPORT_BIT"/>
</node>
</node>
<node CREATED="1360252939361" FOLDED="true" ID="ID_1460379056" MODIFIED="1360253392614" TEXT="athr_nat_init_and_enable(EGRESS)&#xa;athr_nat_init_and_enable(INGRESS)">
<node CREATED="1360253110197" ID="ID_536877332" MODIFIED="1360253259243" TEXT="athrs_lut_ageing_timer_disable(direction)&#xa;&#x5173;&#x95ed;lut&#x8868;&#x7684;&#x5b9a;&#x65f6;&#x5220;&#x9664;&#x529f;&#x80fd;"/>
<node CREATED="1360253125552" ID="ID_1838755130" MODIFIED="1360253315168" TEXT="athrs_nat_enable(direction)&#xa;&#x5f00;&#x542f;&#x67d0;&#x4e2a;&#x65b9;&#x5411;&#x4e0a;&#x7684;nat&#x529f;&#x80fd;"/>
<node CREATED="1360253140136" ID="ID_1505046956" MODIFIED="1360253292619" TEXT="athrs_lut_init(direction)&#xa;&#x521d;&#x59cb;&#x5316;&#x67d0;&#x4e2a;&#x65b9;&#x5411;&#x4e0a;&#x7684;lut&#x8868;"/>
</node>
<node CREATED="1360253395078" ID="ID_1650537899" LINK="#ID_115800439" MODIFIED="1360253797414" TEXT="athrs_hw_nat_set_router_mac_addr, &#x5c06;wan&#x53e3;&#x7684;mac&#x5730;&#x5740;&#x8bbe;&#x7f6e;&#x5230;&#x786c;&#x4ef6;&#x5bc4;&#x5b58;&#x5668;&#xa;wan&#x53e3;&#x7684;mac&#x5730;&#x5740;&#x88ab;&#x4fdd;&#x5b58;&#x5728;&#x5168;&#x5c40;&#x53d8;&#x91cf;athrs_wan_if_mac_addr&#x4e2d;, &#x6b64;&#x503c;&#x5728;&#x51fd;&#x6570;&#xa;athr_reg_hwaccels&#x4e2d;&#x88ab;&#x8bbe;&#x7f6e;"/>
<node CREATED="1360253909805" ID="ID_613239070" MODIFIED="1360253958464" TEXT="athrs_nat_op_lock_init&#xa;&#x521d;&#x59cb;&#x5316;&#x4ee5;&#x4e0b;2&#x4e2a;&#x81ea;&#x65cb;&#x9501;:&#xa;athrs_nat_op_lock&#xa;athrs_lut_op_lock"/>
<node CREATED="1360254043514" ID="ID_673221899" MODIFIED="1360254054259" TEXT="&#x5206;&#x914d;hash&#x8868;hwnat_mod_hash"/>
<node CREATED="1360254063422" ID="ID_1449462048" MODIFIED="1360254083234" TEXT="&#x5206;&#x914d;&#x786c;&#x4ef6;nat&#x6761;&#x76ee;&#x7f13;&#x5b58;nf_hwnat_cachep"/>
<node CREATED="1360254119533" ID="ID_1502865679" MODIFIED="1360254157824" TEXT="athr_nat_proc_init&#xa;&#x521b;&#x5efa;&#x76ee;&#x5f55;/proc/net/nf_nat&#xa;&#x521b;&#x5efa;&#x76ee;&#x5f55;/proc/net/hw_nat"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1360250465189" ID="ID_1730754357" MODIFIED="1360250473972" POSITION="right" TEXT="receive packet">
<node CREATED="1360250475322" ID="ID_172739567" MODIFIED="1360257585154" TEXT="athr_nat_process_ingress_pkts&#xa;&#x6839;&#x636e;&#x6240;&#x6536;&#x5305;&#x7684;descriptor&#x7684;RX_NAT_STATUS&#x4f4d;&#x8bbe;&#x7f6e;&#xa;skb-&gt;ath_hw_nat_fw_flags">
<node CREATED="1360257183418" ID="ID_1025513841" MODIFIED="1360257207494" TEXT="&#x5982;&#x679c;&#x662f;&#x4ece;lan&#x53e3;&#x8fdb;&#x6765;&#x7684;&#x5305;&#x5219;&#x8bbe;&#x7f6e;skb-&gt;ath_hw_nat_fw_flags = 1"/>
<node CREATED="1360257183418" ID="ID_1506501728" MODIFIED="1360257289592" TEXT="&#x5982;&#x679c;&#x662f;&#x4ece;wan&#x53e3;&#x8fdb;&#x6765;&#x7684;&#x5305;&#x4e14;&#x505a;&#x8fc7;DNAT&#x5219;&#x8bbe;&#x7f6e;skb-&gt;ath_hw_nat_fw_flags = 3"/>
<node CREATED="1360257183418" ID="ID_1633783356" MODIFIED="1360257340271" TEXT="&#x5982;&#x679c;&#x662f;&#x4ece;wan&#x53e3;&#x8fdb;&#x6765;&#x7684;&#x5305;&#x4f46;&#x672a;&#x505a;&#x8fc7;DNAT&#x5219;&#x8bbe;&#x7f6e;skb-&gt;ath_hw_nat_fw_flags = 100"/>
<node CREATED="1360257183418" ID="ID_1036429465" MODIFIED="1360257369305" TEXT="&#x5982;&#x679c;&#x4e0d;&#x662f;IP&#x5305;&#x5219;&#x8bbe;&#x7f6e;skb-&gt;ath_hw_nat_fw_flags = 0"/>
</node>
</node>
<node CREATED="1360250520159" ID="ID_736697405" MODIFIED="1360250524299" POSITION="right" TEXT="send packet">
<node CREATED="1360250525801" ID="ID_44957687" MODIFIED="1360257795305" TEXT="athr_nat_process_egress_pkts&#xa;&#x6839;&#x636e;&#x5305;&#x7684;skb-&gt;ath_hw_nat_fw_flags&#x8bbe;&#x7f6e;&#xa;descriptor&#x7684;RX_NAT_STATUS&#x4f4d;&#xa;">
<node CREATED="1360257826441" ID="ID_750845411" MODIFIED="1360257950869" TEXT="&#x5982;&#x679c;skb-&gt;ath_hw_nat_fw_flags = 2&#x5219;&#x8868;&#x793a;&#x5305;&#x8981;&#x4ece;wan&#x53e3;&#x51fa;&#x53bb;&#x4e14;&#x9700;&#x8981;&#x786c;&#x4ef6;&#x505a;SNAT&#xa;&#x6240;&#x4ee5;&#x8bbe;&#x7f6e;descriptor&#x7684;TX_NAT_ENABLE&#x4f4d;"/>
<node CREATED="1360257826441" ID="ID_1889061207" MODIFIED="1360258060718" TEXT="&#x5982;&#x679c;skb-&gt;ath_hw_nat_fw_flags != 2&#x4f46;&#x662f;&#x6b64;&#x5305;&#x5bf9;&#x5e94;&#x7684;&#x8fde;&#x63a5;&#x5df2;&#x88ab;&#x52a0;&#x5165;&#x786c;&#x4ef6;&#x5219;&#xa;&#x4ecd;&#x8bbe;&#x7f6e;descriptor&#x7684;TX_NAT_ENABLE&#x4f4d;,&#x8868;&#x793a;&#x7528;&#x786c;&#x4ef6;&#x505a;SNAT"/>
</node>
</node>
<node CREATED="1360251913480" ID="ID_1053363228" MODIFIED="1360251922403" POSITION="left" TEXT="&#x9057;&#x7559;&#x95ee;&#x9898;">
<node CREATED="1360251923688" ID="ID_1905425732" MODIFIED="1360252022900" TEXT="&#x5b8f;ATH_WAN_INTERFACE&#x5c06;wan&#x5b9a;&#x4e49;&#x4e3a;eth0, &#x8fd9;&#x5728;qsdk&#x5e73;&#x53f0;&#x4e0a;&#x662f;&#x6709;&#x95ee;&#x9898;&#x7684;,wan&#x53e3;&#x5e94;&#x52a8;&#x6001;&#x83b7;&#x53d6;"/>
<node CREATED="1360256166363" ID="ID_1351647133" MODIFIED="1360256192270" TEXT="&#x4ec0;&#x4e48;&#x60c5;&#x51b5;&#x4e0b;&#x9700;&#x8981;&#x5bf9;tcp&#x7684;&#x5e8f;&#x5217;&#x53f7;&#x8fdb;&#x884c;&#x8c03;&#x6574;"/>
</node>
<node CREATED="1360255488476" ID="ID_1136480656" MODIFIED="1360255495115" POSITION="left" TEXT="kernel patch">
<node CREATED="1360255497203" ID="ID_1821276789" MODIFIED="1360255513079" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;&#x7684;patch">
<node CREATED="1360255584293" ID="ID_1060688376" MODIFIED="1360255585893" TEXT="struct nf_conn">
<node CREATED="1360255869112" ID="ID_1477054963" MODIFIED="1360255871432" TEXT="unsigned long status">
<node CREATED="1360255946798" ID="ID_940683865" MODIFIED="1360255953664" TEXT="IPS_NAT_ALG_PKT(11)"/>
<node CREATED="1360255966669" ID="ID_832537312" MODIFIED="1360255970344" TEXT="IPS_ATHR_HW_NAT_ADDED(12)"/>
<node CREATED="1360255979945" ID="ID_1127362434" MODIFIED="1360255984388" TEXT="IPS_ATHR_HW_NAT_IS_UDP(13)"/>
<node CREATED="1360255993829" ID="ID_696209884" MODIFIED="1360255998200" TEXT="IPS_ATHR_HW_NAT_IS_ONLY_EGRESS(14)"/>
<node CREATED="1360256008983" ID="ID_792097675" MODIFIED="1360256012813" TEXT="IPS_ATHR_SW_NAT_SKIPPED(15)"/>
<node CREATED="1360256022600" ID="ID_57211479" MODIFIED="1360256026929" TEXT="IPS_ATHR_HW_CT_INGRESS(16)"/>
<node CREATED="1360256035553" ID="ID_184736268" MODIFIED="1360256039971" TEXT="IPS_ATHR_HW_CT_EGRESS(17)"/>
<node CREATED="1360256050551" ID="ID_1678503129" MODIFIED="1360256054705" TEXT="IPS_ATHR_HW_SRC_NAT_L2NOSUPPORT(18)"/>
<node CREATED="1360256065260" ID="ID_1991169546" MODIFIED="1360256069438" TEXT="IPS_ATHR_HW_DST_NAT_L2NOSUPPORT(19)"/>
</node>
<node CREATED="1360255598465" ID="ID_469259327" MODIFIED="1360255600061" TEXT="void *hwnat_priv"/>
</node>
<node CREATED="1360255714154" ID="ID_1146690614" MODIFIED="1360255715491" TEXT="struct sk_buff">
<node CREATED="1360255731690" ID="ID_1567767241" MODIFIED="1360255733482" TEXT="ath_hw_nat_fw_flags">
<node CREATED="1360257385453" ID="ID_1256629885" MODIFIED="1360257420793" TEXT="0 : &#x4e0d;&#x662f;IP&#x5305;"/>
<node CREATED="1360257390313" ID="ID_216690250" MODIFIED="1360257435913" TEXT="1 : &#x4ece;lan&#x53e3;&#x8fdb;&#x6765;&#x7684;&#x5305;"/>
<node CREATED="1360258104689" ID="ID_1676526915" MODIFIED="1360258118689" TEXT="2 : &#x4ece;wan&#x53e3;&#x51fa;&#x53bb;&#x4e14;&#x9700;&#x8981;&#x786c;&#x4ef6;&#x505a;SNAT"/>
<node CREATED="1360257393476" ID="ID_465117312" MODIFIED="1360257452454" TEXT="3 : &#x4ece;wan&#x53e3;&#x8fdb;&#x6765;&#x7684;&#x5305;&#x4e14;&#x505a;&#x8fc7;DNAT"/>
<node CREATED="1360257396541" ID="ID_1573362980" MODIFIED="1360257468242" TEXT="100 : &#x4ece;wan&#x53e3;&#x8fdb;&#x6765;&#x7684;&#x5305;&#x4f46;&#x672a;&#x505a;&#x8fc7;DNAT"/>
</node>
</node>
</node>
<node CREATED="1360258836546" ID="ID_72015945" MODIFIED="1360258866660" TEXT="&#x5305;&#x5904;&#x7406;&#x6d41;&#x7a0b;&#x7684;patch">
<node CREATED="1360258873092" ID="ID_1742819708" MODIFIED="1360258927246" TEXT="nf_conntrack_destroy&#xa;(net/netfilter/core.c)">
<node CREATED="1360258900972" ID="ID_895571236" LINK="#ID_515880236" MODIFIED="1360259058076" TEXT="&#x5f53;&#x8fde;&#x63a5;&#x88ab;&#x5220;&#x9664;&#x65f6;&#x8c03;&#x7528;athr_nat_sw_ops-&gt;nf_process_nat(NULL, ct, 0, 0)"/>
</node>
<node CREATED="1360259244452" ID="ID_469052547" MODIFIED="1360259274428" TEXT="death_by_timeout&#xa;(net/netfilter/nf_conntrack_core.c)">
<node CREATED="1360258900972" ID="ID_1808790464" LINK="#ID_515880236" MODIFIED="1360259058076" TEXT="&#x5f53;&#x8fde;&#x63a5;&#x88ab;&#x5220;&#x9664;&#x65f6;&#x8c03;&#x7528;athr_nat_sw_ops-&gt;nf_process_nat(NULL, ct, 0, 0)"/>
</node>
<node CREATED="1360259472019" ID="ID_151483415" MODIFIED="1360259489842" TEXT="nf_conntrack_tuple_taken&#xa;(net/netfilter/nf_conntrack_core.c)">
<node CREATED="1360259506094" ID="ID_914705916" LINK="#ID_736725660" MODIFIED="1360259649876" TEXT="athr_nat_sw_ops-&gt;nf_tuple_taken(tuple, ignored_conntrack)&#xa;&#x5982;&#x679c;&#x4e00;&#x4e2a;tuple&#x5728;hwnat&#x7f13;&#x5b58;&#x4e2d;&#x5b58;&#x5728;,&#x5219;&#x4e5f;&#x53ef;&#x4ee5;&#x8ba4;&#x4e3a;&#x6b64;tuple&#x5728;&#x6574;&#x4e2a;&#x5185;&#x6838;&#x4e2d;&#x5b58;&#x5728;"/>
</node>
<node CREATED="1360260995212" ID="ID_833585751" MODIFIED="1360261013825" TEXT="nf_conntrack_in&#xa;(net/netfilter/nf_conntrack_core.c)">
<node CREATED="1360261031672" ID="ID_1715676741" MODIFIED="1360261306227" TEXT="resolve_normal_ct&#xa;(net/netfilter/nf_conntrack_core.c)&#xa;&#x627e;&#x5230;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;,&#x5982;&#x679c;&#x4e0d;&#x5b58;&#x5728;&#x5219;&#x4e3a;&#x5176;&#x521b;&#x5efa;&#x4e00;&#x4e2a;&#x65b0;&#x8fde;&#x63a5;">
<node CREATED="1360261323459" ID="ID_1403359543" LINK="#ID_594678346" MODIFIED="1360261775192" TEXT="athr_nat_sw_ops-&gt;nf_find_get(net, &amp;tuple, skb-&gt;ath_hw_nat_fw_flags, &amp;h)&#xa;&#x5f53;&#x5305;&#x662f;&#x4ece;wan&#x53e3;&#x8fdb;&#x6765;&#x65f6;,&#x5982;&#x679c;skb-&gt;ath_hw_nat_fw_flags == 3&#xa;&#x8868;&#x793a;&#x5df2;&#x5728;&#x786c;&#x4ef6;&#x4e2d;&#x505a;&#x8fc7;DNAT,&#x6545;&#x800c;&#x5176;&#x76ee;&#x7684;IP&#x5730;&#x5740;&#x5df2;&#x88ab;&#x4fee;&#x6539;&#x8fc7;&#x4e86;,&#x6240;&#x4ee5;&#x67e5;&#x627e;&#x8fde;&#x63a5;&#x65f6;&#x9700;&#x8981;&#x8c03;&#x7528;&#xa;athr_nat_sw_ops-&gt;get_wan_ipaddr&#x6765;&#x5c06;&#x76ee;&#x7684;IP&#x6062;&#x590d;&#x4e3a;wan&#x53e3;&#x7684;IP&#x5730;&#x5740;,&#x4ece;&#x800c;&#x4fdd;&#x8bc1;&#xa;&#x80fd;&#x8fdb;&#x884c;&#x6b63;&#x786e;&#x7684;CT&#x8fde;&#x63a5;&#x67e5;&#x627e;."/>
<node CREATED="1360260462096" ID="ID_1227985822" MODIFIED="1360260478626" TEXT="init_conntrack&#xa;(net/netfilter/nf_conntrack_core.c)">
<node CREATED="1360260517711" ID="ID_442322527" MODIFIED="1360260843597" TEXT="&#x5f53;&#x4ece;wan&#x53e3;&#x8fdb;&#x6765;&#x7684;&#x4e00;&#x4e2a;&#x5305;&#x5bfc;&#x81f4;&#x9700;&#x8981;&#x521b;&#x5efa;&#x4e00;&#x4e2a;&#x65b0;&#x7684;&#x8fde;&#x63a5;&#x65f6;,&#x5982;&#x679c;skb-&gt;ath_hw_nat_fw_flags == 3&#xa;&#x8868;&#x793a;&#x5df2;&#x5728;&#x786c;&#x4ef6;&#x4e2d;&#x505a;&#x8fc7;DNAT,&#x6545;&#x800c;&#x5176;&#x76ee;&#x7684;IP&#x5730;&#x5740;&#x5df2;&#x88ab;&#x4fee;&#x6539;&#x8fc7;&#x4e86;,&#x6240;&#x4ee5;&#x521b;&#x5efa;&#x65b0;&#x8fde;&#x63a5;&#x65f6;&#x9700;&#x8981;&#x8c03;&#x7528;&#xa;athr_nat_sw_ops-&gt;get_wan_ipaddr&#x6765;&#x5c06;&#x76ee;&#x7684;IP&#x6062;&#x590d;&#x4e3a;wan&#x53e3;&#x7684;IP&#x5730;&#x5740;,&#x4ece;&#x800c;&#x4fdd;&#x8bc1;CT&#x8fde;&#x63a5;&#x662f;&#x5bf9;&#x7684;.&#xa;&#xa;&#x540c;&#x65f6;&#x8bbe;&#x7f6e;set_bit(IPS_ATHR_SW_NAT_SKIPPED_BIT, &amp;ct-&gt;status)&#x8868;&#x793a;&#x4e0d;&#x9700;&#x8981;&#x518d;&#x5728;&#x5185;&#x6838;&#x4e2d;&#x505a;NAT&#x4e86;"/>
</node>
</node>
<node CREATED="1360261067166" ID="ID_265817888" MODIFIED="1360261082905" TEXT="athr_nat_sw_ops-&gt;nf_process_nat(skb, ct, ctinfo, protonum)"/>
</node>
<node CREATED="1360263427925" ID="ID_536940782" MODIFIED="1360263861156" TEXT="nf_nat_fn&#xa;&#x6839;&#x636e;&#x5df2;&#x7ecf;&#x5efa;&#x7acb;&#x7684;&#x8fde;&#x63a5;&#x4fe1;&#x606f;&#x67e5;&#x627e;iptables&#x7684;nat chain&#x4ee5;&#x83b7;&#x53d6;nat&#x4fe1;&#x606f;(nf_nat_setup_info),&#xa;&#x518d;&#x6839;&#x636e;&#x5df2;&#x5efa;&#x7acb;&#x7684;nat&#x4fe1;&#x606f;&#x4fee;&#x6539;&#x5305;&#x548c;ct&#x91cc;&#x7684;reply tuple(nf_nat_packet).&#xa;">
<node CREATED="1360263638021" ID="ID_1427322430" MODIFIED="1360263673810" TEXT="&#x5f53;skb-&gt;ath_hw_nat_fw_flags == 2(&#x6807;&#x8bb0;&#x4e3a;&#x9700;&#x8981;&#x5728;&#x786c;&#x4ef6;&#x91cc;&#x505a;SNAT)&#xa;&#x6216;skb-&gt;ath_hw_nat_fw_flags == 3(&#x6807;&#x8bb0;&#x4e3a;&#x5df2;&#x7ecf;&#x5728;&#x786c;&#x4ef6;&#x91cc;&#x505a;&#x5b8c;DNAT)&#x65f6;&#xa;&#x65e0;&#x987b;&#x518d;&#x505a;nat"/>
<node CREATED="1360263008407" ID="ID_1358927563" MODIFIED="1360263010801" TEXT="nf_nat_rule_find">
<node CREATED="1360262810122" ID="ID_746667151" MODIFIED="1360262951936" TEXT="ipt_do_table&#xa;&#x5f53;skb-&gt;ath_hw_nat_fw_flags == 2(&#x6807;&#x8bb0;&#x4e3a;&#x9700;&#x8981;&#x5728;&#x786c;&#x4ef6;&#x91cc;&#x505a;SNAT)&#xa;&#x6216;skb-&gt;ath_hw_nat_fw_flags == 3(&#x6807;&#x8bb0;&#x4e3a;&#x5df2;&#x7ecf;&#x5728;&#x786c;&#x4ef6;&#x91cc;&#x505a;&#x5b8c;DNAT)&#x65f6;&#xa;&#x65e0;&#x987b;&#x518d;&#x67e5;&#x627e;nat&#x8868;">
<node CREATED="1360264109255" ID="ID_1226924716" MODIFIED="1360264179989" TEXT="nf_nat_setup_info&#xa;&#x6839;&#x636e;iptables&#x89c4;&#x5219;(&#x4e3b;&#x8981;&#x662f;masquerade)&#x5efa;&#x7acb;nat&#x4fe1;&#x606f;,&#x4e3b;&#x8981;&#x5c31;&#x662f;&#x4fee;&#x6539;reply&#x7684;tuple">
<node CREATED="1360264199884" ID="ID_63414115" LINK="#ID_490050450" MODIFIED="1360264259817" TEXT="athr_nat_sw_ops-&gt;nf_alter_port(curr_tuple, new_tuple, ct)"/>
</node>
</node>
<node CREATED="1360263095689" ID="ID_110749934" LINK="#ID_1406392292" MODIFIED="1360263169534" TEXT="athr_nat_sw_ops-&gt;check_layer2if&#xa;&#x68c0;&#x67e5;&#x5e95;&#x5c42;L2 interface&#x662f;&#x4e0d;&#x662f;HWNAT&#x6240;&#x652f;&#x6301;&#x7684;interface"/>
</node>
</node>
</node>
</node>
</node>
</map>
