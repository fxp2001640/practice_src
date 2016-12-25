<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1294810295625" ID="ID_1772130352" MODIFIED="1294884343504" TEXT="netfilter">
<node CREATED="1294812874832" FOLDED="true" ID="ID_11445743" MODIFIED="1443060885952" POSITION="right" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<icon BUILTIN="folder"/>
<node CREATED="1307951687639" ID="ID_529241814" MODIFIED="1307951698155" TEXT="nat&#x5206;&#x7c7b;">
<node CREATED="1307951708567" FOLDED="true" ID="ID_1873847937" MODIFIED="1307956279610" TEXT="&#x9525;&#x5f62;nat (cone nat)">
<node CREATED="1307951776127" ID="ID_222208348" MODIFIED="1307951789439" TEXT="full cone nat">
<node CREATED="1307952033678" ID="ID_1612959535" MODIFIED="1307953785690">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      egress :&#160;
    </p>
    <p>
      (src=internal_ip_1, src_port=internal_port_1, dst=*, dst_port=*)
    </p>
    <p>
      ==&gt;
    </p>
    <p>
      (src=external_ip_1, src_port=external_port_1, dst=(=*), dst_port=(=*))
    </p>
    <p>
      &#19981;&#31649;&#21253;&#30340;dst ip&#21644;dst port&#20026;&#22810;&#23569;,&#30456;&#21516;&#30340;&#20869;&#37096;src ip&#21644;&#20869;&#37096;src port&#23558;&#26144;&#23556;&#21040;&#30456;&#21516;&#30340;
    </p>
    <p>
      &#22806;&#37096;src ip&#21644;&#22806;&#37096;src port
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1307952533801" ID="ID_1470027352" MODIFIED="1307954019734">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ingress:
    </p>
    <p>
      (src=*, src_port=*, dst=external_ip_1, dst_port=external_port_1)
    </p>
    <p>
      ==&gt;
    </p>
    <p>
      (src=(=*), src_port=(=*), dst=internal_ip_1, dst_port=internal_port_1)
    </p>
    <p>
      &#19981;&#31649;&#21253;&#30340;src ip&#21644;src port&#20026;&#22810;&#23569;,&#25152;&#26377;dst ip=external_ip_1, dst port=external_port_1
    </p>
    <p>
      &#30340;&#21253;&#37117;&#23558;&#26144;&#23556;&#21040;dst ip=internal_ip_1, dst_port=internal_port_1
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1307951790528" ID="ID_402064787" MODIFIED="1307951806577" TEXT="restricted cone nat">
<node CREATED="1307952033678" ID="ID_691475077" MODIFIED="1307954197636">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      egress :&#160;
    </p>
    <p>
      (src=internal_ip_1, src_port=internal_port_1, dst=*, dst_port=*)
    </p>
    <p>
      ==&gt;add dst to table(internal_ip_1, internal_port_1)
    </p>
    <p>
      (src=external_ip_1, src_port=external_port_1, dst=(=*), dst_port=(=*))
    </p>
    <p>
      &#19981;&#31649;&#21253;&#30340;dst ip&#21644;dst port&#20026;&#22810;&#23569;,&#30456;&#21516;&#30340;&#20869;&#37096;src ip&#21644;&#20869;&#37096;src port&#23558;&#26144;&#23556;&#21040;&#30456;&#21516;&#30340;
    </p>
    <p>
      &#22806;&#37096;src ip&#21644;&#22806;&#37096;src port
    </p>
    <p>
      &#26144;&#23556;&#30340;&#21516;&#26102;,&#23558;&#21253;&#30340;&#30446;&#30340;&#22320;&#22336;&#21152;&#20837;&#20197;(internal_ip_1, internal_port_1)&#20026;key&#30340;&#34920;&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1307952533801" ID="ID_1760406560" MODIFIED="1307954324581">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ingress:
    </p>
    <p>
      (src=*, src_port=*, dst=external_ip_1, dst_port=external_port_1)
    </p>
    <p>
      ==&gt;if src in table(internal_ip_1, internal_port_1)
    </p>
    <p>
      (src=(=*), src_port=(=*), dst=internal_ip_1, dst_port=internal_port_1)
    </p>
    <p>
      &#20165;&#24403;&#21253;&#30340;src ip&#22312;&#20197;(internal_ip_1, internal_port_1)&#20026;key&#30340;&#34920;&#20013;&#26102;,&#25165;&#23558;
    </p>
    <p>
      dst ip=external_ip_1, dst port=external_port_1&#30340;&#21253;&#26144;&#23556;&#21040;
    </p>
    <p>
      dst ip=internal_ip_1, dst_port=internal_port_1
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1307951807858" ID="ID_1834184896" MODIFIED="1307951820413" TEXT="port restricted cone nat">
<node CREATED="1307952033678" ID="ID_679013788" MODIFIED="1307954405149">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      egress :&#160;
    </p>
    <p>
      (src=internal_ip_1, src_port=internal_port_1, dst=*, dst_port=*)
    </p>
    <p>
      ==&gt;add (dst, dst_port) to table(internal_ip_1, internal_port_1)
    </p>
    <p>
      (src=external_ip_1, src_port=external_port_1, dst=(=*), dst_port=(=*))
    </p>
    <p>
      &#19981;&#31649;&#21253;&#30340;dst ip&#21644;dst port&#20026;&#22810;&#23569;,&#30456;&#21516;&#30340;&#20869;&#37096;src ip&#21644;&#20869;&#37096;src port&#23558;&#26144;&#23556;&#21040;&#30456;&#21516;&#30340;
    </p>
    <p>
      &#22806;&#37096;src ip&#21644;&#22806;&#37096;src port
    </p>
    <p>
      &#26144;&#23556;&#30340;&#21516;&#26102;,&#23558;&#21253;&#30340;(dst ip, dst port)&#21152;&#20837;&#20197;(internal_ip_1, internal_port_1)&#20026;key&#30340;&#34920;&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1307952533801" ID="ID_309440189" MODIFIED="1307954443753">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ingress:
    </p>
    <p>
      (src=*, src_port=*, dst=external_ip_1, dst_port=external_port_1)
    </p>
    <p>
      ==&gt;if (src, src_port) in table(internal_ip_1, internal_port_1)
    </p>
    <p>
      (src=(=*), src_port=(=*), dst=internal_ip_1, dst_port=internal_port_1)
    </p>
    <p>
      &#20165;&#24403;&#21253;&#30340;(src ip, src port)&#22312;&#20197;(internal_ip_1, internal_port_1)&#20026;key&#30340;&#34920;&#20013;&#26102;,&#25165;&#23558;
    </p>
    <p>
      dst ip=external_ip_1, dst port=external_port_1&#30340;&#21253;&#26144;&#23556;&#21040;
    </p>
    <p>
      dst ip=internal_ip_1, dst_port=internal_port_1
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1307951744251" FOLDED="true" ID="ID_1394590602" MODIFIED="1307956277737" TEXT="&#x5bf9;&#x79f0;nat (symmetric nat)">
<node CREATED="1307952033678" ID="ID_1832197376" MODIFIED="1307955781177">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      egress :&#160;
    </p>
    <p>
      (src=internal_ip_1, src_port=internal_port_1, dst=outside_ip_1, dst_port=outside_port_1)
    </p>
    <p>
      ==&gt;
    </p>
    <p>
      (src=external_ip_1, src_port=external_port_1, dst=outside_ip_1, dst_port=outside_port_1)
    </p>
    <p>
      &#21482;&#35201;4&#20803;&#32452;&#20013;&#20219;&#20309;&#19968;&#20010;&#20803;&#32032;&#19981;&#21516;,&#37027;&#20040;&#23558;&#26144;&#23556;&#21040;&#19981;&#21516;&#30340;external port&#19978;
    </p>
    <p>
      egress&#26102;&#20197;&#19978;&#38754;&#30340;&#22235;&#20803;&#32452;&#20026;key,&#19979;&#38754;&#30340;&#22235;&#20803;&#32452;&#20026;value
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1307952033678" ID="ID_750311936" MODIFIED="1307956157718">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ingress :&#160;
    </p>
    <p>
      (src=outside_ip_1, src_port=outside_port_1, dst=external_ip_1, dst_port=external_port_1)
    </p>
    <p>
      ==&gt;
    </p>
    <p>
      (src=outside_ip_1, src_port=outside_port_1, dst=internal_ip_1, dst_port=internal_port_1)
    </p>
    <p>
      &#20165;&#24403;(src=internal_ip_1, src_port=internal_port_1, dst=outside_ip_1, dst_port=outside_port_1)
    </p>
    <p>
      &#23384;&#22312;&#26102;,&#25165;&#36827;&#34892;&#26144;&#23556;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1294812921800" ID="ID_438803782" MODIFIED="1304996751805" TEXT="&#x94fe;chain&#x7684;&#x987a;&#x5e8f;&#x56fe;">
<node CREATED="1294813853591" ID="ID_531335354" MODIFIED="1329461504717">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="./pic/netfilter_chain.jpg" />
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1294812972922" ID="ID_183333614" MODIFIED="1304996894004" TEXT="&#x8868;table&#x7684;&#x4f18;&#x5148;&#x7ea7;">
<node CREATED="1294814837904" ID="ID_803030842" MODIFIED="1294815149639">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      CONNTRACK_DEFRAG
    </p>
    <p>
      RAW
    </p>
    <p>
      SELINUX_FIRST
    </p>
    <p>
      CONNTRACK
    </p>
    <p>
      MANGLE
    </p>
    <p>
      NAT_DST
    </p>
    <p>
      FILTER
    </p>
    <p>
      SECURITY
    </p>
    <p>
      NAT_SRC
    </p>
    <p>
      SELINUX_LAST
    </p>
    <p>
      CONNTRACK_CONFIRM
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1294818799687" ID="ID_173181923" MODIFIED="1307086875051" TEXT="&#x91cd;&#x8981;&#x7684;&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1294818814122" ID="ID_988155663" MODIFIED="1307086877694" TEXT="struct nf_conntrack_tuple">
<node CREATED="1294818880991" ID="ID_1012227637" MODIFIED="1307086879902" TEXT="src">
<node CREATED="1294818959494" ID="ID_1683733757" MODIFIED="1294819126938" TEXT="l3 src address"/>
<node CREATED="1294818974648" ID="ID_1144357100" MODIFIED="1294819018561" TEXT="l4 src port"/>
<node CREATED="1294818985303" ID="ID_1640796588" MODIFIED="1294818993471" TEXT="l3 protocol"/>
</node>
<node CREATED="1294818917022" ID="ID_1574012488" MODIFIED="1307086888669" TEXT="dst">
<node CREATED="1294819021873" ID="ID_704593171" MODIFIED="1294819031876" TEXT="l3 dst address"/>
<node CREATED="1294819036340" ID="ID_250057958" MODIFIED="1294819044374" TEXT="l4 dst port"/>
<node CREATED="1294819046446" ID="ID_514644056" MODIFIED="1294819056571" TEXT="l4 protocol"/>
<node CREATED="1294819068946" ID="ID_1907669747" MODIFIED="1294819076864" TEXT="direction"/>
</node>
</node>
<node CREATED="1294820828836" ID="ID_798509191" MODIFIED="1307096995607" TEXT="struct nf_conn">
<node CREATED="1294820860514" ID="ID_1944484565" MODIFIED="1294820877033" TEXT="struct nf_conntrack  &#xff1a;ct_general"/>
<node CREATED="1294820922158" ID="ID_1534655627" MODIFIED="1294820964776" TEXT="struct nf_conntrack_tuple_hash &#xff1a;tuplehash[direction]"/>
<node CREATED="1294820981945" ID="ID_1217272874" MODIFIED="1294820985455" TEXT="status">
<node CREATED="1308046523945" ID="ID_760806352" MODIFIED="1308046527498" TEXT="IPS_EXPECTED_BIT"/>
<node CREATED="1308046534058" ID="ID_1936176978" MODIFIED="1308047105888">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      IPS_SEEN_REPLY_BIT :
    </p>
    <p>
      &#23545;tcp&#32780;&#35328;: original&#26041;&#21521;&#21457;&#21253;&#21518;,reply&#26041;&#21521;&#20877;&#21457;&#21253;&#21363;&#20250;&#35774;&#32622;&#27492;&#20301;
    </p>
    <p>
      &#23545;udp&#32780;&#35328;: original&#26041;&#21521;&#21457;&#21253;&#21518;,reply&#26041;&#21521;&#20877;&#21457;&#21253;&#21363;&#20250;&#35774;&#32622;&#27492;&#20301;
    </p>
    <p>
      &#27880;&#24847;&#27492;&#20301;&#30340;&#35774;&#32622;&#26159;&#21327;&#35758;&#26080;&#20851;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308046653576" ID="ID_784639871" MODIFIED="1308047112465">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      IPS_ASSURED_BIT:
    </p>
    <p>
      &#23545;tcp&#32780;&#35328;: &#19977;&#27425;&#25569;&#25163;&#23436;&#25104;&#21518;,&#20219;&#24847;&#26041;&#21521;&#20877;&#21457;&#21253;&#21363;&#20250;&#35774;&#32622;&#27492;&#20301;
    </p>
    <p>
      &#23545;udp&#32780;&#35328;: &#33509;IPS_SEEN_REPLY_BIT&#24050;&#35774;&#32622;, &#21017;&#20219;&#24847;&#26041;&#21521;&#20877;&#21457;&#21253;&#21363;&#20250;&#35774;&#32622;&#27492;&#20301;
    </p>
    <p>
      &#27880;&#24847;&#27492;&#20301;&#30340;&#35774;&#32622;&#26159;&#21327;&#35758;&#30456;&#20851;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1294821002029" ID="ID_938499435" MODIFIED="1294821241320" TEXT="struct nf_conn * &#xff1a;master &#xff1a;&#x6b64;&#x8fde;&#x63a5;&#x662f;master&#x7684;related&#x8fde;&#x63a5;"/>
<node CREATED="1294821044245" ID="ID_285866967" MODIFIED="1294821048597" TEXT="timeout"/>
<node CREATED="1294821050142" ID="ID_1264914533" MODIFIED="1294821056341" TEXT="mark"/>
<node CREATED="1294821093734" ID="ID_610572863" MODIFIED="1294821103266" TEXT="union nf_conntrack_proto &#xff1a;proto"/>
<node CREATED="1294821123860" ID="ID_1402212699" MODIFIED="1294821134166" TEXT="struct nf_ct_ext * &#xff1a;ext">
<node CREATED="1294821409921" ID="ID_1038053368" MODIFIED="1294822801417" TEXT="offset &#xff1a;&#x5404;&#x79cd;&#x6269;&#x5c55;&#x6570;&#x636e;&#x7684;&#x504f;&#x79fb;&#x4f4d;&#x7f6e;"/>
<node CREATED="1294821427365" ID="ID_1844454871" MODIFIED="1294822781903" TEXT="len &#xff1a; &#x5934;&#x90e8;&#x548c;&#x6269;&#x5c55;&#x6570;&#x636e;&#x7684;&#x603b;&#x957f;"/>
<node CREATED="1294821433142" ID="ID_1424211174" MODIFIED="1294822750071" TEXT="data[0] &#xff1a;&#x771f;&#x6b63;&#x6570;&#x636e;&#x5f00;&#x59cb;&#x7684;&#x5730;&#x65b9;"/>
</node>
<node CREATED="1294821145008" ID="ID_1743943637" MODIFIED="1294821155053" TEXT="struct net * &#xff1a;ct_net"/>
</node>
<node CREATED="1294826477160" FOLDED="true" ID="ID_1846680257" MODIFIED="1299052618954" TEXT="struct nf_conn_help">
<node CREATED="1294826498588" FOLDED="true" ID="ID_974300598" MODIFIED="1299034106381" TEXT="struct nf_conntrack_helper * &#xff1a;helper">
<node CREATED="1294826655562" ID="ID_76822072" MODIFIED="1294826659535" TEXT="hnode"/>
<node CREATED="1294826666836" ID="ID_1329998268" MODIFIED="1294826670517" TEXT="name"/>
<node CREATED="1294826684103" ID="ID_1472809562" MODIFIED="1294826706851" TEXT="struct module * &#xff1a;me &#xff1a;&#x6307;&#x5411;&#x6a21;&#x5757;&#x81ea;&#x5df1;"/>
<node CREATED="1294826724039" ID="ID_50036166" MODIFIED="1294826732531" TEXT="struct nf_conntrack_expect_policy * &#xff1a;expect_policy"/>
<node CREATED="1294826746563" ID="ID_325703958" MODIFIED="1294827186204" TEXT="struct nf_conntrack_tuple &#xff1a;tuple &#xff1a;&#x7528;&#x4e8e;&#x786e;&#x5b9a;&#x54ea;&#x4e9b;&#x8fde;&#x63a5;&#x9700;&#x8981;&#x6b64;helper"/>
<node CREATED="1294826800893" ID="ID_1638111757" MODIFIED="1294828366492" TEXT="help &#xff1a;&#x5f53;&#x5339;&#x914d;&#x5230;&#x9700;&#x8981;&#x6b64;helper&#x7684;&#x5305;&#x65f6;&#x6240;&#x8c03;&#x7528;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1294826863457" ID="ID_352949959" MODIFIED="1294826896202" TEXT="destroy &#xff1a;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1294826876187" ID="ID_1889417352" MODIFIED="1294826887327" TEXT="to_nlattr &#xff1a;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1294826541276" ID="ID_247267811" MODIFIED="1294826570987" TEXT="union nf_conntrack_help &#xff1a;help &#xff1a;&#x7279;&#x5b9a;helper&#x7684;&#x79c1;&#x6709;&#x6570;&#x636e;"/>
<node CREATED="1294826590454" ID="ID_1673922487" MODIFIED="1294827931286" TEXT="struct hlist_head &#xff1a;expectations &#xff1a;&#x6b64;master&#x8fde;&#x63a5;&#x4e0b;&#x7684;expection"/>
<node CREATED="1294826617763" ID="ID_1104007393" MODIFIED="1294826627176" TEXT="expecting[xxx]"/>
</node>
<node CREATED="1294828067539" FOLDED="true" ID="ID_1221257387" MODIFIED="1299056720327" TEXT="struct nf_conntrack_expect">
<node CREATED="1294828097680" ID="ID_842281496" MODIFIED="1294828119592" TEXT="lnode &#xff1a;&#x7528;&#x4e8e;&#x6302;&#x63a5;&#x5230;master&#x4e0a;"/>
<node CREATED="1294828140249" ID="ID_1946783092" MODIFIED="1294828167123" TEXT="hnode &#xff1a;&#x7528;&#x4e8e;&#x6302;&#x63a5;&#x5230;net-&gt;ct.expect_hash&#x4e0a;"/>
<node CREATED="1294828202292" ID="ID_883403248" MODIFIED="1294828218534" TEXT="tuple &#xff1a;&#x7528;&#x4e8e;&#x5339;&#x914d;related&#x8fde;&#x63a5;"/>
<node CREATED="1294828240467" ID="ID_1731748338" MODIFIED="1294828299715" TEXT="mask &#xff1a;&#x5339;&#x914d;related&#x8fde;&#x63a5;&#x65f6;&#x6240;&#x7528;&#x7684;mask&#xff0c;&#x53ea;mask src address&#x548c;src port"/>
<node CREATED="1294828387935" ID="ID_211877811" MODIFIED="1299052907120" TEXT="expectfn &#xff1a;&#x5339;&#x914d;&#x5230;related&#x8fde;&#x63a5;&#x65f6;&#x6240;&#x8c03;&#x7528;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;:&#x6b64;&#x51fd;&#x6570;&#x4e00;&#x822c;&#x9700;&#x8981;&#x91cd;&#x5efa;dst nat&#x6216;src nat&#x65f6;&#x7684;ip&#x548c;port&#x4fe1;&#x606f;"/>
<node CREATED="1294828453987" ID="ID_1562324355" MODIFIED="1294828482476" TEXT="struct nf_conntrack_helper * &#xff1a;helper &#xff1a;related&#x8fde;&#x63a5;&#x6240;&#x7528;&#x7684;helper"/>
<node CREATED="1294828495187" ID="ID_65923461" MODIFIED="1294828523943" TEXT="master &#xff1a;&#x4e3b;&#x8fde;&#x63a5;"/>
<node CREATED="1294828537683" ID="ID_70260248" MODIFIED="1294828548705" TEXT="timeout"/>
<node CREATED="1294828565256" ID="ID_1519704364" MODIFIED="1294828568370" TEXT="flags"/>
<node CREATED="1294828578347" ID="ID_994220284" MODIFIED="1294828580732" TEXT="class"/>
<node CREATED="1294828606392" ID="ID_40975016" MODIFIED="1299050934352" TEXT="saved_ip &#xff1a;nat&#x76f8;&#x5173;&#xff1a;dst nat&#x4e4b;&#x540e;&#x7684;&#x771f;&#x6b63;&#x7684;&#x76ee;&#x7684;&#x5730;&#x5740;"/>
<node CREATED="1294828618178" ID="ID_823732639" MODIFIED="1299050963349" TEXT="saved_proto &#xff1a;nat&#x76f8;&#x5173;&#xff1a;dst nat&#x4e4b;&#x540e;&#x7684;&#x771f;&#x6b63;&#x7684;&#x76ee;&#x7684;&#x7aef;&#x53e3;"/>
<node CREATED="1294828630933" ID="ID_1652636376" MODIFIED="1299051001486" TEXT="dir &#xff1a;nat&#x76f8;&#x5173;&#xff1a;connection&#x7684;&#x65b9;&#x5411;"/>
</node>
</node>
<node CREATED="1294819353351" FOLDED="true" ID="ID_1244685044" MODIFIED="1422302275678" TEXT="&#x91cd;&#x8981;&#x7684;&#x5168;&#x5c40;&#x53d8;&#x91cf;">
<node CREATED="1294819374715" ID="ID_1485841758" MODIFIED="1294819775924" TEXT="nf_hooks[family][chain] &#xff1a;netfilter&#x94a9;&#x5b50;"/>
<node CREATED="1294819567432" ID="ID_1655946507" MODIFIED="1294819829756" TEXT="net-&gt;ct.hash[xxx] &#xff1a;&#x7cfb;&#x7edf;&#x5df2;&#x5efa;&#x7acb;(confirmed)&#x7684;&#x8fde;&#x63a5;"/>
<node CREATED="1294824648169" ID="ID_578510406" MODIFIED="1294824749230" TEXT="net-&gt;ct.unconfirmed &#xff1a;&#x5df2;&#x8fdb;&#x5165;&#x7cfb;&#x7edf;&#x4f46;&#x8fd8;&#x672a;&#x51fa;&#x7cfb;&#x7edf;&#x7684;&#x5305;&#x6240;&#x5efa;&#x7acb;&#x7684;&#x672a;&#x786e;&#x8ba4;&#x8fde;&#x63a5;"/>
<node CREATED="1294820308531" ID="ID_880243742" MODIFIED="1294820352887" TEXT="nf_ct_l3protos &#xff1a;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;l3&#x534f;&#x8bae;"/>
<node CREATED="1294820355467" FOLDED="true" ID="ID_125760930" MODIFIED="1294821666106" TEXT="struct nf_conntrack_l4proto &#xff1a;nf_ct_protos &#xff1a;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;l4&#x534f;&#x8bae;">
<node CREATED="1294820569244" ID="ID_1747204257" MODIFIED="1294820574550" TEXT="pkt_to_tuple"/>
<node CREATED="1294820587295" ID="ID_1234637498" MODIFIED="1294820590596" TEXT="invert_tuple"/>
<node CREATED="1294820599769" ID="ID_627025783" MODIFIED="1294820602204" TEXT="packet"/>
<node CREATED="1294820611980" ID="ID_1554192011" MODIFIED="1294820614142" TEXT="new"/>
<node CREATED="1294820627382" ID="ID_914368824" MODIFIED="1294820630659" TEXT="destroy"/>
<node CREATED="1294820640809" ID="ID_611145405" MODIFIED="1294820643100" TEXT="error"/>
</node>
<node CREATED="1294823123539" FOLDED="true" ID="ID_1515598349" MODIFIED="1294913877644" TEXT="struct nf_ct_ext_type &#xff1a;nf_ct_ext_types[type]">
<node CREATED="1294823431805" ID="ID_210226881" MODIFIED="1294823510616" TEXT="NF_CT_EXT_ACCT &#xff1a;&#x8fde;&#x63a5;&#x7684;&#x53cc;&#x5411;&#x6536;&#x5305;&#x7edf;&#x8ba1;"/>
<node CREATED="1294823643701" ID="ID_755174512" MODIFIED="1294826430817" TEXT="NF_CT_EXT_HELPER &#xff1a;&#x7528;&#x4e8e;&#x89e3;&#x6790;l4&#x534f;&#x8bae;&#x7279;&#x5b9a;&#x7684;&#x5305;&#x5185;&#x5bb9;"/>
<node CREATED="1294823775901" ID="ID_1651245047" MODIFIED="1294913869812" TEXT="NF_CT_EXT_NAT &#xff1a;&#x7528;&#x4e8e;&#x5b58;&#x653e;nat&#x76f8;&#x5173;&#x4fe1;&#x606f;"/>
<node CREATED="1294823830552" ID="ID_735924461" MODIFIED="1294886484443" TEXT="NF_CT_EXT_ECACHE &#xff1a;&#x901a;&#x8fc7;netlink&#x5c06;&#x8fde;&#x63a5;&#x7684;&#x72b6;&#x6001;&#x53d8;&#x5316;&#x901a;&#x77e5;&#x7ed9;&#x7528;&#x6237;&#x5c42;"/>
</node>
<node CREATED="1294827413976" ID="ID_116497680" MODIFIED="1294827428858" TEXT="nf_ct_helper_hash &#xff1a;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;helper"/>
<node CREATED="1294828702346" ID="ID_1404146230" MODIFIED="1294828781782" TEXT="net-&gt;ct.expect_hash[xxx] &#xff1a;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;expection&#xff0c;&#x5efa;&#x7acb;&#x8fde;&#x63a5;&#x540e;&#x4ece;&#x8fd9;&#x91cc;&#x5220;&#x9664; &#xff1f;"/>
<node CREATED="1294901901403" ID="ID_1984228519" MODIFIED="1294901973071" TEXT="net-&gt;ipv4.nat_bysource &#xff1a;&#x7cfb;&#x7edf;&#x4e2d;&#x9700;&#x8981;&#x505a;nat&#x7684;&#x8fde;&#x63a5;&#xff0c;&#x6302;&#x63a5;&#x70b9;&#x4e3a;&#x8fde;&#x63a5;&#x7684;nat&#x6269;&#x5c55;&#x6570;&#x636e;"/>
<node CREATED="1294908996407" FOLDED="true" ID="ID_1430721114" MODIFIED="1294911500571" TEXT="struct nf_nat_protocol &#xff1a;nf_nat_protos[xxx]">
<node CREATED="1294909326418" ID="ID_837000757" MODIFIED="1294909329939" TEXT="protonum"/>
<node CREATED="1294909342025" ID="ID_1182365040" MODIFIED="1294909380156" TEXT="manip_pkt &#xff1a;&#x4fee;&#x6539;l4&#x5185;&#x5bb9;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1294909392367" ID="ID_826170820" MODIFIED="1294909459361" TEXT="in_range &#xff1a;&#x5224;&#x65ad;&#x7aef;&#x53e3;&#x662f;&#x5426;&#x5728;&#x89c4;&#x5219;&#x6307;&#x5b9a;&#x8303;&#x56f4;&#x5185;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1294909475948" ID="ID_1422620488" MODIFIED="1294909857952">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      unique_tuple &#65306; &#33719;&#21462;&#31995;&#32479;&#20013;&#21807;&#19968;tuple&#30340;&#22238;&#35843;&#20989;&#25968;<br />&#33719;&#21462;&#21807;&#19968;&#30340;&#31471;&#21475;&#21495;&#65292;&#20197;&#20445;&#35777;tuple&#30340;&#21807;&#19968;&#24615;&#12290;<br />
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1401355935782" FOLDED="true" ID="ID_899024356" MODIFIED="1443056047861" POSITION="left" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1401355964477" ID="ID_29164126" MODIFIED="1401355998360" TEXT="hook&#x8fd4;&#x56de;&#x503c;&#x7684;&#x4f5c;&#x7528;">
<node CREATED="1401356111069" ID="ID_1503421998" MODIFIED="1401359148340" TEXT="NF_ACCEPT&#xa;&#x82e5;&#x5f53;&#x524d;hook&#x51fd;&#x6570;&#x4e0d;&#x662f;chain&#x4e0a;&#x6700;&#x540e;&#x4e00;&#x4e2a;hook&#x51fd;&#x6570;&#xff0c;&#x5219;&#x8868;&#x793a;chain&#x4e0a;&#x5176;&#x5b83;hook&#x51fd;&#x6570;&#x53ef;&#x4ee5;&#x7ee7;&#x7eed;&#x5904;&#x7406;&#x6b64;&#x5305;&#xa;&#x82e5;&#x5f53;&#x524d;hook&#x51fd;&#x6570;&#x662f;chain&#x4e0a;&#x6700;&#x540e;&#x4e00;&#x4e2a;hook&#x51fd;&#x6570;&#xff0c;   &#x5219;&#x8868;&#x793a;&#x5c06;&#x5305;&#x4ea4;&#x7ed9;okfn&#x51fd;&#x6570;&#x5904;&#x7406;"/>
<node CREATED="1401356351406" ID="ID_1959932743" MODIFIED="1401356436883" TEXT="NF_REPEAT&#xa;&#x7d27;&#x63a5;&#x7740;&#x518d;&#x6267;&#x884c;&#x4e00;&#x904d;&#x5f53;&#x524d;hook&#x51fd;&#x6570;&#xff0c; &#x5177;&#x4f53;&#x51b3;&#x5b9a;&#x5c06;&#x5728;&#x4e0b;&#x4e00;&#x6b21;&#x6267;&#x884c;&#x65f6;&#x4f5c;&#x51fa;"/>
<node CREATED="1401356474173" ID="ID_1698852141" MODIFIED="1401359233780" TEXT="NF_DROP&#xa;&#x4e22;&#x5f03;&#x6b64;&#x5305;&#xff0c; chain&#x4e0a;&#x5176;&#x5b83;hook&#x51fd;&#x6570;&#x4ee5;&#x53ca;okfn&#x51fd;&#x6570;&#x90fd;&#x4e0d;&#x80fd;&#x518d;&#x5904;&#x7406;&#x6b64;&#x5305;&#x4e86;"/>
<node CREATED="1401356486797" ID="ID_932905490" MODIFIED="1401359288412" TEXT="NF_STOLEN&#xa;&#x622a;&#x83b7;&#x6b64;&#x5305;&#xff0c; chain&#x4e0a;&#x5176;&#x5b83;hook&#x51fd;&#x6570;&#x4ee5;&#x53ca;okfn&#x51fd;&#x6570;&#x90fd;&#x4e0d;&#x80fd;&#x518d;&#x5904;&#x7406;&#x6b64;&#x5305;&#x4e86;"/>
<node CREATED="1401356498077" ID="ID_1884975492" MODIFIED="1401358216556" TEXT="NF_QUEUE&#xa;hook&#x51fd;&#x6570;&#x5b9e;&#x9645;&#x4e0a;&#x8fd4;&#x56de;&#x7684;&#x662f;NF_QUEUE_NR(x) : &#xa;#define NF_QUEUE_NR(x) ((((x) &lt;&lt; 16) &amp; NF_VERDICT_QMASK) | NF_QUEUE)&#xa;&#x8868;&#x793a;&#x5f53;&#x524d;hook&#x51fd;&#x6570;&#x5e0c;&#x671b;&#x5c06;&#x5305;&#x5148;queue&#x8d77;&#x6765;, &#x4e0d;&#x505a;&#x5177;&#x4f53;&#x7684;&#x51b3;&#x5b9a;&#xff0c;&#xa;&#x7a0d;&#x540e;&#x8c03;&#x7528;nf_reinject&#x5c06;&#x5305;&#x8fd4;&#x56de;&#x56de;&#x6765;&#xff0c;&#x540c;&#x65f6;&#x5305;&#x542b;&#x5177;&#x4f53;&#x7684;&#x51b3;&#x5b9a;&#xff0c;&#x5373;&#x8fd4;&#x56de;NF_XXX&#xa;&#xa;ip_queue&#x548c;ip6_queue&#x4f7f;&#x7528;&#x4e86;&#x6b64;&#x9879;&#x529f;&#x80fd;&#xff0c; &#x5176;&#x610f;&#x4e49;&#x662f;&#xff1a;&#xa;&#x5148;&#x5c06;&#x5305;queue&#x8d77;&#x6765;&#xff0c; &#x7528;netlink&#x6d88;&#x606f;&#x5c06;&#x5305;&#x53d1;&#x9001;&#x5230;&#x7528;&#x6237;&#x7a7a;&#x95f4;&#x7a0b;&#x5e8f;&#xff0c;&#x7531;&#x7528;&#x6237;&#x7a7a;&#x95f4;&#x7a0b;&#x5e8f;&#x51b3;&#x5b9a;&#x5982;&#x4f55;&#x5904;&#x7406;&#x6b64;&#x5305;&#xff0c;&#xa;&#x7528;&#x6237;&#x7a7a;&#x95f4;&#x7a0b;&#x5e8f;&#x7684;&#x5904;&#x7406;&#x51b3;&#x5b9a;&#x7531;nf_reinject&#x53cd;&#x9988;&#x7ed9;netfilter&#x7cfb;&#x7edf;">
<node CREATED="1401357180623" ID="ID_376869164" MODIFIED="1401357182161" TEXT="nf_queue">
<node CREATED="1401357183166" ID="ID_1313023225" MODIFIED="1401357187055" TEXT="__nf_queue"/>
</node>
<node CREATED="1401357826830" ID="ID_250332379" MODIFIED="1401357827995" TEXT="nf_reinject"/>
</node>
<node CREATED="1401356508765" ID="ID_1913970860" MODIFIED="1401359402956" TEXT="NF_STOP&#xa;&#x63a5;&#x53d7;&#x6b64;&#x5305;&#xff0c; chain&#x4e0a;&#x5176;&#x5b83;hook&#x51fd;&#x6570;&#x4e0d;&#x518d;&#x7ee7;&#x7eed;&#x5904;&#x7406;&#x6b64;&#x5305;&#xff0c; &#x5305;&#x88ab;&#x4ea4;&#x7ed9;okfn&#x51fd;&#x6570;&#x5904;&#x7406;"/>
</node>
<node CREATED="1401358596661" ID="ID_290744353" MODIFIED="1401358907077" TEXT="NF_HOOK ( okfn )">
<node CREATED="1401358765390" ID="ID_1782371826" MODIFIED="1401358919312" TEXT="NF_HOOK_THRESH( -65535, okfn )"/>
</node>
<node CREATED="1401358599598" ID="ID_185601848" MODIFIED="1401358935614" TEXT="NF_HOOK_THRESH( thresh, okfn )">
<node CREATED="1401358811630" ID="ID_594890337" MODIFIED="1401358848718" TEXT="&#x4ec5;&#x5f53;hook&#x7684;priority&#x5c0f;&#x4e8e;thresh&#x65f6;&#x624d;&#x6267;&#x884c;hook"/>
<node CREATED="1401359437486" ID="ID_1167506572" MODIFIED="1401359515790" TEXT="&#x5f53;hook&#x6700;&#x7ec8;&#x8fd4;&#x56de;&#x503c;&#x4e3a;NF_ACCEPT&#x6216;NF_STOP&#x65f6;&#x5c06;&#x5305;&#x4ea4;&#x7531;okfn&#x5904;&#x7406;"/>
</node>
</node>
<node CREATED="1443056055828" ID="ID_387160223" MODIFIED="1443057041070" POSITION="left" TEXT="life of connection">
<node CREATED="1443056167303" ID="ID_1215061201" MODIFIED="1443056602747" TEXT="&#x4e00;&#x4e2a;&#x8fde;&#x63a5;&#x4ee3;&#x8868;&#x4e00;&#x4e2a;&#x552f;&#x4e00;&#x7684;5&#x5143;&#x7ec4;(Layer 4 &#x534f;&#x8bae;,&#xff0c;&#x6e90;IP&#xff0c;&#x76ee;&#x7684;IP&#xff0c;layer 4&#x6e90;&#x7aef;&#x53e3;&#x53f7;&#xff0c;layer 4&#x76ee;&#x7684;&#x7aef;&#x53e3;&#x53f7;)&#xff0c;&#x5b9e;&#x73b0;&#x4e0a;&#x5b83;&#x7531;&#x4e00;&#x4e2a;struct nf_conn&#x7ed3;&#x6784;&#x8868;&#x793a;&#x3002;&#x5b83;&#x4e00;&#x822c;&#x7531;&#x8fde;&#x63a5;&#x4e2d;&#x7684;&#x7b2c;&#x4e00;&#x4e2a;&#x5305;&#x521b;&#x5efa;&#xff0c;&#x521b;&#x5efa;&#x4e4b;&#x540e;&#x8fd9;&#x4e2a;&#x8fde;&#x63a5;&#x4f1a;&#x5173;&#x8054;&#x4e00;&#x4e2a;&#x5b9a;&#x65f6;&#x5668;&#xff0c;&#x8fde;&#x63a5;&#x4e2d;&#x7684;&#x540e;&#x7eed;&#x5305;&#x4f1a;&#x5237;&#x65b0;&#x8fd9;&#x4e2a;&#x5b9a;&#x65f6;&#x5668;&#x3002;&#x82e5;&#x4e00;&#x5b9a;&#x65f6;&#x95f4;&#x5185;&#x90fd;&#x6ca1;&#x6709;&#x8fd9;&#x4e2a;&#x8fde;&#x63a5;&#x5185;&#x7684;&#x5305;&#x5305;&#x7ecf;&#x8fc7;&#xff0c;&#x5219;&#x5b9a;&#x65f6;&#x5668;&#x4f1a;&#x8d85;&#x65f6;&#x5220;&#x9664;&#x8fd9;&#x4e2a;&#x8fde;&#x63a5;&#x3002;"/>
<node CREATED="1443056652405" FOLDED="true" ID="ID_1233334807" MODIFIED="1443061162497" TEXT="create">
<node CREATED="1443057046107" ID="ID_1404017841" MODIFIED="1443058259259" TEXT="3&#x5c42;&#x534f;&#x8bae;ipv4&#x5728;prerouting&#x6ce8;&#x518c;&#x4e86;hook&#x51fd;&#x6570;&#x201c;ipv4_conntrack_in&#x201d;&#xff0c;&#x5b83;&#x7684;&#x4f18;&#x5148;&#x7ea7;&#x4ec5;&#x6b21;&#x4e8e;conntrack_defrag&#x548c;raw&#x3002;&#xa;(nf_conntrack_l3proto_ipv4.c)&#xa;&#x8fd9;&#x4e2a;hook&#x7684;&#x76ee;&#x7684;&#x662f;&#x4e3a;&#x6b63;&#x5728;&#x5904;&#x7406;&#x7684;&#x5305;&#x627e;&#x5230;&#x5b83;&#x5bf9;&#x5e94;&#x7684;&#x8fde;&#x63a5;&#xff0c;&#x5982;&#x679c;&#x8fd8;&#x6ca1;&#x6709;&#x5bf9;&#x5e94;&#x7684;&#x8fde;&#x63a5;&#x5219;&#x521b;&#x5efa;&#x4e00;&#x4e2a;&#x65b0;&#x7684;&#x3002;&#x8fd9;&#x4e2a;&#x7ed3;&#x679c;&#x4f53;&#x73b0;&#x4e3a;&#x7ed9;skb-&gt;nfct&#x548c;skb-&gt;nfctinfo&#x8d4b;&#x503c;&#xff0c;&#x524d;&#x8005;&#x4ee3;&#x8868;&#x5305;&#x6240;&#x5728;&#x7684;&#x8fde;&#x63a5;&#xff0c;&#x540e;&#x8005;&#x4ee3;&#x8868;&#x5305;&#x5728;&#x8fde;&#x63a5;&#x4e2d;&#x65b9;&#x5411;&#x3002;">
<node CREATED="1443058083872" ID="ID_952364507" MODIFIED="1443058131677" TEXT="&#x4e00;&#x822c;&#x4f7f;&#x7528;&#x5b8f;nf_ct_get(skb, &amp;ctinfo)&#x6765;&#x83b7;&#x53d6;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;"/>
<node CREATED="1443058155183" ID="ID_356821345" MODIFIED="1443058220287" TEXT="&#x4e00;&#x822c;&#x7528;&#x5b8f;CTINFO2DIR(ctinfo)==IP_CT_DIR_ORIGINAL&#x6765;&#x5224;&#x65ad;&#x5305;&#x5728;&#x8fde;&#x63a5;&#x4e2d;&#x7684;&#x65b9;&#x5411;"/>
</node>
<node CREATED="1443056774187" ID="ID_1923246944" MODIFIED="1443056816968">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/life_of_ct_create_1.PNG" />
  </body>
</html>
</richcontent>
<node CREATED="1443058360458" ID="ID_1400429305" MODIFIED="1443058614902" TEXT="&#x6240;&#x6709;&#x5df2;&#x7ecf;confirm&#x7684;&#x8fde;&#x63a5;&#x90fd;&#x653e;&#x5728;net-&gt;ct.hash&#x8868;&#x4e2d;&#xff0c;&#x8fde;&#x63a5;2&#x4e2a;&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;&#x90fd;&#x5728;&#x5176;&#x4e2d;&#x3002;&#x67e5;&#x627e;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;&#x6240;&#x8981;&#x505a;&#x7684;&#x5c31;&#x662f;&#x6839;&#x636e;&#x5305;&#x6784;&#x5efa;&#x4e00;&#x4e2a;5&#x5143;&#x7ec4;&#xff0c;&#x7136;&#x540e;&#x5728;&#x54c8;&#x5e0c;&#x8868;net-&gt;ct.hash&#x4e2d;&#x67e5;&#x627e;&#x8fd9;&#x4e2a;5&#x5143;&#x7ec4;&#x662f;&#x5426;&#x5b58;&#x5728;&#x3002;"/>
<node CREATED="1443058677054" FOLDED="true" ID="ID_1967559740" MODIFIED="1443061117884" TEXT="&#x82e5;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;&#x4e0d;&#x5b58;&#x5728;&#x5219;&#x9700;&#x8981;&#x521b;&#x5efa;&#x5b83;&#x3002;">
<node CREATED="1443058785679" ID="ID_131307162" MODIFIED="1443059077559" TEXT="&#x65b0;&#x521b;&#x5efa;&#x7684;&#x8fde;&#x63a5;&#xff0c;&#x5176;original&#x65b9;&#x5411;&#x548c;reply&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;&#x662f;&#x5b8c;&#x5168;&#x4e92;&#x53cd;&#x7684;&#x3002;&#x4e5f;&#x5c31;&#x662f;original&#x65b9;&#x5411;&#x7684;&#x6e90;IP/&#x7aef;&#x53e3;&#x5b8c;&#x5168;&#x7b49;&#x4e8e;reply&#x65b9;&#x5411;&#x7684;&#x76ee;&#x7684;IP/&#x7aef;&#x53e3;&#x3002;&#x53ea;&#x6709;&#x5728;&#x7ecf;&#x8fc7;NAT&#x5904;&#x7406;&#x540e;original&#x65b9;&#x5411;&#x548c;reply&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;&#x624d;&#x4f1a;&#x4e0d;&#x4e00;&#x6837;&#x3002;&#x53e6;&#x5916;&#xff0c;&#x8fde;&#x63a5;&#x7684;original&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;&#x81f3;&#x4ece;&#x521b;&#x5efa;&#x4e4b;&#x540e;&#x5c31;&#x4e0d;&#x4f1a;&#x6539;&#x53d8;&#xff0c;NAT&#x5904;&#x7406;&#x53ea;&#x4f1a;&#x4fee;&#x6539;reply&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;&#x3002;"/>
<node CREATED="1443059180938" ID="ID_206500104" MODIFIED="1443059316755" TEXT="&#x6b64;&#x65f6;&#x8fd8;&#x5904;&#x4e8e;prerouting&#x9636;&#x6bb5;&#xff0c;&#x8fd8;&#x4e0d;&#x77e5;&#x5305;&#x6700;&#x7ec8;&#x4f1a;&#x4e0d;&#x4f1a;&#x88ab;&#x7cfb;&#x7edf;&#x63a5;&#x53d7;&#xff0c;&#x6240;&#x4ee5;&#x65b0;&#x521b;&#x5efa;&#x7684;&#x8fde;&#x63a5;&#x88ab;&#x6302;&#x5728;net-&gt;ct.unconfirmed&#x94fe;&#x8868;&#x91cc;&#x9762;&#xff0c;&#x5e76;&#x4e14;&#x53ea;&#x662f;&#x7528;&#x8fde;&#x63a5;&#x7684;original&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;&#x6302;&#x5728;&#x5176;&#x4e2d;&#x3002;"/>
<node CREATED="1443059408362" ID="ID_1112904592" MODIFIED="1443059682935" TEXT="&#x56e0;&#x4e3a;&#x6302;&#x5728;net-&gt;ct.unconfirmed&#x94fe;&#x8868;&#x91cc;&#x65f6;&#x53ea;&#x7528;&#x5230;&#x4e86;original&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;&#xff0c;&#x6240;&#x4ee5;reply&#x65b9;&#x5411;&#x7684;5&#x5143;&#x7ec4;ct-&gt;tuplehash[IP_CT_DIR_REPLY].hnnode.pprev&#x88ab;&#x7528;&#x4e8e;&#x5b58;&#x50a8;original&#x65b9;&#x5411;5&#x5143;&#x7ec4;&#x7684;&#x54c8;&#x5e0c;&#x503c;&#x3002;&#x8fd9;&#x6837;&#x5728;confirm&#x7684;&#x65f6;&#x5019;&#x5c31;&#x4e0d;&#x5fc5;&#x518d;&#x8ba1;&#x7b97;original&#x65b9;&#x5411;5&#x5143;&#x7ec4;&#x7684;&#x54c8;&#x5e0c;&#x503c;&#x4e86;&#x3002;"/>
<node CREATED="1443059729101" ID="ID_1101613299" MODIFIED="1443059776510" TEXT="&#x56e0;&#x4e3a;&#x8fde;&#x63a5;&#x8fd8;&#x6ca1;&#x6709;&#x88ab;confirm&#xff0c;&#x6240;&#x4ee5;&#x8fde;&#x63a5;&#x7684;&#x5b9a;&#x65f6;&#x5668;&#x867d;&#x7136;&#x88ab;&#x521d;&#x59cb;&#x5316;&#xff0c;&#x4f46;&#x8fd8;&#x6ca1;&#x88ab;&#x542f;&#x7528;"/>
<node CREATED="1443059890930" ID="ID_1591926938" MODIFIED="1443060020852" TEXT="&#x8c03;&#x7528;layer4 protocol-&gt;new()&#x7ed9;&#x56db;&#x5c42;&#x534f;&#x8bae;&#x4ee5;&#x8fc7;&#x6ee4;&#x7684;&#x673a;&#x4f1a;&#xff0c;&#x56e0;&#x4e3a;&#x56db;&#x5c42;&#x534f;&#x8bae;&#x53ef;&#x80fd;&#x4f1a;&#x8ba4;&#x4e3a;&#x4e0d;&#x5e94;&#x8be5;&#x521b;&#x5efa;&#x8fd9;&#x4e2a;&#x65b0;&#x8fde;&#x63a5;&#x3002;"/>
<node CREATED="1443060063603" FOLDED="true" ID="ID_1086043391" MODIFIED="1443060293616" TEXT="&#x8fde;&#x63a5;&#x6709;&#x5f88;&#x591a;&#x6269;&#x5c55;&#x7684;&#x4fe1;&#x606f;&#x9700;&#x8981;&#x4fdd;&#x5b58;&#xff0c;&#x6bd4;&#x5982;&#x7edf;&#x8ba1;&#x4fe1;&#x606f;&#x6269;&#x5c55;NF_CT_EXT_ACCT&#xff0c;&#x4e8b;&#x4ef6;&#x7f13;&#x5b58;&#x6269;&#x5c55;NF_CT_EXT_ECACHE&#xff0c;&#x8fd9;&#x4e9b;&#x6269;&#x5c55;&#x90fd;&#x9700;&#x8981;&#x5728;&#x6b64;&#x65f6;&#x521b;&#x5efa;&#x3002;">
<node CREATED="1443060130345" ID="ID_1640541037" MODIFIED="1443060180684" TEXT="&#x4e00;&#x822c;&#x8c03;&#x7528;&#x63a5;&#x53e3;nf_ct_ext_add(ct, NF_CT_EXT_ACCT, gfp)&#x521b;&#x5efa;&#x7279;&#x5b9a;&#x7c7b;&#x578b;&#x7684;&#x6269;&#x5c55;"/>
</node>
<node CREATED="1443060429445" ID="ID_1693260692" MODIFIED="1443060445515" TEXT="&#x5bf9;&#x4e8e;ALG&#x7684;slave&#x8fde;&#x63a5;&#x6765;&#x8bf4;">
<node CREATED="1443060450901" FOLDED="true" ID="ID_769655118" MODIFIED="1443061078413" TEXT="&#x9996;&#x5148;&#x8981;&#x901a;&#x8fc7;&#x67e5;&#x627e;expectation&#x627e;&#x5230;&#x5b83;&#x6240;&#x5c5e;&#x7684;master&#x8fde;&#x63a5;&#xff0c;&#x5e76;&#x4fdd;&#x5b58;&#x5728;ct-&gt;master&#x4e2d;">
<node CREATED="1443060519290" ID="ID_1825761428" MODIFIED="1443060524874" TEXT="nf_ct_find_expectation()"/>
</node>
<node CREATED="1443060604314" ID="ID_523644413" MODIFIED="1443060625671" TEXT="&#x7ee7;&#x627f;master&#x8fde;&#x63a5;&#x7684;ct-&gt;mark&#x548c;ct-&gt;secmark"/>
<node CREATED="1443060687644" ID="ID_330651475" MODIFIED="1443060738652" TEXT="&#x8c03;&#x7528;exp-&gt;expectfn()&#xff0c;&#x8fd9;&#x4e2a;&#x51fd;&#x6570;&#x91cc;&#x9762;&#x4f1a;&#x4e3a;slave&#x8fde;&#x63a5;&#x5efa;&#x7acb;NAT&#x4fe1;&#x606f;"/>
</node>
<node CREATED="1443060352785" ID="ID_1496589990" MODIFIED="1443060635602" TEXT="&#x5bf9;&#x4e8e;ALG&#x7684;master&#x8fde;&#x63a5;&#x6765;&#x8bf4;">
<node CREATED="1443060841021" FOLDED="true" ID="ID_588021533" MODIFIED="1443061077205">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27492;&#26102;&#38656;&#35201;&#25214;&#21040;master&#36830;&#25509;&#30340;helper
    </p>
    <p>
      helper&#20250;&#22312;POSTROUTING &#30340; NF_IP_PRI_CONNTRACK_HELPER&#28857;&#26816;&#26597;&#21253;&#65292;&#20197;&#30830;&#35748;&#26159;&#21542;&#38656;&#35201;&#20026;slave&#36830;&#25509;&#21019;&#24314;&#19968;&#20010;expectation&#12290;&#36825;&#37324;&#21482;&#26159;&#32473;nfct_help(ct)&#36171;&#20540;&#65292;&#32780;&#27809;&#26377;&#30495;&#30340;&#35843;&#29992;helper&#30340;&#26816;&#26597;&#20989;&#25968;&#12290;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1443060844617" ID="ID_1159681139" MODIFIED="1443060850016" TEXT="__nf_ct_try_assign_helper()"/>
</node>
</node>
</node>
</node>
<node CREATED="1443056774187" ID="ID_857020793" MODIFIED="1443056842535">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/life_of_ct_create_2.PNG" />
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1443056656910" ID="ID_737223868" MODIFIED="1443056659700" TEXT="confirm"/>
<node CREATED="1443056660342" ID="ID_1185370604" MODIFIED="1443056663245" TEXT="refresh"/>
<node CREATED="1443056669138" ID="ID_1423734050" MODIFIED="1443056672096" TEXT="destroy"/>
</node>
<node CREATED="1294815226377" ID="ID_627315451" MODIFIED="1443057606064" POSITION="left" TEXT="prerouting">
<icon BUILTIN="folder"/>
<node CREATED="1294815421806" ID="ID_1688308053" MODIFIED="1294815427301" TEXT="raw"/>
<node CREATED="1294815430567" FOLDED="true" ID="ID_182384140" MODIFIED="1443061155161" TEXT="conntrack">
<icon BUILTIN="folder"/>
<node CREATED="1294815608249" ID="ID_1142155410" MODIFIED="1303111731087" TEXT="ipv4_conntrack_in">
<node CREATED="1294825222085" ID="ID_134845232" MODIFIED="1303111735060" TEXT="nf_conntrack_in">
<node CREATED="1294825273102" ID="ID_1904771560" MODIFIED="1294825276275" TEXT="1, &#x5982;&#x679c;skb-&gt;nfct&#x5df2;&#x8d4b;&#x503c;&#xff0c;&#x5219;&#x76f4;&#x63a5;&#x8fd4;&#x56de;"/>
<node CREATED="1294825292730" ID="ID_1823483343" MODIFIED="1294825320558" TEXT="2, &#x627e;&#x51fa;&#x6b64;&#x5305;&#x6240;&#x5c5e;&#x7684;l3&#x548c;l4&#x534f;&#x8bae;"/>
<node CREATED="1294825337242" ID="ID_1722239846" MODIFIED="1294825339991" TEXT="3, &#x5982;&#x679c;&#x662f;icmp error&#x5305;&#xff0c;&#x5219;&#x627e;&#x5230;&#x5f15;&#x53d1;&#x6b64;error&#x7684;&#x539f;connection"/>
<node CREATED="1294825363559" ID="ID_1160359335" MODIFIED="1304929172178" TEXT="4, &#x8c03;&#x7528;resolve_normal&#x4e3a;&#x5305;&#x521b;&#x5efa;&#x8fde;&#x63a5;_ct">
<node CREATED="1294825406095" ID="ID_758392019" MODIFIED="1294825409086" TEXT="4.1, &#x6784;&#x9020;&#x4e00;&#x4e2a;tuple"/>
<node CREATED="1304924022028" ID="ID_1713979623" MODIFIED="1304924226206" TEXT="4.2 &#x6253;&#x5f00;&#x5b8f;CONFIG_ATHRS_HW_NAT&#x65f6;,&#x82e5;&#x80fd;&#x7528;&#xa;      athr_nat_sw_ops-&gt;nf_find_get&#xa;      &#x67e5;&#x627e;&#x5230;&#x8fde;&#x63a5;&#x5219;&#x8868;&#x660e;&#x8fde;&#x63a5;&#x5b58;&#x5728;,&#x6545;&#x8df3;&#x8fc7;4.3"/>
<node CREATED="1294825429396" FOLDED="true" ID="ID_1623126518" MODIFIED="1443061151459">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      4.3, &#33509;&#36824;&#26410;&#20026;&#27492;tuple&#24314;&#31435;&#36830;&#25509;&#65292;&#21017;&#35843;&#29992;init_conntrack&#21021;&#22987;&#21270;&#19968;&#20010;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
<node CREATED="1294825498033" ID="ID_1826100293" MODIFIED="1294825501113" TEXT="4.2.1 &#x51c6;&#x5907;original&#x548c;reply&#x7684;tuple"/>
<node CREATED="1304926106014" ID="ID_1208847828" MODIFIED="1304926413813" TEXT="4.2.2 &#x82e5;&#x6b64;&#x5305;&#x5df2;&#x7531;&#x786c;&#x4ef6;&#x505a;&#x8fc7;dnat,&#x9700;&#x5c06;original tuple&#x4e2d;&#x7684;&#x76ee;&#x7684;IP&#xa;         &#x6062;&#x590d;&#x4e3a;wan&#x53e3;global ip&#x5730;&#x5740;,&#x5373;&#x786c;&#x4ef6;dnat&#x4e4b;&#x524d;&#x7684;&#x76ee;&#x7684;&#x5730;&#x5740;&#xa;         &#x6ce8;&#x610f;&#x6b64;&#x65f6;reply tuple&#x76f8;&#x5f53;&#x4e8e;&#x5df2;&#x7ecf;&#x505a;&#x8fc7;dnat&#x4fee;&#x6539;&#x4e86;"/>
<node CREATED="1308212100027" FOLDED="true" ID="ID_1054428502" MODIFIED="1308644299294" TEXT="4.2.3 &#x8c03;&#x7528;nf_conntrack_alloc&#x5206;&#x914d;&#x8fde;&#x63a5;">
<node CREATED="1308212136433" ID="ID_665058295" MODIFIED="1308212245742">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#22914;&#26524;&#36830;&#25509;&#24635;&#25968;&#36229;&#38480;&#21017;&#38656;&#35201;&#21024;&#38500;&#19968;&#20123;&#19981;&#24517;&#35201;&#30340;&#36830;&#25509;
    </p>
    <p>
      &#160;&#160;&#160;&#160;(&#21363;&#35843;&#29992;early_drop)
    </p>
  </body>
</html></richcontent>
<node CREATED="1308211472977" ID="ID_1828871399" MODIFIED="1308211763451">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      early_drop : &#30001;&#20110;&#26465;&#30446;&#22826;&#22810;&#38656;&#35201;&#21024;&#38500;&#19968;&#20123;&#38271;&#26102;&#38388;&#27809;&#26377;&#27969;&#37327;&#30340;&#36830;&#25509;
    </p>
    <p>
      &#36873;&#20986;&#37027;&#20123;&#36824;&#27809;&#26377;assured&#30340;&#36830;&#25509;,&#22914;&#26524;&#23427;&#25152;&#22312;&#30340;bucket&#26465;&#30446;&#22826;&#22810;,
    </p>
    <p>
      &#21017;&#21024;&#38500;&#23427;. &#21024;&#38500;&#26102;&#21462;&#28040;&#36830;&#25509;&#30340;&#23450;&#26102;&#22120;,&#24182;&#35843;&#29992;death_by_timeout
    </p>
  </body>
</html></richcontent>
<node CREATED="1308210570948" ID="ID_340841658" MODIFIED="1308210574584" TEXT="death_by_timeout">
<node CREATED="1308210897403" ID="ID_1154570217" LINK="#ID_1683530616" MODIFIED="1308213315036" TEXT="1, &#x5982;&#x679c;&#x5f00;&#x542f;&#x4e86;hwnat&#x5219;&#x8c03;&#x7528;athr_nat_sw_ops-&gt;nf_process_nat&#x5220;&#x9664;&#x6761;&#x76ee;"/>
<node CREATED="1308210960867" ID="ID_520174968" MODIFIED="1308211055478" TEXT="2, &#x5982;&#x679c;destroy&#x4e8b;&#x4ef6;&#x8fd8;&#x672a;&#x4f20;&#x9012;&#x5219;&#x5148;&#x5c06;CT&#x653e;&#x5165;dying list&#x7b49;&#x4f20;&#x9012;&#x5b8c;destroy&#x4e8b;&#x4ef6;&#x540e;&#x518d;&#x9500;&#x6bc1;"/>
<node CREATED="1308211075361" ID="ID_895496357" MODIFIED="1308212539623">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3, &#22914;destroy&#20107;&#20214;&#24050;&#20256;&#36882;,&#21017;&#23558;CT&#20174;&#25152;&#22312;list&#20013;&#21024;&#38500;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#20877;&#36882;&#20943;&#23545;CT&#30340;&#24341;&#29992;(&#21363;&#35843;&#29992;nf_conntrack_put)
    </p>
  </body>
</html></richcontent>
<node CREATED="1308212465800" ID="ID_1129210945" MODIFIED="1308212609850">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;&#36830;&#25509;&#30340;&#24341;&#29992;&#35745;&#25968;&#20943;&#20026;0&#21518;&#38656;&#35201;&#38144;&#27585;&#36830;&#25509;
    </p>
    <p>
      (&#21363;&#35843;&#29992;nf_conntrack_destroy)
    </p>
  </body>
</html></richcontent>
<node CREATED="1308210897403" ID="ID_933565232" MODIFIED="1308210943854" TEXT="1, &#x5982;&#x679c;&#x5f00;&#x542f;&#x4e86;hwnat&#x5219;&#x8c03;&#x7528;athr_nat_sw_ops-&gt;nf_process_nat&#x5220;&#x9664;&#x6761;&#x76ee;"/>
<node CREATED="1308212662431" ID="ID_694555118" MODIFIED="1308212762434" TEXT="2, destroy_conntrack"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1308212999144" ID="ID_245141494" MODIFIED="1308213024021" TEXT="2, &#x5206;&#x914d;&#x5185;&#x5b58;&#x5e76;&#x521d;&#x59cb;&#x5316;&#x8fde;&#x63a5;"/>
<node CREATED="1308213026202" ID="ID_1983314493" LINK="#ID_340841658" MODIFIED="1308213074872" TEXT="3, &#x8bbe;&#x5b9a;&#x8fde;&#x63a5;&#x7684;&#x5b9a;&#x65f6;&#x5668;&#x8d85;&#x65f6;&#x51fd;&#x6570;&#x4e3a;death_by_timeout"/>
</node>
<node CREATED="1294825517484" ID="ID_1713144979" MODIFIED="1308212258621" TEXT="4.2.4  &#x8c03;&#x7528;&#x5bf9;&#x5e94;l4&#x534f;&#x8bae;&#x7684;new&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1294825532407" ID="ID_1973080942" MODIFIED="1308212265109" TEXT="4.2.5 &#x5efa;&#x7acb;&#x7edf;&#x8ba1;&#x548c;ecache&#x7684;&#x6269;&#x5c55;&#x6570;&#x636e;"/>
<node CREATED="1294825548986" FOLDED="true" ID="ID_896178438" MODIFIED="1308212271824" TEXT="4.2.6 &#x5982;&#x679c;&#x6b64;&#x8fde;&#x63a5;&#x662f;&#x4e4b;&#x524d;&#x67d0;&#x4e2a;&#x8fde;&#x63a5;&#x7684;related&#x8fde;&#x63a5;&#xff0c;&#x5219;&#xff1a;">
<node CREATED="1294825566877" ID="ID_479773568" MODIFIED="1294825569450" TEXT="4.2.4.1 &#x5728;ct-&gt;status&#x4e0a;&#x7f6e;&#x4f4d;IPS_EXPECTED_BIT"/>
<node CREATED="1294825583609" ID="ID_847353387" MODIFIED="1294825586111" TEXT="4.2.4.2 &#x6307;&#x5b9a;&#x6b64;&#x8fde;&#x63a5;&#x7684;master&#x8fde;&#x63a5;"/>
<node CREATED="1294825597171" ID="ID_1689828486" MODIFIED="1294825599514" TEXT="4.2.4.3 &#x586b;&#x5145;&#x6b64;&#x8fde;&#x63a5;&#x7684;help&#x6269;&#x5c55;&#x6570;&#x636e;"/>
<node CREATED="1304925135496" ID="ID_1465048518" MODIFIED="1304925179312" TEXT="4.2.4.4 &#x5c06;master&#x8fde;&#x63a5;&#x7684;mark&#x548c;secmark&#x503c;&#x590d;&#x5236;&#x5230;slave&#x8fde;&#x63a5;&#x4e0a;"/>
</node>
<node CREATED="1294825613918" ID="ID_547341148" MODIFIED="1308212276480" TEXT="4.2.7 &#x586b;&#x5145;&#x6b64;&#x8fde;&#x63a5;&#x7684;help&#x6269;&#x5c55;&#x6570;&#x636e;"/>
<node CREATED="1294825629249" ID="ID_127233148" MODIFIED="1308212282125" TEXT="4.2.8 &#x5c06;&#x6b64;&#x8fde;&#x63a5;&#x52a0;&#x5165;&#x5230;net-&gt;ct.unconfirmed&#x4e2d;"/>
<node CREATED="1304926478914" ID="ID_1251038399" MODIFIED="1308212288281" TEXT="4.2.9 &#x82e5;&#x6b64;&#x5305;&#x5df2;&#x7531;&#x786c;&#x4ef6;&#x505a;&#x8fc7;dnat&#x5219;&#x5728;ct-&gt;status&#x4e0a;&#x8bbe;&#x7f6e;&#xa;IPS_ATHR_SW_NAT_SKIPPED_BIT&#x8868;&#x793a;&#x5e94;&#x8df3;&#x8fc7;&#x8f6f;&#x4ef6;nat"/>
<node CREATED="1294825647389" ID="ID_857166088" MODIFIED="1308212295436" TEXT="4.2.10 &#x5982;&#x679c;&#x6b64;&#x8fde;&#x63a5;&#x662f;related&#x8fde;&#x63a5;&#xff0c;&#x5219;&#x8c03;&#x7528;expection&#x7684;expectfn&#x56de;&#x8c03;&#x51fd;&#x6570;&#x8868;&#x793a;&#x5df2;&#x547d;&#x4e2d;&#x4e00;&#x4e2a;related&#x8fde;&#x63a5;"/>
</node>
<node CREATED="1294825678602" ID="ID_1549436075" MODIFIED="1304929173623" TEXT="4.4, &#x786e;&#x5b9a;&#x8fde;&#x63a5;&#x72b6;&#x6001;">
<node CREATED="1294825732157" ID="ID_778033879" MODIFIED="1304924753753">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      IP_CT_ESTABLISHED:&#27492;&#21253;&#20026;original&#26041;&#21521;
    </p>
    <p>
      &#19988;&#20043;&#21069;&#24050;&#25910;&#21040;&#36807;reply&#26041;&#21521;&#30340;&#21253;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1294825744847" ID="ID_1211249584" MODIFIED="1304924678950" TEXT="IP_CT_RELATED:&#x82e5;&#x4e3a;help&#x521b;&#x5efa;&#x7684;&#x8fde;&#x63a5;"/>
<node CREATED="1294825757681" ID="ID_1550036971" MODIFIED="1304924704173" TEXT="IP_CT_NEW:original&#x65b9;&#x5411;&#x7684;&#x7b2c;&#x4e00;&#x4e2a;&#x5305;"/>
<node CREATED="1294825773676" ID="ID_1459803238" MODIFIED="1304924787076" TEXT="IP_CT_IS_REPLY:&#x6b64;&#x5305;&#x4e3a;reply&#x65b9;&#x5411;&#x7684;&#x5305;"/>
</node>
<node CREATED="1294825693661" ID="ID_1088130055" MODIFIED="1304924255040" TEXT="4.5, &#x5c06;&#x8fde;&#x63a5;&#x7684;&#x6570;&#x636e;&#x7ed3;&#x6784;&#x6302;&#x5230;skb-&gt;nfct&#x4e0a;"/>
</node>
<node CREATED="1294825879480" ID="ID_875726592" MODIFIED="1294825904757" TEXT="5, &#x8c03;&#x7528;l4&#x534f;&#x8bae;&#x7684;packet&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1307097735976" FOLDED="true" ID="ID_1147914006" MODIFIED="1308648118184">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26356;&#26032;udp&#21327;&#35758;&#29366;&#24577;
    </p>
    <p>
      &#20027;&#35201;&#26159;&#26356;&#26032;&#36830;&#25509;&#30340;&#23450;&#26102;&#22120;
    </p>
  </body>
</html></richcontent>
<node CREATED="1308644543801" ID="ID_2770210" MODIFIED="1308644545855" TEXT="nf_ct_refresh_acct">
<node CREATED="1308644470905" ID="ID_963759563" MODIFIED="1308644472993" TEXT="__nf_ct_refresh_acct">
<node CREATED="1308644477919" ID="ID_1451893666" MODIFIED="1308644501132" TEXT="1, &#x66f4;&#x65b0;&#x8fde;&#x63a5;&#x7684;&#x5b9a;&#x65f6;&#x5668;"/>
<node CREATED="1308644501920" ID="ID_1909452491" MODIFIED="1308644528359" TEXT="2, &#x66f4;&#x65b0;&#x8fde;&#x63a5;&#x7684;&#x7edf;&#x8ba1;&#x6570;&#x636e;"/>
</node>
</node>
</node>
<node CREATED="1308647039719" ID="ID_1690969868" LINK="#ID_1432984569" MODIFIED="1308648064407" TEXT="&#x66f4;&#x65b0;tcp&#x534f;&#x8bae;&#x72b6;&#x6001;"/>
</node>
<node CREATED="1303120969322" ID="ID_734288887" LINK="#ID_530852489" MODIFIED="1308043778599">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      6, &#25171;&#24320;&#23439;CONFIG_ATHRS_HW_NAT&#26102;
    </p>
    <p>
      &#35843;&#29992;athrs_nat_sw_ops-&gt;nf_process_nat
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1294828882836" ID="ID_1170512329" MODIFIED="1294829124229">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1,&#160;&#26410;&#26377;&#27492;&#36830;&#25509;&#26102;&#21253;&#30340;&#27969;&#31243;
    </p>
    <p>
      2, &#36830;&#25509;&#20026;new&#29366;&#24577;&#26102;&#27491;&#21521;&#21253;&#30340;&#27969;&#31243;
    </p>
    <p>
      3, &#36830;&#25509;&#20026;new&#29366;&#24577;&#26102;&#21453;&#21521;&#21253;&#30340;&#27969;&#31243;
    </p>
    <p>
      4, &#36830;&#25509;&#20026;reply&#29366;&#24577;&#26102;&#27491;&#21521;&#21253;&#30340;&#27969;&#31243;
    </p>
    <p>
      5, &#36830;&#25509;&#20026;reply&#29366;&#24577;&#26102;&#21453;&#21521;&#21253;&#30340;&#27969;&#31243;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1294815442033" ID="ID_582879358" MODIFIED="1294815449669" TEXT="mangle"/>
<node CREATED="1294815451891" FOLDED="true" ID="ID_1233277471" MODIFIED="1443057610012" TEXT="nat_dst">
<node CREATED="1294888691923" ID="ID_1477269389" MODIFIED="1303112420957" TEXT="nf_nat_in">
<node CREATED="1294888699450" ID="ID_878371985" MODIFIED="1303184223189" TEXT="1, nf_nat_fn">
<node CREATED="1303120624692" ID="ID_1956879560" MODIFIED="1303120952662" TEXT="1.0, &#x6253;&#x5f00;&#x5b8f;CONFIG_ATHRS_HW_NAT&#x65f6;">
<node CREATED="1303120713467" ID="ID_256743920" MODIFIED="1303120768070">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;skb-&gt;ath_hw_nat_fw_flags == 2 &#25110;&#32773;
    </p>
    <p>
      skb-&gt;ath_hw_nat_fw_flags == 3&#21017;&#30452;&#25509;&#36820;&#22238;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1294888727985" ID="ID_1547041656" MODIFIED="1294889129400" TEXT="1.1, &#x786e;&#x8ba4;&#x5305;&#x7684;&#x8fde;&#x63a5;&#x5408;&#x6cd5;"/>
<node CREATED="1294889132153" ID="ID_45475820" MODIFIED="1294889157084" TEXT="1.2, &#x5728;&#x8fde;&#x63a5;&#x4e2d;&#x6dfb;&#x52a0;nat&#x6269;&#x5c55;&#x6570;&#x636e;"/>
<node CREATED="1294899672604" ID="ID_1718734021" MODIFIED="1294899716231" TEXT="1.3, &#x5982;&#x679c;&#x662f;reply&#x6216;related&#x7684;icmp&#x5305;&#xff0c;"/>
<node CREATED="1294900131977" ID="ID_1055081546" MODIFIED="1304929650229" TEXT="1.4, &#x5982;&#x679c;&#x8fd8;&#x672a;&#x505a;nat&#xff0c;&#x5219;&#x67e5;&#x627e;nat&#x8868;&#x4e2d;&#x7684;&#x89c4;&#x5219;(nf_nat_rule_find)&#x505a;nat">
<node CREATED="1305007139998" ID="ID_1646988806" MODIFIED="1305007166971" TEXT="1.4.0 nf_nat_rule_find">
<node CREATED="1305007250426" ID="ID_1454719899" MODIFIED="1305007253180" TEXT="ipt_do_table"/>
</node>
<node CREATED="1294900277172" ID="ID_924924202" MODIFIED="1308209938376" TEXT="1.4.1, &#x5982;&#x679c;&#x662f;&#x5728;prerouting&#x5904;&#x5219;&#x5339;&#x914d;&#x89c4;&#x5219;&#x540e;&#x8f6c;&#x5411;ipt_dnat_target">
<node CREATED="1294900776176" ID="ID_1190412294" MODIFIED="1304932092646" TEXT="nf_nat_setup_info, &#x6839;&#x636e;nat&#x4fee;&#x6539;&#x8fde;&#x63a5;&#x7684;tuple">
<arrowlink COLOR="#25d618" DESTINATION="ID_338762921" ENDARROW="None" ENDINCLINATION="239;66;" ID="Arrow_ID_686043955" STARTARROW="Default" STARTINCLINATION="161;92;"/>
<node CREATED="1294900943841" ID="ID_537194556" MODIFIED="1294900963568" TEXT="1, &#x5728;&#x8fde;&#x63a5;&#x4e2d;&#x6dfb;&#x52a0;nat&#x6269;&#x5c55;&#x6570;&#x636e;"/>
<node CREATED="1294900986567" ID="ID_1212347988" MODIFIED="1294901001558" TEXT="2, &#x786e;&#x8ba4;&#x8fd8;&#x672a;&#x505a;nat"/>
<node CREATED="1294901213870" ID="ID_244244005" MODIFIED="1308209946710">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3, get_unique_tuple&#65292;&#20462;&#25913;ip&#21644;port
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#33719;&#21462;&#26032;&#30340;&#21807;&#19968;&#30340;original tuple
    </p>
  </body>
</html></richcontent>
<node CREATED="1294906631286" ID="ID_857675236" MODIFIED="1294908754150">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3.1, &#22914;&#26524;&#23384;&#22312;&#20855;&#26377;&#30456;&#21516;src&#30340;&#36830;&#25509;&#20063;&#20570;&#20102;src nat&#65292;&#21017;&#20351;&#29992;&#30456;&#21516;&#30340;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;src nat&#21518;&#30340;tuple(find_appropriate_src)&#65292;&#27492;&#22788;&#39035;&#20445;&#35777;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#27809;&#26377;&#20004;&#20010;&#36830;&#25509;&#30340;reply tuple&#30456;&#21516;&#65292;&#21542;&#21017;&#22238;&#26469;&#26102;&#26080;&#27861;&#21306;&#20998;&#24320;&#26469;&#12290;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#20063;&#23601;&#26159;&#20570;&#30456;&#21516;src nat&#30340;&#20004;&#20010;&#36830;&#25509;&#30340;dst&#39035;&#26377;&#25152;&#19981;&#21516;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1294907782936" ID="ID_1984273720" MODIFIED="1294907978483">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3.2, &#26681;&#25454;src ip&#21644;dst ip&#30340;hash&#24471;&#20986;nat&#21518;&#30340;<br />&#160; &#160;&#160;&#160;&#160;&#160;&#160;src&#25110;dst&#22320;&#22336;(find_best_ips_proto)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1294908817694" ID="ID_1984843001" MODIFIED="1294909882422" TEXT="3.3, &#x8c03;&#x7528;l4&#x534f;&#x8bae;&#x7684;unique_tuple&#x56de;&#x8c03;&#x51fd;&#x6570;&#x83b7;&#x53d6;&#x552f;&#x4e00;&#x7684;l4&#x4fe1;&#x606f;(port)"/>
</node>
<node CREATED="1294901400471" ID="ID_1941009809" MODIFIED="1304922576413" TEXT="4, &#x6839;&#x636e;&#x65b0;&#x7684;original tuple&#xff0c;&#x786e;&#x5b9a;&#x8fde;&#x63a5;&#x65b0;&#x7684;reply tuple, &#x7531;&#x4e8e;tuple&#x53d8;&#x5316;&#xff0c;&#xa;&#x8fde;&#x63a5;&#x7684;helper&#x4e5f;&#x9700;&#x8981;&#x66f4;&#x65b0;.&#x6ce8;&#x610f;&#x6b64;&#x65f6;&#x4fdd;&#x5b58;&#x8fde;&#x63a5;CT&#x4e2d;&#x7684;original tuple&#x5e76;&#x672a;&#x53d8;&#x5316;,&#xa;&#x53ea;&#x662f;&#x6839;&#x636e;&#x83b7;&#x53d6;&#x7684;&#x65b0;&#x7684;original tuple&#x66f4;&#x65b0;&#x4e86;&#x8fde;&#x63a5;CT&#x4e2d;&#x7684;reply tuple"/>
<node CREATED="1303184347239" ID="ID_590383748" MODIFIED="1304923025491" TEXT="5, &#x5982;&#x679c;&#x5b8f;CONFIG_ATHRS_HW_NAT&#x6253;&#x5f00;&#x4e86;&#x5219;&#x8c03;&#x7528;athr_nat_sw_ops-&gt;nf_alter_port">
<node CREATED="1303184523942" ID="ID_1938665776" MODIFIED="1303184583997" TEXT="1, &#x5982;&#x679c;ICMP&#x7684;ID&#x6539;&#x53d8;&#x4e86;&#x5219;&#x66f4;&#x65b0;ct-&gt;hwnat_priv&#x4e2d;&#x4fdd;&#x5b58;&#x7684;&#x786c;&#x4ef6;&#x6761;&#x76ee;&#x7684;port"/>
</node>
<node CREATED="1294901638861" ID="ID_1436768219" MODIFIED="1303184414560" TEXT="6, &#x5728;ct-&gt;status&#x4e0a;&#x8bbe;&#x7f6e;IPS_SRC_NAT&#x6216;IPS_DST_NAT&#x4f4d;"/>
<node CREATED="1294901712106" ID="ID_803457730" MODIFIED="1303184423178">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      7, &#26681;&#25454;original tuple&#23558;&#36830;&#25509;&#30340;nat&#25193;&#23637;&#25968;&#25454;&#25346;&#36733;&#21040;&#20840;&#23616;&#21464;&#37327;net-&gt;ipv4.nat_bysource&#19978;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1294902001879" ID="ID_667482594" MODIFIED="1303184430063" TEXT="8, &#x5728;ct-&gt;status&#x4e0a;&#x8bbe;&#x7f6e;IPS_DST_NAT_DONE_BIT&#x6216;IPS_SRC_NAT_DONE_BIT&#x4f4d;"/>
</node>
</node>
<node CREATED="1294900357920" ID="ID_338762921" MODIFIED="1294910503779" TEXT="1.4.2, &#x5982;&#x679c;&#x662f;&#x5728;postrouting&#x5904;&#x5219;&#x5339;&#x914d;&#x89c4;&#x5219;&#x540e;&#x8f6c;&#x5411;ipt_snat_target"/>
</node>
<node CREATED="1294911012606" ID="ID_1109334589" MODIFIED="1304929953981" TEXT="1.5, &#x8c03;&#x7528;nf_nat_packet&#x4fee;&#x6539;&#x5305;&#x5185;&#x5bb9;">
<node CREATED="1294911128618" ID="ID_985940292" MODIFIED="1294911198450" TEXT="1.5.1, &#x6839;&#x636e;&#x65b9;&#x5411;&#x548c;hook&#x4f4d;&#x7f6e;&#x786e;&#x5b9a;&#x4fee;&#x6539;src&#x8fd8;&#x662f;dst"/>
<node CREATED="1294911230982" ID="ID_576557429" MODIFIED="1294911259891" TEXT="1.5.2, &#x6839;&#x636e;&#x65b9;&#x5411;&#x83b7;&#x53d6;tuple&#x4ee5;&#x786e;&#x5b9a;&#x4fee;&#x6539;&#x6210;&#x4ec0;&#x4e48;&#x6837;&#x5b50;"/>
<node CREATED="1294911318946" ID="ID_732516353" MODIFIED="1294912672729">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1.5.3,
    </p>
    <p>
      
    </p>
    <table style="border-right-width: 0; border-left-width: 0; border-style: solid; border-top-width: 0; width: 100%; border-bottom-width: 0" border="0">
      <tr>
        <td style="border-right-width: 1; border-style: solid; border-left-width: 1; border-top-width: 1; width: 50%; border-bottom-width: 1" valign="top">
          <p style="margin-left: 1; margin-top: 1; margin-right: 1; margin-bottom: 1">
            l3 protocol-&gt;manip_pkt
          </p>
        </td>
        <td style="border-right-width: 1; border-style: solid; border-left-width: 1; border-top-width: 1; width: 50%; border-bottom-width: 1" valign="top">
          <p style="margin-left: 1; margin-top: 1; margin-right: 1; margin-bottom: 1">
            &#20462;&#25913;&#21253;&#30340;src&#25110;dst ip
          </p>
        </td>
      </tr>
      <tr>
        <td style="border-right-width: 1; border-style: solid; border-left-width: 1; border-top-width: 1; width: 50%; border-bottom-width: 1" valign="top">
          <p style="margin-left: 1; margin-top: 1; margin-right: 1; margin-bottom: 1">
            l4 protocol-&gt;manip_pkt
          </p>
        </td>
        <td style="border-right-width: 1; border-style: solid; border-left-width: 1; border-top-width: 1; width: 50%; border-bottom-width: 1" valign="top">
          <p style="margin-left: 1; margin-top: 1; margin-right: 1; margin-bottom: 1">
            &#20462;&#25913;&#21253;&#30340;l4&#20449;&#24687;(port)
          </p>
        </td>
      </tr>
    </table>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1294888733305" ID="ID_1422307079" MODIFIED="1294888786690" TEXT="2, &#x82e5;&#x76ee;&#x7684;&#x5730;&#x5740;&#x53d8;&#x4e86;&#xff0c;&#x5219;&#x653e;&#x5f03;&#x4e4b;&#x524d;&#x7684;&#x8def;&#x7531;&#x51b3;&#x5b9a;"/>
</node>
</node>
<node CREATED="1294815464902" ID="ID_137727393" MODIFIED="1294815473696" TEXT="filter"/>
</node>
<node CREATED="1294815257743" ID="ID_371539090" MODIFIED="1294815263992" POSITION="left" TEXT="forward"/>
<node CREATED="1294815292317" ID="ID_1049866468" MODIFIED="1294815297544" POSITION="right" TEXT="local out"/>
<node CREATED="1294815240019" FOLDED="true" ID="ID_779148676" MODIFIED="1443056031190" POSITION="left" TEXT="postrouting">
<icon BUILTIN="folder"/>
<node CREATED="1294829571189" ID="ID_956332772" MODIFIED="1294829575614" TEXT="raw"/>
<node CREATED="1294829589360" ID="ID_928103035" MODIFIED="1294829594772" TEXT="mangle"/>
<node CREATED="1294829624015" FOLDED="true" ID="ID_188217652" MODIFIED="1443055894517" TEXT="nat_src">
<node CREATED="1294888862924" ID="ID_1691532587" MODIFIED="1294913322963" TEXT="nf_nat_out">
<arrowlink COLOR="#34cf68" DESTINATION="ID_878371985" ENDARROW="Default" ENDINCLINATION="159;0;" ID="Arrow_ID_945134571" STARTARROW="None" STARTINCLINATION="159;0;"/>
</node>
</node>
<node CREATED="1294829633873" ID="ID_1456393941" MODIFIED="1294829638829" TEXT="filter"/>
<node CREATED="1294815486434" ID="ID_1711179247" MODIFIED="1443055895612" TEXT="conntrack_confirm">
<node CREATED="1294829719593" ID="ID_1578762589" MODIFIED="1304927002715" TEXT="ipv4_confirm">
<node CREATED="1294885147881" ID="ID_577231929" MODIFIED="1294885197004" TEXT="1, &#x5982;&#x679c;&#x6709;&#x5339;&#x914d;&#x7684;helper&#xff0c;&#x5219;&#x8c03;&#x7528;&#x5b83;"/>
<node CREATED="1294885218813" ID="ID_1710430213" MODIFIED="1294885238589" TEXT="2, &#x5982;&#x6709;&#x5fc5;&#x8981;&#x8c03;&#x6574;seq"/>
<node CREATED="1294885302082" ID="ID_1488396634" MODIFIED="1304927005693" TEXT="3, nf_conntrack_confirm">
<node CREATED="1294885347624" ID="ID_1308855627" MODIFIED="1294885387159" TEXT="3.1, &#x53ea;&#x786e;&#x8ba4;original&#x65b9;&#x5411;&#x7684;&#x8fde;&#x63a5;"/>
<node CREATED="1294885413614" ID="ID_490058831" MODIFIED="1294885442364" TEXT="3.2, &#x786e;&#x8ba4;&#x6b64;&#x8fde;&#x63a5;&#x8fd8;&#x672a;&#x653e;&#x5165;net-&gt;ct.hash[hash]"/>
<node CREATED="1294885485019" ID="ID_451927370" MODIFIED="1294885520699" TEXT="3.3, &#x5c06;&#x8fde;&#x63a5;&#x4ece;net-&gt;ct.unconfirmed&#x94fe;&#x4e2d;&#x5220;&#x9664;"/>
<node CREATED="1294885533897" ID="ID_1150211422" MODIFIED="1294885554145" TEXT="3.4, &#x542f;&#x7528;&#x6b64;&#x8fde;&#x63a5;&#x7684;&#x5b9a;&#x65f6;&#x5668;"/>
<node CREATED="1294885582543" ID="ID_550209288" MODIFIED="1294885599716" TEXT="3.5, &#x5728;ct-&gt;status&#x4e0a;&#x6807;&#x8bb0;IPS_CONFIRMED_BIT"/>
<node CREATED="1294885614229" ID="ID_1644639759" MODIFIED="1294885658759" TEXT="3.6, &#x5c06;&#x8fde;&#x63a5;&#x7684;original, repley&#x7684;tuple&#x90fd;&#x653e;&#x5165;net-&gt;ct.hash[xxx]&#x4e2d;"/>
<node CREATED="1294886601110" ID="ID_529575444" MODIFIED="1294886607410" TEXT="3.7, &#x901a;&#x8fc7;netlink&#x5c06;&#x8fde;&#x63a5;&#x7684;&#x72b6;&#x6001;&#x53d8;&#x5316;&#x901a;&#x77e5;&#x7ed9;&#x7528;&#x6237;&#x5c42;"/>
</node>
</node>
</node>
</node>
<node CREATED="1294815267665" FOLDED="true" ID="ID_326075047" MODIFIED="1439942568071" POSITION="right" TEXT="local in">
<node CREATED="1294815277499" ID="ID_117157679" MODIFIED="1294815288198" TEXT="xx"/>
</node>
<node CREATED="1299034363678" FOLDED="true" ID="ID_1654277455" MODIFIED="1440023018647" POSITION="right" TEXT="&#x5b9e;&#x4f8b;&#x5206;&#x6790;">
<node CREATED="1299034390786" ID="ID_1404567350" MODIFIED="1304909708685" TEXT="connection track helper">
<node CREATED="1299034424447" ID="ID_1142351655" MODIFIED="1308822868168" TEXT="sip">
<node CREATED="1299035149996" FOLDED="true" ID="ID_965497430" MODIFIED="1299058509134" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1299035196852" FOLDED="true" ID="ID_465920902" MODIFIED="1299058508006" TEXT="&#x5168;&#x5c40;&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1299035242739" ID="ID_285379198" MODIFIED="1299035258782" TEXT="nf_nat_sip_hook = ip_nat_sip"/>
<node CREATED="1299035271271" ID="ID_445681550" MODIFIED="1299035345235" TEXT="nf_nat_sip_expect_hook = ip_nat_sip_expect"/>
<node CREATED="1299035285898" ID="ID_536416493" MODIFIED="1299035352304" TEXT="nf_nat_sdp_addr_hook = ip_nat_sdp_addr"/>
<node CREATED="1299035300596" ID="ID_292912494" MODIFIED="1299035358596" TEXT="nf_nat_sdp_port_hook = ip_nat_sdp_port"/>
<node CREATED="1299035317175" ID="ID_996178023" MODIFIED="1299035365455" TEXT="nf_nat_sdp_session_hook = ip_nat_sdp_session"/>
<node CREATED="1299035330577" ID="ID_241958246" MODIFIED="1299035370313" TEXT="nf_nat_sdp_media_hook = ip_nat_sdp_media"/>
</node>
</node>
<node CREATED="1299034506156" FOLDED="true" ID="ID_919716533" MODIFIED="1299058180690" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1299034519094" ID="ID_1596432164" MODIFIED="1299034658649">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#21021;&#22987;&#21270;struct nf_conntrack_helper&#32467;&#26500;&#65292;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#25351;&#23450;&#21305;&#37197;&#21327;&#35758;&#20026;UDP&#65292;&#28304;&#31471;&#21475;&#20026;5060&#30340;&#21253;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299034697275" ID="ID_1615786424" MODIFIED="1299034744585" TEXT="2&#xff0c;&#x8c03;&#x7528;nf_conntrack_helper_register&#x6ce8;&#x518c; sip helper"/>
</node>
<node CREATED="1299034772055" FOLDED="true" ID="ID_1564430118" MODIFIED="1299059179922" TEXT="sip_help">
<node CREATED="1299034841810" FOLDED="true" ID="ID_1245636897" MODIFIED="1299058760927">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#26681;&#25454;sip&#25253;&#25991;&#35831;&#27714;&#34892;&#30340;&#26041;&#27861;&#65292;&#33509;&#20026;&#24314;&#31435;&#35831;&#27714;&#65292;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#21017;&#35843;&#29992;process_sip_request
    </p>
  </body>
</html></richcontent>
<node CREATED="1299035696364" FOLDED="true" ID="ID_1376910174" MODIFIED="1299058757486" TEXT="1, &#x82e5;&#x65b9;&#x6cd5;&#x4e3a; INVITE &#x6216; UPDATE &#x6216; ACK &#x6216; PRACK&#xff0c;&#x5219;&#x8c03;&#x7528;process_sdp&#x5904;&#x7406;">
<node CREATED="1299045128747" ID="ID_1941146999" MODIFIED="1299045258691">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#22312;sdp&#25253;&#25991;&#30340;session&#27573;&#20013;&#26597;&#25214;connection&#23383;&#22495;&#65292;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#20174;&#20013;&#25552;&#21462;session&#32423;&#30340;connection address
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299045312609" FOLDED="true" ID="ID_986871895" MODIFIED="1299058755950" TEXT="2, &#x5904;&#x7406;sdp&#x62a5;&#x6587;&#x7684;&#x6bcf;&#x4e2a;media&#x6bb5;">
<node CREATED="1299045360136" ID="ID_274559691" MODIFIED="1299045495770" TEXT="1, &#x5728;media&#x6bb5;&#x4e2d;&#x67e5;&#x627e;media&#x5b57;&#x57df;&#xff0c;&#x4ece;&#x4e2d;&#x63d0;&#x53d6;&#x4f20;&#x8f93;&#x5c42;&#x76ee;&#x7684;&#x7aef;&#x53e3;"/>
<node CREATED="1299045501447" ID="ID_879122934" MODIFIED="1299045596922">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#22312;media&#27573;&#20013;&#26597;&#25214;connecttion&#23383;&#22495;&#65292;&#20174;&#20013;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#25552;&#21462;media&#32423;&#30340;connection address
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299045654232" FOLDED="true" ID="ID_1800155291" MODIFIED="1299058750677" TEXT="3, &#x8c03;&#x7528;set_expected_rtp_rtcp&#x4e3a;&#x6bcf;&#x4e2a;media&#x6dfb;&#x52a0;related connection">
<node CREATED="1299048506907" ID="ID_1462940964" MODIFIED="1299048618555" TEXT="1, &#x5206;&#x522b;&#x4e3a;RTP&#x548c;RTCP&#x521d;&#x59cb;&#x5316;struct nf_conntrack_tuple&#x7ed3;&#x6784;&#xff1a;src ip, dst ip, dst port"/>
<node CREATED="1299048675718" FOLDED="true" ID="ID_829132594" MODIFIED="1299058748365" TEXT="2, &#x5982;&#x679c;&#x9700;&#x8981;&#x505a;NAT&#x5219;&#x8c03;&#x7528;nf_nat_sdp_media_hook&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1299050441539" ID="ID_1229804905" MODIFIED="1299050506783" TEXT="1, &#x5c06;dst ip &#x4fee;&#x6539;&#x4e3a;master connection reply&#x65b9;&#x5411;&#x7684;dst ip"/>
<node CREATED="1299050145947" ID="ID_1788055990" MODIFIED="1299050544131" TEXT="2, &#x786e;&#x4fdd;RTP&#x548c;RTCP&#x7684;struct nf_conntrack_tuple&#x4e0d;&#x4e0e;&#x7cfb;&#x7edf;&#x4e2d;&#x5df2;&#x5b58;&#x5728;&#x7684;connection&#x7684;&#xa;    struct nf_conntrack_tuple&#x51b2;&#x7a81;&#xff0c;&#x5982;&#x679c;&#x51b2;&#x7a81;&#x5219;&#x9012;&#x52a0;dst port&#x76f4;&#x5230;&#x4e0d;&#x51b2;&#x7a81;&#x4e3a;&#x6b62;"/>
<node CREATED="1299050632353" ID="ID_836985992" MODIFIED="1299050681808" TEXT="3, &#x5c06;connection&#x7684;&#x65b9;&#x5411;&#x4fee;&#x6539;&#x4e3a;master connection&#x7684;reply&#x65b9;&#x5411;"/>
<node CREATED="1299051065071" FOLDED="true" ID="ID_84415234" MODIFIED="1299058742508" TEXT="4, &#x5c06;struct nf_conntrack_expect&#x7684;expectfn&#x51fd;&#x6570;&#x8bbe;&#x7f6e;&#x4e3a;ip_nat_sip_expected">
<node CREATED="1299052988677" ID="ID_468229552" MODIFIED="1299053294074">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21305;&#37197;&#27492;related connection&#30340;media data&#25968;&#25454;&#27969;&#20250;&#35843;&#29992;&#27492;&#22238;&#35843;&#20989;&#25968;&#12290;
    </p>
    <p>
      &#20174;struct nf_conntrack_expect&#30340;saved_ip&#21644;saved_proto&#20013;&#25552;&#21462;ip&#21644;port
    </p>
    <p>
      &#20316;&#20026;dst nat&#21518;&#30340;ip&#21644;port&#65292;&#35843;&#29992;nf_nat_setup_info&#37325;&#24314;dst nat&#20449;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1299050746636" ID="ID_1564196959" MODIFIED="1299051137870">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      5, &#23558;&#20462;&#25913;&#20043;&#21069;&#30340;dst ip&#21644;dst port&#20445;&#23384;&#22312;struct nf_conntrack_expect&#32467;&#26500;&#30340;
    </p>
    <p>
      &#160;&#160;&#160;&#160;saved_ip&#21644;saved_proto&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299051536339" ID="ID_1492970003" MODIFIED="1299051607848" TEXT="6, &#x8c03;&#x7528;nf_ct_expect_related&#x6dfb;&#x52a0;RTP&#x548c;RTCP&#x7684;related connection"/>
<node CREATED="1299051176969" ID="ID_1682188298" MODIFIED="1299051616168" TEXT="7, &#x5982;&#x679c;dst port&#x53d1;&#x751f;&#x4e86;&#x53d8;&#x5316;&#x5219;&#x8c03;&#x7528;ip_nat_sdp_port&#x4fee;&#x6539;&#xa;    &#x62a5;&#x6587;&#x4e2d;&#x7684;dst port&#x5e76;&#x505a;&#x76f8;&#x5173;&#x66f4;&#x65b0;&#xff08;&#x5982;&#x957f;&#x5ea6;&#xff0c;&#x68c0;&#x9a8c;&#x548c;&#x7b49;&#xff09;"/>
</node>
</node>
<node CREATED="1299045757664" FOLDED="true" ID="ID_564091825" MODIFIED="1299056622542" TEXT="4, &#x82e5;&#x9700;&#x8981;&#x505a;NAT&#x5219;&#x8c03;&#x7528;nf_nat_sdp_addr_hook&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1299055379974" ID="ID_1551215860" MODIFIED="1299055628926" TEXT="&#x4fee;&#x6539;&#x62a5;&#x6587;&#xff0c;&#x5c06;connection&#x5b57;&#x57df;&#x4e2d;&#x7684;connection address&#x4fee;&#x6539;&#x4e3a;RTP, RTCP related &#xa;connection&#x7684;dst ip&#x3002;&#x6ce8;&#x610f;dst ip&#x5df2;&#x5728;nf_nat_sdp_media_hook&#x56de;&#x8c03;&#x51fd;&#x6570;&#x4e2d;&#x88ab;&#x6539;&#x53d8;"/>
</node>
</node>
<node CREATED="1299045918706" FOLDED="true" ID="ID_1613891146" MODIFIED="1299056624215" TEXT="3, &#x82e5;&#x9700;&#x8981;&#x505a;NAT&#x5219;&#x8c03;&#x7528;nf_nat_sdp_session_hook&#x56de;&#x8c03;&#x51fd;&#x6570; ">
<node CREATED="1299056116341" ID="ID_465943615" MODIFIED="1299056370718" TEXT="1, &#x4fee;&#x6539;&#x62a5;&#x6587;&#xff0c;&#x5c06;session&#x6bb5;&#x4e2d;originator&#x5b57;&#x57df;&#x5185;&#x7684;unicast address&#x4fee;&#x6539;&#x4e3a;RTP&#xff0c;RTCP &#xa;   related connection&#x7684;dst ip&#x3002;&#x6ce8;&#x610f;&#x6b64;dst ip&#x5df2;&#x5728;nf_nat_sdp_media_hook&#x56de;&#x8c03;&#x51fd;&#x6570;&#x4e2d;&#x6539;&#x53d8;"/>
<node CREATED="1299056388256" ID="ID_1046265307" MODIFIED="1299056466381" TEXT="2, &#x4fee;&#x6539;&#x62a5;&#x6587;&#xff0c;&#x5c06;session&#x6bb5;&#x4e2d;connection&#x5b57;&#x57df;&#x5185;&#x7684;connection address&#x4fee;&#x6539;&#x4e3a;RTP&#xff0c;RTCP&#xa;    related connection&#x7684;dst ip&#x3002;&#x6ce8;&#x610f;&#x6b64;dst ip&#x5df2;&#x5728;nf_nat_sdp_media_hook&#x56de;&#x8c03;&#x51fd;&#x6570;&#x4e2d;&#x6539;&#x53d8; "/>
</node>
</node>
<node CREATED="1299035825058" FOLDED="true" ID="ID_452899644" MODIFIED="1299058002541" TEXT="2, &#x82e5;&#x65b9;&#x6cd5;&#x4e3a; BYE&#xff0c;&#x5219;&#x8c03;&#x7528;process_bye_request&#x5904;&#x7406; ">
<node CREATED="1299057968471" ID="ID_456084271" MODIFIED="1299058000591" TEXT="&#x5220;&#x9664;&#x4e4b;&#x524d;&#x5728;&#x6b64;connection&#x4e0b;&#x5efa;&#x7acb;&#x7684;&#x6240;&#x6709;related connection "/>
</node>
<node CREATED="1299035885290" ID="ID_1970710713" MODIFIED="1299035915745" TEXT="3, &#x82e5;&#x65b9;&#x6cd5;&#x4e3a; REGISTER&#xff0c;&#x5219;&#x8c03;&#x7528;process_register_request&#x5904;&#x7406;"/>
</node>
<node CREATED="1299034976296" FOLDED="true" ID="ID_730087230" MODIFIED="1299058120272">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#26681;&#25454;sip&#25253;&#25991;&#35831;&#27714;&#34892;&#30340;&#26041;&#27861;&#65292;&#33509;&#20026;&#21709;&#24212;&#35831;&#27714;&#65292;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#21017;&#35843;&#29992;process_sip_response
    </p>
  </body>
</html></richcontent>
<node CREATED="1299035952261" FOLDED="true" ID="ID_813941768" MODIFIED="1299058101437" TEXT="1, &#x82e5;&#x662f;&#x54cd;&#x5e94; INVITE&#xff0c;&#x5219;&#x8c03;&#x7528;process_invite_response&#x5904;&#x7406;">
<arrowlink COLOR="#29ea21" DESTINATION="ID_978463743" ENDARROW="None" ENDINCLINATION="209;0;" ID="Arrow_ID_1980596220" STARTARROW="Default" STARTINCLINATION="209;0;"/>
<arrowlink COLOR="#32bc23" DESTINATION="ID_1095240663" ENDARROW="None" ENDINCLINATION="222;0;" ID="Arrow_ID_1531812517" STARTARROW="Default" STARTINCLINATION="222;0;"/>
<node CREATED="1299057083584" ID="ID_1572159992" MODIFIED="1299057554564" TEXT="1, &#x82e5;&#x54cd;&#x5e94;&#x7684;code&#x5728;100-299&#x8303;&#x56f4;&#x5185;&#xff0c;&#x5219;&#x8c03;&#x7528;process_sdp&#x5904;&#x7406;">
<arrowlink COLOR="#5caf2e" DESTINATION="ID_1376910174" ENDARROW="Default" ENDINCLINATION="363;-11;" ID="Arrow_ID_1318753073" STARTARROW="None" STARTINCLINATION="235;0;"/>
</node>
<node CREATED="1299057158428" ID="ID_1026829223" MODIFIED="1299057357063">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#33509;&#21709;&#24212;&#30340;code&#19981;&#22312;100-299&#33539;&#22260;&#20869;&#65292;&#21017;&#21024;&#38500;&#20043;&#21069;&#22312;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#27492;connection&#19979;&#24314;&#31435;&#30340;&#25152;&#26377;related connection
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1299035997821" FOLDED="true" ID="ID_1398265481" MODIFIED="1299058108374" TEXT="2, &#x82e5;&#x662f;&#x54cd;&#x5e94; UPDATE&#xff0c;&#x5219;&#x8c03;&#x7528;process_update_response&#x5904;&#x7406;">
<node CREATED="1299057826728" ID="ID_1095240663" MODIFIED="1299057881450" TEXT="&#x540c;process_invite_response"/>
</node>
<node CREATED="1299036050037" FOLDED="true" ID="ID_782030620" MODIFIED="1299058109318" TEXT="3, &#x82e5;&#x662f;&#x54cd;&#x5e94; PRACK&#xff0c;&#x5219;&#x8c03;&#x7528;process_prack_response&#x5904;&#x7406;">
<node CREATED="1299058061454" ID="ID_978463743" MODIFIED="1299058092428" TEXT="&#x540c;process_invite_response "/>
</node>
<node CREATED="1299036086011" ID="ID_1770541283" MODIFIED="1299036110712" TEXT="4, &#x82e5;&#x662f;&#x54cd;&#x5e94; REGISTER&#xff0c;&#x5219;&#x8c03;&#x7528;process_register_response&#x5904;&#x7406;"/>
</node>
<node CREATED="1299035421224" FOLDED="true" ID="ID_167434152" MODIFIED="1299058502485" TEXT="3, &#x82e5;&#x9700;&#x8981;&#x505a;NAT&#x5219;&#x8c03;&#x7528;nf_nat_sip_hook&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1299058444203" ID="ID_246853952" MODIFIED="1299058497953" TEXT="&#x4fee;&#x6539;&#x62a5;&#x6587;&#xff0c;&#x5c06;sip&#x62a5;&#x6587;&#x4e2d;&#x76f8;&#x5173;&#x5730;&#x5740;&#x4fee;&#x6539;&#x4e3a;src nat&#x4e4b;&#x540e;&#x7684;&#x6e90;&#x5730;&#x5740;"/>
</node>
</node>
</node>
</node>
<node CREATED="1308645218162" ID="ID_536163214" MODIFIED="1308645229149" TEXT="ipv4">
<node CREATED="1308645242066" FOLDED="true" ID="ID_980219055" MODIFIED="1308822846000">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21021;&#22987;&#21270;(nf_conntrack_l3proto_ipv4_init)
    </p>
    <p>
      net/ipv4/netfilter/nf_conntrack_l3proto_ipv4.c
    </p>
  </body>
</html></richcontent>
<node CREATED="1308645381001" ID="ID_634572868" MODIFIED="1308645445387" TEXT="1, nf_register_sockopt(&amp;so_getorigdst)"/>
<node CREATED="1308645446476" ID="ID_75812580" MODIFIED="1308645639127">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, nf_conntrack_l4proto_register(&amp;nf_conntrack_l4proto_tcp4)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;nf_conntrack_l4proto_tcp4
    </p>
  </body>
</html></richcontent>
<node CREATED="1308645676039" ID="ID_937715050" MODIFIED="1308645903684">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      pkt_to_tuple = tcp_pkt_to_tuple
    </p>
    <p>
      &#21363;&#30001;&#21253;&#26469;&#26500;&#24314;tuple,&#23545;&#20110;tcp&#32780;&#35328;,&#21363;
    </p>
    <p>
      &#23558;tuple-&gt;src.u.tcp.port&#36171;&#20540;&#20026;tcp&#28304;&#31471;&#21475;
    </p>
    <p>
      &#23558;tuple-&gt;dst.u.tcp.port&#36171;&#20540;&#20026;tcp&#30446;&#30340;&#31471;&#21475;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308645690791" ID="ID_1044758113" MODIFIED="1308646041050">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      invert_tuple&#160;= tcp_invert_tuple
    </p>
    <p>
      &#21363;&#21453;&#36716;&#26576;&#20010;tuple&#30340;tcp&#30456;&#20851;&#37096;&#20998;,&#21363;
    </p>
    <p>
      tuple-&gt;src.u.tcp.port = orig-&gt;dst.u.tcp.port
    </p>
    <p>
      tuple-&gt;dst.u.tcp.port = orig-&gt;src.u.tcp.port
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308646063641" ID="ID_1432984569" MODIFIED="1308647008823">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      packet&#160;= tcp_packet
    </p>
    <p>
      &#26356;&#26032;tcp&#21327;&#35758;&#29366;&#24577;,&#24182;&#26681;&#25454;tcp&#21327;&#35758;&#29366;&#24577;&#26356;&#26032;&#36830;&#25509;&#30340;&#23450;&#26102;&#22120;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308647156589" ID="ID_1449429076" MODIFIED="1308647283372">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      new&#160;= tcp_new
    </p>
    <p>
      &#26356;&#26032;tcp&#21327;&#35758;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1308645462717" ID="ID_1478044511" MODIFIED="1308645465524" TEXT="3, nf_conntrack_l4proto_register(&amp;nf_conntrack_l4proto_udp4)">
<node CREATED="1308645676039" ID="ID_1876781934" MODIFIED="1308647466133">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      pkt_to_tuple = udp_pkt_to_tuple
    </p>
    <p>
      &#21363;&#30001;&#21253;&#26469;&#26500;&#24314;tuple,&#23545;&#20110;udp&#32780;&#35328;,&#21363;
    </p>
    <p>
      &#23558;tuple-&gt;src.u.tcp.port&#36171;&#20540;&#20026;udp&#28304;&#31471;&#21475;
    </p>
    <p>
      &#23558;tuple-&gt;dst.u.tcp.port&#36171;&#20540;&#20026;udp&#30446;&#30340;&#31471;&#21475;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308645690791" ID="ID_1764253469" MODIFIED="1308647524312">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      invert_tuple&#160;= udp_invert_tuple
    </p>
    <p>
      &#21363;&#21453;&#36716;&#26576;&#20010;tuple&#30340;udp&#30456;&#20851;&#37096;&#20998;,&#21363;
    </p>
    <p>
      tuple-&gt;src.u.udp.port = orig-&gt;dst.u.udp.port
    </p>
    <p>
      tuple-&gt;dst.u.udp.port = orig-&gt;src.u.udp.port
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308646063641" ID="ID_826835524" MODIFIED="1308647595354">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      packet&#160;= udp_packet
    </p>
    <p>
      &#26356;&#26032;udp&#36830;&#25509;&#30340;&#23450;&#26102;&#22120;
    </p>
  </body>
</html></richcontent>
<node CREATED="1308647698374" ID="ID_1779798641" LINK="#ID_1147914006" MODIFIED="1308648091775">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#33509;&#36824;&#26410;&#25910;&#21040;reply&#26041;&#21521;&#30340;&#21253;&#21017;&#36229;&#26102;&#26102;&#38388;&#20026;
    </p>
    <p>
      (nf_ct_udp_timeout_stream=180HZ)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308647832044" ID="ID_553393822" LINK="#ID_1147914006" MODIFIED="1308648105632">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#33509;&#24050;&#25910;&#21040;reply&#26041;&#21521;&#30340;&#21253;&#21017;&#36229;&#26102;&#26102;&#38388;&#20026;
    </p>
    <p>
      (nf_ct_udp_timeout=30HZ)
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1308645474541" ID="ID_121028369" MODIFIED="1308645477102" TEXT="4, nf_conntrack_l4proto_register(&amp;nf_conntrack_l4proto_icmp)"/>
<node CREATED="1308645487870" ID="ID_1798739167" MODIFIED="1308645490467" TEXT="5, nf_conntrack_l3proto_register(&amp;nf_conntrack_l3proto_ipv4)"/>
<node CREATED="1308645521519" ID="ID_1408961683" MODIFIED="1308645545602">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      6, nf_register_hooks(ipv4_conntrack_ops, ARRAY_SIZE(ipv4_conntrack_ops))
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1304909741399" FOLDED="true" ID="ID_1580029373" MODIFIED="1443055875902" POSITION="left" TEXT="hw-accelerator">
<node CREATED="1304909781439" ID="ID_720740309" MODIFIED="1304909792500" TEXT="&#x521d;&#x59cb;&#x5316;&#x6d41;&#x7a0b;">
<node CREATED="1304909810577" ID="ID_3216783" MODIFIED="1308042350388" TEXT="athr_gmac_init">
<node CREATED="1304909854697" ID="ID_877739200" MODIFIED="1308132091551" TEXT="athr_register_hwaccels">
<node CREATED="1304910250169" ID="ID_1809525514" MODIFIED="1308132092887" TEXT="athr_reg_hwaccels">
<node CREATED="1304911241963" ID="ID_1017179494" MODIFIED="1308132095506" TEXT="1, mac-&gt;hw_accels-&gt;nat = athrs27_register_nat_ops()">
<node CREATED="1308042477156" ID="ID_1976975366" MODIFIED="1308042839663" TEXT="hw_nat_api-&gt;init                          =                            athr_nat_init;"/>
<node CREATED="1308042488758" ID="ID_1703780436" MODIFIED="1308042666730" TEXT="hw_nat_api-&gt;down                        =                       athr_nat_down; "/>
<node CREATED="1308042499383" ID="ID_544578398" MODIFIED="1308042689337" TEXT="hw_nat_api-&gt;add_entry                   =          athr_hw_nat_add_entry; "/>
<node CREATED="1308042509384" ID="ID_1335219938" MODIFIED="1308042722513" TEXT="hw_nat_api-&gt;del_entry            =           athr_hw_nat_del_entry; "/>
<node CREATED="1308042518889" ID="ID_1762758962" MODIFIED="1308042745095" TEXT="hw_nat_api-&gt;lkp_entry            =     athr_hw_nat_lookup_entry; "/>
<node CREATED="1308042528154" ID="ID_996734558" MODIFIED="1308042758024" TEXT="hw_nat_api-&gt;set_wan_mac_addr     =          athr_set_nat_wan_mac; "/>
<node CREATED="1308042537051" ID="ID_1269572024" MODIFIED="1308042773937" TEXT=" hw_nat_api-&gt;set_wan_ip_addr      =             athr_set_nat_wan_ip; "/>
<node CREATED="1308042545053" ID="ID_1721160606" MODIFIED="1308042790763" TEXT="hw_nat_api-&gt;reg_net_notifier     =     athr_reg_net_notifcations; "/>
<node CREATED="1308042554286" ID="ID_500784060" MODIFIED="1308042555748" TEXT="hw_nat_api-&gt;unreg_net_notifier   = athr_unreg_net_notifcations; "/>
<node CREATED="1308042562831" ID="ID_288160538" MODIFIED="1308042802982" TEXT="hw_nat_api-&gt;proc_init            =                 athr_nat_proc_init; "/>
<node CREATED="1308042571024" ID="ID_319216193" MODIFIED="1308042817359" TEXT="hw_nat_api-&gt;proc_remove          =          athr_nat_proc_remove; "/>
<node CREATED="1308042579985" ID="ID_356151226" MODIFIED="1308042825207" TEXT="hw_nat_api-&gt;cleanup              =                  athr_nat_cleanup; "/>
</node>
<node CREATED="1304911261895" FOLDED="true" ID="ID_626733341" MODIFIED="1308042981424" TEXT="2, mac-&gt;hw_accels-&gt;acl = athrs27_register_acl_ops()">
<node CREATED="1308042854754" ID="ID_219982595" MODIFIED="1308042975289" TEXT="hw_acl_api-&gt;init                 =                     athr_acl_init; "/>
<node CREATED="1308042863555" ID="ID_1958410083" MODIFIED="1308042972462" TEXT="hw_acl_api-&gt;create_chain         =    athr_create_cmd_chain; "/>
<node CREATED="1308042872788" ID="ID_22210878" MODIFIED="1308042969408" TEXT="hw_acl_api-&gt;parse_chain          =         athr_nf_parse_cmds; "/>
<node CREATED="1308042881749" ID="ID_875882193" MODIFIED="1308042966182" TEXT="hw_acl_api-&gt;add_cmds             =            athr_nf_add_cmds; "/>
<node CREATED="1308042890518" ID="ID_278913204" MODIFIED="1308042963374" TEXT="hw_acl_api-&gt;flush_entries        =               athr_flush_rules; "/>
<node CREATED="1308042900071" ID="ID_1803081381" MODIFIED="1308042958167" TEXT="hw_acl_api-&gt;cleanup              =             athr_acl_cleanup; "/>
</node>
</node>
</node>
<node CREATED="1304909897865" FOLDED="true" ID="ID_1638441511" MODIFIED="1304921637753" TEXT="2, athr_register_hwaccels_notifiers">
<node CREATED="1304921044486" ID="ID_272983767" MODIFIED="1304921047989" TEXT="athr_setup_hwaccels_notifiers">
<node CREATED="1304921072585" ID="ID_1532297259" MODIFIED="1304921078161" TEXT="mac-&gt;hw_accels-&gt;nat-&gt;reg_net_notifier()">
<node CREATED="1304921253391" ID="ID_305342618" MODIFIED="1304921304929">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, athr_nat_netdev_event_handler:
    </p>
    <p>
      wan &#21475;up/down&#26102;&#25552;&#37266;hwccelerator
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1304921360460" ID="ID_1947806549" MODIFIED="1304921402471">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, athr_nat_inetaddr_event_handler:
    </p>
    <p>
      wan&#21475;IP&#22320;&#22336;&#21464;&#21270;&#26102;&#25552;&#37266;hwaccelerator
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1304912081489" ID="ID_568273822" MODIFIED="1308043065950" TEXT="athr_gmac_open">
<node CREATED="1304912114587" ID="ID_711057359" MODIFIED="1304912117629" TEXT="athr_init_hwaccels">
<node CREATED="1304912294626" ID="ID_177354015" MODIFIED="1304912298293" TEXT="athr_setup_hwaccels">
<node CREATED="1304919100730" ID="ID_1988188134" MODIFIED="1304920508823" TEXT="athr_nat_init">
<node CREATED="1304919205191" ID="ID_1034274946" MODIFIED="1308043313083">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, create&#160;athr_nat_sw_ops
    </p>
    <p>
      athr_nat_sw_ops-&gt;nf_process_nat = athr_nf_ct_process_ops;
    </p>
    <p>
      athr_nat_sw_ops-&gt;nf_find_get = athr_nf_find_get;
    </p>
    <p>
      athr_nat_sw_ops-&gt;get_wan_ipaddr = athr_get_wan_ip_addr;
    </p>
    <p>
      athr_nat_sw_ops-&gt;nf_tuple_taken = athr_nf_ct_tuple_taken;
    </p>
    <p>
      athr_nat_sw_ops-&gt;nf_alter_port = athr_nf_ct_alter_port;
    </p>
    <p>
      athr_nat_sw_ops-&gt;check_layer2if = athr_nf_ct_check_layer2if
    </p>
  </body>
</html></richcontent>
<node CREATED="1304922006301" ID="ID_1114953549" MODIFIED="1304922008191" TEXT="athr_nf_ct_alter_port"/>
<node CREATED="1304923298336" ID="ID_269586059" MODIFIED="1304923300871" TEXT="athr_nf_ct_tuple_taken"/>
<node CREATED="1304927308385" ID="ID_530852489" MODIFIED="1308043889543">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      athr_nf_ct_process_ops
    </p>
    <p>
      &#36319;&#36394;&#36830;&#25509;&#30340;&#24314;&#31435;&#21024;&#38500;&#29366;&#24577;,
    </p>
    <p>
      &#20197;&#26356;&#26032;&#23545;&#24212;&#30340;&#30828;&#20214;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1303121143689" ID="ID_446917048" MODIFIED="1308213494813" TEXT="1, &#x5982;&#x679c;skb!=null&#x5219;&#x8c03;&#x7528;athr_nf_nat_process_ops">
<node CREATED="1308043999963" ID="ID_1514234671" MODIFIED="1308044101208">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      0, &#33509;&#36830;&#25509;&#30340;&#20986;&#21475;&#19981;&#25903;&#25345;hwnat,&#21017;&#36820;&#22238;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#27604;&#22914;:PPPOE&#20986;&#21475;&#19981;&#25903;&#25345;hwnat
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1303121467759" ID="ID_412095534" MODIFIED="1308045305345">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#33509;&#36830;&#25509;&#24050;&#28155;&#21152;&#21040;&#30828;&#20214;(&#21363;IPS_ATHR_HW_NAT_ADDED_BIT&#22312;ct-&gt;status&#19978;&#32622;&#20301;)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#36830;&#25509;&#24050;&#28155;&#21152;&#21040;&#30828;&#20214;&#21253;&#25324;2&#31181;&#24773;&#20917;:
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#31532;&#19968;&#31181;: egress nat entry &#24050;&#21152;&#20837;&#30828;&#20214;.
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#31532;&#20108;&#31181;: egress nat entry &#21644; ingress nat entry&#22343;&#24050;&#21152;&#20837;&#30828;&#20214;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1303121662822" ID="ID_1077027752" MODIFIED="1308044281502">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#33509;&#21253;&#20174;lan&#20391;&#36807;&#26469;(&#21363;skb-&gt;ath_hw_nat_fw_flags == 1)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#21017;&#35774;&#32622;skb-&gt;ath_hw_nat_fw_flags&#20026;2,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#34920;&#31034;&#24212;&#30001;&#30828;&#20214;&#20570;SNAT, &#20043;&#21518;&#36820;&#22238;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1308044315153" ID="ID_1860438258" MODIFIED="1308044359351">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#33509;&#21253;&#20174;wan&#20391;&#36807;&#26469;&#20294;&#26410;&#30001;&#30828;&#20214;&#20570;&#36807;dnat
    </p>
    <p>
      &#160;&#160;&#160;&#160;(&#21363;skb-&gt;ath_hw_nat_fw_flags == 100)
    </p>
  </body>
</html></richcontent>
<node CREATED="1303121763805" ID="ID_1183448775" MODIFIED="1308045542629">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#22914;&#26524;&#27492;UDP&#27969;&#22312;original&#21644;reply&#26041;&#21521;&#22343;&#24050;&#21457;&#36807;&#21253;&#65292;
    </p>
    <p>
      &#160;&#160;&#160;&#160;(&#27492;&#31181;&#24773;&#20917;&#23545;&#24212;&#20110;egress nat entry &#24050;&#21152;&#20837;&#30828;&#20214;, &#20294;
    </p>
    <p>
      &#160;&#160;&#160;&#160;ingress nat entry &#36824;&#26410;&#21152;&#20837;&#30828;&#20214;. &#27492;&#22788;&#26816;&#26597;UDP&#27969;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#21452;&#21521;&#24050;&#21457;&#21253;,&#25152;&#20197;&#26377;&#24517;&#35201;&#23558;ingress nat entry&#21152;&#20837;&#30828;&#20214;)
    </p>
  </body>
</html></richcontent>
<node CREATED="1303121891196" ID="ID_875701478" MODIFIED="1308045607628">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#23558;skb-&gt;ath_hw_nat_fw_flags&#32622;&#20026;1
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#36825;&#24847;&#21619;&#30528;&#21253;&#36824;&#38656;&#22312;&#36719;&#20214;&#20013;&#20570;nat
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1303122058147" ID="ID_252439415" MODIFIED="1308044794539">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#22312;ct-&gt;status&#19978;&#35774;&#32622;IPS_ATHR_HW_NAT_IS_UDP_BIT
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#34920;&#31034;UDP&#21452;&#21521;&#36830;&#25509;&#24050;&#24314;&#31435;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1303122086219" ID="ID_1940646906" LINK="#ID_1978971750" MODIFIED="1308044820844" TEXT="3, &#x8c03;&#x7528;athr_nat_add_or_del_tuple&#x6dfb;&#x52a0;&#x786c;&#x4ef6;&#x6761;&#x76ee;"/>
</node>
</node>
</node>
<node CREATED="1303122173051" ID="ID_1237484818" MODIFIED="1308048018645">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#21542;&#21017;&#22914;&#26524;&#36830;&#25509;&#24050;&#24314;&#31435;(&#21363;original&#21644;reply&#26041;&#21521;&#19978;&#22343;&#24050;&#21457;&#36807;&#21253;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#32780;&#24403;&#21069;&#21253;&#20026;original&#26041;&#21521;&#20877;&#27425;&#21457;&#21253;, &#35265;skb-&gt;nfctinfo)
    </p>
  </body>
</html></richcontent>
<node CREATED="1304931884874" ID="ID_361792832" MODIFIED="1308048360679">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#35843;&#29992;athr_nat_add_or_del_tuple&#22312;&#30828;&#20214;&#20013;&#28155;&#21152;NAT&#26465;&#30446;
    </p>
    <p>
      &#160;&#160;&#160;&#160;(&#27492;&#22788;&#24773;&#20917;&#23545;&#24212;&#20110;tcp&#36830;&#25509;&#30340;&#31532;&#19977;&#27425;&#25569;&#25163;,&#27492;&#26102;&#36830;&#25509;&#21018;&#24314;&#31435;,&#22240;&#27492;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#38656;&#35201;&#22312;&#30828;&#20214;&#20013;&#24314;&#31435;egress nat entry&#21644;ingress nat entry)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1303122524017" ID="ID_549776704" MODIFIED="1304932422067">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#33509;&#21253;&#19981;&#26159;udp&#21253;&#19988;&#24050;&#22312;&#30828;&#20214;&#20013;&#20570;&#36807;dnat&#20102;&#21017;&#22312;ct-&gt;status&#19978;&#26631;&#35782;DNAT&#24050;&#20570;&#23436;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#33509;&#21253;&#19981;&#26159;ALG&#30340;&#21253;&#21017;&#35843;&#29992;athr_mangle_conntrack_dnat&#28155;&#21152;DNAT&#30828;&#20214;&#26465;&#30446;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1303122672440" ID="ID_1873334467" MODIFIED="1308128042305" TEXT="3, &#x5982;&#x679c;NAT&#x6761;&#x76ee;&#x5df2;&#x5199;&#x5165;&#x786c;&#x4ef6;&#xff0c;&#x4e14;&#x4e0d;&#x9700;&#x8981;&#x505a;DNAT&#x65f6;&#xff0c;&#x5219;&#x8bbe;&#x7f6e;&#xa;skb-&gt;ath_hw_nat_fw_flags = 2&#x8868;&#x793a;&#x8ba9;&#x786c;&#x4ef6;&#x505a;SNAT&#xa;(&#x5f53;&#x8bbe;&#x7f6e;skb-&gt;ath_hw_nat_fw_flags = 2&#x8ba9;&#x786c;&#x4ef6;&#x505a;SNAT&#x540e;,&#xa;&#x5305;&#x4f1a;&#x8df3;&#x8fc7;&#x8f6f;&#x4ef6;&#x4e2d;&#x7684;nat&#x6a21;&#x5757;. &#x6240;&#x4ee5;&#x82e5;&#x5305;&#x9700;&#x8981;&#x505a;DNAT&#x5219;&#x4e0d;&#x80fd;&#x5728;&#x6b64;&#xa;&#x8bbe;&#x7f6e;skb-&gt;ath_hw_nat_fw_flags, &#x5426;&#x5219;&#x5c06;&#x5bfc;&#x81f4;&#x8df3;&#x8fc7;&#x8f6f;&#x4ef6;&#x7684;DNAT)"/>
</node>
<node CREATED="1303122883103" ID="ID_463239019" MODIFIED="1303122895273" TEXT="3, &#x5426;&#x5219;">
<node CREATED="1303122906263" ID="ID_267405875" MODIFIED="1304929335960">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#22914;&#26524;&#26159;UDP&#21327;&#35758;
    </p>
  </body>
</html></richcontent>
<node CREATED="1303182224476" ID="ID_1355066999" MODIFIED="1308213648095">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#22914;&#26524;&#26410;&#22312;&#30828;&#20214;&#20013;&#20570;DNAT&#19988;NAT&#26465;&#30446;&#26410;&#20889;&#20837;&#30828;&#20214;&#21017;
    </p>
    <p>
      &#160;&#160;&#160;&#160;(&#27492;&#22788;&#24773;&#20917;&#23545;&#24212;&#20110;UDP&#36830;&#25509;&#30340;&#31532;&#20108;&#20010;&#21253;,&#26080;&#35770;&#26159;original
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#26041;&#21521;&#36824;&#26159;reply&#26041;&#21521;. &#30001;&#20110;&#31532;&#19968;&#20010;&#21253;&#24050;&#23558;nat&#20449;&#24687;&#24314;&#31435;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#36215;&#26469;, &#25152;&#20197;&#27492;&#22788;&#38656;&#35201;&#23558;nat&#21152;&#20837;&#21040;&#30828;&#20214;.&#33509;&#27492;&#21253;&#20026;original
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#26041;&#21521;&#21017;&#20165;&#21152;&#20837;egress nat entry,&#32780;&#33509;&#27492;&#21253;&#20026;reply
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#26041;&#21521;&#21017;&#21516;&#26102;&#21152;&#20837;egress nat entry&#21644;ingress nat entry)
    </p>
  </body>
</html></richcontent>
<node CREATED="1303182357211" ID="ID_1050009116" MODIFIED="1308127435581">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#33509;&#21452;&#21521;&#22343;&#24050;&#21457;&#36807;&#21253;,&#34920;&#26126;&#36830;&#25509;&#24050;&#24314;&#31435;,&#21017;&#22312;ct-&gt;status&#19978;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#35774;&#32622;IPS_ATHR_HW_NAT_IS_UDP_BIT&#26631;&#35782;.&#27492;&#26631;&#35782;&#34920;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#31034;&#27492;UDP&#36830;&#25509;&#19978;original&#21644;reply&#26041;&#21521;&#22343;&#24050;&#21457;&#36865;&#36807;&#21253;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1303182431586" ID="ID_1978971750" MODIFIED="1303184075698" TEXT="2, &#x8c03;&#x7528;athr_nat_add_or_del_tuple&#x5728;&#x786c;&#x4ef6;&#x4e2d;&#x6dfb;&#x52a0;NAT&#x6761;&#x76ee;">
<node CREATED="1303182967351" ID="ID_1514955441" MODIFIED="1304928886875">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#22914;&#26524;&#26159;egress&#26041;&#21521;&#19988;&#24050;&#22312;&#36719;&#20214;&#20013;&#20570;&#23436;snat&#21017;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#35843;&#29992;athr_mangle_conntrack_snat
    </p>
  </body>
</html></richcontent>
<node CREATED="1308129791620" ID="ID_210520373" MODIFIED="1308130325026" TEXT="1, &#x5982;&#x679c;&#x6dfb;&#x52a0;&#x4e86;ingress nat entry,&#x5219;&#x8fde;&#x63a5;&#x4e0a;&#x7684;&#x5305;&#x5728;&#x8fdb;&#x5165;&#x8f6f;&#x4ef6;&#x65f6;&#xa;    &#x5df2;&#x5728;&#x786c;&#x4ef6;&#x4e2d;&#x505a;&#x8fc7;&#x4e86;DNAT,&#x6b64;&#x65f6;&#x5305;&#x4e2d;&#x7684;&#x76ee;&#x7684;IP&#x548c;&#x76ee;&#x7684;port&#x5df2;&#x53d8;&#x5316;, &#xa;    &#x5728;&#x8f6f;&#x4ef6;&#x4e2d;&#x641c;&#x7d22;&#x6b64;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;&#x65f6;&#x5e94;&#x4f7f;&#x7528;DNAT&#x4e4b;&#x540e;&#x7684;&#x5730;&#x5740;&#x4fe1;&#x606f;.&#xa;    &#x6240;&#x4ee5;&#x9700;&#x8981;&#x4fee;&#x6539;&#x8fde;&#x63a5;reply&#x65b9;&#x5411;&#x7684;tuple&#x4ee5;&#x4fbf;&#x5728;ingress nat entry&#xa;    &#x52a0;&#x5165;&#x540e;&#x7528;&#x4fee;&#x6539;&#x540e;&#x7684;&#x5730;&#x5740;&#x4fe1;&#x606f;&#x641c;&#x7d22;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;.(corrupt_tuple)"/>
<node CREATED="1303183125430" ID="ID_944482559" MODIFIED="1308130497600">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, athr_modify_tb
    </p>
  </body>
</html></richcontent>
<node CREATED="1308130537406" ID="ID_167210976" MODIFIED="1308130546683" TEXT="1, &#x6dfb;&#x52a0;&#x6761;&#x76ee;">
<node CREATED="1308130627384" ID="ID_178095434" MODIFIED="1308131153145">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#28155;&#21152;egress nat entry, &#28155;&#21152;&#26465;&#20214;&#20026;&#19979;&#21015;&#24773;&#20917;&#20043;&#19968;:
    </p>
    <p>
      &#160;&#160;&#160;&#160;1.1 &#25351;&#23450;&#28155;&#21152;egress nat entry(&#21363;dir==NAT_EGRESS)
    </p>
    <p>
      &#160;&#160;&#160;&#160;1.2 &#21327;&#35758;&#20026;TCP&#25110;ICMP
    </p>
    <p>
      &#160;&#160;&#160;&#160;1.3 &#23545;&#20110;UDP&#32780;&#35328;, &#33509;&#21452;&#21521;&#22343;&#24050;&#21457;&#21253;(IPS_ATHR_HW_NAT_IS_UDP_BIT
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#22312;ct-&gt;status&#19978;&#32622;&#20301;),&#21017;&#22312;&#21152;&#20837;ingress nat entry&#30340;&#21516;&#26102;&#20063;&#24212;&#35813;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#21152;&#20837;egress nat entry.
    </p>
    <p>
      &#160;&#160;&#160;&#160;
    </p>
  </body>
</html></richcontent>
<node CREATED="1303183347933" ID="ID_1465475183" MODIFIED="1308131513939" TEXT="1, &#x5c06;egress nat entry&#x4fdd;&#x5b58;&#x5728;((struct nf_ct_hwnat *)ct-&gt;hwnat_priv)-&gt;tuple[0]&#x4e2d;"/>
<node CREATED="1308131570473" ID="ID_1661048963" MODIFIED="1308131667153" TEXT="2, &#x5982;&#x679c;&#x7ecf;&#x67e5;&#x627e;&#x786c;&#x4ef6;&#x540e;&#x786e;&#x8ba4;&#x6b64;&#x6761;&#x76ee;&#x8fd8;&#x672a;&#x6dfb;&#x52a0;&#x5219;&#x5c06;&#x5176;&#x6dfb;&#x52a0;&#x5230;&#x786c;&#x4ef6;&#x4e2d;(hw_nat_api-&gt;add_entry)"/>
</node>
<node CREATED="1308130627384" ID="ID_1496714026" MODIFIED="1308131315541">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#28155;&#21152;ingress nat entry, &#28155;&#21152;&#26465;&#20214;&#20026;&#19979;&#21015;&#24773;&#20917;&#20043;&#19968;:
    </p>
    <p>
      &#160;&#160;&#160;&#160;1.1 &#25351;&#23450;&#28155;&#21152;ingress nat entry(&#21363;dir==NAT_INGRESS)
    </p>
    <p>
      &#160;&#160;&#160;&#160;1.2 &#21327;&#35758;&#20026;TCP&#25110;ICMP
    </p>
    <p>
      &#160;&#160;&#160;&#160;1.3 &#23545;&#20110;UDP&#32780;&#35328;, &#33509;&#21452;&#21521;&#22343;&#24050;&#21457;&#21253;(IPS_ATHR_HW_NAT_IS_UDP_BIT
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#22312;ct-&gt;status&#19978;&#32622;&#20301;),&#21017;&#22312;&#21152;&#20837;egress nat entry&#30340;&#21516;&#26102;&#20063;&#24212;&#35813;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#21152;&#20837;ingress nat entry.
    </p>
    <p>
      &#160;&#160;&#160;&#160;
    </p>
  </body>
</html></richcontent>
<node CREATED="1303183347933" ID="ID_1261187125" MODIFIED="1308131641801" TEXT="1, &#x5c06;egress nat entry&#x4fdd;&#x5b58;&#x5728;((struct nf_ct_hwnat *)ct-&gt;hwnat_priv)-&gt;tuple[1]&#x4e2d;"/>
<node CREATED="1308131570473" ID="ID_884615017" MODIFIED="1308131667153" TEXT="2, &#x5982;&#x679c;&#x7ecf;&#x67e5;&#x627e;&#x786c;&#x4ef6;&#x540e;&#x786e;&#x8ba4;&#x6b64;&#x6761;&#x76ee;&#x8fd8;&#x672a;&#x6dfb;&#x52a0;&#x5219;&#x5c06;&#x5176;&#x6dfb;&#x52a0;&#x5230;&#x786c;&#x4ef6;&#x4e2d;(hw_nat_api-&gt;add_entry)"/>
</node>
<node CREATED="1303183402813" ID="ID_144166031" MODIFIED="1308131775781" TEXT="3, &#x82e5;&#x6210;&#x529f;&#x6dfb;&#x52a0;&#x786c;&#x4ef6;&#x6761;&#x76ee;&#x5219;&#x5728;ct-&gt;status&#x4e0a;&#x8bbe;&#x7f6e;IPS_ATHR_HW_NAT_ADDED_BIT&#x6807;&#x8bc6;"/>
</node>
<node CREATED="1308130547567" ID="ID_741040539" MODIFIED="1308130554257" TEXT="2, &#x5220;&#x9664;&#x6761;&#x76ee;"/>
</node>
</node>
<node CREATED="1303183005671" ID="ID_882449659" MODIFIED="1308130497600">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#22914;&#26524;&#26159;ingress&#26041;&#21521;&#19988;&#24050;&#22312;&#36719;&#20214;&#20013;&#20570;&#23436;dnat&#21017;
    </p>
    <p>
      &#35843;&#29992;athr_mangle_conntrack_dnat
    </p>
  </body>
</html></richcontent>
<node CREATED="1308129791620" ID="ID_429506142" MODIFIED="1308130325026" TEXT="1, &#x5982;&#x679c;&#x6dfb;&#x52a0;&#x4e86;ingress nat entry,&#x5219;&#x8fde;&#x63a5;&#x4e0a;&#x7684;&#x5305;&#x5728;&#x8fdb;&#x5165;&#x8f6f;&#x4ef6;&#x65f6;&#xa;    &#x5df2;&#x5728;&#x786c;&#x4ef6;&#x4e2d;&#x505a;&#x8fc7;&#x4e86;DNAT,&#x6b64;&#x65f6;&#x5305;&#x4e2d;&#x7684;&#x76ee;&#x7684;IP&#x548c;&#x76ee;&#x7684;port&#x5df2;&#x53d8;&#x5316;, &#xa;    &#x5728;&#x8f6f;&#x4ef6;&#x4e2d;&#x641c;&#x7d22;&#x6b64;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;&#x65f6;&#x5e94;&#x4f7f;&#x7528;DNAT&#x4e4b;&#x540e;&#x7684;&#x5730;&#x5740;&#x4fe1;&#x606f;.&#xa;    &#x6240;&#x4ee5;&#x9700;&#x8981;&#x4fee;&#x6539;&#x8fde;&#x63a5;reply&#x65b9;&#x5411;&#x7684;tuple&#x4ee5;&#x4fbf;&#x5728;ingress nat entry&#xa;    &#x52a0;&#x5165;&#x540e;&#x7528;&#x4fee;&#x6539;&#x540e;&#x7684;&#x5730;&#x5740;&#x4fe1;&#x606f;&#x641c;&#x7d22;&#x5305;&#x6240;&#x5c5e;&#x7684;&#x8fde;&#x63a5;.(corrupt_tuple)"/>
<node CREATED="1308132680751" ID="ID_65390442" LINK="#ID_944482559" MODIFIED="1308132763903" TEXT="2, athr_modify_tb"/>
</node>
</node>
<node CREATED="1303182498106" ID="ID_471144991" MODIFIED="1308128238068">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3, &#33509;&#36830;&#25509;&#23545;&#24212;nat&#26465;&#30446;&#24050;&#28155;&#21152;&#21040;&#30828;&#20214;,&#27492;&#21253;&#21448;&#19981;&#26159;wan&#21475;&#36827;&#26469;&#30340;&#21253;,&#21017;&#22312;&#19981;&#38656;&#35201;&#20570;
    </p>
    <p>
      &#160;&#160;&#160;&#160;DNAT&#26102;&#35774;&#32622;skb-&gt;ath_hw_nat_fw_flags = 2&#34920;&#31034;&#35753;&#30828;&#20214;&#20570;SNAT.
    </p>
    <p>
      &#160;&#160;&#160;&#160;(&#24403;&#35774;&#32622;skb-&gt;ath_hw_nat_fw_flags = 2&#35753;&#30828;&#20214;&#20570;SNAT&#21518;,&#21253;&#20250;&#36339;&#36807;&#36719;&#20214;&#20013;&#30340;
    </p>
    <p>
      &#160;&#160;&#160;&#160;nat&#27169;&#22359;. &#25152;&#20197;&#33509;&#21253;&#38656;&#35201;&#20570;DNAT&#21017;&#19981;&#33021;&#22312;&#27492;&#35774;&#32622;skb-&gt;ath_hw_nat_fw_flags,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#21542;&#21017;&#23558;&#23548;&#33268;&#36339;&#36807;&#36719;&#20214;&#30340;DNAT)
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1303182707009" ID="ID_1003607809" MODIFIED="1308133745215">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#22914;&#26524;&#24050;&#22312;&#30828;&#20214;&#20013;&#20570;&#20102;DNAT&#65292;&#21017;&#23558;ct-&gt;status&#32622;&#19978;
    </p>
    <p>
      &#160;&#160;&#160;&#160;IPS_ATHR_HW_NAT_ADDED_BIT.&#27492;&#22788;&#24773;&#20917;&#23545;&#24212;&#20110;
    </p>
    <p>
      &#160;&#160;&#160;&#160;udp&#36830;&#25509;&#24314;&#31435;&#21518;reply&#26041;&#21521;&#30340;&#21253;.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1303182707009" ID="ID_665161742" MODIFIED="1308133787628">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, &#22914;&#26524;&#24050;&#22312;&#30828;&#20214;&#20013;&#20570;&#20102;DNAT&#65292;&#21017;&#23558;ct-&gt;status&#32622;&#19978;
    </p>
    <p>
      &#160;&#160;&#160;&#160;IPS_ATHR_HW_NAT_ADDED_BIT.&#27492;&#22788;&#24773;&#20917;&#23545;&#24212;&#20110;
    </p>
    <p>
      &#160;&#160;&#160;&#160;tcp&#36830;&#25509;&#24314;&#31435;&#21518;reply&#26041;&#21521;&#30340;&#21253;.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1303121202464" ID="ID_1683530616" MODIFIED="1303121242334" TEXT="2, &#x5982;&#x679c;skb==null&#x4e14;ctinfo==0&#x5219;&#x8c03;&#x7528;athr_nf_nat_delete_tuple">
<node CREATED="1308213447869" ID="ID_1388812763" LINK="#ID_1978971750" MODIFIED="1308213679448" TEXT="1, athr_nat_add_or_del_tuple"/>
<node CREATED="1308213468528" ID="ID_310804657" MODIFIED="1308213489530" TEXT="2, &#x91ca;&#x653e;ct-&gt;hwnat_priv&#x6240;&#x4fdd;&#x5b58;&#x7684;&#x79c1;&#x6709;&#x6761;&#x76ee;"/>
</node>
</node>
</node>
<node CREATED="1304919399907" ID="ID_1550013666" MODIFIED="1308043401292">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2, enable nat in ingress and egress
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#22312;&#30828;&#20214;&#20013;&#24320;&#21551;nat&#21151;&#33021;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1304919664283" ID="ID_148705314" MODIFIED="1308043533060">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3, set router mac address
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#22312;&#30828;&#20214;&#20013;&#35774;&#32622;GMAC0&#30340;mac&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1304919710794" ID="ID_923742208" MODIFIED="1304919722839" TEXT="4, create hash table: hwnat_mod_hash"/>
<node CREATED="1304919739229" ID="ID_440783631" MODIFIED="1304919753364" TEXT="5, create entry cache: nf_hwnat_cachep"/>
<node CREATED="1304919902583" FOLDED="true" ID="ID_470718691" MODIFIED="1308043638246" TEXT="6, athr_nat_proc_init">
<node CREATED="1304919970819" ID="ID_1273347850" MODIFIED="1308043632647" TEXT="1, /proc/net/nf_nat">
<node CREATED="1304920353348" ID="ID_1314094813" MODIFIED="1304920496677">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      nf_nat_seq_show
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1304919992471" FOLDED="true" ID="ID_1638761107" MODIFIED="1304920499698" TEXT="2, /proc/net/hw_nat">
<node CREATED="1304920464336" ID="ID_1463946292" MODIFIED="1304920467118" TEXT="hw_nat_seq_show"/>
</node>
</node>
</node>
<node CREATED="1304922950832" ID="ID_846337404" MODIFIED="1304922953382" TEXT="athr_acl_init"/>
</node>
</node>
</node>
</node>
<node CREATED="1304925351992" FOLDED="true" ID="ID_1498721877" MODIFIED="1308042344243">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22788;&#29702;ingress&#30340;&#21253;:athr_nat_process_ingress_pkts
    </p>
    <p>
      &#20027;&#35201;&#26159;&#26356;&#26032;skb-&gt;ath_hw_nat_fw_flags,&#20043;&#21518;&#23558;&#21253;&#20132;&#32473;
    </p>
    <p>
      netif_receive_skb(skb)&#20256;&#36882;&#21040;&#21327;&#35758;&#26632;&#19978;&#23618;
    </p>
  </body>
</html></richcontent>
<node CREATED="1304925467963" ID="ID_199200420" MODIFIED="1304925524387">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#33509;&#20026;lan&#20391;&#36827;&#26469;&#30340;&#21253;&#21017;
    </p>
    <p>
      skb-&gt;ath_hw_nat_fw_flags = 1
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1304925547780" ID="ID_1913619113" MODIFIED="1304925587952">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      2,&#33509;&#20026;wan&#20391;&#36827;&#26469;&#30340;&#38750;IPV4&#30340;&#21253;&#21017;
    </p>
    <p>
      skb-&gt;ath_hw_nat_fw_flags = 0
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1304925693713" ID="ID_611017036" MODIFIED="1304925756281">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3,&#33509;&#20026;wan&#20391;&#36827;&#26469;&#30340;IP&#21253;&#19988;&#24050;&#30001;&#30828;&#20214;&#20570;&#36807;dnat&#21017;
    </p>
    <p>
      skb-&gt;ath_hw_nat_fw_flags = 3
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1304925783073" ID="ID_1725562152" MODIFIED="1304925841153">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      4,&#33509;&#20026;wan&#20391;&#36827;&#26469;&#30340;IP&#21253;&#20294;&#26410;&#30001;&#30828;&#20214;&#20570;&#36807;dnat&#21017;
    </p>
    <p>
      skb-&gt;ath_hw_nat_fw_flags = 100
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1422302311966" FOLDED="true" ID="ID_1400990266" MODIFIED="1439942602213" POSITION="left" TEXT="ebtables">
<node CREATED="1422302349713" FOLDED="true" ID="ID_68551441" MODIFIED="1423034505445" TEXT="&#x57fa;&#x672c;&#x6846;&#x67b6;">
<node CREATED="1422302367217" ID="ID_254305711" MODIFIED="1422303162724">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/ebtables_iptables.jpeg" />
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1422346966439" FOLDED="true" ID="ID_32085811" MODIFIED="1439942598974" TEXT="prerouting&#x9636;&#x6bb5;">
<node CREATED="1422346980962" ID="ID_1958853861" MODIFIED="1422346988830">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bridge_prerouting_1.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1422346992180" ID="ID_1406172651" MODIFIED="1422346998602">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bridge_prerouting_2.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1422347055255" ID="ID_1750826040" MODIFIED="1422347123446" TEXT="ebtables&#x7684;prerouting&#x9636;&#x6bb5;&#x4ece;br_handle_frame()&#x51fd;&#x6570;&#x5f00;&#x59cb;&#xff0c;&#x5230;br_handle_frame_finish()&#x51fd;&#x6570;&#x7ed3;&#x675f;"/>
<node CREATED="1422347458466" ID="ID_67986296" MODIFIED="1422347472240">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bridge_prerouting_3.png" />
  </body>
</html></richcontent>
<node CREATED="1422347477785" ID="ID_307181409" MODIFIED="1422347568785" TEXT="&#x5373;&#x5728;&#x8c03;&#x7528;iptables&#x4e4b;&#x524d;&#x548c;&#x4e4b;&#x540e;&#x90fd;&#x4f1a;&#x8c03;&#x7528;ebtables, &#x56e0;&#x800c;ebtables&#x53ef;&#x4ee5;&#x6539;&#x53d8;iptables&#x7684;&#x51b3;&#x5b9a;"/>
<node CREATED="1422594768496" ID="ID_1446072119" MODIFIED="1422595131967">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27880;&#24847;&#22312;iptables&#20043;&#21069;&#29992;&#30340;&#26159;NF_HOOK()&#36825;&#31561;&#21516;&#20110;NF_HOOK_THRESH(INT_MIN), &#36825;&#23454;&#38469;&#19978;&#34920;&#31034;&#25152;&#26377;&#30340;hook&#20989;&#25968;&#37117;&#20250;&#34987;&#25191;&#34892;
    </p>
    <p>
      
    </p>
    <p>
      &#32780;iptables&#20043;&#21518;&#29992;&#30340;&#26159;NF_HOOK_THRESH(1)&#65292;&#36825;&#34920;&#31034;&#21482;&#26377;priority&#20540;&#22823;&#20110;1&#30340;hook&#20989;&#25968;&#25165;&#20250;&#34987;&#25191;&#34892;&#65292;&#32780;&#22312;&#30446;&#21069;&#30340;&#20195;&#30721;&#20013;prerouting hook&#28857;&#27809;&#26377;priority&#20540;&#22823;&#20110;1&#30340;hook&#20989;&#25968;&#65292;&#25152;&#20197;&#30456;&#24403;&#20110;&#36825;&#37324;&#19981;&#25191;&#34892;&#20219;&#20309;hook&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1422595733975" ID="ID_1969006446" MODIFIED="1422596029634">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      br-&gt;nf_call_iptables&#21442;&#25968;&#20915;&#23450;&#20102;&#26159;&#21542;&#22312;ebtables&#20013;&#35843;&#29992;iptables
    </p>
    <p>
      
    </p>
    <p>
      &#22914;&#26524;&#27492;&#21442;&#25968;&#20026;1&#65292;&#21017;&#22312;&#20989;&#25968;br_nf_pre_routing()&#20250;&#20998;&#37197;skb-&gt;nf_bridge&#32467;&#26500;
    </p>
    <p>
      &#22914;&#26524;&#27492;&#21442;&#25968;&#20026;0&#65292;&#21017;&#20989;&#25968;br_nf_pre_routing()&#20250;&#31435;&#21363;&#36864;&#20986;&#32780;skb-&gt;nf_bridge&#20026;&#31354;&#65292;&#24403;&#22312;ebtables&#21518;&#32493;&#20854;&#23427;hook&#28857;&#20013;&#26816;&#26597;&#21040;skb-&gt;nf_bridge&#20026;&#31354;&#19981;&#20877;&#35843;&#29992;iptables
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1422596136214" FOLDED="true" ID="ID_1818083618" MODIFIED="1422601336382">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;iptables&#20043;&#21069;&#38656;&#35201;&#20570;&#30340;&#20934;&#22791;&#24037;&#20316;
    </p>
    <p>
      br_nf_pre_routing()
    </p>
  </body>
</html></richcontent>
<node CREATED="1422596159983" ID="ID_1614646366" MODIFIED="1422596199347" TEXT="skb-&gt;data&#x6307;&#x5411;network&#x5934;&#x90e8;">
<node CREATED="1422596224080" ID="ID_795414952" MODIFIED="1422596266370" TEXT="&#x6ce8;&#x610f;&#x5305;&#x8fdb;&#x5165;bridge&#x6a21;&#x5757;&#x65f6;skb-&gt;data&#x5df2;&#x7ecf;&#x8df3;&#x8fc7;&#x4e86;mac&#x5934;&#x90e8;"/>
<node CREATED="1422596267204" ID="ID_332398265" MODIFIED="1422596296408" TEXT="&#x6240;&#x4ee5;&#x8fd9;&#x91cc;&#x8981;&#x505a;&#x7684;&#x662f;&#x8df3;&#x8fc7;&#x4e00;&#x4e9b;&#x5c01;&#x88c5;&#x5934;&#x90e8;&#x5982;vlan, pppoe"/>
</node>
<node CREATED="1422596428664" ID="ID_441924606" MODIFIED="1422597110584">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      L3&#23618;&#21482;&#20250;&#22788;&#29702;&#21457;&#32473;&#33258;&#24049;&#30340;&#21253;(skb-&gt;pkt_type == PACKET_HOST)
    </p>
    <p>
      &#22240;&#27492;&#23545;&#20110;&#30446;&#30340;mac&#22320;&#22336;&#19981;&#26159;&#33258;&#24049;&#30340;&#21253;(skb-&gt;pkt_type == PACKET_OTHERHOST)&#38656;&#35201;&#22312;skb-&gt;nf_bridge-&gt;mask&#19978; &#20570;&#20010;&#26631;&#35760;(BRNF_PKT_TYPE)&#65292;&#20877;&#23558;skb-&gt;pkt_type&#35774;&#20026;PACKET_HOST&#65292;&#36825;&#26679;iptables&#35843;&#29992;&#23436;&#21518;&#23601;&#21487;&#20197;&#26681;&#25454;skb-&gt;nf_bridge-&gt;mask&#19978;&#30340;&#26631;&#35760;BRNF_PKT_TYPE&#23558;skb-&gt;pkt_type&#24674;&#22797;&#20026;PACKET_OTHERHOST
    </p>
  </body>
</html></richcontent>
<node CREATED="1422597458592" ID="ID_599537068" MODIFIED="1422597583822" TEXT="&#x505a;&#x6807;&#x8bb0;&#x7684;&#x52a8;&#x4f5c;&#x662f;&#x5728;setup_pre_routing()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
<node CREATED="1422597501229" ID="ID_841188203" MODIFIED="1422597527760" TEXT="&#x6839;&#x636e;&#x6807;&#x8bb0;&#x6062;&#x590d;&#x7684;&#x52a8;&#x4f5c;&#x662f;&#x5728;br_nf_pre_routing_finish()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
</node>
<node CREATED="1422599877944" ID="ID_1265330513" MODIFIED="1422600475879">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      L3&#23618;&#21482;&#20250;&#22788;&#29702;L3 interface&#36827;&#20837;&#30340;&#21253;&#65292;&#22240;&#27492;&#38656;&#35201;&#25226;skb-&gt;dev&#35774;&#32622;&#20026;bridge&#23545;&#24212;&#30340;network device
    </p>
    <p>
      &#20294;L2 bridge&#21482;&#22788;&#29702;bridge port&#36827;&#20837;&#30340;&#21253;&#65292;&#22240;&#27492;&#22312;&#36827;&#20837;L3&#20043;&#21069;&#38656;&#35201;&#25226;&#30495;&#27491;&#30340;&#20837;&#21475;bridge port&#20445;&#23384;&#22312;skb-&gt;nf_bridge-&gt;physindev&#20013;&#65292;&#20197;&#20415;&#36208;&#23436;iptables&#30340;prerouting hook&#28857;&#21518;&#24674;&#22797;&#30495;&#27491;&#20837;&#21475;&#65292;&#20877;&#32487;&#32493;bridge&#30340;&#22788;&#29702;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422600184374" ID="ID_1533458380" MODIFIED="1422600231296" TEXT="&#x5c06;skb-&gt;dev&#x5207;&#x6362;&#x4e3a;bridge&#x7684;&#x64cd;&#x4f5c;&#x662f;&#x5728;setup_pre_routing()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
<node CREATED="1422600184374" ID="ID_717919760" MODIFIED="1422600331474" TEXT="&#x5c06;skb-&gt;dev&#x5207;&#x6362;&#x4e3a;&#x4e4b;&#x524d;&#x4fdd;&#x5b58;&#x7684;bridge port&#x7684;&#x64cd;&#x4f5c;&#x662f;&#x5728;br_nf_pre_routing_finish()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
</node>
<node CREATED="1422600543204" ID="ID_1356206404" MODIFIED="1422600828966">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      L3&#23618;&#21482;&#22788;&#29702;IP&#21253;&#65292;&#22240;&#27492;&#38656;&#35201;&#23558;skb-&gt;protocol&#35774;&#32622;&#20026;ETH_P_IP
    </p>
    <p>
      &#20026;&#20102;&#19981;&#20002;&#22833;L2&#22836;&#37096;&#20449;&#24687;&#65292;&#38656;&#35201;&#22312;skb-&gt;nf_bridge-&gt;mask&#20013;&#26631;&#35760;IP&#22836;&#37096;&#30340;&#21069;&#38754;&#26159;&#20160;&#20040;&#26679;&#30340;&#23553;&#35013;&#22836;&#37096;(vlan&#25110;&#32773;pppoe)
    </p>
    <p>
      &#22312;&#36208;&#23436;iptables&#30340;prerouting hook&#28857;&#21518;&#23558;skb-&gt;protocol&#24674;&#22797;&#20026;&#30495;&#27491;&#30340;L2&#22836;&#37096;&#23553;&#35013;&#21327;&#35758;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422600184374" ID="ID_264303751" MODIFIED="1422600900391" TEXT="&#x5c06;skb-&gt;protocol&#x5207;&#x6362;&#x4e3a;ETH_P_IP&#x7684;&#x64cd;&#x4f5c;&#x662f;&#x5728;setup_pre_routing()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
<node CREATED="1422600184374" ID="ID_584906490" MODIFIED="1422600947117" TEXT="&#x5c06;skb-&gt;protocol&#x5207;&#x6362;&#x4e3a;&#x4e4b;&#x524d;&#x4fdd;&#x5b58;&#x7684;&#x771f;&#x6b63;&#x7684;L2&#x5934;&#x90e8;&#x5c01;&#x88c5;&#x7684;&#x64cd;&#x4f5c;&#x662f;&#x5728;br_nf_pre_routing_finish()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
</node>
<node CREATED="1422601006653" ID="ID_1837381470" MODIFIED="1422601184850">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22240;&#20026;&#22312;iptables&#30340;prerouting hook&#28857;&#21487;&#33021;&#20250;&#21457;&#29983;DNAT,&#21363;&#30446;&#30340;IP&#34987;&#20462;&#25913;&#65292;&#36825;&#26102;&#38656;&#35201;&#21516;&#26102;&#20462;&#25913;&#21253;&#30340;&#30446;&#30340;mac&#22320;&#22336;
    </p>
    <p>
      &#20026;&#20102;&#26816;&#27979;&#26159;&#21542;&#21457;&#29983;&#20102;DNAT&#65292;&#38656;&#35201;&#20445;&#23384;&#20043;&#21069;&#30340;&#30446;&#30340;IP&#22320;&#22336;&#65292;&#22312;&#36208;&#23436;iptables&#30340;prerouting hook&#28857;&#21518;&#27604;&#36739;&#21253;&#20013;&#30340;
    </p>
    <p>
      &#30446;&#30340;IP&#22320;&#22336;&#21644;&#20043;&#21069;&#20445;&#23384;&#30340;&#30446;&#30340;IP&#22320;&#22336;&#65292;&#23601;&#21487;&#20197;&#30693;&#36947;&#26159;&#21542;&#21457;&#29983;&#20102;DNAT&#65292;&#20063;&#23601;&#30693;&#36947;&#26159;&#21542;&#38656;&#35201;&#20462;&#25913;&#30446;&#30340;MAC&#22320;&#22336;&#20102;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422601202754" ID="ID_1567068939" MODIFIED="1422601242333" TEXT="&#x4fdd;&#x5b58;&#x76ee;&#x7684;IP&#x5730;&#x5740;&#x662f;&#x5728;br_nf_pre_routing()&#x51fd;&#x6570;&#x4e2d;&#x8c03;&#x7528;store_orig_dstaddr()&#x5b8c;&#x6210;&#x7684;"/>
<node CREATED="1422601262741" ID="ID_294142599" MODIFIED="1422601290422" TEXT="&#x68c0;&#x6d4b;&#x662f;&#x5426;&#x53d1;&#x751f;DNAT&#x662f;&#x5728;br_nf_pre_routing_finish()&#x51fd;&#x6570;&#x4e2d;&#x5b8c;&#x6210;&#x7684;"/>
</node>
</node>
<node CREATED="1422598928945" FOLDED="true" ID="ID_941770191" MODIFIED="1422600162243" TEXT="&#x5982;&#x4f55;&#x907f;&#x514d;&#x5305;&#x91cd;&#x590d;&#x8fdb;&#x5165;iptables&#x7684;prerouting hook&#x70b9;">
<node CREATED="1422598993467" ID="ID_1495303573" MODIFIED="1422599378006">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21253;&#24050;&#32463;&#22312;ebtables&#35843;&#29992;iptables&#30340;&#36807;&#31243;&#20013;&#36208;&#36807;&#19968;&#36941;iptables&#30340;prerouting hook&#28857;&#20102;
    </p>
    <p>
      &#22914;&#26524;&#20043;&#21518;&#21253;&#36824;&#26159;&#20915;&#23450;&#21457;&#24448;&#26412;&#26426;&#65292;&#21017;&#21253;&#36824;&#20250;&#36827;&#20837;iptables&#30340;prerouting hook&#28857;&#65292;&#20026;&#20102;&#36991;&#20813;&#37325;&#22797;&#36827;&#20837;
    </p>
    <p>
      
    </p>
    <p>
      &#21253;&#31532;&#19968;&#27425;&#36827;&#20837;iptables&#30340;prerouting hook&#28857;&#20043;&#21069;&#20250;&#22312;skb-&gt;nf_bridge-&gt;mask&#19978;&#20570;&#19978;&#26631;&#35760;BRNF_NF_BRIDGE_PREROUTING&#65292;&#36825;&#26679;&#22312;&#31532;&#19968;&#27425;&#32463;&#36807;iptables&#30340;prerouting hook&#26102;&#33021;&#30475;&#21040;&#36825;&#20010;&#26631;&#35760;
    </p>
    <p>
      
    </p>
    <p>
      &#21253;&#31532;&#19968;&#27425;&#36208;&#23436;iptables&#30340;prerouting hook&#28857;&#20043;&#21518;&#20250;&#28165;&#38500;skb-&gt;nf_bridge-&gt;mask&#19978;&#30340;&#26631;&#35760;BRNF_NF_BRIDGE_PREROUTING&#65292;&#36825;&#26679;&#22312;&#31532;&#20108;&#27425;&#32463;&#36807;iptables&#30340;prerouting hook&#26102;&#23601;&#30475;&#19981;&#21040;&#36825;&#20010;&#26631;&#35760;&#20102;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422597458592" ID="ID_999623796" MODIFIED="1422597583822" TEXT="&#x505a;&#x6807;&#x8bb0;&#x7684;&#x52a8;&#x4f5c;&#x662f;&#x5728;setup_pre_routing()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
<node CREATED="1422597501229" ID="ID_935888573" MODIFIED="1422599498541" TEXT="&#x6e05;&#x9664;&#x6807;&#x8bb0;&#x7684;&#x52a8;&#x4f5c;&#x662f;&#x5728;br_nf_pre_routing_finish()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
<node CREATED="1422599548867" ID="ID_1372832231" MODIFIED="1422599758211">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      bridge&#22312;iptables&#30340;prerouting hook&#28857;&#27880;&#20876;&#20102;&#19968;&#20010;hook&#20989;&#25968;ip_sabotage_in()
    </p>
    <p>
      &#36825;&#20010;&#20989;&#25968;&#20250;&#26597;&#30475;skb-&gt;nf_bridge&#21644;&#20043;&#19978;&#30340;&#26631;&#35760;BRNF_NF_BRIDGE_PREROUTING&#65306;
    </p>
    <p>
      
    </p>
    <p>
      skb-&gt;nf_bridge&#19981;&#20026;&#31354;&#19988;&#26377;BRNF_NF_BRIDGE_PREROUTING&#26631;&#35760;&#34920;&#31034;&#26159;&#31532;&#19968;&#27425;&#32463;&#36807;&#65292;&#22240;&#27492;&#19981;&#36339;&#36807;iptables&#30340;prerouting hook&#28857;
    </p>
    <p>
      
    </p>
    <p>
      skb-&gt;nf_bridge&#19981;&#20026;&#31354;&#19988;&#27809;&#26377;BRNF_NF_BRIDGE_PREROUTING&#26631;&#35760;&#34920;&#31034;&#19981;&#26159;&#31532;&#19968;&#27425;&#32463;&#36807;&#65292;&#22240;&#27492;&#36339;&#36807;iptables&#30340;prerouting hook&#28857;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422599778546" ID="ID_1567417691" MODIFIED="1422599802555">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ip_sabotage_in&#65288;&#65289;
    </p>
    <p>
      {
    </p>
    <p>
      if (skb-&gt;nf_bridge &amp;&amp;
    </p>
    <p>
      &#160;&#160;&#160;&#160;!(skb-&gt;nf_bridge-&gt;mask &amp; BRNF_NF_BRIDGE_PREROUTING)) {
    </p>
    <p>
      return NF_STOP;
    </p>
    <p>
      }
    </p>
    <p>
      
    </p>
    <p>
      return NF_ACCEPT;
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1422601339341" FOLDED="true" ID="ID_817616944" MODIFIED="1422603671810" TEXT="&#x5982;&#x4f55;&#x786e;&#x5b9a;&#x6b63;&#x786e;&#x7684;&#x76ee;&#x7684;MAC&#x5730;&#x5740;">
<node CREATED="1422601597919" ID="ID_521450047" MODIFIED="1422601645420" TEXT="&#x5982;&#x679c;&#x76ee;&#x7684;IP&#x6ca1;&#x6709;&#x53d8;&#x5316;&#xff0c;&#x5219;&#x65e0;&#x9700;&#x91cd;&#x65b0;&#x9009;&#x62e9;&#x76ee;&#x7684;MAC&#x5730;&#x5740;&#xff0c;&#x76f4;&#x63a5;&#x4f7f;&#x7528;&#x5305;&#x4e2d;&#x7684;&#x76ee;&#x7684;MAC&#x5730;&#x5740;"/>
<node CREATED="1422601666613" ID="ID_1330476689" MODIFIED="1422601719824" TEXT="&#x5982;&#x679c;&#x76ee;&#x7684;IP&#x53d8;&#x5316;&#x4e86;&#x5219;&#x9700;&#x8981;&#x91cd;&#x65b0;&#x8fdb;&#x884c;&#x8def;&#x7531;&#x9009;&#x62e9;&#xff0c;&#x6839;&#x636e;&#x8def;&#x7531;&#x4e4b;&#x540e;&#x7684;&#x51fa;&#x63a5;&#x53e3;&#x9009;&#x62e9;&#x76ee;&#x7684;MAC&#x5730;&#x5740;">
<node CREATED="1422601730405" ID="ID_906522076" MODIFIED="1422601956530" TEXT="&#x5982;&#x679c;&#x8def;&#x7531;&#x4e4b;&#x540e;&#x51fa;&#x63a5;&#x53e3;&#x4e0d;&#x518d;&#x662f;&#x5165;&#x53e3;bridge, &#x5219;&#x5305;&#x4e0d;&#x80fd;&#x7ee7;&#x7eed;bridge&#x5904;&#x7406;&#xff0c;&#x9700;&#x8981;&#x5c06;&#x5176;&#x6295;&#x9012;&#x5230;L3&#x5c42;&#xff0c;&#x518d;&#x7ecf;&#x8fc7;&#x8def;&#x7531;&#x8f6c;&#x5230;&#x53e6;&#x5916;&#x7684;&#x51fa;&#x63a5;&#x53e3;&#xff0c;&#x8fd9;&#x65f6;&#x9700;&#x8981;&#x5c06;&#x5305;&#x7684;&#x76ee;&#x7684;MAC&#x5730;&#x5740;&#x4fee;&#x6539;&#x4e3a;&#x5165;&#x53e3;bridge&#x7684;MAC&#xff0c;&#x8868;&#x793a;&#x5305;&#x662f;&#x53d1;&#x7ed9;&#x672c;&#x673a;&#x7684;&#xff0c;&#x4e4b;&#x540e;&#x5c31;&#x4f1a;&#x6295;&#x9012;&#x5230;L3&#x5c42;"/>
<node CREATED="1422602018379" ID="ID_449762857" MODIFIED="1422602213106" TEXT="&#x5982;&#x679c;&#x8def;&#x7531;&#x4e4b;&#x540e;&#x51fa;&#x63a5;&#x53e3;&#x8fd8;&#x662f;&#x5165;&#x53e3;bridge&#xff0c;&#x8868;&#x793a;&#x5305;&#x8fd8;&#x662f;&#x9700;&#x8981;bridge&#xff0c;&#x8fd9;&#x65f6;&#x76ee;&#x7684;MAC&#x5730;&#x5740;&#x5e94;&#x8bbe;&#x7f6e;&#x4e3a;&#x8def;&#x7531;&#x4e0b;&#x4e00;&#x8df3;&#x7684;MAC&#x5730;&#x5740;&#xff0c;&#x4e5f;&#x5c31;&#x662f;skb-&gt;dst-&gt;neighbour&#x7684;&#x5730;&#x5740;">
<node CREATED="1422602239964" ID="ID_1327181172" MODIFIED="1422602317667" TEXT="&#x5982;&#x679c;&#x6b64;&#x65f6;skb-&gt;dst-&gt;neighbour&#x90bb;&#x5c45;&#x7684;MAC&#x5730;&#x5740;&#x5df2;&#x7ecf;&#x7ecf;&#x8fc7;ARP&#x89e3;&#x6790;&#x5b8c;&#x6210;&#xff0c;&#x5219;&#x5c06;&#x5176;&#x62f7;&#x8d1d;&#x5230;&#x5305;&#x7684;&#x76ee;&#x7684;MAC&#x5730;&#x5740;&#x4e2d;"/>
<node CREATED="1422602239964" ID="ID_1651935624" MODIFIED="1422602486370" TEXT="&#x5982;&#x679c;&#x6b64;&#x65f6;skb-&gt;dst-&gt;neighbour&#x90bb;&#x5c45;&#x7684;MAC&#x5730;&#x5740;&#x8fd8;&#x672a;&#x7ecf;&#x8fc7;ARP&#x89e3;&#x6790;&#x5b8c;&#x6210;&#xff0c;&#x5219;&#x9700;&#x7ecf;&#x8fc7;&#x90bb;&#x5c45;&#x5b50;&#x7cfb;&#x7edf;&#x89e3;&#x6790;&#x4e0b;&#x4e00;&#x8df3;&#x7684;&#x76ee;&#x7684;MAC&#x5730;&#x5740;&#xff0c;&#x4e5f;&#x5c31;&#x662f;&#x8c03;&#x7528;skb-&gt;dst-&gt;neigh-&gt;output(neigh, skb).">
<node CREATED="1422602502009" ID="ID_816079610" MODIFIED="1422602782004">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#37051;&#23621;&#23376;&#31995;&#32479;&#20250;&#37325;&#20889;L2&#22836;&#37096;&#65292;&#36825;&#21253;&#25324;&#30446;&#30340;MAC&#21644;&#28304;MAC
    </p>
    <p>
      &#28304;MAC&#20250;&#20889;&#20026;&#20986;&#25509;&#21475;&#30340;MAC&#22320;&#22336;&#65292;&#20063;&#23601;&#26159;&#20986;&#21475;bridge(&#21516;&#26102;&#20063;&#26159;&#20837;&#21475;bridge)&#30340;MAC&#22320;&#22336;
    </p>
    <p>
      &#22240;&#20026;&#36825;&#37324;&#36824;&#26159;bridge&#65292;&#32780;bridge&#30340;&#26102;&#20505;&#28304;MAC&#22320;&#22336;&#19981;&#24212;&#35813;&#25913;&#21464;&#65292;&#25152;&#20197;&#22312;&#36890;&#36807;&#37051;&#23621;&#23376;&#31995;&#32479;&#35299;&#26512;&#30446;&#30340;MAC&#20043;&#21069;&#20808;&#20445;&#23384;&#28304;MAC&#65292;&#35299;&#26512;&#23436;&#25104;&#21518;&#20877;&#24674;&#22797;&#28304;MAC
    </p>
  </body>
</html></richcontent>
<node CREATED="1422602831353" ID="ID_1974029885" MODIFIED="1422602849753" TEXT="&#x4fdd;&#x5b58;&#x6e90;MAC&#x662f;&#x5728;br_nf_pre_routing_finish_bridge()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
<node CREATED="1422602920907" ID="ID_1227100785" MODIFIED="1422602941025" TEXT="&#x6062;&#x590d;&#x6e90;MAC&#x5730;&#x5740;&#x662f;&#x5728;br_nf_pre_routing_finish_bridge_slow()&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x7684;"/>
</node>
<node CREATED="1422603022728" ID="ID_649604120" MODIFIED="1422603066878" TEXT="&#x5982;&#x4f55;&#x5c06;&#x5305;&#x5728;&#x89e3;&#x6790;&#x76ee;&#x7684;MAC&#x5b8c;&#x6210;&#x540e;&#x91cd;&#x65b0;&#x6536;&#x56de;&#x6765;&#x7ee7;&#x7eed;&#x5904;&#x7406;">
<node CREATED="1422603072134" ID="ID_908348943" MODIFIED="1422603134127" TEXT="&#x8c03;&#x7528;&#x90bb;&#x5c45;&#x7cfb;&#x7edf;&#x89e3;&#x6790;&#x76ee;&#x7684;MAC&#x4e4b;&#x524d;&#x5728;skb-&gt;nf_bridge-&gt;mask&#x4e0a;&#x8bbe;&#x7f6e;&#x6807;&#x8bb0;BRNF_BRIDGED_DNAT"/>
<node CREATED="1422603160148" ID="ID_949442717" MODIFIED="1422603254227" TEXT="&#x5728;bridge&#x7684;&#x53d1;&#x5305;&#x51fd;&#x6570;br_dev_xmit()&#x4e2d;&#x68c0;&#x6d4b;skb-&gt;nf_bridge-&gt;mask&#x4e0a;&#x662f;&#x5426;&#x6709;&#x6807;&#x8bb0;BRNF_BRIDGED_DNAT&#xff0c;&#x82e5;&#x6709;&#x5219;&#x8c03;&#x7528;br_nf_pre_routing_finish_bridge_slow()&#x8f6c;&#x56de;&#x6765;&#x7ee7;&#x7eed;&#x5904;&#x7406;">
<node CREATED="1422603262937" ID="ID_270377022" MODIFIED="1422603271446" TEXT="br_nf_pre_routing_finish_bridge_slow()">
<node CREATED="1422603281022" ID="ID_1449230240" MODIFIED="1422603284133" TEXT="br_handle_frame_finish()"/>
</node>
</node>
</node>
<node CREATED="1422603450411" ID="ID_1931386802" MODIFIED="1422603528766" TEXT="&#x6ce8;&#x610f;&#x90bb;&#x5c45;&#x5b50;&#x7cfb;&#x7edf;&#x662f;L2.5&#x5c42;&#xff0c;&#x6240;&#x4ee5;&#x8fdb;&#x5165;&#x4e4b;&#x524d;&#x8fd8;&#x662f;&#x8981;&#x5c06;skb-&gt;dev&#x5207;&#x6362;&#x4e3a;&#x51fa;&#x53e3;bridge&#xff0c;&#x800c;&#x5728;&#x89e3;&#x6790;&#x5b8c;&#x6210;&#x540e;&#x6062;&#x590d;&#x4e3a;&#x5165;&#x53e3;bridge port">
<node CREATED="1422603538546" ID="ID_1273807653" MODIFIED="1422603612883">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36827;&#20837;&#20043;&#21069;&#30340;&#20999;&#25442;&#21457;&#29983;&#22312;br_nf_pre_routing_finish_bridge()&#20989;&#25968;&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1422603623716" ID="ID_1195290662" MODIFIED="1422603640935" TEXT="&#x89e3;&#x6790;&#x4e4b;&#x540e;&#x7684;&#x5207;&#x6362;&#x53d1;&#x751f;&#x5728;br_nf_pre_routing_finish_bridge_slow()&#x51fd;&#x6570;&#x4e2d;"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1423032534626" ID="ID_508385345" MODIFIED="1423033645918" TEXT="&#x4e3a;&#x4ec0;&#x4e48;&#x9700;&#x8981;fake route">
<node CREATED="1423033655791" ID="ID_818167069" MODIFIED="1423033758487" TEXT="&#x5728;&#x6b63;&#x5e38;&#x7684;netfilter&#x6d41;&#x7a0b;&#x4e2d;&#xff0c;prerouting&#x8fc7;&#x540e;&#x5c31;&#x662f;&#x8def;&#x7531;&#x9009;&#x62e9;&#xff0c;&#x6240;&#x4ee5;netfilter&#x4e2d;&#x5728;prerouting&#x540e;&#x9762;&#x7684;hook&#x70b9;&#x90fd;&#x5047;&#x8bbe;&#x4e86;&#x5df2;&#x505a;&#x5b8c;&#x8def;&#x7531;&#x4e14;skb-&gt;dst&#x4e0d;&#x4e3a;&#x7a7a;"/>
<node CREATED="1423033788548" ID="ID_574004922" MODIFIED="1423033933993" TEXT="&#x5bf9;&#x4e8e;bridge&#x7684;&#x5305;&#x5373;&#x4f7f;&#x4e0d;&#x9700;&#x8981;&#x505a;&#x8def;&#x7531;&#xff0c;&#x4f46;&#x662f;&#x4e3a;&#x4e86;&#x6ee1;&#x8db3;netfilter&#x4e2d;&#x5404;hook&#x70b9;&#x5bf9;&#x8def;&#x7531;&#x5b8c;&#x6210;&#x7684;&#x5047;&#x8bbe;&#xff0c;&#x9700;&#x8981;&#x7ed9;skb-&gt;dst&#x8d4b;&#x503c;&#x4e00;&#x4e2a;&#x4f2a;&#x88c5;&#x7684;&#x8def;&#x7531;"/>
<node CREATED="1423034049724" ID="ID_956009259" MODIFIED="1423034162108" TEXT="prerouting&#x540e;&#x505a;&#x5b8c;&#x8def;&#x7531;&#x9009;&#x62e9;&#xff0c;&#x8fd9;&#x4e5f;&#x5c31;&#x662f;&#x8bf4;&#x5728;br_nf_pre_routing_finish()&#x51fd;&#x6570;&#x7684;&#x6700;&#x540e;&#xff0c; skb-&gt;dst&#x603b;&#x662f;&#x4e0d;&#x4e3a;&#x7a7a;&#x7684;&#xff0c;&#x65e0;&#x8bba;&#x662f;&#x771f;&#x7684;&#x8def;&#x7531;&#x8fd8;&#x662f;&#x4f2a;&#x88c5;&#x7684;&#x8def;&#x7531;"/>
<node CREATED="1423033956358" ID="ID_761550238" MODIFIED="1423034402079">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36825;&#20010;&#20266;&#35013;&#30340;&#36335;&#30001;&#22312;&#19981;&#20877;&#38656;&#35201;&#32463;&#36807;netfilter&#21508;hook&#28857;&#26102;&#34987;&#20002;&#24323;&#65292;&#35265;
    </p>
    <p>
      1&#65292;To local host&#30340;&#21253;&#65306;br_nf_local_in()&#20013;&#20002;&#24323;&#20266;&#35013;&#30340;&#36335;&#30001;
    </p>
    <p>
      2&#65292;bridge&#30340;&#21253;&#65306;br_dev_queue_push_xmit()&#20013;&#20002;&#24323;&#20266;&#35013;&#30340;&#36335;&#30001;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1422941907951" FOLDED="true" ID="ID_1228690656" MODIFIED="1423034356261" TEXT="forward&#x9636;&#x6bb5;">
<node CREATED="1422942221622" ID="ID_1741958204" MODIFIED="1422942228678">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bridge_forward_2.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1422942231356" ID="ID_391998552" MODIFIED="1422942240466">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bridge_forward_1.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1422942295081" ID="ID_1461492045" MODIFIED="1422942356629" TEXT="ebtables&#x7684;forward&#x9636;&#x6bb5;&#x4ece;br_handle_frame_finish()&#x51fd;&#x6570;&#x5f00;&#x59cb;&#xff0c;&#x5230;br_forward_finish()&#x51fd;&#x6570;&#x7ed3;&#x675f; "/>
<node CREATED="1422942295081" ID="ID_1415298653" MODIFIED="1422942471005" TEXT="ebtables&#x7684;local out&#x9636;&#x6bb5;&#x4ece;br_dev_xmit()&#x51fd;&#x6570;&#x5f00;&#x59cb;&#xff0c;&#x5230;br_forward_finish()&#x51fd;&#x6570;&#x7ed3;&#x675f; "/>
<node CREATED="1422942295081" ID="ID_1623054059" MODIFIED="1422942525671" TEXT="ebtables&#x7684;local in&#x9636;&#x6bb5;&#x4ece;br_handle_frame_finish()&#x51fd;&#x6570;&#x5f00;&#x59cb;&#xff0c;&#x5230;netif_receive_skb()&#x51fd;&#x6570;&#x7ed3;&#x675f; "/>
<node CREATED="1422942904008" FOLDED="true" ID="ID_1624696068" MODIFIED="1422948174420" TEXT="multicast router">
<node CREATED="1422942937601" ID="ID_1280033297" MODIFIED="1422943030893" TEXT="what is multicast router">
<node CREATED="1422943685014" ID="ID_724189844" MODIFIED="1422943751710" TEXT="&#x80fd;&#x53d1;&#x51fa;IGMP/MLD general query&#x7684;&#x7f51;&#x7edc;&#x8bbe;&#x5907;&#x79f0;&#x4e3a;multicast router"/>
<node CREATED="1422944580182" ID="ID_265733811" MODIFIED="1422944689910">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36830;&#25509;multicast router&#30340;bridge port&#31216;&#20026;&#36335;&#30001;&#22120;&#31471;&#21475;&#65292;&#34987;&#21152;&#20837;br-&gt;router_list
    </p>
    <p>
      &#36335;&#30001;&#22120;&#31471;&#21475;&#26377;2&#31181;&#26041;&#24335;&#25351;&#23450;&#65292;&#19968;&#31181;&#26159;&#21160;&#24577;&#23398;&#20064;&#65292;&#21478;&#19968;&#31181;&#26159;&#29992;&#25143;&#25351;&#23450;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422943976220" ID="ID_1087677837" MODIFIED="1422944708909" TEXT="&#x6536;&#x5230;IGMP/MLD query&#x5305;&#x7684;bridge port&#x5b66;&#x4e60;&#x4e3a;&#x8def;&#x7531;&#x5668;&#x7aef;&#x53e3;">
<node CREATED="1422944212804" ID="ID_710700855" MODIFIED="1422944266539">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      br_ip4_multicast_query()
    </p>
    <p>
      br_ip6_multicast_query()
    </p>
  </body>
</html></richcontent>
<node CREATED="1422944181594" ID="ID_253004786" MODIFIED="1422944184556" TEXT="br_multicast_query_received()">
<node CREATED="1422944158384" ID="ID_1703870074" MODIFIED="1422944160807" TEXT="br_multicast_mark_router()">
<node CREATED="1422944123292" ID="ID_543474430" MODIFIED="1422944126568" TEXT="br_multicast_add_router()"/>
</node>
</node>
</node>
</node>
<node CREATED="1422944740764" ID="ID_1615790770" MODIFIED="1422944864150" TEXT="&#x7528;&#x6237;&#x8bbe;&#x7f6e;/proc/sys/net/dev/br-lan/eth1/multicast_router">
<node CREATED="1422944804557" ID="ID_437032284" MODIFIED="1422944807503" TEXT="store_multicast_router()">
<node CREATED="1422944742353" ID="ID_1131465494" MODIFIED="1422944747511" TEXT="br_multicast_set_port_router()">
<node CREATED="1422944123292" ID="ID_712011433" MODIFIED="1422944126568" TEXT="br_multicast_add_router()"/>
</node>
</node>
</node>
</node>
<node CREATED="1422945117675" ID="ID_1487432645" MODIFIED="1422945263990">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;local host&#22312;bridge&#20043;&#19978;&#36816;&#34892;IGMP/MLD&#21327;&#35758;&#65292;&#21017;local host&#26412;&#36523;&#20063;&#26159;&#19968;&#20010;multicast router
    </p>
    <p>
      &#36825;&#31181;&#24773;&#20917;&#29992;br-&gt;multicast_router&#26469;&#34920;&#31034;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422945369415" ID="ID_1989331417" MODIFIED="1422945375776" TEXT="&#x7528;&#x6237;&#x8bbe;&#x7f6e;/proc/sys/net/dev/br-lan/multicast_router">
<node CREATED="1422945314304" ID="ID_1724214576" MODIFIED="1422945322132" TEXT="store_multicast_router()">
<node CREATED="1422945339715" ID="ID_91523521" MODIFIED="1422945342583" TEXT="br_multicast_set_router()"/>
</node>
</node>
</node>
</node>
<node CREATED="1422942993212" ID="ID_1500513052" MODIFIED="1422943071991">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      which packet should be
    </p>
    <p>
      sent to multicast router
    </p>
  </body>
</html></richcontent>
<node CREATED="1422946570664" ID="ID_1228067153" MODIFIED="1422946672712">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;&#32452;&#25773;&#25968;&#25454;&#21253;&#37117;&#24212;&#36716;&#21457;&#21040;&#25152;&#26377;multicast router&#65292;&#20294;&#26159;&#19981;&#33021;&#29615;&#22238;
    </p>
  </body>
</html></richcontent>
<node CREATED="1422946437617" ID="ID_1703885678" MODIFIED="1422947061457">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;forward&#30340;(&#21363;&#20174;br_handle_frame_finish()&#26469;&#30340;)&#32452;&#25773;&#25968;&#25454;&#21253;&#65292;&#24212;&#35813;&#36716;&#21457;&#21040;br-&gt;router_list
    </p>
    <p>
      &#22914;&#26524;local host&#26412;&#36523;&#26159;multicast router (br-&gt;multicast_router)&#21017;&#20063;&#23558;&#32452;&#25773;&#25968;&#25454;&#21253;&#25237;&#36882;&#21040;L3&#65292;&#21363;
    </p>
    <p>
      br_pass_frame_up()
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1422946437617" ID="ID_584892716" MODIFIED="1422947191504">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;local out&#30340;(&#21363;&#20174;br_dev_xmit()&#26469;&#30340;)&#32452;&#25773;&#25968;&#25454;&#21253;&#65292;&#24212;&#35813;&#36716;&#21457;&#21040;br-&gt;router_list
    </p>
    <p>
      &#20026;&#36991;&#20813;&#29615;&#22238;&#24182;&#19981;&#21457;&#36865;&#21040;local host&#26412;&#36523;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1422948225222" FOLDED="true" ID="ID_768308230" MODIFIED="1422949796629" TEXT="&#x80fd;&#x5426;&#x5c06;&#x5305;deliver&#x5230;&#x67d0;&#x4e2a;&#x7aef;&#x53e3;&#x7684;&#x68c0;&#x67e5;">
<node CREATED="1422948255161" ID="ID_1078384234" MODIFIED="1422949285502">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20986;&#21475;&#24517;&#39035;&#22788;&#20110;STP forwarding&#29366;&#24577;
    </p>
    <p>
      &#33509;hairpin&#27169;&#24335;&#27809;&#26377;&#24320;&#21551;&#65292;&#21017;&#20986;&#21475;&#19981;&#33021;&#31561;&#20110;&#20837;&#21475;
    </p>
    <p>
      &#33509;hairpin&#27169;&#24335;&#24320;&#21551;&#65292;&#21017;&#21253;&#19981;&#20026;&#32452;&#25773;&#21253;&#26102;&#20986;&#21475;&#21487;&#20197;&#31561;&#20110;&#20837;&#21475;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1422949373720" ID="ID_1604063305" MODIFIED="1422949483861" TEXT="&#x6ce8;&#x610f;&#x5728;&#x68c0;&#x67e5;&#x70b9;&#x68c0;&#x67e5;&#x65f6;skb-&gt;dev&#x8fd8;&#x7b49;&#x4e8e;&#x5305;&#x5165;&#x53e3;&#x7684;bridge port&#xff0c;&#xa;&#x800c;&#x53ea;&#x6709;&#x5728;__br_forward()&#x6216;__br_deliver()&#x4e4b;&#x540e;&#xff0c;skb-&gt;dev&#x624d;&#x53d8;&#x4e3a;&#x51fa;&#x53e3;bridge port"/>
<node CREATED="1422948257806" FOLDED="true" ID="ID_1308488682" MODIFIED="1422949114859" TEXT="&#x68c0;&#x67e5;&#x70b9;">
<node CREATED="1422948298073" ID="ID_205839840" MODIFIED="1422948304050" TEXT="br_flood_forward()">
<node CREATED="1422948316690" ID="ID_106361414" MODIFIED="1422948319746" TEXT="br_flood()">
<node CREATED="1422948333416" ID="ID_918699572" MODIFIED="1422948336948" TEXT="maybe_deliver()">
<node CREATED="1422948351053" ID="ID_1383431028" MODIFIED="1422948353827" TEXT="should_deliver()"/>
</node>
</node>
<node CREATED="1422948436012" ID="ID_654431368" MODIFIED="1422948442536" TEXT="__br_forward()"/>
</node>
<node CREATED="1422948501242" ID="ID_1125567050" MODIFIED="1422948503970" TEXT="br_forward()">
<node CREATED="1422948519375" ID="ID_1728385670" MODIFIED="1422948523820" TEXT="should_deliver()"/>
<node CREATED="1422948436012" ID="ID_864526878" MODIFIED="1422948442536" TEXT="__br_forward()"/>
</node>
<node CREATED="1422949008144" ID="ID_1041464038" MODIFIED="1422949019208" TEXT="br_multicast_forward()">
<node CREATED="1422948657695" ID="ID_952036629" MODIFIED="1422948660720" TEXT="br_multicast_flood()">
<node CREATED="1422948333416" ID="ID_195536400" MODIFIED="1422948336948" TEXT="maybe_deliver()">
<node CREATED="1422948351053" ID="ID_758213777" MODIFIED="1422948353827" TEXT="should_deliver()"/>
</node>
</node>
<node CREATED="1422948675514" ID="ID_1280626817" MODIFIED="1422948677702" TEXT="__br_forward()"/>
</node>
<node CREATED="1422948933683" ID="ID_1828970939" MODIFIED="1422948936548" TEXT="br_multicast_deliver()">
<node CREATED="1422948657695" ID="ID_86466118" MODIFIED="1422948660720" TEXT="br_multicast_flood()">
<node CREATED="1422948333416" ID="ID_952661751" MODIFIED="1422948336948" TEXT="maybe_deliver()">
<node CREATED="1422948351053" ID="ID_21560998" MODIFIED="1422948353827" TEXT="should_deliver()"/>
</node>
</node>
<node CREATED="1422948462548" ID="ID_102853084" MODIFIED="1422948473838" TEXT="__br_deliver()"/>
</node>
<node CREATED="1422948570096" ID="ID_344463020" MODIFIED="1422948572572" TEXT="br_deliver()">
<node CREATED="1422948519375" ID="ID_1323819752" MODIFIED="1422948523820" TEXT="should_deliver()"/>
</node>
<node CREATED="1422948404707" ID="ID_1257191225" MODIFIED="1422948408021" TEXT="br_flood_deliver()">
<node CREATED="1422948316690" ID="ID_433500513" MODIFIED="1422948319746" TEXT="br_flood()">
<node CREATED="1422948333416" ID="ID_1788775655" MODIFIED="1422948336948" TEXT="maybe_deliver()">
<node CREATED="1422948351053" ID="ID_1659015415" MODIFIED="1422948353827" TEXT="should_deliver()"/>
</node>
</node>
<node CREATED="1422948462548" ID="ID_752265443" MODIFIED="1422948473838" TEXT="__br_deliver()"/>
</node>
</node>
</node>
</node>
<node CREATED="1423031438697" FOLDED="true" ID="ID_1315449452" MODIFIED="1423034507468" TEXT="postrouting&#x9636;&#x6bb5;">
<node CREATED="1423031623072" ID="ID_1369138904" MODIFIED="1423031645729">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bridge_postrouting_2.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1423031647844" ID="ID_1338349916" MODIFIED="1423031653993">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bridge_postrouting_1.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1423032233509" ID="ID_1060723551" MODIFIED="1423032254721" TEXT="&#x4e3a;&#x4ec0;&#x4e48;&#x8981;&#x4fdd;&#x5b58;&#x548c;&#x6062;&#x590d;L2 header?">
<node CREATED="1423032258406" ID="ID_1311046418" MODIFIED="1423032423339">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21253;&#36827;&#20837;br_nf_post_routing()&#20989;&#25968;&#65292;&#23601;&#24050;&#30830;&#23450;&#26159;bridge&#30340;&#21253;&#65292;&#32780;&#23545;&#20110;bridge&#30340;&#21253;&#19981;&#24212;&#25913;&#21464;&#20854;L2&#22836;&#37096;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1423032440977" ID="ID_1283970650" MODIFIED="1423032499081" TEXT="&#x5305;&#x8d70;&#x5b8c;iptables&#x89c4;&#x5219;&#x518d;&#x56de;&#x6765;&#xff0c;&#x5176;L2&#x5934;&#x90e8;&#x53ef;&#x80fd;&#x5df2;&#x7ecf;&#x6539;&#x53d8;&#xff0c;&#x6240;&#x4ee5;&#x9700;&#x8981;&#x91cd;&#x65b0;&#x6062;&#x590d;"/>
<node CREATED="1423034428030" ID="ID_615216200" MODIFIED="1423034483164" TEXT="&#x5982;&#x679c;&#x8d70;&#x5b8c;&#x4e86;iptables&#x7684;postrouting&#x540e;&#x53d1;&#x751f;&#x4e86;SNAT&#x5219;&#x9700;&#x8981;&#x91cd;&#x65b0;&#x8ba1;&#x7b97;&#x6e90;MAC&#x5730;&#x5740;"/>
</node>
</node>
</node>
<node CREATED="1308210547206" FOLDED="true" ID="ID_1590399716" MODIFIED="1439942208649" POSITION="right" TEXT="ecm">
<node CREATED="1430526521896" ID="ID_823413996" MODIFIED="1439941789754" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1430706488458" FOLDED="true" ID="ID_1792643445" MODIFIED="1439941811060" TEXT="&#x8fde;&#x63a5;&#x7684;&#x65b9;&#x5411;&#x548c;&#x5305;&#x7684;&#x65b9;&#x5411;">
<node CREATED="1430706540150" ID="ID_257287691" MODIFIED="1430706541909" TEXT="&#x8fde;&#x63a5;&#x7684;&#x65b9;&#x5411;">
<node CREATED="1430706578931" ID="ID_615207914" MODIFIED="1430706642846">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#36830;&#25509;&#26159;&#20174;LAN&#21521;WAN&#21457;&#36215;&#30340;&#65292;&#21017;&#31216;&#27492;&#36830;&#25509;&#26159;egress&#30340;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ECM_DB_DIRECTION_EGRESS_NAT
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430706578931" ID="ID_1430354177" MODIFIED="1430706680680">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#36830;&#25509;&#26159;&#20174;WAN&#21521;LAN&#21457;&#36215;&#30340;&#65292;&#21017;&#31216;&#27492;&#36830;&#25509;&#26159;ingress&#30340;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;ECM_DB_DIRECTION_INGRESS_NAT
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430706527879" ID="ID_1512775778" MODIFIED="1430706529474" TEXT="&#x5305;&#x7684;&#x65b9;&#x5411;">
<node CREATED="1430706723717" ID="ID_1240585010" MODIFIED="1430706837624">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#21253;&#26159;&#20174;&#36830;&#25509;&#30340;&#21457;&#36215;&#22788;&#21457;&#20986;&#30340;&#65292;&#21017;&#31216;&#27492;&#21253;&#30340;&#26041;&#21521;&#20026;&#65306;ECM_TRACKER_SENDER_TYPE_SRC
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430706723717" ID="ID_1099641622" MODIFIED="1430706879259">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#21253;&#26159;&#20174;&#36830;&#25509;&#30340;&#32456;&#32467;&#22788;&#21457;&#20986;&#30340;&#65292;&#21017;&#31216;&#27492;&#21253;&#30340;&#26041;&#21521;&#20026;&#65306;ECM_TRACKER_SENDER_TYPE_DEST
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1430526821272" FOLDED="true" ID="ID_726264771" MODIFIED="1439941814509" TEXT="NAT information">
<node CREATED="1430526832905" ID="ID_1937495284" MODIFIED="1431546473915" TEXT="Linux&apos;s view">
<node CREATED="1430706358092" ID="ID_19483454" MODIFIED="1431214995779">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/ecm_linux_nat_view.PNG" />
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430526871561" ID="ID_1488352932" MODIFIED="1430705712444">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ct
    </p>
    <p>
      Linux&#20013;&#30340;NAT&#20449;&#24687;&#26159;&#31449;&#22312;&#36830;&#25509;&#21457;&#36215;&#32773;&#30340;&#35282;&#24230;&#24471;&#21040;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430526876734" ID="ID_769789530" MODIFIED="1430526968196" TEXT="original">
<node CREATED="1430526897064" ID="ID_1954488114" MODIFIED="1430526974514" TEXT="src ip"/>
<node CREATED="1430526909921" ID="ID_509709558" MODIFIED="1430526918832" TEXT="src port"/>
<node CREATED="1430526978574" ID="ID_541507564" MODIFIED="1430526985576" TEXT="dest ip"/>
<node CREATED="1430526986231" ID="ID_1796027057" MODIFIED="1430526989366" TEXT="dest port"/>
<node CREATED="1430527032225" ID="ID_1075681847" MODIFIED="1430527038738" TEXT="L3 protocol"/>
</node>
<node CREATED="1430526993810" ID="ID_494669099" MODIFIED="1430526997786" TEXT="reply">
<node CREATED="1430526998935" ID="ID_880047707" MODIFIED="1430527001908" TEXT="src ip"/>
<node CREATED="1430527002758" ID="ID_461313575" MODIFIED="1430527006777" TEXT="src port"/>
<node CREATED="1430527007417" ID="ID_1918709427" MODIFIED="1430527011426" TEXT="dest ip"/>
<node CREATED="1430527012103" ID="ID_1811865448" MODIFIED="1430527015816" TEXT="dest port"/>
<node CREATED="1430527042449" ID="ID_729996465" MODIFIED="1430527046721" TEXT="L4 protocol"/>
</node>
</node>
</node>
<node CREATED="1430527052113" FOLDED="true" ID="ID_108576001" MODIFIED="1431215033165" TEXT="nss firmware&apos;s view">
<node CREATED="1430527103361" FOLDED="true" ID="ID_237786068" MODIFIED="1431215031993">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ct
    </p>
    <p>
      nss firmware&#20851;&#20110;connection&#30340;&#21547;&#20041;&#19982;Linux&#20013;connection&#30340;&#21547;&#20041;&#26159;&#19968;&#33268;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430527106887" ID="ID_1119324172" LINK="#ID_1954488114" MODIFIED="1430705731390" TEXT="flow ip"/>
<node CREATED="1430527117983" ID="ID_1890179835" LINK="#ID_1918709427" MODIFIED="1430705763224" TEXT="flow ip xlate"/>
<node CREATED="1430527140041" ID="ID_618592829" LINK="#ID_509709558" MODIFIED="1430705772817" TEXT="flow ident"/>
<node CREATED="1430527149303" ID="ID_1219407433" LINK="#ID_1811865448" MODIFIED="1430705781597" TEXT="flow ident xlate"/>
<node CREATED="1430527124983" ID="ID_1590726584" LINK="#ID_541507564" MODIFIED="1430705792064" TEXT="return ip"/>
<node CREATED="1430527129503" ID="ID_993747504" LINK="#ID_880047707" MODIFIED="1430705843227" TEXT="return ip xlate"/>
<node CREATED="1430527159295" ID="ID_973709045" LINK="#ID_1796027057" MODIFIED="1430705858271" TEXT="return ident"/>
<node CREATED="1430527165241" ID="ID_1673445347" LINK="#ID_461313575" MODIFIED="1430705895853" TEXT="return ident xlate"/>
</node>
</node>
<node CREATED="1430527210929" ID="ID_1356764991" MODIFIED="1431546436196" TEXT="ecm&apos;s view">
<node CREATED="1430703492491" ID="ID_1008805496" MODIFIED="1431215067361">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/ecm_nat_view.PNG" />
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527248879" ID="ID_1194067628" MODIFIED="1430527252753" TEXT="front end">
<node CREATED="1430527224087" FOLDED="true" ID="ID_1651688567" MODIFIED="1431215137854">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ct
    </p>
    <p>
      &#36825;&#37324;&#30340;NAT&#20449;&#24687;&#37117;&#26159;&#31449;&#22312;&#24403;&#21069;&#21253;&#30340;&#35282;&#24230;&#24471;&#20986;&#26469;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430527230672" ID="ID_1520216877" MODIFIED="1430704920892">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ip src addr
    </p>
    <p>
      &#21253;&#21457;&#36215;&#22788;&#30340;host&#30340;IP&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527311185" ID="ID_1849499514" MODIFIED="1430704964728">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ip src addr nat
    </p>
    <p>
      &#21253;&#20174;&#21457;&#36215;&#22788;&#21521;&#25509;&#32456;&#32467;&#22788;&#20256;&#36755;&#36807;&#31243;&#36807;&#31243;&#20013;&#65292;&#32463;&#36807;NATer&#21518;&#30340;&#28304;IP
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527321145" ID="ID_531924975" MODIFIED="1430704976080">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      src port
    </p>
    <p>
      &#21253;&#21457;&#36215;&#22788;&#30340;host&#19978;&#30340;&#31471;&#21475;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527383377" ID="ID_1172419522" MODIFIED="1430705006846">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      src port nat
    </p>
    <p>
      &#21253;&#20174;&#21457;&#36215;&#22788;&#21521;&#25509;&#32456;&#32467;&#22788;&#20256;&#36755;&#36807;&#31243;&#36807;&#31243;&#20013;&#65292;&#32463;&#36807;NATer&#21518;&#30340;&#28304;&#31471;&#21475;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527397809" ID="ID_777516691" MODIFIED="1430705017307">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ip dest addr
    </p>
    <p>
      &#21253;&#32456;&#32467;&#22788;&#30340;host&#30340;IP&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527431217" ID="ID_319888198" MODIFIED="1430705027690">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ip dest addr nat
    </p>
    <p>
      &#21253;&#20174;&#21457;&#36215;&#22788;&#21521;&#25509;&#32456;&#32467;&#22788;&#20256;&#36755;&#36807;&#31243;&#36807;&#31243;&#20013;&#65292;&#32463;&#36807;NATer&#21069;&#30340;&#30446;&#30340;IP
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527438207" ID="ID_1567975285" MODIFIED="1430705038229">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      dest port
    </p>
    <p>
      &#21253;&#25509;&#32456;&#32467;&#22788;&#30340;host&#19978;&#30340;&#31471;&#21475;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430527442312" ID="ID_954773217" MODIFIED="1430705046651">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      dest port nat
    </p>
    <p>
      &#21253;&#20174;&#21457;&#36215;&#22788;&#21521;&#25509;&#32456;&#32467;&#22788;&#20256;&#36755;&#36807;&#31243;&#36807;&#31243;&#20013;&#65292;&#32463;&#36807;NATer&#21069;&#30340;&#30446;&#30340;&#31471;&#21475;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1430527253559" ID="ID_1785456324" MODIFIED="1430528215922">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      database
    </p>
    <p>
      database&#20013;ct&#30340;&#21547;&#20041;&#19982;front end&#20013;ct&#30340;&#21547;&#20041;&#26159;&#19968;&#19968;&#23545;&#24212;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430527462497" FOLDED="true" ID="ID_135492899" MODIFIED="1431215143628" TEXT="ct">
<node CREATED="1430527520538" ID="ID_1812062693" MODIFIED="1430527524826" TEXT="from">
<node CREATED="1430527531401" ID="ID_1304376795" MODIFIED="1430527532924" TEXT="ip">
<node CREATED="1430527230672" ID="ID_1851059259" LINK="#ID_1520216877" MODIFIED="1430528154356" TEXT="ip src addr"/>
</node>
<node CREATED="1430527533679" ID="ID_1511943613" MODIFIED="1430527535553" TEXT="port">
<node CREATED="1430527321145" ID="ID_112709081" LINK="#ID_531924975" MODIFIED="1430527872139" TEXT="src port"/>
</node>
</node>
<node CREATED="1430527536889" ID="ID_1655507426" MODIFIED="1430527539913" TEXT="from nat">
<node CREATED="1430527540823" ID="ID_403209985" MODIFIED="1430527542561" TEXT="ip">
<node CREATED="1430527311185" ID="ID_71959987" LINK="#ID_1849499514" MODIFIED="1430527880012" TEXT="ip src addr nat"/>
</node>
<node CREATED="1430527543113" ID="ID_1538438006" MODIFIED="1430527560124" TEXT="port">
<node CREATED="1430527383377" ID="ID_596819738" LINK="#ID_1172419522" MODIFIED="1430527890197" TEXT="src port nat"/>
</node>
</node>
<node CREATED="1430527546424" ID="ID_1485178963" MODIFIED="1430527548617" TEXT="to">
<node CREATED="1430527549367" ID="ID_13658494" MODIFIED="1430527550935" TEXT="ip">
<node CREATED="1430527397809" ID="ID_19142936" LINK="#ID_777516691" MODIFIED="1430527897445" TEXT="ip dest addr"/>
</node>
<node CREATED="1430527551327" ID="ID_1774688975" MODIFIED="1430527553537" TEXT="port">
<node CREATED="1430527438207" ID="ID_1209623251" LINK="#ID_1567975285" MODIFIED="1430527905197" TEXT="dest port"/>
</node>
</node>
<node CREATED="1430527562545" ID="ID_1682767963" MODIFIED="1430527564705" TEXT="to nat">
<node CREATED="1430527565593" ID="ID_385410721" MODIFIED="1430527566809" TEXT="ip">
<node CREATED="1430527431217" ID="ID_287239694" LINK="#ID_319888198" MODIFIED="1430527910853" TEXT="ip dest addr nat"/>
</node>
<node CREATED="1430527567359" ID="ID_1798817092" MODIFIED="1430527569017" TEXT="port">
<node CREATED="1430527442312" ID="ID_1175815341" LINK="#ID_954773217" MODIFIED="1430528165934" TEXT="dest port nat"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1430779169401" FOLDED="true" ID="ID_344200153" MODIFIED="1439941819284" TEXT="&#x8fde;&#x63a5;&#x7684;&#x72b6;&#x6001;&#x53ca;&#x8d85;&#x65f6;&#x65f6;&#x95f4;">
<node CREATED="1430779324750" ID="ID_744721846" MODIFIED="1431215185477">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_tracker_sender_state_t
    </p>
    <p>
      &#36830;&#25509;&#30340;&#21333;&#21521;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430769480411" FOLDED="true" ID="ID_745818291" MODIFIED="1431215190883">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_tracker_sender_state_t state
    </p>
    <p>
      TCP&#36830;&#25509;&#30340;&#21333;&#21521;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430769480411" ID="ID_1701308538" MODIFIED="1430776413290">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_UNKNOWN
    </p>
    <p>
      &#36824;&#27809;&#26377;&#30475;&#35265;&#36825;&#20010;&#26041;&#21521;&#19978;&#30340;&#20219;&#20309;&#21253;&#65292;&#25152;&#20197;&#29366;&#24577;&#26410;&#30693;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_799266412" MODIFIED="1430776800920">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_ESTABLISHING
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP sync&#65292;&#20294;&#36824;&#26410;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;sync&#30340;ack
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_616568767" MODIFIED="1430776875394">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_ESTABLISHED
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP sync&#65292;&#24182;&#19988;&#24050;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;sync&#30340;ack&#65292;&#27492;&#26102;&#36825;&#20010;&#26041;&#21521;&#19978;&#30340;TCP&#36830;&#25509;&#24050;&#24314;&#31435;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1206812532" MODIFIED="1430776912461">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_CLOSING
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP fin&#65292;&#20294;&#36824;&#26410;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;fin&#30340;ack
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1947227476" MODIFIED="1430776944211">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_CLOSED
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP fin&#65292;&#24182;&#19988;&#24050;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;fin&#30340;ack&#65292;&#27492;&#26102;&#36825;&#20010;&#26041;&#21521;&#19978;&#30340;TCP&#36830;&#25509;&#24050;&#26029;&#24320;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_162850170" MODIFIED="1430778604721">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_FAULT
    </p>
    <p>
      &#25351;&#19968;&#20999;&#38169;&#35823;&#29366;&#24577;&#65292;&#27604;&#22914;&#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#25910;&#21040;&#20102;&#19968;&#20010;TCP reset&#65292;&#25110;&#32773;&#36830;&#25509;&#20851;&#38381;&#21518;&#21448;&#25910;&#21040;sync
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1470822700" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_MAX"/>
</node>
<node CREATED="1430769480411" FOLDED="true" ID="ID_248876744" MODIFIED="1431215167581">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_tracker_sender_state_t state
    </p>
    <p>
      UDP&#36830;&#25509;&#30340;&#21333;&#21521;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430769480411" ID="ID_599906915" MODIFIED="1430776413290">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_UNKNOWN
    </p>
    <p>
      &#36824;&#27809;&#26377;&#30475;&#35265;&#36825;&#20010;&#26041;&#21521;&#19978;&#30340;&#20219;&#20309;&#21253;&#65292;&#25152;&#20197;&#29366;&#24577;&#26410;&#30693;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1392589683" MODIFIED="1430780422357">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_ESTABLISHING
    </p>
    <p>
      &#27809;&#26377;&#29992;&#21040;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1062818223" MODIFIED="1430780474326">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_ESTABLISHED
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#33267;&#23569;&#25910;&#21040;&#20102;&#19968;&#20010;&#21253;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1973167142" MODIFIED="1430780429787">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_CLOSING
    </p>
    <p>
      &#27809;&#26377;&#29992;&#21040;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1515980332" MODIFIED="1430780435888">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_CLOSED
    </p>
    <p>
      &#27809;&#26377;&#29992;&#21040;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_5842822" MODIFIED="1430780441740">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_FAULT
    </p>
    <p>
      &#27809;&#26377;&#29992;&#21040;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1017286183" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_MAX"/>
</node>
</node>
<node CREATED="1430779203669" FOLDED="true" ID="ID_162606368" MODIFIED="1431215256271">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_tracker_connection_state_t
    </p>
    <p>
      &#36830;&#25509;&#30340;&#29366;&#24577;&#65292;&#23427;&#19968;&#33324;&#30001;&#36830;&#25509;&#30340;2&#20010;&#21333;&#21521;&#29366;&#24577;&#32463;&#30001;&#19968;&#20010;&#29366;&#24577;&#26426;&#32852;&#21512;&#30830;&#23450;&#65292;&#27604;&#22914;&#65306;
    </p>
    <p>
      ecm_tracker_tcp_connection_state_matrix[*src_state][*dest_state]
    </p>
    <p>
      ecm_tracker_udp_connection_state_matrix[*src_state][*dest_state]
    </p>
  </body>
</html></richcontent>
<node CREATED="1430779211361" ID="ID_1460687937" MODIFIED="1430779213273" TEXT="ECM_TRACKER_CONNECTION_STATE_ESTABLISHING"/>
<node CREATED="1430779218039" ID="ID_1058350039" MODIFIED="1430779219691" TEXT="ECM_TRACKER_CONNECTION_STATE_ESTABLISHED"/>
<node CREATED="1430779224489" ID="ID_1553862536" MODIFIED="1430779226384" TEXT="ECM_TRACKER_CONNECTION_STATE_CLOSING"/>
<node CREATED="1430779230978" ID="ID_404183241" MODIFIED="1430779232690" TEXT="ECM_TRACKER_CONNECTION_STATE_CLOSED"/>
<node CREATED="1430779237524" ID="ID_237380199" MODIFIED="1430779239353" TEXT="ECM_TRACKER_CONNECTION_STATE_FAULT"/>
<node CREATED="1430779244968" ID="ID_854062562" MODIFIED="1430779246415" TEXT="ECM_TRACKER_CONNECTION_STATE_MAX"/>
</node>
<node CREATED="1430780117099" FOLDED="true" ID="ID_1806524243" MODIFIED="1431215328863" TEXT="&#x8fde;&#x63a5;&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;">
<node CREATED="1430878078536" ID="ID_1634571788" MODIFIED="1431215304331">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/ecm_connection_timer.PNG" />
    </p>
  </body>
</html></richcontent>
<node CREATED="1430878143862" ID="ID_1906827615" MODIFIED="1430878176949" TEXT="&#x4e00;&#x4e2a;timer group&#x662f;&#x6307;&#x8d85;&#x65f6;&#x65f6;&#x957f;&#x76f8;&#x540c;&#x7684;&#x4e00;&#x7ec4;&#x5b9a;&#x65f6;&#x5668;"/>
<node CREATED="1430878235232" ID="ID_543553521" MODIFIED="1430878297419" TEXT="&#x540c;&#x5c5e;&#x4e00;&#x4e2a;timer group&#x7684;timer&#x6309;&#x7167;&#x52a0;&#x5165;&#x5148;&#x540e;&#x987a;&#x5e8f;&#x5f62;&#x6210;&#x4e00;&#x4e2a;&#x94fe;&#x8868;&#xff0c;&#x6302;&#x63a5;&#x5728;&#x5bf9;&#x5e94;&#x7684;timer group&#x4e0a;"/>
</node>
<node CREATED="1430779966387" ID="ID_409186895" MODIFIED="1430781658911">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      TCP&#36830;&#25509;&#30340;&#36229;&#26102;&#26102;&#38388;&#19968;&#33324;&#30001;&#36830;&#25509;&#30340;&#29366;&#24577;&#30830;&#23450;
    </p>
    <p>
      timer group = ecm_tracker_tcp_timer_group_from_state[*connection_state]
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430779966387" ID="ID_1245853719" MODIFIED="1430785318491">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      UDP&#36830;&#25509;&#30340;&#36229;&#26102;&#26102;&#38388;&#19968;&#33324;&#26159;&#19968;&#20010;&#22266;&#23450;&#20540;&#65292;&#25152;&#20197;&#23427;&#22312;&#21019;&#24314;&#36830;&#25509;&#26102;&#23601;&#30830;&#23450;&#20102;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1430889533614" FOLDED="true" ID="ID_313494278" MODIFIED="1431217617795" TEXT="classifier">
<node CREATED="1430951828885" ID="ID_1056878576" MODIFIED="1431215460128">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/ecm_classifier_response.PNG" />
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430891717578" FOLDED="true" ID="ID_888700581" MODIFIED="1431215581153">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct ecm_classifier_process_response
    </p>
    <p>
      &#20998;&#31867;&#35780;&#20272;&#32467;&#26524;&#65292;&#27599;&#19968;&#20010;classifier&#35780;&#20272;&#19968;&#20010;&#21253;&#21518;&#20250;&#24471;&#20986;&#19968;&#20010;&#20998;&#31867;&#32467;&#26524;
    </p>
    <p>
      &#39640;&#20248;&#20808;&#32423;&#30340;classifier&#30340;&#20998;&#31867;&#32467;&#26524;&#23558;&#35206;&#30422;&#20302;&#20248;&#20808;&#32423;&#30340;classifier&#30340;&#20998;&#31867;&#32467;&#26524;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430891755125" FOLDED="true" ID="ID_1424777604" MODIFIED="1431215522089">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_classifier_relevence_t relevance
    </p>
    <p>
      classifier&#19982;&#36830;&#25509;&#30340;&#20851;&#32852;&#24615;&#65292;&#36825;&#20915;&#23450;&#20102;classifier&#22914;&#20309;&#22788;&#29702;&#36830;&#25509;&#20869;&#30340;&#21518;&#32493;&#21253;&#65292;&#20197;&#21450;&#26159;&#21542;&#32473;&#20986;&#20102;&#36830;&#25509;&#30340;&#30828;&#20214;&#21152;&#36895;&#20915;&#23450;&#21644;QOS&#20915;&#23450;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430891874419" ID="ID_1157998290" MODIFIED="1430892191474">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_CLASSIFIER_RELEVANCE_MAYBE
    </p>
    <p>
      classifier&#36824;&#19981;&#33021;&#20915;&#23450;&#36830;&#25509;&#26159;&#21542;&#19982;classifier&#26377;&#20851;&#31995;&#65292;&#22240;&#27492;&#36830;&#25509;&#36824;&#19981;&#33021;&#34987;&#30828;&#20214;&#21152;&#36895;&#65292;&#36830;&#25509;&#30340;&#21518;&#32493;&#21253;&#36824;&#35201;&#32487;&#32493;&#36865;&#21040;classifier&#36827;&#34892;&#20998;&#31867;&#35780;&#20272;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430891883981" ID="ID_106110896" MODIFIED="1430892747407">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_CLASSIFIER_RELEVANCE_NO
    </p>
    <p>
      &#36830;&#25509;&#19982;classifier&#27809;&#26377;&#20851;&#31995;&#65292;&#22240;&#27492;&#20063;&#19981;&#32473;&#20986;&#36830;&#25509;&#30340;&#30828;&#20214;&#21152;&#36895;&#20915;&#23450;&#21644;QOS&#20915;&#23450;&#12290;
    </p>
    <p>
      &#36830;&#25509;&#30340;&#21518;&#32493;&#21253;&#19981;&#35201;&#20877;&#36865;&#21040;classifier&#65292;&#36825;&#24847;&#21619;&#30528;&#23558;classifier&#20174;connection-&gt;assignments[x]&#20013;&#21024;&#38500;&#65292;&#20294;&#26159;&#36825;&#37324;&#26377;&#19968;&#20010;&#20363;&#22806;&#65292;&#22914;&#26524;classifier&#26159;defualt&#31867;&#30340;classifier&#21017;&#21363;&#20351;&#26080;&#20851;&#20063;&#19981;&#33021;&#21024;&#38500;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430891893339" ID="ID_168919517" LINK="#ID_1894034080" MODIFIED="1430893288528">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_CLASSIFIER_RELEVANCE_YES
    </p>
    <p>
      &#36830;&#25509;&#19982;classifier&#26377;&#20851;&#31995;&#65292;&#22240;&#27492;&#32473;&#20986;&#36830;&#25509;&#30340;&#30828;&#20214;&#21152;&#36895;&#20915;&#23450;&#21644;QOS&#20915;&#23450;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430891767953" ID="ID_1069928473" MODIFIED="1430891770125" TEXT="uint32_t became_relevant"/>
<node CREATED="1430891777741" FOLDED="true" ID="ID_1894034080" MODIFIED="1431215531104">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uint32_t process_actions
    </p>
    <p>
      &#21253;&#21547;&#20102;&#21738;&#20123;&#20998;&#31867;&#20915;&#23450;&#65292;&#21363;&#19979;&#38754;&#21738;&#20123;&#23383;&#27573;&#26377;&#25928;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430893520407" ID="ID_1907709614" MODIFIED="1430893521188" TEXT="ECM_CLASSIFIER_PROCESS_ACTION_DROP"/>
<node CREATED="1430893529347" ID="ID_1268868829" MODIFIED="1430893530098" TEXT="ECM_CLASSIFIER_PROCESS_ACTION_QOS_TAG"/>
<node CREATED="1430893538034" ID="ID_555427113" MODIFIED="1430893538590" TEXT="ECM_CLASSIFIER_PROCESS_ACTION_ACCEL_MODE"/>
<node CREATED="1430893546485" ID="ID_1140060066" MODIFIED="1430893547095" TEXT="ECM_CLASSIFIER_PROCESS_ACTION_TIMER_GROUP"/>
<node CREATED="1430893555597" ID="ID_955664456" MODIFIED="1430893556169" TEXT="ECM_CLASSIFIER_PROCESS_ACTION_DSCP"/>
<node CREATED="1430893566380" ID="ID_1855474627" MODIFIED="1430893566999" TEXT="ECM_CLASSIFIER_PROCESS_ACTION_DSCP_DENY"/>
</node>
<node CREATED="1430891788919" ID="ID_327544526" MODIFIED="1430894062768">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      bool drop
    </p>
    <p>
      &#20002;&#24323;&#24403;&#21069;&#21253;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430891800207" ID="ID_261274982" MODIFIED="1430891800833" TEXT="uint32_t flow_qos_tag"/>
<node CREATED="1430891810949" ID="ID_1740332462" MODIFIED="1430891811559" TEXT="uint32_t return_qos_tag"/>
<node CREATED="1430891823260" ID="ID_292387046" MODIFIED="1430891823995" TEXT="uint8_t flow_dscp"/>
<node CREATED="1430891834118" ID="ID_1555975233" MODIFIED="1430891835923" TEXT="uint8_t return_dscp"/>
<node CREATED="1430891847429" FOLDED="true" ID="ID_1398370423" MODIFIED="1431215580369">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_classifier_acceleration_mode_t accel_mode
    </p>
    <p>
      &#30828;&#20214;&#21152;&#36895;&#20915;&#23450;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430893611870" ID="ID_988898008" MODIFIED="1430893612887" TEXT="ECM_CLASSIFIER_ACCELERATION_MODE_DONT_CARE"/>
<node CREATED="1430893621760" ID="ID_1410885741" MODIFIED="1430893622323" TEXT="ECM_CLASSIFIER_ACCELERATION_MODE_NO"/>
<node CREATED="1430893630095" ID="ID_925082825" MODIFIED="1430893630674" TEXT="ECM_CLASSIFIER_ACCELERATION_MODE_ACCEL"/>
</node>
<node CREATED="1430891858092" ID="ID_93627206" MODIFIED="1430894094808">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_db_timer_group_t timer_group
    </p>
    <p>
      &#36171;&#32473;&#36830;&#25509;&#26032;&#30340;&#36229;&#26102;&#26102;&#38388;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430889552292" FOLDED="true" ID="ID_614088399" MODIFIED="1431217610123">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      reclassify
    </p>
    <p>
      &#35831;&#27714;&#37325;&#26032;&#35780;&#20272;connection&#30340;QOS&#23646;&#24615;&#65292;&#20197;&#21450;&#26159;&#21542;&#38656;&#35201;&#30828;&#20214;&#21152;&#36895;
    </p>
    <p>
      reclassify&#26159;&#30001;connection&#30340;generation&#21464;&#21270;&#24341;&#36215;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1431199821795" ID="ID_51988680" MODIFIED="1431199828234" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1431199835491" ID="ID_770785260" MODIFIED="1431199980679" TEXT="&#x5f53;&#x8fde;&#x63a5;&#x5173;&#x8054;&#x7684;interface&#x7684;link&#x72b6;&#x6001;&#x53d1;&#x751f;&#x53d8;&#x5316;&#x540e;&#xff0c;&#x9700;&#x8981;&#x91cd;&#x65b0;&#x8bc4;&#x4f30;&#x8fde;&#x63a5;&#x7684;QOS&#x5c5e;&#x6027;&#x548c;&#x662f;&#x5426;&#x9700;&#x8981;&#x786c;&#x4ef6;&#x52a0;&#x901f;"/>
<node CREATED="1431200009351" ID="ID_155579594" MODIFIED="1431200308676">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27492;&#26102;&#38656;&#35201;&#20570;2&#20214;&#20107;&#24773;&#65306;
    </p>
    <p>
      1&#65292;&#21024;&#38500;&#30828;&#20214;&#20013;&#36830;&#25509;&#23545;&#24212;&#30340;&#21152;&#36895;&#26465;&#30446;&#65292;&#21482;&#26377;&#36825;&#26679;&#36830;&#25509;&#30340;&#21253;&#25165;&#20250;&#37325;&#26032;&#36827;&#20837;&#36719;&#20214;&#65292;classifier&#25165;&#26377;&#26426;&#20250;&#37325;&#26032;&#20998;&#31867;&#35780;&#20272;
    </p>
    <p>
      2&#65292;&#23558;&#36830;&#25509;&#30340;generation&#35774;&#32622;&#20026;&#24322;&#20110;&#20840;&#23616;generation&#65292;&#36825;&#26679;&#22312;postrouting hook&#20013;&#23601;&#21487;&#20197;&#26816;&#27979;&#21040;classifier generation&#21464;&#21270;&#65292;&#20174;&#32780;&#35302;&#21457;reclassify
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430890813510" ID="ID_448230734" MODIFIED="1431200939233">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      reclassify&#26412;&#36523;&#24182;&#19981;&#20570;&#20998;&#31867;&#35780;&#20272;&#65292;&#23427;&#20195;&#34920;&#20102;&#19968;&#20010;&#35831;&#27714;&#65292;&#35831;&#27714;classifier&#23545;&#36830;&#25509;&#36827;&#34892;&#37325;&#26032;&#20998;&#31867;&#35780;&#20272;&#12290;&#30495;&#27491;&#30340;&#35780;&#20272;&#26159;&#22312;post routing hook&#20013;&#35843;&#29992;classifier-&gt;process()&#36827;&#34892;&#30340;&#12290;
    </p>
    <p>
      reclassify&#20027;&#35201;&#20570;&#20102;3&#20214;&#20107;&#24773;&#65306;
    </p>
    <p>
      1&#65292;&#37325;&#26032;&#26500;&#24314;&#20102;&#36830;&#25509;&#25152;&#20851;&#32852;&#30340;interface
    </p>
    <p>
      2&#65292;&#22240;&#20026;&#22312;&#19978;&#19968;&#27425;&#20998;&#31867;&#35780;&#20272;&#20043;&#21518;&#65292;&#19982;&#36830;&#25509;&#27809;&#26377;&#20851;&#31995;&#30340;classifier&#34987;&#35299;&#38500;&#20102;&#19982;&#36830;&#25509;&#30340;&#20851;&#32852;&#65292;&#29616;&#22312;&#26082;&#28982;&#26159;reclassify&#65292;&#25152;&#20197;&#38656;&#35201;&#23558;&#25152;&#26377;classifier&#37325;&#26032;&#20851;&#32852;&#21040;&#36830;&#25509;&#12290;
    </p>
    <p>
      3&#65292;&#28165;&#38500;&#19978;&#19968;&#27425;&#30340;&#20998;&#31867;&#35780;&#20272;&#32467;&#26524;&#65292;&#21363;&#23558;classifier&#30340;struct ecm_classifier_process_response-&gt;relevance&#35774;&#32622;&#20026;ECM_CLASSIFIER_RELEVANCE_MAYBE&#12290;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430889694855" ID="ID_1668411362" MODIFIED="1431196773810">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#31995;&#32479;&#26377;&#19968;&#20010;&#20840;&#23616;&#30340;generation&#24207;&#21495;&#65306;ecm_db_classifier_generation
    </p>
  </body>
</html></richcontent>
<node CREATED="1430890105805" ID="ID_168342360" MODIFIED="1430890158370">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_db_classifier_generation_change()
    </p>
    <p>
      &#27492;API&#29992;&#20110;&#25913;&#21464;&#20840;&#23616;&#30340;generation&#24207;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431196776934" ID="ID_1382271298" MODIFIED="1431196830487" TEXT="&#x5728;&#x76ee;&#x524d;&#x7684;ecm&#x5b9e;&#x73b0;&#x4e2d;&#xff0c;&#x6b64;&#x503c;&#x9664;&#x4e86;&#x521d;&#x59cb;&#x5316;&#x4e4b;&#x5916;&#xff0c;&#x6ca1;&#x6709;&#x522b;&#x7684;&#x5730;&#x65b9;&#x6539;&#x53d8;&#x5b83;"/>
</node>
<node CREATED="1430889851637" FOLDED="true" ID="ID_142650282" MODIFIED="1431217481226">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#20010;connection&#26377;&#19968;&#20010;classifier_generation&#65292;&#21019;&#24314;&#36830;&#25509;&#26102;&#20250;&#29992;&#20840;&#23616;&#30340;generation&#24207;&#21495;&#26469;&#21021;&#22987;&#21270;&#27492;&#20540;
    </p>
    <p>
      &#22312;classifier&#21464;&#20026;enable/disable&#26102;&#65292;&#36830;&#25509;&#20851;&#32852;&#30340;interface&#30340;&#38142;&#36335;&#29366;&#24577;&#21464;&#21270;&#26102;&#65292;&#20197;&#21450;reclassify&#37325;&#26500;interface&#22833;&#36133;&#26102;
    </p>
    <p>
      &#37117;&#20250;&#25913;&#21464;&#27492;&#20540;&#65292;&#20351;&#20854;&#19981;&#31561;&#20110;&#20840;&#23616;generation&#65292;&#20174;&#32780;&#35302;&#21457;reclassify&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1431217350498" ID="ID_263005217" MODIFIED="1431217459695">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_generation_change_situation.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430889945592" ID="ID_1635783679" MODIFIED="1431197298955" TEXT="&#x5f53;&#x8fde;&#x63a5;&#x7684;classifier_generation&#x4e0d;&#x7b49;&#x4e8e;&#x5168;&#x5c40;&#x7684;generation&#x5e8f;&#x53f7;&#x65f6;&#x8868;&#x793a;classifier&#x6709;&#x53d8;&#x5316;&#xff0c;&#xa;&#x5206;&#x7c7b;&#x51b3;&#x5b9a;&#x53ef;&#x80fd;&#x4f1a;&#x53d8;&#x5316;&#xff0c;&#x6240;&#x4ee5;&#x9700;&#x8981;&#x91cd;&#x65b0;&#x5206;&#x7c7b;&#xff0c;&#x5373;reclassify">
<node CREATED="1431197419461" FOLDED="true" ID="ID_1380660186" MODIFIED="1431217587725" TEXT="&#x4f55;&#x65f6;&#x68c0;&#x6d4b;&#x53d8;&#x5316;">
<node CREATED="1431198029781" ID="ID_1940986493" MODIFIED="1431217566342">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/ecm_generation_changed_detect.PNG" />
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431197430991" FOLDED="true" ID="ID_1699103226" MODIFIED="1431217589490" TEXT="&#x5982;&#x4f55;&#x68c0;&#x6d4b;&#x53d8;&#x5316;">
<node CREATED="1430890193421" ID="ID_794187847" MODIFIED="1430890317438">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_db_connection_classifier_generation_changed()
    </p>
    <p>
      &#27492;API&#29992;&#20110;&#26816;&#27979;&#36830;&#25509;&#30340;classifier_generation&#26159;&#21542;&#24322;&#20110;&#20840;&#23616;&#30340;generation&#24207;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431198072186" FOLDED="true" ID="ID_1458672670" LINK="#ID_448230734" MODIFIED="1431217600545" TEXT="&#x5982;&#x4f55;&#x54cd;&#x5e94;&#x53d8;&#x5316;">
<node CREATED="1430890369600" ID="ID_728836893" MODIFIED="1430890453914">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_front_end_ipv4_connection_regenerate()
    </p>
    <p>
      &#33509;&#36830;&#25509;&#30340;classifier_generation&#24322;&#20110;&#20840;&#23616;&#30340;generation&#24207;&#21495;&#65292;&#21017;&#29992;&#27492;API&#36827;&#34892;reclassify
    </p>
  </body>
</html></richcontent>
<node CREATED="1430890521856" ID="ID_890358168" MODIFIED="1431198853883">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#37325;&#26032;&#35745;&#31639;from, to, from_nat, to_nat&#23545;&#24212;&#30340;iface&#23618;&#27425;&#32467;&#26500;
    </p>
    <p>
      &#22914;&#26524;&#26576;&#20123;interface&#26242;&#26102;&#36824;&#19981;&#33021;&#25104;&#21151;&#26500;&#24314;&#20986;&#26469;&#65292;&#34920;&#31034;&#24403;&#21069;linux device&#30340;&#21464;&#21270;&#36824;&#27809;&#26377;&#25910;&#25947;&#65292;&#22240;&#27492;&#38656;&#35201;&#24310;&#26102;&#20877;&#36827;&#34892;reclassify&#12290;&#27492;&#26102;&#23558;connection&#30340;generation&#35774;&#32622;&#20026;&#24322;&#20110;&#20840;&#23616;generation&#65292;&#36825;&#26679;&#22312;&#19979;&#27425;&#26816;&#27979;generation&#21464;&#21270;&#26102;&#23601;&#33021;&#25506;&#27979;&#21040;&#24182;&#37325;&#26032;&#36827;&#34892;reclassify&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1431198987685" ID="ID_308898976" MODIFIED="1431198993600" TEXT="ecm_interface_heirarchy_construct()"/>
<node CREATED="1431199007965" ID="ID_305340546" MODIFIED="1431199010443" TEXT="ecm_db_connection_classifier_generation_change()"/>
</node>
<node CREATED="1430890609016" ID="ID_646862942" LINK="#ID_106110896" MODIFIED="1430893095269">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ecm_front_end_ipv4_reclassify()
    </p>
    <p>
      &#35843;&#29992;&#21508;&#20010;classifier&#30340;reclassify&#22238;&#35843;&#20989;&#25968;&#65306;aci-&gt;reclassify(aci)
    </p>
    <p>
      
    </p>
    <p>
      &#27880;&#24847;&#65292;&#24403;classifier&#19982;&#36830;&#25509;&#26080;&#20851;&#26102;&#65292;classifier&#20250;&#20174;connection-&gt;assignments [ x ] &#20013;&#34987;&#21024;&#38500;
    </p>
    <p>
      &#36825;&#37324;&#20570;reclassify&#26102;&#38656;&#35201;&#23558;&#25152;&#26377;&#24050;&#26377;&#30340;classifier&#37325;&#26032;&#20851;&#32852;&#21040;connection
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1431199647917" ID="ID_448794280" MODIFIED="1431199773748" TEXT="classifier-&gt;reclassify()&#x56de;&#x8c03;&#x51fd;&#x6570;&#x4ec5;&#x4ec5;&#x662f;&#x6e05;&#x9664;&#x4e4b;&#x524d;&#x505a;&#x51fa;&#x7684;&#x5206;&#x7c7b;&#x51b3;&#x5b9a;&#xff0c;&#x5373;&#x5c06;struct ecm_classifier_process_response-&gt;relevance&#x8bbe;&#x7f6e;&#x4e3a;ECM_CLASSIFIER_RELEVANCE_MAYBE"/>
</node>
</node>
<node CREATED="1431154726738" FOLDED="true" ID="ID_354846793" MODIFIED="1431217626285" TEXT="decelerate&#x4e0e;defunct">
<node CREATED="1431154764845" ID="ID_840492927" MODIFIED="1431155118987">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      decelerate
    </p>
    <p>
      &#21024;&#38500;&#30828;&#20214;&#20013;&#36830;&#25509;&#23545;&#24212;&#30340;&#21152;&#36895;&#26465;&#30446;&#65292;&#23427;&#19981;&#20851;&#24515;&#36830;&#25509;&#20197;&#21518;&#26159;&#21542;&#36824;&#33021;&#22312;&#30828;&#20214;&#20013;&#21152;&#36895;
    </p>
    <p>
      &#22914;&#26524;&#36830;&#25509;&#27809;&#26377;&#21464;&#20026;defunct&#65292;&#21017;ecm&#36824;&#21487;&#20197;&#22312;&#20197;&#21518;&#20026;&#36830;&#25509;&#28155;&#21152;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431154770961" ID="ID_371692717" MODIFIED="1431155265274">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      defunct
    </p>
    <p>
      &#36825;&#20010;&#29366;&#24577;&#19981;&#20165;&#35201;&#21024;&#38500;&#30828;&#20214;&#20013;&#36830;&#25509;&#23545;&#24212;&#30340;&#21152;&#36895;&#26465;&#30446;&#65292;&#32780;&#19988;&#35201;&#27714;&#20197;&#21518;&#37117;&#19981;&#20877;&#22312;&#30828;&#20214;&#20013;&#21152;&#36895;&#27492;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431204078103" ID="ID_697090221" MODIFIED="1431204086885" TEXT="action seen"/>
</node>
<node CREATED="1430431305999" ID="ID_1168995981" MODIFIED="1432941083192" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1430431458995" FOLDED="true" ID="ID_817154185" MODIFIED="1432941108881">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct ecm_db_connection_instance
    </p>
    <p>
      &#36830;&#25509;&#30340;&#25628;&#32034;&#20851;&#38190;&#23383;&#26159;&#65306;
    </p>
    <p>
      (mapping_from-&gt;host-&gt;address,
    </p>
    <p>
      &#160;mapping_from-&gt;port,
    </p>
    <p>
      &#160;mapping_to-&gt;host-&gt;address,
    </p>
    <p>
      &#160;mapping_to-&gt;port)
    </p>
  </body>
</html></richcontent>
<node CREATED="1430707452194" FOLDED="true" ID="ID_1688820964" MODIFIED="1430874446343" TEXT="&#x7528;&#x4e8e;&#x5c06;connection&#x94fe;&#x63a5;&#x5230;&#x5404;&#x79cd;&#x94fe;&#x8868;&#x7684;&#x5b57;&#x6bb5;">
<node CREATED="1430432408564" ID="ID_807917635" MODIFIED="1430432408564" TEXT=" struct ecm_db_connection_instance *next"/>
<node CREATED="1430432408564" ID="ID_483981941" MODIFIED="1430846778619">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *prev
    </p>
    <p>
      next, prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#20840;&#23616;&#38142;&#34920;struct ecm_db_connection_instance *ecm_db_connections
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408564" ID="ID_606513901" MODIFIED="1430846898486" TEXT=" struct ecm_db_connection_instance *hash_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408564" ID="ID_113501177" MODIFIED="1430846898486">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *hash_prev
    </p>
    <p>
      hash_next, hash_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#20840;&#23616;hash&#34920;struct ecm_db_connection_instance *ecm_db_connection_table [ hash_index ]
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_540540355" MODIFIED="1430432408565" TEXT=" struct ecm_db_connection_instance *serial_hash_next"/>
<node CREATED="1430432408565" ID="ID_1619368486" MODIFIED="1430872896863">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *serial_hash_prev
    </p>
    <p>
      serial_hash_next, serial_hash_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#20840;&#23616;hash&#34920;struct ecm_db_connection_instance *ecm_db_connection_serial_table [ hash_index ]
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408565" ID="ID_1556078387" MODIFIED="1430873886249" TEXT=" struct ecm_db_connection_instance *from_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408565" ID="ID_411851926" MODIFIED="1430873886249">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *from_prev
    </p>
    <p>
      from_next, from_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;mapping_from
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_1322470085" MODIFIED="1430432408565" TEXT=" struct ecm_db_connection_instance *to_next"/>
<node CREATED="1430432408565" ID="ID_465784720" MODIFIED="1430873677751">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *to_prev
    </p>
    <p>
      to_next, to_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;mapping_to
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408565" ID="ID_752704891" MODIFIED="1430873893905" TEXT=" struct ecm_db_connection_instance *from_nat_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408565" ID="ID_1853198445" MODIFIED="1430873893905">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *from_nat_prev
    </p>
    <p>
      from_nat_next, from_nat_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;mapping_nat_from
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_1307191864" MODIFIED="1430432408565" TEXT=" struct ecm_db_connection_instance *to_nat_next"/>
<node CREATED="1430432408565" ID="ID_1510582310" MODIFIED="1430873738948">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *to_nat_prev
    </p>
    <p>
      to_nat_next, to_nat_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;mapping_nat_to
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408565" ID="ID_1488066304" MODIFIED="1430873995102" TEXT=" struct ecm_db_connection_instance *iface_from_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408565" ID="ID_1104909499" MODIFIED="1430873995102">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *iface_from_prev
    </p>
    <p>
      iface_from_next, iface_from_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;from_node&#25152;&#23545;&#24212;&#30340;iface
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_557892205" MODIFIED="1430432408565" TEXT=" struct ecm_db_connection_instance *iface_to_next"/>
<node CREATED="1430432408565" ID="ID_1541712685" MODIFIED="1430873983618">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *iface_to_prev
    </p>
    <p>
      iface_to_next, iface_to_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;to_node&#25152;&#23545;&#24212;&#30340;iface
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408565" ID="ID_1021079850" MODIFIED="1430874024673" TEXT=" struct ecm_db_connection_instance *iface_from_nat_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408566" ID="ID_1192548930" MODIFIED="1430874024673">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *iface_from_nat_prev
    </p>
    <p>
      iface_from_nat_next, iface_from_nat_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;from_nat_node&#25152;&#23545;&#24212;&#30340;iface
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_1570036628" MODIFIED="1430432408566" TEXT=" struct ecm_db_connection_instance *iface_to_nat_next"/>
<node CREATED="1430432408566" ID="ID_799120968" MODIFIED="1430874064387">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *iface_to_nat_prev
    </p>
    <p>
      iface_to_nat_next, iface_to_nat_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;to_nat_node&#25152;&#23545;&#24212;&#30340;iface
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccccff" CREATED="1430432408566" ID="ID_1780707586" MODIFIED="1430874074565" TEXT=" struct ecm_db_connection_instance *node_from_next"/>
<node BACKGROUND_COLOR="#ccccff" CREATED="1430432408566" ID="ID_1754885200" MODIFIED="1430874074565">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *node_from_prev
    </p>
    <p>
      node_from_next, node_from_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;from_node
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408566" ID="ID_1252808254" MODIFIED="1430873406548" TEXT=" struct ecm_db_connection_instance *node_to_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408566" ID="ID_1233908310" MODIFIED="1430873406559">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *node_to_prev
    </p>
    <p>
      node_to_next, node_to_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;to_node
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_1358400903" MODIFIED="1430432408566" TEXT=" struct ecm_db_connection_instance *node_from_nat_next"/>
<node CREATED="1430432408566" ID="ID_142821953" MODIFIED="1430873484489">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *node_from_nat_prev
    </p>
    <p>
      node_from_nat_next, node_from_nat_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;from_nat_node
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408567" ID="ID_144254951" MODIFIED="1430873526721" TEXT=" struct ecm_db_connection_instance *node_to_nat_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408567" ID="ID_1413544146" MODIFIED="1430873526721">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *node_to_nat_prev
    </p>
    <p>
      node_to_nat_next, node_to_nat_prev&#29992;&#20110;&#23558;&#36830;&#25509;&#38142;&#20837;&#25152;&#20851;&#32852;&#30340;to_nat_node
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430432408565" ID="ID_1449771673" MODIFIED="1430872983512">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_connection_hash_t hash_index
    </p>
    <p>
      &#29992;&#36830;&#25509;&#30340;&#25628;&#32034;&#20851;&#38190;&#23383;&#35745;&#31639;&#20986;&#26469;&#30340;hash&#20540;&#65292;&#29992;&#20110;hash&#34920;&#65306;ecm_db_connection_table
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_591627443" MODIFIED="1430873015563">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_connection_hash_t serial_hash_index
    </p>
    <p>
      &#29992;ci-&gt;serial&#35745;&#31639;&#20986;&#26469;&#30340;hash&#20540;&#65292;&#29992;&#20110;hash&#34920;&#65306;ecm_db_connection_serial_table
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_353031575" MODIFIED="1430432408565" TEXT=" uint32_t time_added"/>
<node CREATED="1430432408565" MODIFIED="1430432408565" TEXT=" int protocol"/>
<node CREATED="1430432408565" FOLDED="true" ID="ID_1240868887" MODIFIED="1430844615942" TEXT=" ecm_db_direction_t direction">
<node CREATED="1430844480759" ID="ID_734134537" MODIFIED="1430844551495">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_DB_DIRECTION_EGRESS_NAT
    </p>
    <p>
      &#36830;&#25509;&#26159;&#20174;LAN&#21040;WAN&#21457;&#36215;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430844489684" ID="ID_427921899" MODIFIED="1430844563112">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_DB_DIRECTION_INGRESS_NAT
    </p>
    <p>
      &#36830;&#25509;&#26159;&#20174;LAN&#21040;WAN&#21457;&#36215;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430844498678" ID="ID_165053207" MODIFIED="1430844587205">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_DB_DIRECTION_NON_NAT
    </p>
    <p>
      &#32431;&#36335;&#30001;&#65292;&#27809;&#26377;&#20570;NAT
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430844507907" ID="ID_724938899" MODIFIED="1430844611899">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_DB_DIRECTION_BRIDGED
    </p>
    <p>
      &#32431;&#26725;&#25509;&#30340;&#27969;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430432408565" ID="ID_249184549" MODIFIED="1430432408565" TEXT=" bool is_routed"/>
<node CREATED="1430724142091" FOLDED="true" ID="ID_1912673176" MODIFIED="1430876639356" TEXT="mapping&#x76f8;&#x5173;&#x5b57;&#x6bb5;">
<node CREATED="1430432408565" ID="ID_1302220561" LINK="#ID_1520216877" MODIFIED="1430724914246">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *mapping_from
    </p>
    <p>
      &#21253;&#21457;&#36215;&#22788;&#30340;host&#30340;IP&#22320;&#22336;&#21644;&#31471;&#21475;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_1526091131" LINK="#ID_777516691" MODIFIED="1430724950163">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *mapping_to
    </p>
    <p>
      &#21253;&#32456;&#32467;&#22788;&#30340;host&#30340;IP&#22320;&#22336;&#21644;&#31471;&#21475;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_1904691281" LINK="#ID_1849499514" MODIFIED="1430725054780">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *mapping_nat_from
    </p>
    <p>
      &#21253;&#20174;&#21457;&#36215;&#22788;&#21521;&#25509;&#32456;&#32467;&#22788;&#20256;&#36755;&#36807;&#31243;&#36807;&#31243;&#20013;&#65292;&#32463;&#36807;NATer&#21518;&#30340;&#28304;IP&#21644;&#28304;&#31471;&#21475;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408565" ID="ID_1314433647" LINK="#ID_319888198" MODIFIED="1430725064116">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *mapping_nat_to
    </p>
    <p>
      &#21253;&#20174;&#21457;&#36215;&#22788;&#21521;&#25509;&#32456;&#32467;&#22788;&#20256;&#36755;&#36807;&#31243;&#36807;&#31243;&#20013;&#65292;&#32463;&#36807;NATer&#21069;&#30340;&#30446;&#30340;IP&#21644;&#30446;&#30340;&#31471;&#21475;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430723959072" FOLDED="true" ID="ID_1879551946" MODIFIED="1430873851007" TEXT="iface&#x76f8;&#x5173;&#x5b57;&#x6bb5;">
<node BACKGROUND_COLOR="#66ff66" COLOR="#000000" CREATED="1430432408566" ID="ID_325568858" MODIFIED="1430723347586">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_iface_instance *from_interfaces[ECM_DB_IFACE_HEIRARCHY_MAX]
    </p>
    <p>
      &#21040;&#36798;mapping_from-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;interface&#23618;&#32423;&#24207;&#21015;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#66ff66" COLOR="#000000" CREATED="1430432408566" ID="ID_1227595962" MODIFIED="1430723559043">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t from_interface_first
    </p>
    <p>
      &#19978;&#38754;from_interfaces&#25968;&#32452;&#30340;&#31532;&#19968;&#20010;&#26377;&#25928;&#20803;&#32032;&#30340;&#19979;&#26631;&#20301;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#66ff66" COLOR="#000000" CREATED="1430432408566" ID="ID_433599215" MODIFIED="1430723591008">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool from_interface_set
    </p>
    <p>
      &#19978;&#38754;from_interfaces&#25968;&#32452;&#24050;&#34987;&#36171;&#20540;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_93294221" MODIFIED="1430723370984">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_iface_instance *to_interfaces[ECM_DB_IFACE_HEIRARCHY_MAX]
    </p>
    <p>
      &#21040;&#36798;mapping_to-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;interface&#23618;&#32423;&#24207;&#21015;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_1099498643" MODIFIED="1430723622764">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t to_interface_first
    </p>
    <p>
      &#19978;&#38754;to_interfaces&#25968;&#32452;&#30340;&#31532;&#19968;&#20010;&#26377;&#25928;&#20803;&#32032;&#30340;&#19979;&#26631;&#20301;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_870044948" MODIFIED="1430723648349">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool to_interface_set
    </p>
    <p>
      &#19978;&#38754;to_interfaces&#25968;&#32452;&#24050;&#34987;&#36171;&#20540;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#99ffcc" CREATED="1430432408566" ID="ID_1956982527" MODIFIED="1430723416538">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_iface_instance *from_nat_interfaces[ECM_DB_IFACE_HEIRARCHY_MAX]
    </p>
    <p>
      &#21040;&#36798;mapping_nat_from-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;interface&#23618;&#32423;&#24207;&#21015;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#99ffcc" CREATED="1430432408566" ID="ID_1846462999" MODIFIED="1430723730576">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t from_nat_interface_first
    </p>
    <p>
      &#19978;&#38754;from_nat_interfaces&#25968;&#32452;&#30340;&#31532;&#19968;&#20010;&#26377;&#25928;&#20803;&#32032;&#30340;&#19979;&#26631;&#20301;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#99ffcc" CREATED="1430432408566" ID="ID_1608779419" MODIFIED="1430723771232">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool from_nat_interface_set
    </p>
    <p>
      &#19978;&#38754;from_nat_interfaces&#25968;&#32452;&#24050;&#34987;&#36171;&#20540;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_656341313" MODIFIED="1430723701099">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_iface_instance *to_nat_interfaces[ECM_DB_IFACE_HEIRARCHY_MAX]
    </p>
    <p>
      &#21040;&#36798;mapping_nat_to-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;interface&#23618;&#32423;&#24207;&#21015;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_507503761" MODIFIED="1430723746029">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t to_nat_interface_first
    </p>
    <p>
      &#19978;&#38754;to_nat_interfaces&#25968;&#32452;&#30340;&#31532;&#19968;&#20010;&#26377;&#25928;&#20803;&#32032;&#30340;&#19979;&#26631;&#20301;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408566" ID="ID_1505541762" MODIFIED="1430723787849">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool to_nat_interface_set
    </p>
    <p>
      &#19978;&#38754;to_nat_interfaces&#25968;&#32452;&#24050;&#34987;&#36171;&#20540;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430724076634" FOLDED="true" ID="ID_1900841338" MODIFIED="1430873853710" TEXT="node&#x76f8;&#x5173;&#x5b57;&#x6bb5;">
<node BACKGROUND_COLOR="#ffffff" CREATED="1430432408566" ID="ID_1789811983" MODIFIED="1430724273695">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_node_instance *from_node
    </p>
    <p>
      &#21040;&#36798;mapping_from-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;&#19979;&#19968;&#36339;&#30340;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ffffff" CREATED="1430432408566" ID="ID_346919780" MODIFIED="1430724288316">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_node_instance *to_node
    </p>
    <p>
      &#21040;&#36798;mapping_to-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;&#19979;&#19968;&#36339;&#30340;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ffffff" CREATED="1430432408566" ID="ID_1295768" MODIFIED="1430724371736">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_node_instance *from_nat_node
    </p>
    <p>
      &#21040;&#36798;mapping_nat_from-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;&#19979;&#19968;&#36339;&#30340;MAC&#22320;&#22336;&#65292;&#21487;&#33021;&#20026;NATer&#33258;&#24049;&#26576;&#20010;interface&#30340;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ffffff" CREATED="1430432408566" ID="ID_225074235" MODIFIED="1430724398675">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_node_instance *to_nat_node
    </p>
    <p>
      &#21040;&#36798;mapping_nat_to-&gt;host&#25152;&#35201;&#32463;&#36807;&#30340;&#19979;&#19968;&#36339;&#30340;MAC&#22320;&#22336;&#65292;&#21487;&#33021;&#20026;NATer&#33258;&#24049;&#26576;&#20010;interface&#30340;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430432408567" ID="ID_837571492" MODIFIED="1431364233596">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_timer_group_entry defunct_timer
    </p>
    <p>
      &#27492;&#23450;&#26102;&#22120;&#29992;&#20110;defunct&#36825;&#20010;&#36830;&#25509;&#65292;&#21363;&#19981;&#20877;&#22312;&#30828;&#20214;&#20013;&#21152;&#36895;&#27492;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430846405352" ID="ID_576756981" MODIFIED="1430846411317" TEXT="&#x56de;&#x8c03;&#x51fd;&#x6570;&#xff1a;ecm_db_connection_defunct_callback">
<node CREATED="1430846424257" ID="ID_539163153" MODIFIED="1430846425352" TEXT="ci-&gt;defunct(ci-&gt;feci)"/>
</node>
<node CREATED="1430846463152" ID="ID_403356432" MODIFIED="1430846467637" TEXT="&#x8d85;&#x65f6;&#x65f6;&#x95f4;&#xff1a;"/>
<node CREATED="1430878664770" ID="ID_811362547" MODIFIED="1430887984416">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20309;&#26102;&#26356;&#26032;&#65306;
    </p>
    <p>
      postrouting&#25910;&#21040;&#27492;&#36830;&#25509;&#30340;&#21253;&#26102;&#26356;&#26032;&#27492;&#23450;&#26102;&#22120;
    </p>
    <p>
      &#20174;nss firmware&#25910;&#21040;&#20851;&#20110;&#27492;&#36830;&#25509;&#30340;&#32479;&#35745;&#20449;&#24687;&#26102;&#26356;&#26032;&#27492;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430878799109" ID="ID_789595409" MODIFIED="1430878799900" TEXT="ecm_front_end_ipv4_net_dev_callback">
<node CREATED="1430878923560" ID="ID_907645951" MODIFIED="1430878924291" TEXT="ecm_db_connection_defunct_timer_touch(ci)"/>
</node>
<node CREATED="1430878852204" ID="ID_1026520743" MODIFIED="1430878854627" TEXT="ecm_front_end_ipv4_ip_process">
<node CREATED="1430878861883" ID="ID_894325220" MODIFIED="1430878862571" TEXT="ecm_front_end_ipv4_tcp_process">
<node CREATED="1430878920637" ID="ID_1636960914" MODIFIED="1430878921083" TEXT="ecm_db_connection_defunct_timer_touch(ci)"/>
</node>
<node CREATED="1430878871249" ID="ID_537068997" MODIFIED="1430878871633" TEXT="ecm_front_end_ipv4_udp_process">
<node CREATED="1430878917074" ID="ID_734779624" MODIFIED="1430878917638" TEXT="ecm_db_connection_defunct_timer_touch(ci)"/>
</node>
</node>
</node>
</node>
<node CREATED="1430722746196" FOLDED="true" ID="ID_1842488517" MODIFIED="1430844359005" TEXT="&#x7edf;&#x8ba1;&#x4fe1;&#x606f;&#x5b57;&#x6bb5;">
<node CREATED="1430432408567" ID="ID_1686324868" MODIFIED="1430432408567" TEXT=" uint64_t from_data_total"/>
<node CREATED="1430432408567" ID="ID_1003276955" MODIFIED="1430432408567" TEXT=" uint64_t to_data_total"/>
<node CREATED="1430432408567" ID="ID_611495810" MODIFIED="1430432408567" TEXT=" uint64_t from_packet_total"/>
<node CREATED="1430432408567" ID="ID_1177837191" MODIFIED="1430432408567" TEXT=" uint64_t to_packet_total"/>
<node CREATED="1430432408567" ID="ID_1284691692" MODIFIED="1430432408567" TEXT=" uint64_t from_data_total_dropped"/>
<node CREATED="1430432408567" ID="ID_326817845" MODIFIED="1430432408567" TEXT=" uint64_t to_data_total_dropped"/>
<node CREATED="1430432408567" ID="ID_491960508" MODIFIED="1430432408567" TEXT=" uint64_t from_packet_total_dropped"/>
<node CREATED="1430432408567" ID="ID_567014462" MODIFIED="1430432408567" TEXT=" uint64_t to_packet_total_dropped"/>
</node>
<node CREATED="1430725193094" FOLDED="true" ID="ID_809202854" MODIFIED="1430891176110" TEXT="classifier&#x76f8;&#x5173;&#x5b57;&#x6bb5;">
<node CREATED="1430765100302" ID="ID_822610358" MODIFIED="1430765118404">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_front_end_nat_2.PNG" />
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" ID="ID_521408019" MODIFIED="1430763744687">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_classifier_instance *assignments
    </p>
    <p>
      &#20998;&#37197;&#32473;&#26412;connection&#30340;&#25152;&#26377;classifier&#30340;&#38142;&#34920;&#65292;&#25353;&#29031;classifier type&#20174;&#22823;&#21040;&#23567;&#25490;&#21015;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" ID="ID_1455963118" MODIFIED="1430765241921">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_classifier_instance *assignments_by_type[ECM_CLASSIFIER_TYPES]
    </p>
    <p>
      &#20998;&#37197;&#32473;&#26412;connection&#30340;&#25152;&#26377;classifier&#65292;&#20197;&#25968;&#32452;&#24418;&#24335;&#23384;&#25918;&#65292;&#26041;&#20415;&#29992;classifier type&#26469;&#32034;&#24341;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" ID="ID_398816854" MODIFIED="1430765454929">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_classifier_type_assignment type_assignment[ECM_CLASSIFIER_TYPES]
    </p>
    <p>
      &#24403;&#26412;connection&#21547;&#26377;type &#20026; x &#30340;classifier&#26102;&#65292;type_assignment [ x ]&#29992;&#20110;&#23558;&#26412;connection&#38142;&#20837;ecm_db_connection_classifier_type_assignments [ x ]&#65292;&#36825;&#26679;&#23601;&#21487;&#20197;&#20840;&#23616;&#30340;&#30693;&#36947;&#19982;&#26576;&#20010;&#31867;&#22411;&#30340;classifier&#20851;&#32852;&#30340;&#25152;&#26377;connection&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" ID="ID_1344565199" MODIFIED="1430432408567" TEXT=" uint16_t classifier_generation"/>
</node>
<node CREATED="1430432408567" ID="ID_294066627" MODIFIED="1430432408567" TEXT=" uint32_t generations"/>
<node CREATED="1430432408567" ID="ID_915918325" MODIFIED="1430432408567" TEXT=" struct ecm_front_end_connection_instance *feci"/>
<node CREATED="1430432408567" ID="ID_12070219" MODIFIED="1430786359044">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_connection_defunct_callback_t defunct
    </p>
    <p>
      &#27492;&#20989;&#25968;&#21024;&#38500;&#36830;&#25509;&#23545;&#24212;&#30340;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;&#65292;&#20351;&#36830;&#25509;&#19981;&#20877;&#22312;&#30828;&#20214;&#20013;&#34987;&#21152;&#36895;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" ID="ID_459339776" MODIFIED="1430785755143">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_connection_final_callback_t final
    </p>
    <p>
      &#24403;connection&#30340;&#24341;&#29992;&#35745;&#25968;&#21464;&#20026;0&#23548;&#33268;connection&#38656;&#35201;&#34987;&#38144;&#27585;&#26102;&#35843;&#29992;&#27492;&#22238;&#35843;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" ID="ID_901467504" MODIFIED="1430786385893">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void *arg
    </p>
    <p>
      &#35843;&#29992;&#19978;&#38754;final&#20989;&#25968;&#26102;&#30340;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" ID="ID_305689797" MODIFIED="1430846602456">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t serial
    </p>
    <p>
      &#36882;&#22686;&#20840;&#23616;&#21464;&#37327;ecm_db_connection_serial&#24471;&#21040;&#30340;&#31995;&#21015;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408567" FOLDED="true" ID="ID_22946628" MODIFIED="1430877205023" TEXT=" uint32_t flags">
<node CREATED="1430846806875" ID="ID_1502042136" MODIFIED="1430846807829" TEXT="ECM_DB_CONNECTION_FLAGS_INSERTED"/>
</node>
<node CREATED="1430432408567" MODIFIED="1430432408567" TEXT=" int refs"/>
<node CREATED="1430432408567" MODIFIED="1430432408567" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430432408570" FOLDED="true" ID="ID_1935424430" MODIFIED="1431039163626" TEXT="struct ecm_db_iface_instance">
<node CREATED="1430874189774" FOLDED="true" ID="ID_43758686" MODIFIED="1430874654083" TEXT="&#x7528;&#x4e8e;&#x5c06;iface&#x94fe;&#x63a5;&#x5230;&#x5404;&#x79cd;&#x94fe;&#x8868;&#x7684;&#x5b57;&#x6bb5;">
<node CREATED="1430432408570" ID="ID_1721709786" MODIFIED="1430432408570" TEXT=" struct ecm_db_iface_instance *next"/>
<node CREATED="1430432408570" ID="ID_1845611461" MODIFIED="1430432408570" TEXT=" struct ecm_db_iface_instance *prev"/>
<node CREATED="1430432408570" ID="ID_372058594" MODIFIED="1430432408570" TEXT=" struct ecm_db_iface_instance *hash_next"/>
<node CREATED="1430432408570" ID="ID_1068355594" MODIFIED="1430432408570" TEXT=" struct ecm_db_iface_instance *hash_prev"/>
<node CREATED="1430432408571" ID="ID_738295717" MODIFIED="1430874578312">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *from_connections
    </p>
    <p>
      from_node&#23545;&#24212;&#21040;&#27492;iface&#30340;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408571" ID="ID_1987111527" MODIFIED="1430874590212">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *to_connections
    </p>
    <p>
      to_node&#23545;&#24212;&#21040;&#27492;iface&#30340;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408571" ID="ID_871101676" MODIFIED="1430874604591">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *from_nat_connections
    </p>
    <p>
      from_nat_node&#23545;&#24212;&#21040;&#27492;iface&#30340;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408571" ID="ID_1279814594" MODIFIED="1430874617169">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *to_nat_connections
    </p>
    <p>
      to_nat_node&#23545;&#24212;&#21040;&#27492;iface&#30340;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408570" ID="ID_1121419618" MODIFIED="1430874648724">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_node_instance *nodes
    </p>
    <p>
      &#20851;&#32852;&#21040;&#27492;iface&#30340;&#25152;&#26377;node
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430432408570" ID="ID_1114986874" MODIFIED="1430432408570" TEXT=" ecm_db_iface_type_t type"/>
<node CREATED="1430432408570" ID="ID_167379810" MODIFIED="1430432408570" TEXT=" int node_count"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint32_t time_added"/>
<node CREATED="1430432408570" ID="ID_1411616053" MODIFIED="1430874698169">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t interface_identifier
    </p>
    <p>
      &#27492;iface&#22312;linux&#20013;&#30340;&#32534;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408571" ID="ID_37972471" MODIFIED="1430874715645">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t nss_interface_identifier
    </p>
    <p>
      &#27492;iface&#22312;nss firmware&#20013;&#30340;&#32534;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408571" ID="ID_1198493554" MODIFIED="1430432408571" TEXT=" char name[IFNAMSIZ]"/>
<node CREATED="1430432408571" ID="ID_517239594" MODIFIED="1430432408571" TEXT=" int32_t mtu"/>
<node CREATED="1430874222997" FOLDED="true" ID="ID_1070169113" MODIFIED="1430874252242" TEXT="&#x7edf;&#x8ba1;&#x4fe1;&#x606f;&#x5b57;&#x6bb5;">
<node CREATED="1430432408571" ID="ID_1717468947" MODIFIED="1430432408571" TEXT=" uint64_t from_data_total"/>
<node CREATED="1430432408571" ID="ID_1152473217" MODIFIED="1430432408571" TEXT=" uint64_t to_data_total"/>
<node CREATED="1430432408571" ID="ID_1068144093" MODIFIED="1430432408571" TEXT=" uint64_t from_packet_total"/>
<node CREATED="1430432408571" ID="ID_627138231" MODIFIED="1430432408571" TEXT=" uint64_t to_packet_total"/>
<node CREATED="1430432408571" ID="ID_1551147303" MODIFIED="1430432408571" TEXT=" uint64_t from_data_total_dropped"/>
<node CREATED="1430432408571" ID="ID_971514335" MODIFIED="1430432408571" TEXT=" uint64_t to_data_total_dropped"/>
<node CREATED="1430432408571" ID="ID_711487473" MODIFIED="1430432408571" TEXT=" uint64_t from_packet_total_dropped"/>
<node CREATED="1430432408571" ID="ID_967080772" MODIFIED="1430432408571" TEXT=" uint64_t to_packet_total_dropped"/>
</node>
<node CREATED="1430432408571" FOLDED="true" ID="ID_1339718589" MODIFIED="1430432435181" TEXT="union type_info">
<node CREATED="1430432408571" FOLDED="true" ID="ID_732781048" MODIFIED="1430432426685" TEXT=" struct ecm_db_interface_info_ethernet ethernet">
<node CREATED="1430432408571" ID="ID_1797084573" MODIFIED="1430432408571" TEXT=" uint8_t address[ETH_ALEN]"/>
</node>
<node CREATED="1430432408571" FOLDED="true" ID="ID_595618031" MODIFIED="1430432427676" TEXT=" struct ecm_db_interface_info_vlan vlan">
<node CREATED="1430432408571" ID="ID_980771988" MODIFIED="1430432408571" TEXT=" uint8_t address[ETH_ALEN]"/>
<node CREATED="1430432408571" MODIFIED="1430432408571" TEXT=" uint16_t vlan_tpid"/>
<node CREATED="1430432408571" MODIFIED="1430432408571" TEXT=" uint16_t vlan_tag"/>
</node>
<node CREATED="1430432408571" FOLDED="true" ID="ID_1316606585" MODIFIED="1430432428988" TEXT=" struct ecm_db_interface_info_lag lag">
<node CREATED="1430432408571" MODIFIED="1430432408571" TEXT=" uint8_t address[ETH_ALEN]"/>
</node>
<node CREATED="1430432408571" FOLDED="true" ID="ID_69790057" MODIFIED="1430432429660" TEXT=" struct ecm_db_interface_info_bridge bridge">
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint8_t address[ETH_ALEN]"/>
</node>
<node CREATED="1430432408572" FOLDED="true" ID="ID_1620168609" MODIFIED="1430432430582" TEXT=" struct ecm_db_interface_info_pppoe pppoe">
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint16_t pppoe_session_id"/>
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint8_t remote_mac[ETH_ALEN]"/>
</node>
<node CREATED="1430432408572" FOLDED="true" ID="ID_1690118004" MODIFIED="1430432431861" TEXT=" struct ecm_db_interface_info_unknown unknown">
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint32_t os_specific_ident"/>
</node>
<node CREATED="1430432408572" FOLDED="true" ID="ID_867289259" MODIFIED="1430432432821" TEXT=" struct ecm_db_interface_info_loopback loopback">
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint32_t os_specific_ident"/>
</node>
<node CREATED="1430432408572" FOLDED="true" ID="ID_819918807" MODIFIED="1430432433708" TEXT=" struct ecm_db_interface_info_ipsec_tunnel ipsec_tunnel">
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint32_t os_specific_ident"/>
</node>
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" struct ecm_db_interface_info_sit sit"/>
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" struct ecm_db_interface_info_tunipip6 tunipip6"/>
</node>
<node CREATED="1430432408572" ID="ID_940743495" MODIFIED="1430432408572" TEXT=" ecm_db_iface_xml_state_get_method_t xml_state_get"/>
<node CREATED="1430432408572" ID="ID_855529868" MODIFIED="1430874481245">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_iface_final_callback_t final
    </p>
    <p>
      &#24403;iface&#30340;&#24341;&#29992;&#35745;&#25968;&#21464;&#20026;0&#23548;&#33268;iface&#38656;&#35201;&#34987;&#38144;&#27585;&#26102;&#35843;&#29992;&#27492;&#22238;&#35843;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408572" ID="ID_1401809370" MODIFIED="1430874497277">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void *arg
    </p>
    <p>
      &#19978;&#38754;final&#20989;&#25968;&#30340;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint32_t flags"/>
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" int refs"/>
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" ecm_db_iface_hash_t hash_index"/>
<node CREATED="1430432408572" MODIFIED="1430432408572" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430432408569" FOLDED="true" ID="ID_1341810857" MODIFIED="1431039167661" TEXT="struct ecm_db_host_instance">
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" struct ecm_db_host_instance *next"/>
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" struct ecm_db_host_instance *prev"/>
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" struct ecm_db_host_instance *hash_next"/>
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" struct ecm_db_host_instance *hash_prev"/>
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" ip_addr_t address"/>
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" bool on_link"/>
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" struct ecm_db_mapping_instance *mappings"/>
<node CREATED="1430432408569" MODIFIED="1430432408569" TEXT=" int mapping_count"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint32_t time_added"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t from_data_total"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t to_data_total"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t from_packet_total"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t to_packet_total"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t from_data_total_dropped"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t to_data_total_dropped"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t from_packet_total_dropped"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint64_t to_packet_total_dropped"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" ecm_db_host_final_callback_t final"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" void *arg"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint32_t flags"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" int refs"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" ecm_db_host_hash_t hash_index"/>
<node CREATED="1430432408570" MODIFIED="1430432408570" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430432408568" FOLDED="true" ID="ID_1765599723" MODIFIED="1431039169455" TEXT="struct ecm_db_mapping_instance">
<node CREATED="1430786718461" FOLDED="true" ID="ID_399239819" MODIFIED="1430874128143" TEXT="&#x7528;&#x4e8e;&#x5c06;mapping&#x94fe;&#x63a5;&#x5230;&#x5404;&#x79cd;&#x94fe;&#x8868;&#x7684;&#x5b57;&#x6bb5;">
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408568" ID="ID_1106023874" MODIFIED="1430787852983" TEXT=" struct ecm_db_mapping_instance *next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430432408568" ID="ID_1540523332" MODIFIED="1430787980146">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *prev
    </p>
    <p>
      next, prev&#29992;&#20110;&#23558;mapping&#38142;&#25509;&#21040;&#20840;&#23616;&#38142;&#34920;&#65306;struct ecm_db_mapping_instance *ecm_db_mappings
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccccff" CREATED="1430432408568" ID="ID_358578374" MODIFIED="1430787878248" TEXT=" struct ecm_db_mapping_instance *hash_next"/>
<node BACKGROUND_COLOR="#ccccff" CREATED="1430432408568" ID="ID_360898092" MODIFIED="1430788049114">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *hash_prev
    </p>
    <p>
      hash_next, hash_prev&#29992;&#20110;&#23558;mapping&#38142;&#25509;&#21040;&#20840;&#23616;hash&#34920;&#65306;struct ecm_db_mapping_instance *ecm_db_mapping_table [hash idx]
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_530910022" MODIFIED="1430432408568" TEXT=" struct ecm_db_mapping_instance *mapping_next"/>
<node CREATED="1430432408568" ID="ID_409772130" LINK="#ID_945014245" MODIFIED="1430788165494">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *mapping_prev
    </p>
    <p>
      mapping_next, mapping_prev&#29992;&#20110;&#23558;mapping&#38142;&#25509;&#21040;&#25152;&#20851;&#32852;&#30340;host&#30340;host-&gt;mappings&#38142;&#34920;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_852258878" MODIFIED="1430432408568" TEXT=" struct ecm_db_connection_instance *from_connections"/>
<node CREATED="1430432408568" ID="ID_1511262287" MODIFIED="1430432408568" TEXT=" struct ecm_db_connection_instance *to_connections"/>
<node CREATED="1430432408568" ID="ID_1722805730" MODIFIED="1430432408568" TEXT=" struct ecm_db_connection_instance *from_nat_connections"/>
<node CREATED="1430432408568" ID="ID_1041226550" MODIFIED="1430432408568" TEXT=" struct ecm_db_connection_instance *to_nat_connections"/>
</node>
<node CREATED="1430432408568" ID="ID_231938406" MODIFIED="1430432408568" TEXT=" uint32_t time_added"/>
<node CREATED="1430432408568" FOLDED="true" ID="ID_1384880992" MODIFIED="1430876842819" TEXT=" struct ecm_db_host_instance *host">
<node BACKGROUND_COLOR="#ccccff" CREATED="1430786942344" ID="ID_1222088003" MODIFIED="1430787257594" TEXT=" struct ecm_db_host_instance *next"/>
<node BACKGROUND_COLOR="#ccccff" CREATED="1430786942344" ID="ID_719967224" MODIFIED="1430787312406">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_host_instance *prev
    </p>
    <p>
      next, prev&#29992;&#20110;&#23558;host&#38142;&#25509;&#21040;&#20840;&#23616;&#38142;&#34920;&#65306;struct ecm_db_host_instance *ecm_db_hosts
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430786942344" ID="ID_1387256496" MODIFIED="1430787406266" TEXT=" struct ecm_db_host_instance *hash_next"/>
<node BACKGROUND_COLOR="#ccffcc" CREATED="1430786942344" ID="ID_1279094834" MODIFIED="1430787406266">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_host_instance *hash_prev
    </p>
    <p>
      hash_next, hash_prev&#29992;&#20110;&#23558;host&#38142;&#25509;&#21040;&#20840;&#23616;hash&#34920;&#65306;struct ecm_db_host_instance *ecm_db_host_table [hash idx]
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" ID="ID_961471801" MODIFIED="1430787112344">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ip_addr_t address
    </p>
    <p>
      host&#30340;IP&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" ID="ID_186142595" MODIFIED="1430787540416">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool on_link
    </p>
    <p>
      true&#34920;&#31034;&#19981;&#38656;&#35201;&#36890;&#36807;&#32593;&#20851;&#23601;&#21487;&#20197;&#21040;&#36798;&#27492;host&#65292;&#21363;&#30452;&#36830;&#12290;false&#34920;&#31034;&#38656;&#35201;&#36890;&#36807;&#32593;&#20851;&#25165;&#21487;&#20197;&#21040;&#36798;&#27492;host&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" ID="ID_945014245" MODIFIED="1430787146622">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_mapping_instance *mappings
    </p>
    <p>
      &#20851;&#32852;&#21040;&#27492;host&#30340;mapping&#38142;&#34920;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" ID="ID_1550385118" MODIFIED="1430787163162">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int mapping_count
    </p>
    <p>
      &#19978;&#38754;mapping&#38142;&#34920;&#30340;&#38271;&#24230;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" ID="ID_1000939931" MODIFIED="1430786942344" TEXT=" uint32_t time_added"/>
<node CREATED="1430787591495" FOLDED="true" ID="ID_1208790716" MODIFIED="1430787647269" TEXT="&#x7edf;&#x8ba1;&#x4fe1;&#x606f;&#x5b57;&#x6bb5;">
<node CREATED="1430786942344" ID="ID_1630906978" MODIFIED="1430786942344" TEXT=" uint64_t from_data_total"/>
<node CREATED="1430786942344" ID="ID_1287949020" MODIFIED="1430786942344" TEXT=" uint64_t to_data_total"/>
<node CREATED="1430786942344" ID="ID_1614790802" MODIFIED="1430786942344" TEXT=" uint64_t from_packet_total"/>
<node CREATED="1430786942344" ID="ID_355367700" MODIFIED="1430786942344" TEXT=" uint64_t to_packet_total"/>
<node CREATED="1430786942344" ID="ID_1798620659" MODIFIED="1430786942344" TEXT=" uint64_t from_data_total_dropped"/>
<node CREATED="1430786942344" ID="ID_1852973614" MODIFIED="1430786942344" TEXT=" uint64_t to_data_total_dropped"/>
<node CREATED="1430786942344" ID="ID_109641999" MODIFIED="1430786942344" TEXT=" uint64_t from_packet_total_dropped"/>
<node CREATED="1430786942344" ID="ID_776184664" MODIFIED="1430786942344" TEXT=" uint64_t to_packet_total_dropped"/>
</node>
<node CREATED="1430786942344" ID="ID_744697397" MODIFIED="1430787075735">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_host_final_callback_t final
    </p>
    <p>
      &#24403;host&#30340;&#24341;&#29992;&#35745;&#25968;&#21464;&#20026;0&#23548;&#33268;host&#38656;&#35201;&#34987;&#38144;&#27585;&#26102;&#35843;&#29992;&#27492;&#22238;&#35843;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" ID="ID_658471303" MODIFIED="1430787091110">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void *arg
    </p>
    <p>
      &#19978;&#38754;final&#20989;&#25968;&#30340;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" ID="ID_1393738892" MODIFIED="1430786942344" TEXT=" uint32_t flags">
<node CREATED="1430787198439" ID="ID_46014837" MODIFIED="1430787199606" TEXT="ECM_DB_HOST_FLAGS_INSERTED"/>
</node>
<node CREATED="1430786942344" MODIFIED="1430786942344" TEXT=" int refs"/>
<node CREATED="1430786942344" ID="ID_1568208668" MODIFIED="1430787700573">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_host_hash_t hash_index
    </p>
    <p>
      &#38142;&#25509;&#21040;&#20840;&#23616;hash&#34920;&#65306;struct ecm_db_host_instance *ecm_db_host_table [hash idx]&#26102;&#25152;&#20351;&#29992;&#30340;hash&#20540;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430786942344" MODIFIED="1430786942344" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430432408568" ID="ID_1634175232" MODIFIED="1430787905154">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int port
    </p>
    <p>
      &#31471;&#21475;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430876430246" FOLDED="true" ID="ID_94000" MODIFIED="1430876847186" TEXT="connection&#x5f15;&#x7528;&#x8ba1;&#x6570;">
<node CREATED="1430432408568" ID="ID_387118945" MODIFIED="1430876810569">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int tcp_from
    </p>
    <p>
      &#34987;tcp connection&#24341;&#29992;&#20026;mapping_from&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_417226027" MODIFIED="1430876808428">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int tcp_to
    </p>
    <p>
      &#34987;tcp connection&#24341;&#29992;&#20026;mapping_to&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_638515726" MODIFIED="1430876805858">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int udp_from
    </p>
    <p>
      &#34987;udp connection&#24341;&#29992;&#20026;mapping_from&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_1476597417" MODIFIED="1430876803577">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int udp_to
    </p>
    <p>
      &#34987;udp connection&#24341;&#29992;&#20026;mapping_to&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_74679235" MODIFIED="1430876801202">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int tcp_nat_from
    </p>
    <p>
      &#34987;tcp connection&#24341;&#29992;&#20026;mapping_nat_from&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_597651126" MODIFIED="1430876798819">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int tcp_nat_to
    </p>
    <p>
      &#34987;tcp connection&#24341;&#29992;&#20026;mapping_nat_to&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_98119032" MODIFIED="1430876796272">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int udp_nat_from
    </p>
    <p>
      &#34987;udp connection&#24341;&#29992;&#20026;mapping_nat_from&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_1054430130" MODIFIED="1430876793663">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int udp_nat_to
    </p>
    <p>
      &#34987;udp connection&#24341;&#29992;&#20026;mapping_nat_to&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_172956563" MODIFIED="1430876791491">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int from
    </p>
    <p>
      &#34987;tcp&#25110;udp connection&#24341;&#29992;&#20026;mapping_from&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_1566625825" MODIFIED="1430876789663">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int to
    </p>
    <p>
      &#34987;tcp&#25110;udp connection&#24341;&#29992;&#20026;mapping_to&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408568" ID="ID_185841663" MODIFIED="1430876787467">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int nat_from
    </p>
    <p>
      &#34987;tcp&#25110;udp connection&#24341;&#29992;&#20026;mapping_from_nat&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408569" ID="ID_1840656085" MODIFIED="1430876784335">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int nat_to
    </p>
    <p>
      &#34987;tcp&#25110;udp connection&#24341;&#29992;&#20026;mapping_to_nat&#30340;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430786661096" FOLDED="true" ID="ID_268971268" MODIFIED="1430876848866" TEXT="&#x7edf;&#x8ba1;&#x4fe1;&#x606f;&#x5b57;&#x6bb5;">
<node CREATED="1430432408569" ID="ID_1948073078" MODIFIED="1430432408569" TEXT=" uint64_t from_data_total"/>
<node CREATED="1430432408569" ID="ID_388865495" MODIFIED="1430432408569" TEXT=" uint64_t to_data_total"/>
<node CREATED="1430432408569" ID="ID_1593687266" MODIFIED="1430432408569" TEXT=" uint64_t from_packet_total"/>
<node CREATED="1430432408569" ID="ID_428025852" MODIFIED="1430432408569" TEXT=" uint64_t to_packet_total"/>
<node CREATED="1430432408569" ID="ID_1643212384" MODIFIED="1430432408569" TEXT=" uint64_t from_data_total_dropped"/>
<node CREATED="1430432408569" ID="ID_1319174925" MODIFIED="1430432408569" TEXT=" uint64_t to_data_total_dropped"/>
<node CREATED="1430432408569" ID="ID_749941446" MODIFIED="1430432408569" TEXT=" uint64_t from_packet_total_dropped"/>
<node CREATED="1430432408569" ID="ID_498458035" MODIFIED="1430432408569" TEXT=" uint64_t to_packet_total_dropped"/>
</node>
<node CREATED="1430432408569" ID="ID_12083298" MODIFIED="1430787003797">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_db_mapping_final_callback_t final
    </p>
    <p>
      &#24403;mapping&#30340;&#24341;&#29992;&#35745;&#25968;&#21464;&#20026;0&#23548;&#33268;mapping&#38656;&#35201;&#34987;&#38144;&#27585;&#26102;&#35843;&#29992;&#27492;&#22238;&#35843;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408569" ID="ID_165324377" MODIFIED="1430787019805">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void *arg
    </p>
    <p>
      &#19978;&#38754;final&#20989;&#25968;&#30340;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430432408569" FOLDED="true" ID="ID_322869494" MODIFIED="1430876852077" TEXT=" uint32_t flags">
<node CREATED="1430787934278" ID="ID_1094674728" MODIFIED="1430787934873" TEXT="ECM_DB_MAPPING_FLAGS_INSERTED"/>
</node>
<node CREATED="1430432408569" ID="ID_145794675" MODIFIED="1430432408569" TEXT=" int refs"/>
<node CREATED="1430432408569" ID="ID_1072860761" MODIFIED="1430432408569" TEXT=" ecm_db_mapping_hash_t hash_index"/>
<node CREATED="1430432408569" ID="ID_1240296650" MODIFIED="1430432408569" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430432558231" FOLDED="true" ID="ID_796270724" MODIFIED="1431039171165" TEXT="struct ecm_db_node_instance">
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_node_instance *next"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_node_instance *prev"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_node_instance *hash_next"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_node_instance *hash_prev"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint8_t address[ETH_ALEN]"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_connection_instance *from_connections"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_connection_instance *to_connections"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" int from_connections_count"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" int to_connections_count"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_connection_instance *from_nat_connections"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_connection_instance *to_nat_connections"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" int from_nat_connections_count"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" int to_nat_connections_count"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint32_t time_added"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t from_data_total"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t to_data_total"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t from_packet_total"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t to_packet_total"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t from_data_total_dropped"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t to_data_total_dropped"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t from_packet_total_dropped"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" uint64_t to_packet_total_dropped"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_iface_instance *iface"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_node_instance *node_next"/>
<node CREATED="1430433148171" MODIFIED="1430433148171" TEXT=" struct ecm_db_node_instance *node_prev"/>
<node CREATED="1430433148172" MODIFIED="1430433148172" TEXT=" ecm_db_node_final_callback_t final"/>
<node CREATED="1430433148172" MODIFIED="1430433148172" TEXT=" void *arg"/>
<node CREATED="1430433148172" MODIFIED="1430433148172" TEXT=" uint8_t flags"/>
<node CREATED="1430433148172" MODIFIED="1430433148172" TEXT=" int refs"/>
<node CREATED="1430433148172" MODIFIED="1430433148172" TEXT=" ecm_db_node_hash_t hash_index"/>
<node CREATED="1430433148172" MODIFIED="1430433148172" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430767762677" FOLDED="true" ID="ID_439348915" MODIFIED="1431039178812" TEXT="classifier">
<node CREATED="1430767530976" ID="ID_1221809400" MODIFIED="1430767547127">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_front_end_nat_3.PNG" />
  </body>
</html></richcontent>
<node CREATED="1430768211991" FOLDED="true" ID="ID_120900473" MODIFIED="1430958334764" TEXT="struct ecm_classifier_default_internal_instance">
<node CREATED="1430768417564" FOLDED="true" ID="ID_259031355" MODIFIED="1430958329584" TEXT=" struct ecm_classifier_default_instance base">
<node CREATED="1430768417564" ID="ID_542867201" LINK="#ID_337856440" MODIFIED="1430768859418" TEXT=" struct ecm_classifier_instance base"/>
<node CREATED="1430768417564" ID="ID_179221223" MODIFIED="1430768417564" TEXT=" ecm_classifier_default_process_callback_t process"/>
<node CREATED="1430768417564" ID="ID_1998492353" MODIFIED="1430768417564" TEXT=" ecm_classifier_default_timer_group_change_callback_t timer_group_change"/>
<node CREATED="1430768417564" ID="ID_492435083" LINK="#ID_1542892886" MODIFIED="1430768824757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_default_tracker_get_and_ref_callback_t tracker_get_and_ref
    </p>
    <p>
      &#36820;&#22238;&#20851;&#32852;&#21040;&#26412;connection&#30340;tracker
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430768417564" ID="ID_1647298074" MODIFIED="1430891256024">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t ci_serial
    </p>
    <p>
      &#36830;&#25509;&#30340;&#24207;&#21015;&#21495;&#65306;connection-&gt;serial&#65292;&#19968;&#33324;&#29992;&#27492;&#24207;&#21015;&#21495;&#25214;&#21040;&#23545;&#24212;&#30340;connection&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430768417564" ID="ID_919739632" MODIFIED="1430768417564" TEXT=" struct ecm_classifier_process_response process_response"/>
<node CREATED="1430768417564" MODIFIED="1430768417564" TEXT=" ecm_db_timer_group_t timer_group"/>
<node CREATED="1430768417564" ID="ID_152713387" MODIFIED="1430768417564" TEXT=" ecm_tracker_sender_type_t ingress_sender"/>
<node CREATED="1430768417564" ID="ID_1009725685" MODIFIED="1430768417564" TEXT=" ecm_tracker_sender_type_t egress_sender"/>
<node CREATED="1430768417564" ID="ID_1542892886" LINK="#ID_1067230419" MODIFIED="1430769873307">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_tracker_instance *ti
    </p>
    <p>
      &#20851;&#32852;&#21040;&#26412;connection&#30340;tracker
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430768417564" ID="ID_1022032023" MODIFIED="1430768417564" TEXT=" bool tracking"/>
<node CREATED="1430768417564" MODIFIED="1430768417564" TEXT=" int refs"/>
<node CREATED="1430768417564" MODIFIED="1430768417564" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430768915120" FOLDED="true" ID="ID_1737494375" MODIFIED="1430775391427" TEXT="struct ecm_tracker_tcp_internal_instance">
<node CREATED="1430769480411" FOLDED="true" ID="ID_487380218" MODIFIED="1430775378419" TEXT=" struct ecm_tracker_tcp_instance tcp_base">
<node CREATED="1430769480411" ID="ID_370867588" LINK="#ID_1067230419" MODIFIED="1430773958878" TEXT=" struct ecm_tracker_instance base"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_bytes_avail_get_method_t bytes_avail_get"/>
<node CREATED="1430769480411" ID="ID_1764875242" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_bytes_read_method_t bytes_read"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_bytes_discard_method_t bytes_discard"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_mss_get_method_t mss_get"/>
<node CREATED="1430769480411" ID="ID_1492512477" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_segment_add_method_t segment_add"/>
</node>
<node CREATED="1430769480411" FOLDED="true" ID="ID_372045970" MODIFIED="1430769495069" TEXT=" struct ecm_tracker_tcp_host_data sender_data[ECM_TRACKER_SENDER_MAX]">
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint16_t mss"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" bool mss_seen"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint32_t seq_no"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint32_t num_seqs"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" bool seq_no_valid"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *recvd_order"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *recvd_order_last"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t recvd_bytes_total"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t recvd_count"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *in_order"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *in_order_last"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t in_order_count"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *future"/>
</node>
<node CREATED="1430769480411" FOLDED="true" ID="ID_1710754019" MODIFIED="1430769497605" TEXT=" struct ecm_tracker_tcp_sender_state sender_states[ECM_TRACKER_SENDER_MAX]">
<node CREATED="1430769480411" FOLDED="true" ID="ID_1888820484" MODIFIED="1430769496711" TEXT=" ecm_tracker_sender_state_t state">
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_UNKNOWN"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_ESTABLISHING"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_ESTABLISHED"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_CLOSING"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_CLOSED"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_FAULT"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_MAX"/>
</node>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint32_t syn_seq"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint32_t fin_seq"/>
</node>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t data_limit"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int refs"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" spinlock_t lock"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430769568420" FOLDED="true" ID="ID_1858241882" MODIFIED="1430769821382" TEXT="struct ecm_tracker_udp_internal_instance">
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" struct ecm_tracker_udp_instance udp_base">
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" struct ecm_tracker_instance base"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_udp_data_read_method_t data_read"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_udp_data_size_get_method_t data_size_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_udp_datagram_add_method_t datagram_add"/>
</node>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" struct sk_buff *src_recvd_order"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" struct sk_buff *src_recvd_order_last"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" int32_t src_count"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" int32_t src_bytes_total"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" struct sk_buff *dest_recvd_order"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" struct sk_buff *dest_recvd_order_last"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" int32_t dest_count"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" int32_t dest_bytes_total"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" int32_t data_limit"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_sender_state_t sender_state[ECM_TRACKER_SENDER_MAX]"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_db_timer_group_t timer_group"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" spinlock_t lock"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" int refs"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" uint16_t magic"/>
</node>
<node CREATED="1430769480411" FOLDED="true" ID="ID_1067230419" MODIFIED="1430958311365" TEXT=" struct ecm_tracker_instance base">
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_data_total_get_method_t data_total_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_data_limit_get_method_t data_limit_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_data_limit_set_method_t data_limit_set"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_count_get_method_t datagram_count_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_discard_method_t datagram_discard"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_size_get_method_t datagram_size_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_read_method_t datagram_read"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_add_method_t datagram_add"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_discard_all_method_t discard_all"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_state_update_method_t state_update"/>
<node CREATED="1430769802577" ID="ID_741685734" MODIFIED="1430769802577" TEXT=" ecm_tracker_state_get_method_t state_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_xml_state_get_callback_t xml_state_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_ref_method_t ref"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_deref_method_t deref"/>
</node>
</node>
<node CREATED="1430433148172" FOLDED="true" ID="ID_337856440" MODIFIED="1430958303639" TEXT="struct ecm_classifier_instance">
<node BACKGROUND_COLOR="#00cc99" CREATED="1430433148172" ID="ID_730676662" LINK="#ID_521408019" MODIFIED="1430766042959">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_classifier_instance *ca_next
    </p>
    <p>
      &#29992;&#20110;&#23558;classifier&#38142;&#20837;connection&#30340;assignments&#38142;&#34920;
    </p>
  </body>
</html></richcontent>
</node>
<node BACKGROUND_COLOR="#00cc99" CREATED="1430433148172" ID="ID_448929409" LINK="#ID_521408019" MODIFIED="1430766051711">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_classifier_instance *ca_prev
    </p>
    <p>
      &#29992;&#20110;&#23558;classifier&#38142;&#20837;connection&#30340;assignments&#38142;&#34920;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_1677805237" MODIFIED="1430958289412">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_process_callback_t process
    </p>
    <p>
      &#22312;postrouting hook&#20013;&#35843;&#29992;&#27492;&#20989;&#25968;&#29992;&#20110;&#32473;&#20986;&#36830;&#25509;&#30340;&#30828;&#20214;&#21152;&#36895;&#20915;&#23450;&#21644;QOS&#20915;&#23450;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_1064544325" MODIFIED="1430956255470">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_sync_from_v4_callback_t sync_from_v4
    </p>
    <p>
      &#21019;&#24314;&#22909;&#28040;&#24687;&#21518;&#65292;&#30495;&#27491;&#21457;&#36865;&#32473;NSS firmware&#20043;&#21069;&#65292;&#25226;&#27492;&#28040;&#24687;&#20256;&#32473;classifier&#65292;&#20197;&#20415;&#35753;classifier&#26377;&#26426;&#20250;&#23545;&#28040;&#24687;&#36827;&#34892;&#26356;&#25913;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_391554807" MODIFIED="1430956861738">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_sync_to_v4_callback_t sync_to_v4
    </p>
    <p>
      &#25910;&#21040;sync&#28040;&#24687;&#21518;&#65292;&#23558;&#28040;&#24687;&#20256;&#32473;classifier&#65292;&#20197;&#20415;&#35753;classifier&#20063;&#26377;&#26426;&#20250;&#20102;&#35299;&#36830;&#25509;&#30340;&#32479;&#35745;&#20449;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_717528378" MODIFIED="1430957714424">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_sync_from_v6_callback_t sync_from_v6
    </p>
    <p>
      &#21019;&#24314;&#22909;&#28040;&#24687;&#21518;&#65292;&#30495;&#27491;&#21457;&#36865;&#32473;NSS firmware&#20043;&#21069;&#65292;&#25226;&#27492;&#28040;&#24687;&#20256;&#32473;classifier&#65292;&#20197;&#20415;&#35753;classifier&#26377;&#26426;&#20250;&#23545;&#28040;&#24687;&#36827;&#34892;&#26356;&#25913;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_1443116792" MODIFIED="1430957727503">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_sync_to_v6_callback_t sync_to_v6
    </p>
    <p>
      &#25910;&#21040;sync&#28040;&#24687;&#21518;&#65292;&#23558;&#28040;&#24687;&#20256;&#32473;classifier&#65292;&#20197;&#20415;&#35753;classifier&#20063;&#26377;&#26426;&#20250;&#20102;&#35299;&#36830;&#25509;&#30340;&#32479;&#35745;&#20449;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_1551208337" MODIFIED="1430957742315">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_type_get_callback_t type_get
    </p>
    <p>
      &#33719;&#21462;classifier&#30340;&#31867;&#22411;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_679288317" MODIFIED="1430957830354">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_reclassify_allowed_get_callback_t reclassify_allowed
    </p>
    <p>
      &#24403;classifier_generation&#21464;&#21270;&#21518;&#26159;&#21542;&#20801;&#35768;&#37325;&#26032;&#20998;&#31867;&#35782;&#21035;&#65292;&#21363;&#37325;&#26032;&#20570;&#20986;&#30828;&#20214;&#21152;&#36895;&#20915;&#23450;&#21644;QOS&#20915;&#23450;
    </p>
  </body>
</html></richcontent>
<arrowlink DESTINATION="ID_679288317" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1684698799" STARTARROW="None" STARTINCLINATION="0;0;"/>
</node>
<node CREATED="1430433148172" ID="ID_1260264562" LINK="#ID_614088399" MODIFIED="1430957887807">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_classifier_reclassify_callback_t reclassify
    </p>
    <p>
      classifier_generation&#21464;&#21270;&#21518;&#37325;&#26032;&#20998;&#31867;&#35782;&#21035;&#65292;&#21363;&#37325;&#26032;&#20570;&#20986;&#30828;&#20214;&#21152;&#36895;&#20915;&#23450;&#21644;QOS&#20915;&#23450;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_889204368" MODIFIED="1430433148172" TEXT=" ecm_classifier_last_process_response_get_callback_t last_process_response_get"/>
<node CREATED="1430433148172" ID="ID_1280844525" MODIFIED="1430433148172" TEXT=" ecm_classifier_xml_state_get_callback_t xml_state_get"/>
<node CREATED="1430433148172" ID="ID_89675490" MODIFIED="1430433148172" TEXT=" ecm_classifier_ref_method_t ref"/>
<node CREATED="1430433148172" ID="ID_72856808" MODIFIED="1430433148172" TEXT=" ecm_classifier_deref_callback_t deref"/>
</node>
</node>
<node CREATED="1430433148172" FOLDED="true" ID="ID_409008887" MODIFIED="1432941881468">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct ecm_front_end_connection_instance
    </p>
    <p>
      front_end_connection&#20027;&#35201;&#36127;&#36131;&#19982;&#30828;&#20214;&#21152;&#36895;&#22120;&#30340;&#20132;&#20114;&#65292;
    </p>
    <p>
      &#27604;&#22914;&#28155;&#21152;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;&#26159;&#21542;&#25104;&#21151;&#65292;&#26159;&#21542;&#38656;&#35201;&#35299;&#38500;&#30828;&#20214;&#21152;&#36895;
    </p>
  </body>
</html></richcontent>
<node CREATED="1431039541089" ID="ID_514128006" MODIFIED="1431039562659">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_front_end_nat_6.PNG" />
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148172" ID="ID_1375540583" MODIFIED="1430433148172" TEXT=" ecm_front_end_connection_ref_method_t ref"/>
<node CREATED="1430433148172" ID="ID_1381307288" MODIFIED="1430433148172" TEXT=" ecm_front_end_connection_deref_callback_t deref"/>
<node CREATED="1430433148172" ID="ID_109798040" MODIFIED="1431040381431">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_front_end_connection_decelerate_method_t decelerate
    </p>
    <p>
      &#22312;&#30828;&#20214;&#20013;&#21024;&#38500;connection&#23545;&#24212;&#30340;&#21152;&#36895;&#26465;&#30446;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" ID="ID_93117877" MODIFIED="1430433148173" TEXT=" ecm_front_end_connection_accel_state_get_method_t accel_state_get"/>
<node CREATED="1430433148173" ID="ID_1515511763" MODIFIED="1430433148173" TEXT=" ecm_front_end_connection_action_seen_method_t action_seen"/>
<node CREATED="1430433148173" ID="ID_126164764" MODIFIED="1430433148173" TEXT=" ecm_front_end_connection_accel_ceased_method_t accel_ceased"/>
<node CREATED="1430433148173" ID="ID_1452116975" MODIFIED="1430433148173" TEXT=" ecm_front_end_connection_xml_state_get_callback_t xml_state_get"/>
<node CREATED="1430433148173" FOLDED="true" ID="ID_261171009" MODIFIED="1431149490488" TEXT=" struct ecm_front_end_connection_mode_stats stats">
<node CREATED="1430433148173" FOLDED="true" ID="ID_213021450" MODIFIED="1431129506831">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool decelerate_pending
    </p>
    <p>
      ecm&#24050;&#32463;&#21521;nss firmware&#21457;&#20986;&#21152;&#36895;&#26576;&#20010;connection&#30340;&#28040;&#24687;&#65292;&#20294;&#26159;&#36824;&#27809;&#26377;&#25910;&#21040;&#22238;&#24212;
    </p>
    <p>
      &#27492;&#26102;ecm&#20934;&#22791;&#21462;&#28040;&#23545;&#36825;&#20010;connection&#30340;&#30828;&#20214;&#21152;&#36895;&#65292;&#20294;&#26159;&#21069;&#38754;&#21457;&#20986;&#30340;&#21629;&#20196;&#36824;&#27809;&#26377;&#24471;&#21040;&#22238;&#24212;&#65292;&#25152;&#20197;&#26242;&#26102;&#19981;&#33021;&#21521;nss firmware&#21457;&#20986;&#21462;&#28040;&#21152;&#36895;&#30340;&#28040;&#24687;&#65292;&#21363;&#38656;&#35201;pending&#27492;decelerate&#30340;&#28040;&#24687;&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1431064152997" ID="ID_402246718" MODIFIED="1431064173868">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_front_end_nat_7.PNG" />
  </body>
</html></richcontent>
</node>
<node CREATED="1431064193475" ID="ID_1186817433" MODIFIED="1431064251754">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_front_end_nat_8.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430433148173" ID="ID_1769624227" MODIFIED="1431041163998">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool flush_happened
    </p>
    <p>
      &#20174;nss firmware&#25910;&#21040;&#20102;NSS_IPV4_SYNC_REASON_FLUSH&#28040;&#24687;&#65292;
    </p>
    <p>
      &#20063;&#23601;&#26159;NSS firmware&#22312;&#27809;&#26377;&#25910;&#21040;ecm&#25351;&#20196;&#30340;&#24773;&#20917;&#19979;&#33258;&#24049;&#21024;&#38500;&#20102;connection&#30340;&#21152;&#36895;&#26465;&#30446;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" ID="ID_1923048407" MODIFIED="1430433148173" TEXT=" uint32_t flush_happened_total"/>
<node CREATED="1430433148173" ID="ID_648775628" MODIFIED="1430433148173" TEXT=" uint32_t no_action_seen_total"/>
<node CREATED="1430433148173" ID="ID_1143022971" MODIFIED="1430433148173" TEXT=" uint32_t no_action_seen"/>
<node CREATED="1430433148173" ID="ID_626536479" MODIFIED="1430433148173" TEXT=" uint32_t no_action_seen_limit"/>
<node CREATED="1430433148173" ID="ID_1444793635" MODIFIED="1430959006543">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t driver_fail_total
    </p>
    <p>
      &#19982;nss firmware&#36890;&#20449;&#26102;&#65292;&#39537;&#21160;&#36820;&#22238;&#22833;&#36133;&#30340;&#24635;&#27425;&#25968;
    </p>
    <p>
      &#20165;&#20316;debug&#32479;&#35745;&#26174;&#31034;&#20043;&#29992;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" ID="ID_1273852177" MODIFIED="1430959597073">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t driver_fail
    </p>
    <p>
      &#19982;nss firmware&#36890;&#20449;&#26102;(&#28155;&#21152;&#65292;&#21024;&#38500;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;)&#65292;&#39537;&#21160;&#36820;&#22238;&#22833;&#36133;&#30340;&#27425;&#25968;
    </p>
    <p>
      &#36890;&#20449;&#25104;&#21151;&#21518;&#65292;&#27492;&#20540;&#34987;&#28165;0
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" FOLDED="true" ID="ID_1875945954" LINK="#ID_614462130" MODIFIED="1431064285929">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t driver_fail_limit
    </p>
    <p>
      &#26368;&#22810;&#20801;&#35768;&#22810;&#23569;&#27425;&#39537;&#21160;&#22833;&#36133;&#65292;&#24403;&#22833;&#36133;&#27425;&#25968;&#36229;&#36807;&#27492;&#38480;&#21046;&#21518;front_end_connection-&gt;accel_mode&#34987;&#35774;&#32622;&#20026;ECM_FRONT_END_ACCELERATION_MODE_FAIL_DRIVER&#65292;&#36825;&#23558;&#20572;&#27490;&#23581;&#35797;&#32487;&#32493;&#19982;nss firmware&#36890;&#20449;
    </p>
    <p>
      
    </p>
    <p>
      &#24403;&#22833;&#36133;&#27425;&#25968;&#27809;&#26377;&#36229;&#36807;&#27492;&#38480;&#21046;&#26102;&#23558;front_end_connection-&gt;accel_mode&#35774;&#32622;&#20026;ECM_FRONT_END_ACCELERATION_MODE_DECEL&#65292;&#20197;&#20801;&#35768;&#32487;&#32493;&#19982;nss firmware&#36890;&#20449;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430960289886" ID="ID_1192240652" MODIFIED="1430960329464" TEXT="ecm_front_end_ipv4_connection_tcp_front_end_accelerate()">
<node CREATED="1430960330494" ID="ID_437217763" MODIFIED="1430960332643" TEXT="ecm_front_end_ipv4_accel_pending_set()">
<node CREATED="1430960355172" ID="ID_1844429466" MODIFIED="1430960370736">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if (ECM_FRONT_END_ACCELERATION_FAILED(feci-&gt;accel_mode))
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;return false
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1430433148173" ID="ID_674569564" MODIFIED="1430960729669">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t nss_nack_total
    </p>
    <p>
      &#25910;&#21040;&#30828;&#20214;&#21152;&#36895;&#22833;&#36133;&#30340;&#22238;&#24212;&#30340;&#24635;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" ID="ID_1068887529" MODIFIED="1430960935734">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t nss_nack
    </p>
    <p>
      &#25910;&#21040;&#30828;&#20214;&#21152;&#36895;&#22833;&#36133;&#30340;&#22238;&#24212;&#30340;&#27425;&#25968;&#65292;&#36890;&#20449;&#25104;&#21151;&#21518;&#27492;&#20540;&#34987;&#28165;0
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" FOLDED="true" ID="ID_300583774" LINK="#ID_614462130" MODIFIED="1431064288280">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t nss_nack_limit
    </p>
    <p>
      &#26368;&#22810;&#20801;&#35768;&#22810;&#23569;&#27425;&#22833;&#36133;&#30340;&#22238;&#24212;&#65292;&#24403;&#22833;&#36133;&#27425;&#25968;&#36229;&#36807;&#27492;&#38480;&#21046;&#21518;front_end_connection-&gt;accel_mode&#34987;&#35774;&#32622;&#20026;ECM_FRONT_END_ACCELERATION_MODE_FAIL_NSS&#65292;&#36825;&#23558;&#20572;&#27490;&#23581;&#35797;&#32487;&#32493;&#19982;nss firmware&#36890;&#20449;
    </p>
    <p>
      
    </p>
    <p>
      &#24403;&#22833;&#36133;&#27425;&#25968;&#27809;&#26377;&#36229;&#36807;&#27492;&#38480;&#21046;&#26102;&#23558;front_end_connection-&gt;accel_mode&#35774;&#32622;&#20026;ECM_FRONT_END_ACCELERATION_MODE_DECEL&#65292;&#20197;&#20801;&#35768;&#32487;&#32493;&#19982;nss firmware&#36890;&#20449;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430960289886" ID="ID_249386582" MODIFIED="1430960329464" TEXT="ecm_front_end_ipv4_connection_tcp_front_end_accelerate()">
<node CREATED="1430960330494" ID="ID_1293885287" MODIFIED="1430960332643" TEXT="ecm_front_end_ipv4_accel_pending_set()">
<node CREATED="1430960355172" ID="ID_92787584" MODIFIED="1430960370736">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if (ECM_FRONT_END_ACCELERATION_FAILED(feci-&gt;accel_mode))
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;return false
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1430433148173" ID="ID_470924163" MODIFIED="1430954521007">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;unsigned long cmd_time_begun
    </p>
    <p>
      &#28155;&#21152;&#65292;&#21024;&#38500;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;&#30340;&#28040;&#24687;&#21457;&#36865;&#32473;NSS firmware&#30340;&#26102;&#38388;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" ID="ID_1373320068" MODIFIED="1431039960964">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;unsigned long cmd_time_completed
    </p>
    <p>
      &#28155;&#21152;&#65292;&#21024;&#38500;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;&#26102;&#25910;&#21040;NSS firmware&#30340;&#22238;&#24212;&#30340;&#26102;&#38388;&#65292;&#27880;&#24847;&#36825;&#37324;&#30340;&#22238;&#24212;&#21487;&#33021;&#26159;&#25104;&#21151;&#20063;&#21487;&#33021;&#26159;&#22833;&#36133;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430433148173" ID="ID_1575690946" MODIFIED="1430952307797">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_db_connection_instance *ci
    </p>
    <p>
      &#20851;&#32852;&#30340;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" ID="ID_902852176" MODIFIED="1430433148173" TEXT=" bool can_accel"/>
<node CREATED="1430433148173" ID="ID_190790880" MODIFIED="1431040272893">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool is_defunct
    </p>
    <p>
      true&#34920;&#31034;ecm&#24050;&#32463;&#21457;&#36865;&#20102;&#19968;&#20010;&#28040;&#24687;&#32473;NSS firmware&#65292;&#35201;&#22312;&#30828;&#20214;&#20013;&#21024;&#38500;connection&#23545;&#24212;&#30340;&#21152;&#36895;&#26465;&#30446;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430433148173" FOLDED="true" ID="ID_614462130" MODIFIED="1430960303027">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_front_end_acceleration_mode_t accel_mode
    </p>
    <p>
      &#21482;&#35201;accel_mode&#19981;&#26159;ECM_FRONT_END_ACCELERATION_MODE_DECEL&#65292;&#21017;&#34920;&#31034;&#24050;&#32463;&#22788;&#29702;&#36807;&#20102;&#36830;&#25509;&#65292;
    </p>
    <p>
      &#25110;&#25104;&#21151;&#65292;&#25110;&#22833;&#36133;&#65292;&#25110;&#27491;&#22312;&#22788;&#29702;&#20013;&#65292;&#25152;&#20197;&#19981;&#20877;&#22788;&#29702;&#27492;&#36830;&#25509;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430952331045" ID="ID_681639246" MODIFIED="1430952331784" TEXT="ECM_FRONT_END_ACCELERATION_MODE_FAIL_DEFUNCT"/>
<node CREATED="1430952339500" ID="ID_787144658" MODIFIED="1430952341198" TEXT="ECM_FRONT_END_ACCELERATION_MODE_FAIL_DECEL"/>
<node CREATED="1430952346410" ID="ID_811144560" MODIFIED="1430952348777" TEXT="ECM_FRONT_END_ACCELERATION_MODE_FAIL_NO_ACTION"/>
<node CREATED="1430952353254" ID="ID_91382517" MODIFIED="1430952353769" TEXT="ECM_FRONT_END_ACCELERATION_MODE_FAIL_NSS"/>
<node CREATED="1430952359495" ID="ID_261124382" MODIFIED="1430952361164" TEXT="ECM_FRONT_END_ACCELERATION_MODE_FAIL_DRIVER"/>
<node CREATED="1430952369201" ID="ID_1521319622" MODIFIED="1430952370692" TEXT="ECM_FRONT_END_ACCELERATION_MODE_FAIL_RULE"/>
<node CREATED="1430952380244" ID="ID_1949489110" MODIFIED="1430952380888" TEXT="ECM_FRONT_END_ACCELERATION_MODE_FAIL_DENIED"/>
<node CREATED="1430952388544" ID="ID_1963802089" MODIFIED="1430953261259">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_FRONT_END_ACCELERATION_MODE_DECEL
    </p>
    <p>
      &#36830;&#25509;&#36824;&#27809;&#26377;&#34987;&#30828;&#20214;&#21152;&#36895;&#65292;&#36825;&#26159;&#36830;&#25509;&#34987;&#21019;&#24314;&#26102;&#30340;&#40664;&#35748;&#20540;&#65292;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430952399391" ID="ID_987545292" MODIFIED="1430952805208">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_FRONT_END_ACCELERATION_MODE_ACCEL_PENDING
    </p>
    <p>
      &#27491;&#22312;&#20934;&#22791;&#21152;&#36895;&#65292;&#20063;&#23601;&#26159;&#35828;&#21019;&#24314;&#21152;&#36895;&#26465;&#30446;&#30340;&#28040;&#24687;&#24050;&#32463;&#21457;&#32473;&#20102;NSS firmware&#65292;&#20294;&#26159;&#36824;&#27809;&#26377;&#25910;&#21040;&#22238;&#22797;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430952409210" ID="ID_782145802" MODIFIED="1430952411898" TEXT="ECM_FRONT_END_ACCELERATION_MODE_ACCEL"/>
<node CREATED="1430952417655" ID="ID_372275603" MODIFIED="1430952418300" TEXT="ECM_FRONT_END_ACCELERATION_MODE_DECEL_PENDING"/>
</node>
<node CREATED="1430433148173" ID="ID_476039547" MODIFIED="1430433148173" TEXT=" spinlock_t lock"/>
<node CREATED="1430433148173" ID="ID_1985976717" MODIFIED="1430433148173" TEXT=" int refs"/>
</node>
<node CREATED="1430433612109" ID="ID_1831218308" MODIFIED="1431544163375" TEXT="struct nss_ipv4_msg">
<node CREATED="1430434285487" ID="ID_1843063339" MODIFIED="1430434285487" TEXT=" struct nss_cmn_msg cm"/>
<node CREATED="1430434285487" FOLDED="true" ID="ID_734655247" MODIFIED="1432941099430" TEXT="union msg">
<node CREATED="1430434285487" FOLDED="true" ID="ID_494722410" MODIFIED="1431504806003">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct nss_ipv4_rule_create_msg rule_create
    </p>
    <p>
      create rule&#20013;&#30340;&#25152;&#26377;&#20449;&#24687;&#37117;&#26159;&#31449;&#22312;&#36830;&#25509;&#21457;&#36215;&#32773;&#30340;&#35282;&#24230;&#30475;&#21040;&#30340;&#65292;&#20063;&#23601;&#26159;original&#30340;&#35282;&#24230;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430434285487" FOLDED="true" ID="ID_1688219173" MODIFIED="1431497793526">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint16_t valid_flags
    </p>
    <p>
      &#25351;&#26126;struct nss_ipv4_rule_create_msg&#32467;&#26500;&#20013;&#21738;&#20123;&#22495;&#26159;&#26377;&#25928;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430437807775" ID="ID_1291902107" MODIFIED="1430438066337">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_CREATE_CONN_VALID
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430437930017" ID="ID_1194082427" MODIFIED="1430437930666" TEXT="NSS_IPV4_RULE_CREATE_TCP_VALID"/>
<node CREATED="1430437938961" ID="ID_1753304683" MODIFIED="1430437939737" TEXT="NSS_IPV4_RULE_CREATE_PPPOE_VALID"/>
<node CREATED="1430437949009" ID="ID_903084329" MODIFIED="1430437949596" TEXT="NSS_IPV4_RULE_CREATE_QOS_VALID"/>
<node CREATED="1430437957423" ID="ID_1210951923" MODIFIED="1430437958143" TEXT="NSS_IPV4_RULE_CREATE_VLAN_VALID"/>
<node CREATED="1430437968607" ID="ID_191976864" MODIFIED="1430437969212" TEXT="NSS_IPV4_RULE_CREATE_DSCP_MARKING_VALID"/>
<node CREATED="1430437978009" ID="ID_836809635" MODIFIED="1430437978697" TEXT="NSS_IPV4_RULE_CREATE_VLAN_MARKING_VALID"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_1485970693" MODIFIED="1431497796773" TEXT=" uint16_t rule_flags">
<node CREATED="1430506579307" ID="ID_1160836789" MODIFIED="1430506656831">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_CREATE_FLAG_NO_SEQ_CHECK
    </p>
    <p>
      &#19981;&#23545;TCP&#27969;&#36827;&#34892;&#24207;&#21015;&#21495;&#26816;&#26597;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430506589571" ID="ID_1112989486" MODIFIED="1430506756706">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_CREATE_FLAG_BRIDGE_FLOW
    </p>
    <p>
      &#26412;&#28040;&#24687;&#25152;&#21019;&#24314;&#30340;&#27969;&#26159;bridge&#30340;&#27969;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430506597737" ID="ID_518838225" MODIFIED="1430506769745">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_CREATE_FLAG_ROUTED
    </p>
    <p>
      &#26412;&#28040;&#24687;&#25152;&#21019;&#24314;&#30340;&#27969;&#26159;route&#30340;&#27969;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430506606193" ID="ID_1173468084" MODIFIED="1430516513563">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_CREATE_FLAG_DSCP_MARKING
    </p>
    <p>
      &#38656;&#35201;&#20462;&#25913;&#26412;&#26465;&#27969;&#30340;dscp
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430506614257" ID="ID_1192395245" MODIFIED="1430506614733" TEXT="NSS_IPV4_RULE_CREATE_FLAG_VLAN_MARKING"/>
<node CREATED="1430506622641" ID="ID_881267884" MODIFIED="1430506623226" TEXT="NSS_IPV4_RULE_UPDATE_FLAG_CHANGE_MTU"/>
<node CREATED="1430506631171" ID="ID_627172449" MODIFIED="1430506631795" TEXT="NSS_IPV4_RULE_CREATE_FLAG_ICMP_NO_CME_FLUSH"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_923105938" MODIFIED="1431501473268" TEXT=" struct nss_ipv4_5tuple tuple">
<node CREATED="1430435043169" ID="ID_673024186" MODIFIED="1430435043169" TEXT=" uint32_t flow_ip"/>
<node CREATED="1430435043169" ID="ID_819970654" MODIFIED="1430435043169" TEXT=" uint32_t flow_ident"/>
<node CREATED="1430435043170" ID="ID_294137626" MODIFIED="1430435043170" TEXT=" uint32_t return_ip"/>
<node CREATED="1430435043170" ID="ID_1531392906" MODIFIED="1430435043170" TEXT=" uint32_t return_ident"/>
<node CREATED="1430435043170" ID="ID_1986471741" MODIFIED="1430435043170" TEXT=" uint8_t protocol"/>
<node CREATED="1430435043170" ID="ID_232694353" MODIFIED="1430435043170" TEXT=" uint8_t reserved[3]"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_1504652248" MODIFIED="1431501692934" TEXT=" struct nss_ipv4_connection_rule conn_rule">
<node CREATED="1430435043170" ID="ID_1103596166" MODIFIED="1430436662751">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint16_t flow_mac[3]
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#28304;MAC&#22320;&#22336;&#65292;&#36825;&#20010;&#22320;&#22336;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#30446;&#30340;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043170" ID="ID_180681596" MODIFIED="1430436743413">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint16_t return_mac[3]
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#30446;&#30340;MAC&#22320;&#22336;&#65292;&#36825;&#20010;&#22320;&#22336;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#28304;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043170" ID="ID_1247681963" MODIFIED="1430437726693">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t flow_interface_num
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#20837;&#21475;interface&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#20986;&#21475;interface
    </p>
    <p>
      
    </p>
    <p>
      &#27880;&#24847;&#36825;&#26159;&#26368;&#24213;&#23618;interface&#23545;&#24212;&#30340;id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043170" ID="ID_1365501583" MODIFIED="1430437733321">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int32_t return_interface_num
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#20986;&#21475;interface&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#20837;&#21475;interface
    </p>
    <p>
      
    </p>
    <p>
      &#27880;&#24847;&#36825;&#26159;&#26368;&#24213;&#23618;interface&#23545;&#24212;&#30340;id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043170" ID="ID_746271381" MODIFIED="1430435043170" TEXT=" uint32_t flow_mtu"/>
<node CREATED="1430435043170" ID="ID_691391454" MODIFIED="1430435043170" TEXT=" uint32_t return_mtu"/>
<node CREATED="1430435043170" ID="ID_783762032" MODIFIED="1430435043170" TEXT=" uint32_t flow_ip_xlate"/>
<node CREATED="1430435043170" ID="ID_48114749" MODIFIED="1430435043170" TEXT=" uint32_t return_ip_xlate"/>
<node CREATED="1430435043170" ID="ID_185341579" MODIFIED="1430435043170" TEXT=" uint32_t flow_ident_xlate"/>
<node CREATED="1430435043170" ID="ID_1687854747" MODIFIED="1430435043170" TEXT=" uint32_t return_ident_xlate"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_148594284" MODIFIED="1431504805211" TEXT=" struct nss_ipv4_protocol_tcp_rule tcp_rule">
<node CREATED="1430435043170" ID="ID_1522763065" MODIFIED="1430435043170" TEXT=" uint32_t flow_max_window"/>
<node CREATED="1430435043170" ID="ID_880689350" MODIFIED="1430435043170" TEXT=" uint32_t return_max_window"/>
<node CREATED="1430435043170" ID="ID_336121740" MODIFIED="1430435043170" TEXT=" uint32_t flow_end"/>
<node CREATED="1430435043170" ID="ID_1169144003" MODIFIED="1430435043170" TEXT=" uint32_t return_end"/>
<node CREATED="1430435043170" ID="ID_337114820" MODIFIED="1430435043170" TEXT=" uint32_t flow_max_end"/>
<node CREATED="1430435043170" ID="ID_1963695003" MODIFIED="1430435043170" TEXT=" uint32_t return_max_end"/>
<node CREATED="1430435043170" ID="ID_1962381724" MODIFIED="1430435043170" TEXT=" uint8_t flow_window_scale"/>
<node CREATED="1430435043170" ID="ID_1790846391" MODIFIED="1430435043170" TEXT=" uint8_t return_window_scale"/>
<node CREATED="1430435043171" MODIFIED="1430435043171" TEXT=" uint16_t reserved"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_916230453" MODIFIED="1430955736013" TEXT=" struct nss_ipv4_pppoe_rule pppoe_rule">
<node CREATED="1430435043171" ID="ID_1041377514" MODIFIED="1430440199595">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint16_t flow_pppoe_session_id
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#25152;&#25658;&#24102;&#30340;PPPoE&#23553;&#35013;&#30340;session id&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#24212;&#28155;&#21152;&#30340;PPPoE&#23553;&#35013;&#30340;session id
    </p>
    <p>
      &#27880;&#24847;&#27492;session id&#19981;&#20316;&#21305;&#37197;&#20043;&#29992;&#65292;&#20165;&#29992;&#20110;&#21457;&#36865;&#21253;&#26102;&#28155;&#21152;PPPoE&#23553;&#35013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" ID="ID_743029662" MODIFIED="1430440564463">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint16_t flow_pppoe_remote_mac[3]
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;PPPoE&#21253;&#30340;&#28304;MAC&#22320;&#22336;&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;PPPoE&#21253;&#30340;&#30446;&#30340;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" ID="ID_917047841" MODIFIED="1430440255563">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint16_t return_pppoe_session_id
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#25152;&#25658;&#24102;&#30340;PPPoE&#23553;&#35013;&#30340;session id&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#24212;&#28155;&#21152;&#30340;PPPoE&#23553;&#35013;&#30340;session id
    </p>
    <p>
      &#27880;&#24847;&#27492;session id&#19981;&#20316;&#21305;&#37197;&#20043;&#29992;&#65292;&#20165;&#29992;&#20110;&#21457;&#36865;&#21253;&#26102;&#28155;&#21152;PPPoE&#23553;&#35013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" ID="ID_358898190" MODIFIED="1430440594290">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint16_t return_pppoe_remote_mac[3]
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;PPPoE&#21253;&#30340;&#28304;MAC&#22320;&#22336;&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;PPPoE&#21253;&#30340;&#30446;&#30340;MAC&#22320;&#22336;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_906150231" MODIFIED="1431498407418" TEXT=" struct nss_ipv4_qos_rule qos_rule">
<node CREATED="1430435043171" ID="ID_443059549" MODIFIED="1430441225336">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t flow_qos_tag
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#25152;&#25351;&#23450;&#30340;qos&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#25152;&#25351;&#23450;&#30340;qos
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" ID="ID_1308664918" MODIFIED="1430441259911">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t return_qos_tag
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#25152;&#25351;&#23450;&#30340;qos&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#25152;&#25351;&#23450;&#30340;qos
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_884895284" MODIFIED="1431501022358" TEXT=" struct nss_ipv4_dscp_rule dscp_rule">
<node CREATED="1430435043171" ID="ID_510718580" MODIFIED="1430505837799">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint8_t flow_dscp
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#25152;&#25351;&#23450;&#30340;dscp&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#25152;&#25351;&#23450;&#30340;dscp
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" ID="ID_672290359" MODIFIED="1430505869948">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint8_t return_dscp
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#25152;&#25351;&#23450;&#30340;dscp&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#25152;&#25351;&#23450;&#30340;dscp
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" MODIFIED="1430435043171" TEXT=" uint8_t reserved[2]"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_696580072" MODIFIED="1431498414262" TEXT=" struct nss_ipv4_vlan_rule vlan_primary_rule">
<node CREATED="1430435043171" ID="ID_257213054" MODIFIED="1430506342869">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t ingress_vlan_tag
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#26368;&#22806;&#23618;vlan&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#26368;&#22806;&#23618;vlan
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" ID="ID_804608845" MODIFIED="1430506420850">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t egress_vlan_tag
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#26368;&#22806;&#23618;vlan&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#26368;&#22806;&#23618;vlan
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_1045842497" MODIFIED="1431498418066" TEXT=" struct nss_ipv4_vlan_rule vlan_secondary_rule">
<node CREATED="1430435043171" ID="ID_694014791" MODIFIED="1430506496438">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t ingress_vlan_tag
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#26368;&#20869;&#23618;vlan&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#26368;&#20869;&#23618;vlan
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430435043171" ID="ID_1634138818" MODIFIED="1430506486333">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t egress_vlan_tag
    </p>
    <p>
      &#21253;&#27839;&#30528;reply&#26041;&#21521;&#36827;&#20837;NATer&#26102;&#30340;&#26368;&#20869;&#23618;vlan&#65292;&#20063;&#26159;
    </p>
    <p>
      &#21253;&#27839;&#30528;original&#26041;&#21521;&#31163;&#24320;NATer&#26102;&#30340;&#26368;&#20869;&#23618;vlan
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430434285487" ID="ID_567347767" MODIFIED="1430434285487" TEXT=" uint32_t index"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_302820582" MODIFIED="1431202775040">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct nss_ipv4_rule_destroy_msg rule_destroy
    </p>
    <p>
      ecm&#21457;&#32473;NSS firmware&#30340;&#28040;&#24687;&#65292;&#35201;&#27714;&#21024;&#38500;&#26576;&#20010;&#36830;&#25509;&#30340;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430434285487" ID="ID_1971524403" MODIFIED="1430434285487" TEXT=" struct nss_ipv4_5tuple tuple"/>
</node>
<node CREATED="1430434285487" FOLDED="true" ID="ID_55206158" MODIFIED="1431202645959" TEXT=" struct nss_ipv4_rule_establish rule_establish">
<node CREATED="1430434285487" MODIFIED="1430434285487" TEXT=" uint32_t index"/>
<node CREATED="1430434285487" MODIFIED="1430434285487" TEXT=" uint32_t protocol"/>
<node CREATED="1430434285487" MODIFIED="1430434285487" TEXT=" int32_t flow_interface"/>
<node CREATED="1430434285487" MODIFIED="1430434285487" TEXT=" uint32_t flow_mtu"/>
<node CREATED="1430434285487" MODIFIED="1430434285487" TEXT=" uint32_t flow_ip"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t flow_ip_xlate"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t flow_ident"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t flow_ident_xlate"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t flow_mac[3]"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t flow_pppoe_session_id"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t flow_pppoe_remote_mac[3]"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t ingress_vlan_tag"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" int32_t return_interface"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t return_mtu"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t return_ip"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t return_ip_xlate"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t return_ident"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t return_ident_xlate"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t return_mac[3]"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t return_pppoe_session_id"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t return_pppoe_remote_mac[3]"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint16_t egress_vlan_tag"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t flags"/>
<node CREATED="1430434285488" MODIFIED="1430434285488" TEXT=" uint32_t qos_tag"/>
</node>
<node CREATED="1430434285488" FOLDED="true" ID="ID_448907098" MODIFIED="1431546423115">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct nss_ipv4_conn_sync conn_stats
    </p>
    <p>
      NSS firmware&#21457;&#32473;ecm&#30340;&#28040;&#24687;&#65292;&#29992;&#20110;&#21516;&#27493;&#32479;&#35745;&#20449;&#24687;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430434285488" ID="ID_732592298" MODIFIED="1430434285488" TEXT=" uint32_t index"/>
<node CREATED="1431203591982" FOLDED="true" ID="ID_456829826" MODIFIED="1431203772516" TEXT="&#x8fde;&#x63a5;&#x4fe1;&#x606f;">
<node CREATED="1430434285488" ID="ID_1925928431" MODIFIED="1430434285488" TEXT=" uint8_t protocol"/>
<node CREATED="1430434285488" ID="ID_1897127418" MODIFIED="1430434285488" TEXT=" uint32_t flow_ip"/>
<node CREATED="1430434285488" ID="ID_147029869" MODIFIED="1430434285488" TEXT=" uint32_t flow_ip_xlate"/>
<node CREATED="1430434285488" ID="ID_827144636" MODIFIED="1430434285488" TEXT=" uint32_t flow_ident"/>
<node CREATED="1430434285489" ID="ID_1744872817" MODIFIED="1430434285489" TEXT=" uint32_t flow_ident_xlate"/>
<node CREATED="1430434285489" ID="ID_1934795904" MODIFIED="1430434285489" TEXT=" uint32_t return_ip"/>
<node CREATED="1430434285489" ID="ID_230847800" MODIFIED="1430434285489" TEXT=" uint32_t return_ip_xlate"/>
<node CREATED="1430434285489" ID="ID_866097063" MODIFIED="1430434285489" TEXT=" uint32_t return_ident"/>
<node CREATED="1430434285489" ID="ID_1563777324" MODIFIED="1430434285489" TEXT=" uint32_t return_ident_xlate"/>
<node CREATED="1430434285489" ID="ID_785193375" MODIFIED="1430434285489" TEXT=" uint16_t return_pppoe_session_id"/>
<node CREATED="1430434285489" ID="ID_1597096580" MODIFIED="1430434285489" TEXT=" uint16_t return_pppoe_remote_mac[3]"/>
</node>
<node CREATED="1431203661387" FOLDED="true" ID="ID_1095097571" MODIFIED="1431203706854" TEXT="TCP&#x534f;&#x8bae;&#x72b6;&#x6001;&#x4fe1;&#x606f;">
<node CREATED="1430434285489" ID="ID_1254141502" MODIFIED="1430434285489" TEXT=" uint32_t flow_max_window"/>
<node CREATED="1430434285489" ID="ID_1031956573" MODIFIED="1430434285489" TEXT=" uint32_t flow_end"/>
<node CREATED="1430434285489" ID="ID_1150631844" MODIFIED="1430434285489" TEXT=" uint32_t flow_max_end"/>
<node CREATED="1430434285489" ID="ID_932843845" MODIFIED="1430434285489" TEXT=" uint32_t return_max_window"/>
<node CREATED="1430434285489" ID="ID_1694247975" MODIFIED="1430434285489" TEXT=" uint32_t return_end"/>
<node CREATED="1430434285489" ID="ID_245358412" MODIFIED="1430434285489" TEXT=" uint32_t return_max_end"/>
</node>
<node CREATED="1430434285489" ID="ID_296774868" MODIFIED="1430519570675">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t flow_rx_packet_count
    </p>
    <p>
      &#27839;original&#26041;&#21521;&#36827;&#20837;NATer&#30340;&#21253;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" ID="ID_708693534" MODIFIED="1430519583393">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t flow_rx_byte_count
    </p>
    <p>
      &#27839;original&#26041;&#21521;&#36827;&#20837;NATer&#30340;&#23383;&#33410;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" ID="ID_264287529" MODIFIED="1430519608169">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t flow_tx_packet_count
    </p>
    <p>
      &#27839;reply&#26041;&#21521;&#31163;&#24320;NATer&#30340;&#21253;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" ID="ID_791361907" MODIFIED="1430519634233">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t flow_tx_byte_count
    </p>
    <p>
      &#27839;reply&#26041;&#21521;&#31163;&#24320;NATer&#30340;&#23383;&#33410;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" MODIFIED="1430434285489" TEXT=" uint16_t flow_pppoe_session_id"/>
<node CREATED="1430434285489" ID="ID_261497309" MODIFIED="1430434285489" TEXT=" uint16_t flow_pppoe_remote_mac[3]"/>
<node CREATED="1430434285489" ID="ID_413723475" MODIFIED="1430519658369">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t return_rx_packet_count
    </p>
    <p>
      &#27839;reply&#26041;&#21521;&#36827;&#20837;NATer&#30340;&#21253;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" ID="ID_328844115" MODIFIED="1430519677836">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t return_rx_byte_count
    </p>
    <p>
      &#27839;reply&#26041;&#21521;&#36827;&#20837;NATer&#30340;&#23383;&#33410;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" ID="ID_148417323" MODIFIED="1430519690556">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t return_tx_packet_count
    </p>
    <p>
      &#27839;original&#26041;&#21521;&#31163;&#24320;NATer&#30340;&#21253;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" ID="ID_1660134634" MODIFIED="1430519707081">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t return_tx_byte_count
    </p>
    <p>
      &#27839;original&#26041;&#21521;&#31163;&#24320;NATer&#30340;&#23383;&#33410;&#30340;&#25968;&#37327;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430434285489" ID="ID_985633867" MODIFIED="1430434285489" TEXT=" uint32_t inc_ticks"/>
<node CREATED="1430434285490" FOLDED="true" ID="ID_380266579" MODIFIED="1431217917322">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t reason
    </p>
    <p>
      &#20160;&#20040;&#21407;&#22240;&#35302;&#21457;&#20102;&#36825;&#20010;&#32479;&#35745;&#21516;&#27493;&#28040;&#24687;
    </p>
  </body>
</html></richcontent>
<node CREATED="1431217761395" ID="ID_1429023039" MODIFIED="1431217813679">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_SYNC_REASON_STATS
    </p>
    <p>
      &#23450;&#26102;&#32479;&#35745;&#20449;&#24687;&#21516;&#27493;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431217770637" ID="ID_353862597" MODIFIED="1431217894463">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_SYNC_REASON_FLUSH
    </p>
    <p>
      &#22312;&#27809;&#26377;ecm&#30340;&#25351;&#20196;&#19979;&#65292;nss firmware&#21024;&#38500;&#20102;&#36830;&#25509;&#23545;&#24212;&#30340;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;&#65292;&#36825;&#26159;&#26368;&#21518;&#19968;&#27425;&#32479;&#35745;&#20449;&#24687;&#21516;&#27493;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431217779872" ID="ID_1502059594" MODIFIED="1431217901064">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_SYNC_REASON_EVICT
    </p>
    <p>
      &#22312;&#27809;&#26377;ecm&#30340;&#25351;&#20196;&#19979;&#65292;nss firmware&#21024;&#38500;&#20102;&#36830;&#25509;&#23545;&#24212;&#30340;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;&#65292;&#36825;&#26159;&#26368;&#21518;&#19968;&#27425;&#32479;&#35745;&#20449;&#24687;&#21516;&#27493;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431217789027" ID="ID_752320924" MODIFIED="1431217916197">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      NSS_IPV4_RULE_SYNC_REASON_DESTROY
    </p>
    <p>
      &#22312;ecm&#30340;&#25351;&#20196;&#19979;&#65292;nss firmware&#21024;&#38500;&#20102;&#36830;&#25509;&#23545;&#24212;&#30340;&#30828;&#20214;&#21152;&#36895;&#26465;&#30446;&#65292;&#36825;&#26159;&#26368;&#21518;&#19968;&#27425;&#32479;&#35745;&#20449;&#24687;&#21516;&#27493;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431217796171" ID="ID_953387168" MODIFIED="1431217796633" TEXT="NSS_IPV4_RULE_SYNC_REASON_PPPOE_DESTROY"/>
</node>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint8_t flags"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t qos_tag"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t cause"/>
</node>
<node CREATED="1430434285490" FOLDED="true" ID="ID_1483870960" MODIFIED="1431202660295" TEXT=" struct nss_ipv4_node_sync node_stats">
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" struct nss_cmn_node_stats node_stats"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_create_requests"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_create_collisions"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_create_invalid_interface"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_destroy_requests"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_destroy_misses"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_hash_hits"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_hash_reorders"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_flushes"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_connection_evictions"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t ipv4_fragmentations"/>
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t exception_events[NSS_EXCEPTION_EVENT_IPV4_MAX]"/>
</node>
<node CREATED="1430434285490" FOLDED="true" ID="ID_1903768845" MODIFIED="1431202666803" TEXT=" struct nss_ipv4_rule_conn_cfg_msg rule_conn_cfg">
<node CREATED="1430434285490" MODIFIED="1430434285490" TEXT=" uint32_t num_conn"/>
</node>
</node>
</node>
</node>
<node CREATED="1430775260311" ID="ID_880219543" MODIFIED="1431325253709" TEXT="&#x5b9e;&#x73b0;">
<node CREATED="1431217942758" FOLDED="true" ID="ID_1701038650" MODIFIED="1439941969443" TEXT="&#x6267;&#x884c;&#x6d41;">
<node CREATED="1431218077642" ID="ID_337766887" MODIFIED="1431218094860">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows.PNG" />
  </body>
</html></richcontent>
</node>
<node CREATED="1431218103403" FOLDED="true" ID="ID_678901841" MODIFIED="1439941964188" TEXT="post routing">
<node CREATED="1431218572367" ID="ID_1125782008" MODIFIED="1431218583609">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows_postrouting.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431218110577" FOLDED="true" ID="ID_686115244" MODIFIED="1432946320118" TEXT="acceleration response message received">
<node CREATED="1431218590686" ID="ID_295842082" MODIFIED="1431218605577">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows_acceleration_response.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431218142630" FOLDED="true" ID="ID_676736240" MODIFIED="1432947235491" TEXT="timer of connection expired">
<node CREATED="1431218609512" ID="ID_698843132" MODIFIED="1431218619021">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows_timer_expired.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431218110577" FOLDED="true" ID="ID_878344638" MODIFIED="1432947563804" TEXT="deceleration response message received">
<node CREATED="1431218622566" ID="ID_1556224304" MODIFIED="1431218632145">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows_deceleration_response.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431218157332" FOLDED="true" ID="ID_771633398" MODIFIED="1432947958906" TEXT="connection track event">
<node CREATED="1431218635370" ID="ID_662075843" MODIFIED="1431218645144">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows_conntrack_event.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431218165097" FOLDED="true" ID="ID_1074890149" MODIFIED="1439941966050" TEXT="device event">
<node CREATED="1431218649033" ID="ID_355093833" MODIFIED="1431218658073">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows_device_event.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431218172291" FOLDED="true" ID="ID_992938499" MODIFIED="1431218707079" TEXT="statistics sync message received">
<node CREATED="1431218661743" ID="ID_1442632894" MODIFIED="1431218670400">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/ecm_execution_flows_stats_sync.PNG" />
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1430775267394" FOLDED="true" ID="ID_592249989" MODIFIED="1439941976571" TEXT="tracker">
<node CREATED="1430775308419" ID="ID_1935722460" MODIFIED="1430775313819" TEXT="tcp tracker">
<node CREATED="1430768915120" FOLDED="true" ID="ID_524250810" MODIFIED="1439941975356" TEXT="struct ecm_tracker_tcp_internal_instance">
<node CREATED="1430769480411" ID="ID_585133438" MODIFIED="1430769480411" TEXT=" struct ecm_tracker_tcp_instance tcp_base">
<node CREATED="1430769480411" ID="ID_668624798" MODIFIED="1430775371255" TEXT=" struct ecm_tracker_instance base">
<node CREATED="1430769802577" ID="ID_152902037" MODIFIED="1430769802577" TEXT=" ecm_tracker_data_total_get_method_t data_total_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_data_limit_get_method_t data_limit_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_data_limit_set_method_t data_limit_set"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_count_get_method_t datagram_count_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_discard_method_t datagram_discard"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_size_get_method_t datagram_size_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_read_method_t datagram_read"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_datagram_add_method_t datagram_add"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_discard_all_method_t discard_all"/>
<node CREATED="1430769802577" FOLDED="true" ID="ID_674307072" MODIFIED="1430780184742" TEXT=" ecm_tracker_state_update_method_t state_update">
<node CREATED="1430775512839" ID="ID_1978952333" MODIFIED="1430778689732" TEXT="&#x76ee;&#x7684;&#xff1a;&#x6839;&#x636e;&#x5f53;&#x524d;&#x5305;&#x7684;&#x5185;&#x5bb9;&#x66f4;&#x65b0;&#x8fde;&#x63a5;&#x7684;&#x72b6;&#x6001;&#xff0c;&#x5373;&#x66f4;&#x65b0;struct ecm_tracker_tcp_internal_instance-&gt;sender_data"/>
<node CREATED="1430775539534" ID="ID_1378326522" MODIFIED="1430776009629" TEXT="&#x4f55;&#x65f6;&#x6267;&#x884c;&#xff1a;&#x5305;&#x7ecf;&#x8fc7;postrouting hook&#x65f6;&#xff0c;ecm front end&#x4f1a;&#x8c03;&#x7528;classifier&#x6765;&#x5904;&#x7406;&#x5305;( classifier-&gt;process() )&#xff0c;state_update()&#x51fd;&#x6570;&#x4e00;&#x822c;&#x5728;classifier&#x5904;&#x7406;&#x5305;&#x65f6;&#x88ab;&#x8c03;&#x7528;&#xff0c;&#x4ee5;&#x4fbf;&#x6839;&#x636e;&#x5f53;&#x524d;&#x5305;&#x7684;&#x5185;&#x5bb9;&#x66f4;&#x65b0;&#x8fde;&#x63a5;&#x7684;&#x5f53;&#x524d;&#x72b6;&#x6001;"/>
<node CREATED="1430776086801" ID="ID_1130352160" MODIFIED="1430776104146" TEXT="&#x5b9e;&#x73b0;&#xff1a;ecm_tracker_tcp_state_update_callback()"/>
</node>
<node CREATED="1430769802577" FOLDED="true" ID="ID_349946093" MODIFIED="1430785487909" TEXT=" ecm_tracker_state_get_method_t state_get">
<node CREATED="1430775512839" ID="ID_122099766" MODIFIED="1430778718230" TEXT="&#x76ee;&#x7684;&#xff1a;&#x83b7;&#x53d6;&#x8fde;&#x63a5;&#x7684;&#x72b6;&#x6001;&#xff0c;&#x5373;&#x83b7;&#x53d6;struct ecm_tracker_tcp_internal_instance-&gt;sender_data"/>
<node CREATED="1430778845979" ID="ID_1685787564" MODIFIED="1430778846553" TEXT="&#x4f55;&#x65f6;&#x6267;&#x884c;&#xff1a;">
<node CREATED="1430775539534" ID="ID_1802797924" MODIFIED="1430778889045" TEXT="&#x5305;&#x7ecf;&#x8fc7;postrouting hook&#x65f6;&#xff0c;ecm front end&#x4f1a;&#x8c03;&#x7528;classifier&#x6765;&#x5904;&#x7406;&#x5305;( classifier-&gt;process() )&#xff0c;state_get()&#x51fd;&#x6570;&#x4e00;&#x822c;&#x5728;classifier&#x5904;&#x7406;&#x5305;&#x65f6;&#x88ab;&#x8c03;&#x7528;&#xff0c;&#x4ee5;&#x4fbf;&#x53d6;&#x5f97;&#x8fde;&#x63a5;&#x7684;&#x5f53;&#x524d;&#x72b6;&#x6001;"/>
<node CREATED="1430775539534" ID="ID_1983908848" MODIFIED="1430778999426" TEXT="&#x5305;&#x7ecf;&#x8fc7;postrouting hook&#x65f6;&#xff0c;ecm front end&#x5728;&#x521b;&#x5efa;&#x65b0;&#x8fde;&#x63a5;&#x524d;&#x4f1a;&#x8c03;&#x7528;state_get()&#x51fd;&#x6570;&#x83b7;&#x53d6;&#x8fde;&#x63a5;&#x6240;&#x5c5e;&#x7684;timer group&#x4ee5;&#x4fbf;&#x786e;&#x5b9a;&#x8fde;&#x63a5;&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;"/>
</node>
<node CREATED="1430778627876" ID="ID_1919376034" MODIFIED="1430778636017" TEXT="&#x5b9e;&#x73b0;&#xff1a;ecm_tracker_tcp_state_get_callback()"/>
</node>
<node CREATED="1430769802577" ID="ID_1186757083" MODIFIED="1430769802577" TEXT=" ecm_tracker_xml_state_get_callback_t xml_state_get"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_ref_method_t ref"/>
<node CREATED="1430769802577" MODIFIED="1430769802577" TEXT=" ecm_tracker_deref_method_t deref"/>
</node>
<node CREATED="1430769480411" ID="ID_431812419" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_bytes_avail_get_method_t bytes_avail_get"/>
<node CREATED="1430769480411" ID="ID_1499514242" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_bytes_read_method_t bytes_read"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_bytes_discard_method_t bytes_discard"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_mss_get_method_t mss_get"/>
<node CREATED="1430769480411" ID="ID_387337262" MODIFIED="1430769480411" TEXT=" ecm_tracker_tcp_segment_add_method_t segment_add"/>
</node>
<node CREATED="1430769480411" FOLDED="true" ID="ID_689578417" MODIFIED="1430769495069" TEXT=" struct ecm_tracker_tcp_host_data sender_data[ECM_TRACKER_SENDER_MAX]">
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint16_t mss"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" bool mss_seen"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint32_t seq_no"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint32_t num_seqs"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" bool seq_no_valid"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *recvd_order"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *recvd_order_last"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t recvd_bytes_total"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t recvd_count"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *in_order"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *in_order_last"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t in_order_count"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" struct sk_buff *future"/>
</node>
<node CREATED="1430769480411" FOLDED="true" ID="ID_1778018912" MODIFIED="1430785468046">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct ecm_tracker_tcp_sender_state sender_states[ECM_TRACKER_SENDER_MAX]
    </p>
    <p>
      &#36830;&#25509;&#22312;original, reply 2&#20010;&#26041;&#21521;&#19978;&#30340;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430769480411" FOLDED="true" ID="ID_751176506" MODIFIED="1430785461334">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ecm_tracker_sender_state_t state
    </p>
    <p>
      &#26412;&#26041;&#21521;&#19978;&#30340;TCP&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1430769480411" ID="ID_308008587" MODIFIED="1430776413290">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_UNKNOWN
    </p>
    <p>
      &#36824;&#27809;&#26377;&#30475;&#35265;&#36825;&#20010;&#26041;&#21521;&#19978;&#30340;&#20219;&#20309;&#21253;&#65292;&#25152;&#20197;&#29366;&#24577;&#26410;&#30693;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1162281322" MODIFIED="1430776800920">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_ESTABLISHING
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP sync&#65292;&#20294;&#36824;&#26410;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;sync&#30340;ack
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_544740093" MODIFIED="1430776875394">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_ESTABLISHED
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP sync&#65292;&#24182;&#19988;&#24050;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;sync&#30340;ack&#65292;&#27492;&#26102;&#36825;&#20010;&#26041;&#21521;&#19978;&#30340;TCP&#36830;&#25509;&#24050;&#24314;&#31435;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1485686481" MODIFIED="1430776912461">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_CLOSING
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP fin&#65292;&#20294;&#36824;&#26410;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;fin&#30340;ack
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_247628750" MODIFIED="1430776944211">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_CLOSED
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#24050;&#32463;&#36865;&#20986;&#20102;TCP fin&#65292;&#24182;&#19988;&#24050;&#22312;&#21453;&#26041;&#21521;&#19978;&#25910;&#21040;&#23545;&#36825;&#20010;fin&#30340;ack&#65292;&#27492;&#26102;&#36825;&#20010;&#26041;&#21521;&#19978;&#30340;TCP&#36830;&#25509;&#24050;&#26029;&#24320;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_244212261" MODIFIED="1430778604721">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ECM_TRACKER_SENDER_STATE_FAULT
    </p>
    <p>
      &#25351;&#19968;&#20999;&#38169;&#35823;&#29366;&#24577;&#65292;&#27604;&#22914;&#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#25910;&#21040;&#20102;&#19968;&#20010;TCP reset&#65292;&#25110;&#32773;&#36830;&#25509;&#20851;&#38381;&#21518;&#21448;&#25910;&#21040;sync
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_1136103436" MODIFIED="1430769480411" TEXT="ECM_TRACKER_SENDER_STATE_MAX"/>
</node>
<node CREATED="1430769480411" ID="ID_785254023" MODIFIED="1430778261382">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t syn_seq
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#21457;&#36865;&#30340;TCP sync&#25152;&#23545;&#24212;&#30340;&#24207;&#21015;&#21495;&#65292;&#29992;&#20110;&#25506;&#27979;&#36825;&#20010;sync&#20309;&#26102;&#34987;ack
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1430769480411" ID="ID_233605929" MODIFIED="1430778289335">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint32_t fin_seq
    </p>
    <p>
      &#22312;&#36825;&#20010;&#26041;&#21521;&#19978;&#21457;&#36865;&#30340;TCP fin&#25152;&#23545;&#24212;&#30340;&#24207;&#21015;&#21495;&#65292;&#29992;&#20110;&#25506;&#27979;&#36825;&#20010;fin&#20309;&#26102;&#34987;ack
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int32_t data_limit"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" int refs"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" spinlock_t lock"/>
<node CREATED="1430769480411" MODIFIED="1430769480411" TEXT=" uint16_t magic"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1308210547206" FOLDED="true" ID="ID_30638681" MODIFIED="1443060922741" POSITION="right" TEXT="ALG">
<node CREATED="1429824134131" FOLDED="true" ID="ID_1757943615" MODIFIED="1439942174785" TEXT="&#x5e94;&#x7528;&#x573a;&#x666f;">
<node CREATED="1429824156904" ID="ID_580478569" MODIFIED="1429824432448">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26377;&#20123;&#24212;&#29992;&#65292;&#27604;&#22914;FTP&#65292;&#20250;&#26377;2&#26465;&#27969;&#65306;&#19968;&#26465;&#26159;&#25511;&#21046;&#27969;&#65292;&#19968;&#26465;&#26159;&#25968;&#25454;&#27969;
    </p>
    <p>
      &#31471;&#28857;&#20043;&#38388;&#30340;&#24212;&#29992;&#39318;&#20808;&#24314;&#31435;&#25511;&#21046;&#27969;&#65292;&#22312;&#25511;&#21046;&#27969;&#20013;&#21327;&#21830;&#22914;&#20309;&#24314;&#31435;&#25968;&#25454;&#27969;&#65306;&#27604;&#22914;&#35841;&#21457;&#36215;&#65292;&#30446;&#30340;IP&#22320;&#22336;&#65292;&#30446;&#30340;&#31471;&#21475;&#21495;&#31561;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1429824466641" ID="ID_1905881841" MODIFIED="1429824612947" TEXT="&#x7f51;&#x5173;&#x4e00;&#x822c;&#x4f1a;&#x62d2;&#x7edd;&#x4ece;WAN&#x4fa7;&#x53d1;&#x8d77;&#x7684;&#x8fde;&#x63a5;&#x8bf7;&#x6c42;&#x3002;&#x6240;&#x4ee5;&#x5982;&#x679c;&#x5e94;&#x7528;&#x5728;&#x63a7;&#x5236;&#x6d41;&#x4e2d;&#x534f;&#x5546;&#x7684;&#x7ed3;&#x679c;&#x662f;&#x7531;WAN&#x4fa7;&#x7684;&#x7aef;&#x70b9;&#x53d1;&#x8d77;&#x6570;&#x636e;&#x6d41;&#xff0c;&#x90a3;&#x4e48;&#x8fd9;&#x6761;&#x6570;&#x636e;&#x6d41;&#x5c31;&#x4f1a;&#x88ab;&#x7f51;&#x5173;&#x62d2;&#x7edd;&#x3002;"/>
<node CREATED="1429824628976" ID="ID_1872438235" MODIFIED="1429824797565" TEXT="&#x4e3a;&#x4e86;&#x907f;&#x514d;&#x8fd9;&#x79cd;&#x5931;&#x8d25;&#xff0c;&#x7f51;&#x5173;&#x8981;&#x68c0;&#x6d4b;&#x63a7;&#x5236;&#x6d41;&#xff0c;&#x4e86;&#x89e3;&#x6240;&#x8981;&#x5efa;&#x7acb;&#x7684;&#x6570;&#x636e;&#x6d41;&#x7684;&#x7ec6;&#x8282;&#xff0c;&#x4ee5;&#x4fbf;&#x5728;&#x6570;&#x636e;&#x6d41;&#x4ece;WAN&#x4fa7;&#x53d1;&#x8d77;&#x65f6;&#xff0c;&#x5141;&#x8bb8;&#x5176;&#x901a;&#x8fc7;"/>
</node>
<node CREATED="1429824843915" FOLDED="true" ID="ID_743643874" MODIFIED="1443060921807" TEXT="&#x76ee;&#x6807;&#x4efb;&#x52a1;">
<node CREATED="1429824862922" ID="ID_1890203344" MODIFIED="1429824929338" TEXT="&#x6bcf;&#x4e00;&#x79cd;ALG&#x5e94;&#x7528;&#x5728;Linux&#x4e2d;&#x6709;&#x4e00;&#x4e2a;&#x5bf9;&#x5e94;&#x7684;&#x5185;&#x6838;&#x6a21;&#x5757;&#xff0c;&#x7528;&#x4e8e;&#x89e3;&#x6790;&#x63a7;&#x5236;&#x6d41;&#xff0c;&#x5efa;&#x7acb;&#x6570;&#x636e;&#x6d41;"/>
<node CREATED="1429824968158" ID="ID_668689751" MODIFIED="1429825183218">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#39318;&#20808;ALG&#24212;&#29992;&#38656;&#35201;&#21578;&#35785;Linux&#23427;&#38656;&#35201;&#26816;&#27979;&#20160;&#20040;&#26679;&#30340;&#27969;&#65292;&#36825;&#26159;&#36890;&#36807;&#65306;
    </p>
    <p>
      nf_conntrack_helper_register(struct nf_conntrack_helper *me)&#26469;&#23454;&#29616;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1429825285594" ID="ID_1105028566" MODIFIED="1429825315868" TEXT="me-&gt;tuple&#x6307;&#x660e;&#x4e86;ALG&#x5e94;&#x7528;&#x9700;&#x8981;&#x68c0;&#x6d4b;&#x4ec0;&#x4e48;&#x6837;&#x7684;&#x6d41;"/>
<node CREATED="1429825335718" ID="ID_1643834345" MODIFIED="1429825363779" TEXT="me-&gt;help()&#x5373;&#x662f;&#x89e3;&#x6790;&#x51fd;&#x6570;&#xff0c;&#x7528;&#x4e8e;&#x89e3;&#x6790;&#x63a7;&#x5236;&#x6d41;"/>
</node>
<node CREATED="1429826645470" ID="ID_1213099249" MODIFIED="1440051212708" TEXT="Linux&#x6bcf;&#x65b0;&#x5efa;&#x4e00;&#x6761;connection&#x65f6;&#x7528;reply&#x65b9;&#x5411;&#x7684;tuple&#x53bb;&#x5339;&#x914d;&#x6ce8;&#x518c;&#x7684;helper&#x7684;tuple&#xff0c;&#x82e5;&#x627e;&#x5230;&#x5219;&#x5c06;&#x5176;&#x4fdd;&#x5b58;&#x5728;nfct_help(ct)-&gt;helper&#x4e2d;&#x3002;&#x6ce8;&#x610f;&#x8fd9;&#x79cd;&#x67e5;&#x627e;&#x64cd;&#x4f5c;&#x53ea;&#x662f;&#x5728;&#x8fde;&#x63a5;&#x65b0;&#x5efa;&#x7acb;&#x65f6;&#x624d;&#x8fdb;&#x884c;&#x3002;&#x8fd9;&#x6837;&#x7684;&#x7ed3;&#x679c;&#x662f;&#x63a7;&#x5236;&#x6d41;&#x7684;nfct_help(ct)-&gt;helper&#x4e0d;&#x4e3a;&#x7a7a;&#x3002;">
<node CREATED="1429826982402" ID="ID_1503073395" MODIFIED="1429827007665" TEXT="&#x4e3a;&#x4ec0;&#x4e48;&#x53ea;&#x662f;&#x5339;&#x914d;reply&#x65b9;&#x5411;&#x7684;tuple&#x5462;&#xff1f;">
<node CREATED="1429827077121" ID="ID_1616843670" MODIFIED="1429827599326">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#26465;&#27969;&#30340;&#31532;&#19968;&#20010;&#21253;&#31216;&#20026;original&#26041;&#21521;&#65292;&#25105;&#20204;&#20063;&#24635;&#26159;&#26681;&#25454;original&#26041;&#21521;&#30340;&#31532;&#19968;&#20010;&#21253;&#26469;&#21019;&#24314;connection&#12290;
    </p>
    <p>
      &#26082;&#28982;&#25105;&#20204;&#33021;&#25910;&#21040;&#36825;&#20010;original&#26041;&#21521;&#30340;&#31532;&#19968;&#20010;&#21253;&#65292;&#37027;&#20040;original&#26041;&#21521;&#21457;&#36215;&#30340;&#36830;&#25509;&#23601;&#19981;&#20250;&#34987;&#32593;&#20851;&#25298;&#32477;&#65292;&#25152;&#20197;&#25105;&#20204;&#19981;&#29992;&#25285;&#24515;original&#26041;&#21521;&#21457;&#36215;&#30340;&#36830;&#25509;&#20250;&#19981;&#20250;&#34987;&#32593;&#20851;&#25298;&#32477;&#12290;&#25105;&#20204;&#36824;&#27809;&#26377;&#20174;reply&#26041;&#21521;&#25910;&#21040;&#21253;&#65292;&#25152;&#20197;&#26080;&#27861;&#30830;&#23450;&#20174;reply&#26041;&#21521;&#21457;&#36215;&#30340;&#36830;&#25509;&#20250;&#19981;&#20250;&#34987;&#32593;&#20851;&#25298;&#32477;&#65292;&#25152;&#20197;&#25105;&#20204;&#38656;&#35201;&#39044;&#20808;&#20026;&#20174;reply&#26041;&#21521;&#21457;&#36215;&#30340;&#36830;&#25509;&#24314;&#31435;connection track&#26465;&#30446;&#65292;&#20197;&#35753;&#20854;&#36890;&#36807;&#38450;&#28779;&#22681;&#36807;&#28388;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1429827979432" FOLDED="true" ID="ID_1615389343" MODIFIED="1429830287171" TEXT="netfilter&#x7684;POSTROUTING hook&#x70b9;&#x6709;&#x4e00;&#x4e2a;NF_IP_PRI_CONNTRACK_HELPER&#x94fe;&#xff0c;&#x5728;&#x8fd9;&#x91cc;ALG helper&#x7684;&#x89e3;&#x6790;&#x51fd;&#x6570;nfct_help(ct)-&gt;helper-&gt;help()&#x88ab;&#x6267;&#x884c;&#xff0c;ALG&#x5c31;&#x53ef;&#x4ee5;&#x68c0;&#x6d4b;&#x63a7;&#x5236;&#x6d41;&#x7684;&#x5185;&#x5bb9;&#x4ee5;&#x8bc6;&#x522b;&#x5c06;&#x8981;&#x5efa;&#x7acb;&#x7684;&#x6570;&#x636e;&#x6d41;&#x4e86;&#x3002;&#x6ce8;&#x610f;&#xff1a;&#x89e3;&#x6790;&#x51fd;&#x6570;&#x4f1a;&#x68c0;&#x6d4b;2&#x4e2a;&#x65b9;&#x5411;&#x4e0a;&#x7684;&#x5305;&#x3002;">
<node CREATED="1429828304025" FOLDED="true" ID="ID_1712235240" MODIFIED="1429828437181" TEXT="&#x4e3a;&#x4ec0;&#x4e48;&#x5230;POSTROUTING&#x624d;&#x6267;&#x884c;ALG&#x89e3;&#x6790;&#x51fd;&#x6570;&#xff1f;">
<node CREATED="1429828343876" ID="ID_1907916668" MODIFIED="1429828434024" TEXT="&#x5728;ALG&#x7684;&#x89e3;&#x6790;&#x51fd;&#x6570;&#x4e2d;&#x9700;&#x8981;&#x7528;&#x5230;&#x63a7;&#x5236;&#x6d41;&#x7684;NAT&#x4fe1;&#x606f;&#xff0c;&#x800c;NAT&#x4fe1;&#x606f;&#x53ea;&#x6709;&#x5728;POSTROUTING&#x8fc7;&#x540e;&#x624d;&#x5efa;&#x7acb;&#x5b8c;&#x5168;&#xff0c;&#x6240;&#x4ee5;&#x5230;POSTROUTING&#x624d;&#x6267;&#x884c;ALG&#x89e3;&#x6790;&#x51fd;&#x6570;&#x3002;"/>
</node>
</node>
<node CREATED="1429828557981" ID="ID_452618339" MODIFIED="1429829224702">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ALG&#35299;&#26512;&#20989;&#25968;&#30340;&#26681;&#26412;&#30446;&#30340;&#26159;&#20026;&#21363;&#23558;&#20174;reply&#26041;&#21521;&#21457;&#36215;&#30340;&#25968;&#25454;&#36830;&#25509;&#24314;&#31435;&#19968;&#20010;struct nf_conntrack_expect&#32467;&#26500;&#65292;&#28982;&#21518;&#36890;&#36807;nf_ct_expect_related(struct nf_conntrack_expect *expect)&#20989;&#25968;&#28155;&#21152;&#21040;Linux&#12290;expect-&gt;tuple&#25351;&#26126;&#20102;&#20174;reply&#26041;&#21521;&#21457;&#36215;&#30340;&#25968;&#25454;&#36830;&#25509;&#30340;5&#20803;&#32452;&#65292;&#23427;&#19981;&#26159;&#19968;&#20010;&#31934;&#30830;&#21305;&#37197;5&#20803;&#32452;&#65292;expect-&gt;mask&#25351;&#26126;&#20102;&#38656;&#35201;&#21305;&#37197;5&#20803;&#32452;&#20013;&#21738;&#20960;&#39033;&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1429828833523" FOLDED="true" ID="ID_1901319910" MODIFIED="1429831469004">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#33324;&#26469;&#35828;&#65292;ALG&#24212;&#29992;&#23545;&#24212;&#30340;&#21327;&#35758;&#25552;&#20379;&#20102;&#36275;&#22815;&#20449;&#24687;&#26469;&#21019;&#24314;&#36825;&#20010;expect 5 &#20803;&#32452;&#65306;
    </p>
  </body>
</html></richcontent>
<node CREATED="1429830699065" ID="ID_1110777707" MODIFIED="1429830924996" TEXT="&#x5f53;&#x524d;&#x5305;&#x53ef;&#x80fd;&#x662f;&#x4ece;original&#x65b9;&#x5411;&#x6765;&#x7684;&#xff0c;&#x4e5f;&#x53ef;&#x80fd;&#x662f;&#x4ece;reply&#x65b9;&#x5411;&#x4e0a;&#x6765;&#x7684;&#xff0c;&#x65e0;&#x8bba;&#x4ece;&#x54ea;&#x4e2a;&#x65b9;&#x5411;&#x6765;&#xff0c;&#x5373;&#x5c06;&#x8981;&#x5efa;&#x7acb;&#x7684;&#x6570;&#x636e;&#x6d41;&#x662f;&#x4ece;&#x5f53;&#x524d;&#x65b9;&#x5411;&#x7684;&#x53cd;&#x65b9;&#x5411;&#x53d1;&#x8d77;&#x7684;&#x3002;&#x5373;&#x82e5;&#x5f53;&#x524d;&#x65b9;&#x5411;&#x662f;original&#x65b9;&#x5411;&#xff0c;&#x5219;expect connection&#x662f;reply&#x65b9;&#x5411;&#x7684;&#xff0c;&#x82e5;&#x5f53;&#x524d;&#x65b9;&#x5411;&#x662f;reply&#x65b9;&#x5411;&#xff0c;&#x5219;expect connection&#x662f;original&#x65b9;&#x5411;&#x7684;&#x3002;"/>
<node CREATED="1429830939218" ID="ID_886750100" MODIFIED="1429830980001" TEXT="&#x82e5;src IP&#x65e0;&#x6cd5;&#x83b7;&#x5f97;&#xff0c;&#x5219;&#x53d6;&#x53cd;&#x65b9;&#x5411;&#x7684;src IP"/>
<node CREATED="1429830939218" ID="ID_1492397626" MODIFIED="1429831026559" TEXT="&#x82e5;src port&#x65e0;&#x6cd5;&#x83b7;&#x5f97;&#xff0c;&#x5219;&#x5c06;&#x5176;mask&#x6389;"/>
<node CREATED="1429830939218" ID="ID_384544587" MODIFIED="1429831051838" TEXT="&#x82e5;dest IP&#x65e0;&#x6cd5;&#x83b7;&#x5f97;&#xff0c;&#x5219;&#x53d6;&#x53cd;&#x65b9;&#x5411;&#x7684;dest IP"/>
<node CREATED="1429830939218" ID="ID_948613724" MODIFIED="1429831224041" TEXT="&#x82e5;dest port&#x65e0;&#x6cd5;&#x83b7;&#x5f97;&#xff0c;&#x5219;&#x5c06;&#x5176;mask&#x6389;"/>
<node CREATED="1429831229219" ID="ID_1965428055" MODIFIED="1429831451942" TEXT="&#x4ee5;FTP&#x4e3a;&#x4f8b;&#xff0c;&#x547d;&#x4ee4;&#xff1a;&#x201c;PORT (d1,d2,d3,d4,p1,p2)&#x201d;&#x63d0;&#x4f9b;&#x4e86;&#x76ee;&#x7684;IP&#x548c;&#x76ee;&#x7684;&#x7aef;&#x53e3;"/>
</node>
<node CREATED="1429831504174" ID="ID_1804769184" MODIFIED="1429832143864" TEXT="&#x4ece;&#x5305;&#x4e2d;&#x83b7;&#x5f97;&#x7684;&#x539f;&#x59cb;tuple&#x662f;&#x7aef;&#x70b9;&#x4e4b;&#x95f4;&#x534f;&#x5546;&#x7684;&#x7ed3;&#x679c;&#xff0c;&#x8fd9;&#x662f;&#x5728;&#x6ca1;&#x6709;&#x610f;&#x8bc6;&#x5230;&#x7f51;&#x5173;&#x7684;&#x60c5;&#x51b5;&#x4e0b;&#x534f;&#x5546;&#x51fa;&#x6765;&#x7684;&#x3002;&#x8fd9;&#x4e2a;&#x539f;&#x59cb;&#x7684;tuple&#x9700;&#x8981;&#x9488;&#x5bf9;&#x7f51;&#x5173;&#x7684;NAT&#x505a;&#x4e00;&#x4e9b;&#x8c03;&#x6574;&#x3002;&#x6bd4;&#x5982;&#xff0c;&#x539f;&#x59cb;tuple&#x7684;&#x76ee;&#x7684;IP&#x4e00;&#x822c;&#x6307;&#x5411;LAN&#x4fa7;&#x7aef;&#x70b9;&#xff0c;&#x589e;&#x52a0;&#x7f51;&#x5173;&#x540e;&#xff0c;&#x5e94;&#x5c06;&#x76ee;&#x7684;IP&#x6307;&#x5411;&#x7f51;&#x5173;&#x3002;"/>
</node>
<node CREATED="1429832336753" ID="ID_672516515" MODIFIED="1429832680494" TEXT="ALG&#x89e3;&#x6790;&#x51fd;&#x6570;&#x7684;&#x7b2c;&#x4e8c;&#x4e2a;&#x4efb;&#x52a1;&#x662f;&#x4fee;&#x6539;&#x6240;&#x68c0;&#x67e5;&#x7684;&#x63a7;&#x5236;&#x5305;&#xff0c;&#x4f7f;&#x5305;&#x4e2d;&#x534f;&#x5546;&#x7684;&#x4fe1;&#x606f;&#x9488;&#x5bf9;&#x7f51;&#x5173;&#x7684;NAT&#x505a;&#x51fa;&#x8c03;&#x6574;&#x3002;&#x6bd4;&#x5982;&#xff0c;&#x539f;&#x59cb;&#x7684;&#x76ee;&#x7684;IP&#x4e00;&#x822c;&#x6307;&#x5411;LAN&#x4fa7;&#x7aef;&#x70b9;&#xff0c;&#x589e;&#x52a0;&#x7f51;&#x5173;&#x540e;&#xff0c;&#x5e94;&#x5c06;&#x76ee;&#x7684;IP&#x6307;&#x5411;&#x7f51;&#x5173;&#x3002;"/>
<node CREATED="1429826645470" ID="ID_121654240" MODIFIED="1429896458765" TEXT="Linux&#x6bcf;&#x65b0;&#x5efa;&#x4e00;&#x6761;connection&#x65f6;&#x7528;original&#x65b9;&#x5411;&#x7684;tuple&#x53bb;&#x5339;&#x914d;&#x6ce8;&#x518c;&#x7684;expect connection&#xff0c;&#xa;nf_ct_find_expectation()&#xff0c;&#x82e5;&#x627e;&#x5230;&#x5219;&#x5c06;&#x5176;&#x4e0e;&#x5176;master connection&#x5173;&#x8054;&#x8d77;&#x6765;&#xff0c;&#x540c;&#x65f6;&#x8c03;&#x7528;exp-&gt;expectfn()&#x3002;exp-&gt;expectfn()&#x7684;&#x4e3b;&#x8981;&#x4f5c;&#x7528;&#x662f;&#x4e3a;expect connection&#x5efa;&#x7acb;NAT&#x4fe1;&#x606f;&#x3002;&#x6ce8;&#x610f;&#x8fd9;&#x4e9b;&#x64cd;&#x4f5c;&#x53ea;&#x662f;&#x5728;&#x8fde;&#x63a5;&#x65b0;&#x5efa;&#x7acb;&#x65f6;&#x624d;&#x8fdb;&#x884c;&#x3002;">
<node CREATED="1429826982402" ID="ID_70650904" MODIFIED="1429896611249">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#29992;original&#26041;&#21521;&#30340;tuple&#21435;&#26597;&#25214;&#27880;&#20876;&#30340;expect connection
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;nf_ct_find_expectation()
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1429896631499" FOLDED="true" ID="ID_850932924" MODIFIED="1429896861795" TEXT="expect connection&#x4e0e;master connection&#x4e4b;&#x95f4;&#x7684;&#x5173;&#x8054;">
<node CREATED="1429896658314" ID="ID_876690947" MODIFIED="1429896695221" TEXT="ct -&gt; master = exp -&gt; master"/>
<node CREATED="1429896703711" ID="ID_55507901" MODIFIED="1429896725361" TEXT="ct -&gt; mark = exp -&gt; master -&gt; mark"/>
<node CREATED="1429896749367" ID="ID_458968865" MODIFIED="1429896784758" TEXT="flag IPS_EXPECTED_BIT is set on ct -&gt; status"/>
</node>
<node CREATED="1429896819161" ID="ID_694350937" MODIFIED="1429896852178" TEXT="&#x4e3a;&#x4ec0;&#x4e48;&#x9700;&#x8981;&#x5728;&#x521b;&#x5efa;expect connection&#x65f6;&#x8c03;&#x7528;&#x8c03;&#x7528;exp-&gt;expectfn()&#xff1f;">
<node CREATED="1429896864075" ID="ID_1938618629" MODIFIED="1429896995332" TEXT="&#x4e00;&#x822c;&#x6765;&#x8bf4;&#xff0c;expect connection&#x662f;&#x4ece;WAN&#x4fa7;&#x53d1;&#x8d77;&#x7684;&#xff0c;&#x5982;&#x679c;&#x4e0d;&#x5728;&#x521b;&#x5efa;expect connection&#x65f6;&#x4e3a;&#x5176;&#x5efa;&#x7acb;&#x597d;NAT&#x4fe1;&#x606f;&#xff0c;&#x5219;&#x8fd9;&#x4e2a;&#x5305;&#x4f1a;&#x5728;forward hook&#x70b9;&#x88ab;filter&#x6389;&#xff0c;&#x4ece;&#x800c;&#x65e0;&#x6cd5;&#x5efa;&#x7acb;expect connection"/>
</node>
<node CREATED="1429897037463" ID="ID_1120420723" MODIFIED="1429897060370" TEXT="&#x6ce8;&#x610f;expect connection&#x4e5f;&#x6709;&#x53ef;&#x80fd;&#x6709;&#x81ea;&#x5df1;&#x7684;helper"/>
</node>
</node>
<node CREATED="1429897323702" FOLDED="true" ID="ID_619305807" MODIFIED="1440058272215" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1294826477160" FOLDED="true" ID="ID_1252877709" MODIFIED="1429899133595" TEXT="struct nf_conn_help">
<node CREATED="1294826498588" FOLDED="true" ID="ID_1415964818" MODIFIED="1429897808144" TEXT="struct nf_conntrack_helper * &#xff1a;helper">
<node CREATED="1294826655562" ID="ID_1869172036" MODIFIED="1294826659535" TEXT="hnode"/>
<node CREATED="1294826666836" ID="ID_1064495944" MODIFIED="1294826670517" TEXT="name"/>
<node CREATED="1294826684103" ID="ID_1012532266" MODIFIED="1294826706851" TEXT="struct module * &#xff1a;me &#xff1a;&#x6307;&#x5411;&#x6a21;&#x5757;&#x81ea;&#x5df1;"/>
<node CREATED="1294826724039" ID="ID_1424271261" MODIFIED="1294826732531" TEXT="struct nf_conntrack_expect_policy * &#xff1a;expect_policy"/>
<node CREATED="1294826746563" ID="ID_638932287" MODIFIED="1294827186204" TEXT="struct nf_conntrack_tuple &#xff1a;tuple &#xff1a;&#x7528;&#x4e8e;&#x786e;&#x5b9a;&#x54ea;&#x4e9b;&#x8fde;&#x63a5;&#x9700;&#x8981;&#x6b64;helper"/>
<node CREATED="1294826800893" ID="ID_659458369" MODIFIED="1429897774709" TEXT="int (*help)(skb, L4_offset, ct, ctinfo) &#xff1a;&#x5f53;&#x5339;&#x914d;&#x5230;&#x9700;&#x8981;&#x6b64;helper&#x7684;&#x5305;&#x65f6;&#x6240;&#x8c03;&#x7528;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1294826863457" ID="ID_875855711" MODIFIED="1294826896202" TEXT="destroy &#xff1a;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1294826876187" ID="ID_867472121" MODIFIED="1294826887327" TEXT="to_nlattr &#xff1a;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1294826590454" ID="ID_544324488" MODIFIED="1294827931286" TEXT="struct hlist_head &#xff1a;expectations &#xff1a;&#x6b64;master&#x8fde;&#x63a5;&#x4e0b;&#x7684;expection"/>
<node CREATED="1294826617763" ID="ID_1398408101" MODIFIED="1429897624625" TEXT="int expecting[xxx] &#xff1a;&#x6bcf;&#x4e00;&#x79cd;expectation&#x8fde;&#x63a5;&#x7684;&#x6570;&#x91cf;"/>
<node CREATED="1294826541276" ID="ID_351100366" MODIFIED="1429897653040" TEXT="char data [ ] &#xff1a;&#x7279;&#x5b9a;helper&#x7684;&#x79c1;&#x6709;&#x6570;&#x636e;"/>
</node>
<node CREATED="1294828067539" FOLDED="true" ID="ID_1614068647" MODIFIED="1440058268589" TEXT="struct nf_conntrack_expect">
<node CREATED="1294828097680" ID="ID_593869640" MODIFIED="1294828119592" TEXT="lnode &#xff1a;&#x7528;&#x4e8e;&#x6302;&#x63a5;&#x5230;master&#x4e0a;"/>
<node CREATED="1294828140249" ID="ID_1284313457" MODIFIED="1294828167123" TEXT="hnode &#xff1a;&#x7528;&#x4e8e;&#x6302;&#x63a5;&#x5230;net-&gt;ct.expect_hash&#x4e0a;"/>
<node CREATED="1294828202292" ID="ID_868275171" MODIFIED="1429897956827" TEXT="tuple &#xff1a;&#x7528;&#x4e8e;&#x5339;&#x914d;expectation&#x8fde;&#x63a5;"/>
<node CREATED="1294828240467" ID="ID_1453818010" MODIFIED="1429897962593" TEXT="mask &#xff1a;&#x5339;&#x914d;expectation&#x8fde;&#x63a5;&#x65f6;&#x6240;&#x7528;&#x7684;mask&#xff0c;&#x53ea;mask src address&#x548c;src port"/>
<node CREATED="1294828387935" ID="ID_880883813" MODIFIED="1429898059930" TEXT="int (*expectfn)() &#xff1a;&#x5339;&#x914d;&#x5230;expectation&#x8fde;&#x63a5;&#x65f6;&#x6240;&#x8c03;&#x7528;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;:&#x6b64;&#x51fd;&#x6570;&#x4e3a;expectation connection&#x6784;&#x5efa;NAT&#x4fe1;&#x606f;"/>
<node CREATED="1294828453987" ID="ID_1714108810" MODIFIED="1429898279126" TEXT="struct nf_conntrack_helper * &#xff1a;helper &#xff1a;&#x5982;&#x679c;&#x6b64;&#x503c;&#x4e0d;&#x4e3a;&#x7a7a;&#xff0c;&#x8868;&#x793a;expectation&#x8fde;&#x63a5;&#x4e5f;&#x9700;&#x8981;&#x4e00;&#x4e2a;helper&#xff0c;&#x4e5f;&#x5c31;&#x662f;&#x8bf4;expectation&#x8fde;&#x63a5;&#x8fd8;&#x53ef;&#x80fd;&#x5efa;&#x7acb;&#x4e0b;&#x4e00;&#x7ea7;&#x7684;expectation&#x8fde;&#x63a5;&#x3002;"/>
<node CREATED="1294828495187" ID="ID_1447851798" MODIFIED="1294828523943" TEXT="master &#xff1a;&#x4e3b;&#x8fde;&#x63a5;"/>
<node CREATED="1294828537683" ID="ID_960473041" MODIFIED="1294828548705" TEXT="timeout"/>
<node CREATED="1294828565256" ID="ID_1106069198" MODIFIED="1294828568370" TEXT="flags"/>
<node CREATED="1294828578347" ID="ID_912397246" MODIFIED="1294828580732" TEXT="class"/>
<node CREATED="1294828606392" FOLDED="true" ID="ID_546415836" MODIFIED="1440058267520" TEXT="saved_ip &#xff1a;nat&#x76f8;&#x5173;&#xff1a;dst nat&#x4e4b;&#x540e;&#x7684;&#x771f;&#x6b63;&#x7684;&#x76ee;&#x7684;&#x5730;&#x5740;">
<node CREATED="1429898418204" ID="ID_586931907" MODIFIED="1429899110495">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20174;master connection&#21327;&#35758;&#21253;&#20013;&#35299;&#26512;&#21019;&#24314;&#30340;&#21407;&#22987;struct nf_conntrack_expect ---&gt; tuple&#19968;&#33324;&#26159;&#65306;
    </p>
    <p>
      (protocol,
    </p>
    <p>
      src ip : WAN side PC,
    </p>
    <p>
      dest IP : LAN side PC,
    </p>
    <p>
      src port : port of WAN side PC,
    </p>
    <p>
      dest port : port of LAN side PC)
    </p>
    <p>
      &#36825;&#20010;tuple&#26159;&#27809;&#26377;&#24847;&#35782;&#21040;&#32593;&#20851;&#30340;&#23384;&#22312;&#65292;&#22686;&#21152;&#32593;&#20851;&#21518;&#38656;&#35201;&#23558;&#20854;&#35843;&#25972;&#20026;&#65306;
    </p>
    <p>
      (protocol,
    </p>
    <p>
      src ip : WAN side PC,
    </p>
    <p>
      dest IP : gateway,
    </p>
    <p>
      src port : port of WAN side PC,
    </p>
    <p>
      dest port : port of gateway)
    </p>
    <p>
      &#36825;&#26679;&#35843;&#25972;&#21518;&#30340;tuple&#22833;&#21435;&#20102;2&#20010;&#20449;&#24687;&#65306;dest IP : LAN side PC, dest port : port of LAN side PC&#65292;&#22240;&#27492;&#38656;&#35201;&#23558;&#20854;&#20445;&#23384;&#22312;
    </p>
    <p>
      saved_ip &#65306;&#23427;&#23545;&#24212;&#20102;&#21407;&#22987;tuple&#30340;dest IP : LAN side PC
    </p>
    <p>
      saved_proto &#65306;&#23427;&#23545;&#24212;&#20102;&#21407;&#22987;tuple&#30340;dest port : port of LAN side PC
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1294828618178" ID="ID_330554363" MODIFIED="1299050963349" TEXT="saved_proto &#xff1a;nat&#x76f8;&#x5173;&#xff1a;dst nat&#x4e4b;&#x540e;&#x7684;&#x771f;&#x6b63;&#x7684;&#x76ee;&#x7684;&#x7aef;&#x53e3;"/>
<node CREATED="1294828630933" ID="ID_646094162" MODIFIED="1299051001486" TEXT="dir &#xff1a;nat&#x76f8;&#x5173;&#xff1a;connection&#x7684;&#x65b9;&#x5411;"/>
</node>
</node>
<node CREATED="1440023029414" FOLDED="true" ID="ID_983495244" MODIFIED="1440059807413" TEXT="ALG&#x5e94;&#x7528;">
<node CREATED="1440023041161" ID="ID_1784997978" MODIFIED="1440023045307" TEXT="PPTP">
<node CREATED="1440024244774" FOLDED="true" ID="ID_1421938203" MODIFIED="1440035182117" TEXT="&#x9700;&#x8981;&#x89e3;&#x51b3;&#x7684;&#x95ee;&#x9898;">
<node CREATED="1440026665121" FOLDED="true" ID="ID_1383236916" MODIFIED="1440028350658" TEXT="PPTP &#x6570;&#x636e;&#x5305;&#x683c;&#x5f0f;">
<node CREATED="1433890880039" ID="ID_26839694" MODIFIED="1433890965951">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/pptp_data_packet_format_1.PNG" />
  </body>
</html></richcontent>
</node>
<node CREATED="1440026801079" ID="ID_461686178" MODIFIED="1440026825652">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/pptp_data_pkt_1.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1433864457576" FOLDED="true" ID="ID_1222478551" MODIFIED="1440029509340" TEXT="PPTP&#x901a;&#x4fe1;&#x4e2d;&#x7684;Call ID">
<node CREATED="1433864540952" ID="ID_1281107016" MODIFIED="1440028549001" TEXT="Call ID&#x5bf9;&#x5e94;&#x4e00;&#x4e2a;client&#x4e0e;server&#x4e4b;&#x95f4;&#x7684;&#x8fde;&#x63a5;&#xff0c;&#x4e5f;&#x5c31;&#x662f;&#x4e00;&#x5bf9;PAC-PNS&#x3002;"/>
<node CREATED="1433864710783" ID="ID_655606875" MODIFIED="1433864751492" TEXT="Call ID&#x7531;PAC&#x548c;PNS&#x5404;&#x81ea;&#x5206;&#x914d;&#xff0c;&#x6240;&#x5206;&#x914d;&#x7684;Call ID&#x53ea;&#x5bf9;&#x81ea;&#x5df1;&#x6709;&#x610f;&#x4e49;"/>
<node CREATED="1440028572989" ID="ID_1133703093" MODIFIED="1440028706601" TEXT="PPTP&#x6570;&#x636e;&#x5305;&#x4e2d;&#x7684;call id&#x4ee3;&#x8868;&#x76ee;&#x7684;call id&#xff0c;&#x7531;&#x5bf9;&#x7aef;&#x89e3;&#x91ca;&#x6b64;call id"/>
</node>
<node CREATED="1440026861838" FOLDED="true" ID="ID_1098175234" MODIFIED="1440035179637" TEXT="NAT&#x8bbe;&#x5907;&#x5f15;&#x5165;&#x7684;&#x95ee;&#x9898;">
<node CREATED="1440027911158" ID="ID_902965868" MODIFIED="1440027938566">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/pptp_data_pkt_2.PNG" />
  </body>
</html></richcontent>
</node>
<node CREATED="1440027985997" ID="ID_1903314372" MODIFIED="1440028289921">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;PPTP server&#26469;&#35828;&#65292;&#19981;&#21516;&#30340;client&#36830;&#36807;&#26469;&#26102;&#65292;server&#20250;&#20998;&#37197;&#19981;&#21516;&#30340;call id&#12290;
    </p>
    <p>
      &#22240;&#27492;&#65292;&#23545;&#20110;&#19982;PPTP client 1&#30340;&#36830;&#25509;&#65292;server&#20998;&#37197;&#20102;call id <b>XXX&#160;</b>&#20316;&#20026;&#33258;&#24049;&#30340;call id
    </p>
    <p>
      &#23545;&#20110;&#19982;PPTP client 2&#30340;&#36830;&#25509;&#65292;server&#20998;&#37197;&#20102;call id <b>ZZZ&#160; </b>&#20316;&#20026;&#33258;&#24049;&#30340;call id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1440028895074" ID="ID_831836382" MODIFIED="1440029165308">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;&#21516;&#19968;&#20010;&#36830;&#25509;&#65292;server&#21644;client&#37117;&#20250;&#20998;&#37197;&#33258;&#24049;&#30340;call id&#65292;&#21521;&#23545;&#31471;&#21457;&#21253;&#26102;&#35201;&#22635;&#19978;&#23545;&#31471;&#30340;call id&#12290;
    </p>
    <p>
      &#30001;&#20110;call id&#37117;&#26159;&#30001;PPTP&#35774;&#22791;&#33258;&#24049;&#20998;&#37197;&#30340;&#65292;&#19988;&#20165;&#22312;PPTP&#35774;&#22791;&#33258;&#24049;&#26412;&#22320;&#26377;&#24847;&#20041;&#65292;&#22240;&#27492;&#26080;&#27861;&#36991;&#20813;
    </p>
    <p>
      NAT&#35774;&#22791;LAN&#20391;&#30340;&#22810;&#20010;PPTP client&#20998;&#37197;&#30456;&#21516;&#30340;call id&#65292;&#27604;&#22914;client 1&#21644;client 2&#37117;&#29992;OOO&#20316;&#20026;&#33258;&#24049;&#26412;&#22320;&#30340;call id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1440029261245" ID="ID_1550308544" MODIFIED="1440029437612">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36825;&#26102;server&#21457;&#32473;client 1&#21644;client 2&#30340;&#21253;&#20855;&#26377;&#30456;&#21516;&#30340;call id <b>OOO</b>&#12290;&#20877;&#21152;&#19978;&#30446;&#30340;IP&#22320;&#22336;&#37117;&#26159;NAT&#35774;&#22791;&#65292;&#28304;IP&#22320;&#22336;&#37117;&#26159;server&#65292;&#36825;&#26679;server&#21457;&#32473;client 1&#21644;client 2&#30340;&#21253;&#23558;&#26080;&#27861;&#21306;&#20998;&#65292;&#36890;&#20449;&#23558;&#20250;&#20013;&#26029;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1440029531232" FOLDED="true" ID="ID_395243292" MODIFIED="1440035350390" TEXT="&#x89e3;&#x51b3;&#x65b9;&#x6848;">
<node CREATED="1440029821930" ID="ID_671738360" MODIFIED="1440030067167">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35201;&#35753;PPTP server&#30475;&#21040;&#65292;NAT&#35774;&#22791;LAN&#20391;&#21518;&#38754;&#19981;&#21516;&#30340;client&#26377;&#19981;&#21516;&#30340;call id&#65292;&#36825;&#26679;server&#21457;&#21040;&#19981;&#21516;clien&#30340;&#21253;&#21040;&#36798;NAT&#35774;&#22791;&#26102;&#21487;&#20197;&#26681;&#25454;call id&#23558;&#20854;&#36716;&#21457;&#32473;LAN&#20391;&#19981;&#21516;client&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1433893115087" FOLDED="true" ID="ID_1900801565" MODIFIED="1440033363283">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/pptp_protocol_flow.PNG" />
  </body>
</html></richcontent>
<node CREATED="1440029791037" ID="ID_196911281" MODIFIED="1440030586637">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      PPTP&#21508;&#26041;&#30340;call id&#26159;&#22312;&#20854;&#25511;&#21046;&#36830;&#25509;&#20013;&#21327;&#21830;&#20132;&#25442;&#30340;&#12290;&#27599;&#20010;client&#21644;server&#20043;&#38388;&#20250;&#24314;&#31435;&#19968;&#26465;&#22522;&#20110;TCP&#30340;&#25511;&#21046;&#36830;&#25509;&#12290;client&#36890;&#36807;outgoing call request&#28040;&#24687;&#23558;&#33258;&#24049;&#30340;call id&#21578;&#35785;server&#12290;server&#36890;&#36807;outgoing call reply&#28040;&#24687;&#23558;&#33258;&#24049;&#30340;call id&#21578;&#35785;client&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1433888272525" ID="ID_1788865828" MODIFIED="1433888299167">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/pptp_control_packet_format.PNG" />
  </body>
</html></richcontent>
</node>
<node CREATED="1440030767239" ID="ID_1880539489" MODIFIED="1440030768879" TEXT="Outgoing-Call-Request">
<node CREATED="1440030727717" ID="ID_1939612964" MODIFIED="1440030742353">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/pptp_msg_Outgoing-Call-Request.PNG" />
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1440030767239" ID="ID_1910079834" MODIFIED="1440030790284" TEXT="Outgoing-Call-Reply">
<node CREATED="1440030727717" ID="ID_1996387413" MODIFIED="1440030819159">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/pptp_msg_Outgoing-Call-Reply.PNG" />
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1440033371256" ID="ID_1541165927" MODIFIED="1440033384401">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/pptp_data_pkt_3.PNG" />
  </body>
</html></richcontent>
<node CREATED="1440030606443" ID="ID_1270320394" MODIFIED="1440033904460" TEXT="NAT&#x8bbe;&#x5907;&#x76d1;&#x63a7;client&#x4e0e;server&#x4e4b;&#x95f4;&#x7684;&#x63a7;&#x5236;&#x8fde;&#x63a5;&#xff0c;&#x4fee;&#x6539;outgoing-call-request&#x6d88;&#x606f;&#x4e2d;client&#x81ea;&#x5df1;&#x5206;&#x914d;&#x7684;call id&#xff0c;&#x5c06;&#x5176;&#x6539;&#x4e3a;&#x5728;NAT&#x8bbe;&#x5907;&#x4e0a;&#x552f;&#x4e00;&#x7684;&#x53e6;&#x4e00;&#x4e2a;call id&#x3002;&#x8fd9;&#x6837;server&#x5c06;&#x770b;&#x5230;NAT&#x8bbe;&#x5907;LAN&#x4fa7;&#x540e;&#x9762;&#x4e0d;&#x540c;&#x7684;client&#x5177;&#x6709;&#x4e0d;&#x540c;&#x7684;call id&#x3002;&#xa;&#xa;&#x53e6;&#x5916;&#xff0c;NAT&#x8bbe;&#x5907;&#x4e5f;&#x8981;&#x4fee;&#x6539;outgoing-call-reply&#x6d88;&#x606f;&#x4e2d;&#x7684;peer call id&#xff0c;&#x5c06;&#x5176;&#x6539;&#x56de;&#x4e3a;client&#x81ea;&#x5df1;&#x672c;&#x5730;&#x5206;&#x914d;&#x7684;call id&#xff0c;&#x8fd9;&#x6837;client&#x8fd8;&#x662f;&#x7528;&#x539f;&#x5148;&#x81ea;&#x5df1;&#x672c;&#x5730;&#x7684;call id&#x5904;&#x7406;&#x6d88;&#x606f;&#x3002;&#x5bf9;&#x4e8e;client&#x6765;&#x8bf4;&#xff0c;&#x4ec0;&#x4e48;&#x4e5f;&#x6ca1;&#x6709;&#x53d8;&#x3002;&#xa;&#xa;&#x603b;&#x7684;&#x8bf4;&#xff0c;NAT&#x8bbe;&#x5907;&#x5728;&#x4e2d;&#x95f4;&#x5c06;client&#x7684;call id&#x8fdb;&#x884c;&#x4e86;&#x4e00;&#x6b21;&#x91cd;&#x6620;&#x5c04;&#x3002;&#xa;&#xa;&#x5bf9;&#x4e8e;&#x6570;&#x636e;&#x8fde;&#x63a5;&#x6765;&#x8bf4;&#xff0c;client&#x5230;server&#x7684;&#x5305;&#x4e0d;&#x9700;&#x8981;&#x4fee;&#x6539;&#xff0c;&#x5176;&#x4e2d;call id&#x7684;&#x552f;&#x4e00;&#x6027;&#x7531;server&#x81ea;&#x5df1;&#x4fdd;&#x8bc1;&#xff0c;&#x56e0;&#x4e3a;&#x65e0;&#x8bba;&#x662f;&#x54ea;&#x4e2a;client&#x53d1;&#x5230;server&#x7684;&#x6570;&#x636e;&#x5305;&#xff0c;&#x5176;&#x4e2d;&#x7684;call id&#x90fd;&#x662f;server&#x81ea;&#x5df1;&#x5206;&#x914d;&#x7684;&#x3002;&#xa;server&#x5230;client&#x7684;&#x5305;&#xff0c;&#x5176;&#x4e2d;&#x7684;call id&#x9700;&#x8981;&#x6839;&#x636e;NAT&#x8bbe;&#x5907;&#x5efa;&#x7acb;&#x7684;&#x91cd;&#x6620;&#x5c04;&#x5173;&#x7cfb;&#x8fdb;&#x884c;&#x4fee;&#x6539;&#x3002;&#x5c06;&#x6620;&#x5c04;&#x540e;&#x7684;call id&#x6539;&#x4e3a;client&#x672c;&#x5730;&#x7684;call id&#x3002;"/>
</node>
<node CREATED="1440031181341" ID="ID_1344948962" MODIFIED="1440031202822" TEXT="&#x5982;&#x4f55;&#x4fdd;&#x8bc1;call id&#x5728;NAT&#x8bbe;&#x5907;&#x4e0a;&#x7684;&#x552f;&#x4e00;&#x6027;">
<node CREATED="1440033965643" ID="ID_1413102483" MODIFIED="1440034210997" TEXT="&#x6bcf;&#x4e2a;client&#x90fd;&#x9700;&#x8981;&#x5411;server&#x53d1;&#x8d77;&#x4e00;&#x4e2a;TCP&#x7684;&#x63a7;&#x5236;&#x8fde;&#x63a5;&#xff0c;&#x5176;&#x76ee;&#x7684;&#x7aef;&#x53e3;&#x5747;&#x4e3a;1723&#xff0c;&#x5176;&#x6e90;&#x7aef;&#x53e3;&#x7ecf;&#x8fc7;NAT&#x8bbe;&#x5907;NAT&#x4e4b;&#x540e;&#x80fd;&#x4fdd;&#x8bc1;&#x5176;&#x5728;NAT&#x8bbe;&#x5907;&#x4e0a;&#x7684;&#x552f;&#x4e00;&#x6027;&#x3002;&#x6240;&#x4ee5;&#x7528;PPTP TCP&#x63a7;&#x5236;&#x8fde;&#x63a5;&#x7684;NAT&#x4e4b;&#x540e;&#x7684;&#x6e90;&#x7aef;&#x53e3;&#x53f7;&#x4f5c;&#x4e3a;&#x6620;&#x5c04;&#x540e;&#x7684;call id&#x5929;&#x7136;&#x7684;&#x80fd;&#x4fdd;&#x8bc1;&#x5176;&#x5728;NAT&#x8bbe;&#x5907;&#x4e0a;&#x7684;&#x552f;&#x4e00;&#x6027;&#x3002;"/>
</node>
</node>
<node CREATED="1440048540344" FOLDED="true" ID="ID_1371310157" MODIFIED="1440059805157" TEXT="Linux&#x5b9e;&#x73b0;">
<node CREATED="1440048632880" FOLDED="true" ID="ID_1457800499" MODIFIED="1440051391313">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25991;&#20214;net/netfilter/nf_conntrack_pptp.c&#20013;&#21021;&#22987;&#21270;&#20989;&#25968;nf_conntrack_pptp_init()
    </p>
    <p>
      &#35843;&#29992;nf_conntrack_helper_register()&#27880;&#20876;&#20102;&#19968;&#20010;helper
    </p>
  </body>
</html></richcontent>
<node CREATED="1440048850751" ID="ID_323057392" MODIFIED="1440048852818" TEXT="struct nf_conntrack_helper pptp">
<node CREATED="1440048873287" ID="ID_315573021" MODIFIED="1440048898180">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .tuple.src.l3num = AF_INET
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1440048916690" ID="ID_979233764" MODIFIED="1440048930076">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .tuple.src.u.tcp.port = 1723
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1440048945303" ID="ID_1861559113" MODIFIED="1440048958753">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .tuple.dst.protonum&#160;= IPPROTO_TCP
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1440048974524" ID="ID_1102752664" MODIFIED="1440048984960">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .help = conntrack_pptp_help
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1440049115063" ID="ID_842932406" MODIFIED="1440049383452" TEXT="&#x8fd9;&#x4e2a;helper&#x76d1;&#x63a7;client&#x4e0e;server&#x4e4b;&#x95f4;&#x7684;&#x63a7;&#x5236;&#x8fde;&#x63a5;&#xff0c;&#x5373;&#x76ee;&#x7684;&#x7aef;&#x53e3;&#x4e3a;1723&#x7684;TCP&#x8fde;&#x63a5;"/>
</node>
<node CREATED="1440049444247" FOLDED="true" ID="ID_1067914905" MODIFIED="1440051389600">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      LAN&#20391;&#30340;client&#21521;WAN&#20391;&#30340;server&#21457;&#36215;TCP&#25511;&#21046;&#36830;&#25509;&#65292;&#24314;&#31435;&#26032;&#36830;&#25509;&#26102;&#65292;
    </p>
    <p>
      &#29992;reply&#26041;&#21521;&#30340;tuple&#26597;&#25214;helper&#65292;&#20174;&#32780;&#23558;PPTP helper&#20851;&#32852;&#21040;&#27492;&#36830;&#25509;&#12290;
    </p>
    <p>
      &#27880;&#24847;&#24314;&#31435;&#36830;&#25509;&#26102;&#20165;&#20165;&#26159;&#23558;helper&#20851;&#32852;&#21040;&#36830;&#25509;&#65292;&#32780;&#19981;&#35843;&#29992;helper&#30340;inspect&#20989;&#25968;&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1440049542606" ID="ID_265456040" MODIFIED="1440049566619" TEXT="nf_conntrack_in()">
<node CREATED="1440049567629" ID="ID_130527009" MODIFIED="1440049570014" TEXT="resolve_normal_ct()">
<node CREATED="1440049596184" ID="ID_1868792205" MODIFIED="1440049599158" TEXT="init_conntrack()">
<node CREATED="1440049728111" ID="ID_1000249413" MODIFIED="1440049731285" TEXT="__nf_ct_try_assign_helper()"/>
</node>
</node>
</node>
<node CREATED="1440050207327" ID="ID_1054455687" MODIFIED="1440050237341" TEXT="&#x67e5;&#x627e;&#x5230;&#x7684;PPTP helper&#x88ab;&#x5b58;&#x653e;&#x5728;nfct_help(ct)-&gt;helper&#x4e2d;"/>
<node CREATED="1440050273996" ID="ID_469177342" MODIFIED="1440050367316" TEXT="LAN&#x4fa7;client&#x5411;WAN&#x4fa7;server&#x53d1;&#x8d77;&#x7684;TCP&#x63a7;&#x5236;&#x8fde;&#x63a5;&#xff0c;&#x5176;&#x76ee;&#x7684;&#x7aef;&#x53e3;&#x53f7;&#x662f;1723&#xff0c;&#x4ece;&#x800c;reply&#x65b9;&#x5411;&#x7684;tuple&#x5176;&#x6e90;&#x7aef;&#x53e3;&#x53f7;&#x662f;1723&#xff0c;&#x56e0;&#x6b64;&#x80fd;&#x591f;&#x5339;&#x914d;&#x5230;PPTP helper">
<node CREATED="1440051155497" ID="ID_622209359" LINK="#ID_1503073395" MODIFIED="1440051232129" TEXT="&#x6ce8;&#x610f;&#xff0c;&#x67e5;&#x627e;helper&#x65f6;&#x662f;&#x7528;reply&#x65b9;&#x5411;&#x7684;tuple&#x67e5;&#x627e;&#x7684;"/>
</node>
</node>
<node CREATED="1440051395139" ID="ID_627781304" MODIFIED="1440051669259">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;netfilter&#30340;postrouting&#28857;&#65292;&#25191;&#34892;helper&#30340;inspect&#20989;&#25968;nfct_help(ct)-&gt;helper-&gt;help()
    </p>
    <p>
      helper&#34987;&#20851;&#32852;&#21040;&#36830;&#25509;ct&#65292;&#22240;&#27492;&#26080;&#35770;&#26159;original&#36824;&#26159;reply&#26041;&#21521;&#30340;&#21253;&#65292;&#20854;&#32463;&#36807;postrouting&#28857;&#26102;&#37117;&#20250;&#25191;&#34892;&#27492;inspect&#20989;&#25968;&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1440052657148" FOLDED="true" ID="ID_617888427" MODIFIED="1440059034977" TEXT="conntrack_pptp_help()">
<node CREATED="1440052668442" ID="ID_1322255647" MODIFIED="1440053048059">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;original&#26041;&#21521;&#30340;&#21253;&#26469;&#35828;&#65292;&#20027;&#35201;&#26159;&#37325;&#26144;&#23556;outgoing-call-request&#28040;&#24687;&#20013;&#30340;call id&#65292;
    </p>
    <p>
      &#21363;&#23558;&#20854;&#25913;&#20026;reply tuple -&gt; TCP destination port
    </p>
  </body>
</html></richcontent>
<node CREATED="1440052872215" ID="ID_62299878" MODIFIED="1440052875497" TEXT="pptp_outbound_pkt()">
<node CREATED="1440054980787" ID="ID_1934157846" MODIFIED="1440055172198">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;nf_nat_pptp_outbound()&#23545;call id&#36827;&#34892;&#37325;&#26144;&#23556;
    </p>
    <p>
      net/ipv4/netfilter/nf_nat_pptp.c : pptp_outbound_pkt()
    </p>
  </body>
</html></richcontent>
<node CREATED="1440053362807" ID="ID_1335187186" MODIFIED="1440055565489" TEXT="&#x539f;&#x59cb;&#x7684;call id&#x4fdd;&#x5b58;&#x5728;nfct_nat(ct)-&gt;help.nat_pptp_info&#x4e2d;">
<node CREATED="1440054767501" ID="ID_1264865367" MODIFIED="1440054768302" TEXT="struct nf_nat_pptp">
<node CREATED="1440054784144" ID="ID_997826610" MODIFIED="1440054801234" TEXT="__be16 pns_call_id;          /* NAT&apos;ed PNS call id */">
<node CREATED="1440055612551" ID="ID_287382145" MODIFIED="1440055657857" TEXT="&#x5b9e;&#x9645;&#x4e0a;&#x662f;client&#x7684;call id"/>
</node>
<node CREATED="1440054814361" ID="ID_850326922" MODIFIED="1440054824640" TEXT="__be16 pac_call_id;          /* NAT&apos;ed PAC call id */">
<node CREATED="1440055612551" ID="ID_1667902079" MODIFIED="1440055663337" TEXT="&#x5b9e;&#x9645;&#x4e0a;&#x662f;server&#x7684;call id"/>
</node>
</node>
</node>
<node CREATED="1440053376743" ID="ID_250013421" MODIFIED="1440055645827" TEXT="&#x6620;&#x5c04;&#x540e;&#x7684;call id&#x4fdd;&#x5b58;&#x5728;struct nf_ct_pptp_master *info = nfct_help_data(ct)&#x4e2d;">
<node CREATED="1440053419125" ID="ID_1766216632" MODIFIED="1440053420452" TEXT="struct nf_ct_pptp_master">
<node CREATED="1440053444185" ID="ID_1569869802" MODIFIED="1440053459349" TEXT="enum pptp_ctrlsess_state sstate;          /* session state */"/>
<node CREATED="1440053473390" ID="ID_640904" MODIFIED="1440053485001" TEXT="enum pptp_ctrlcall_state cstate;          /* call state */"/>
<node CREATED="1440053503667" ID="ID_1330800811" MODIFIED="1440053513043" TEXT="__be16 pac_call_id;          /* call id of PAC */">
<node CREATED="1440055612551" ID="ID_629234451" MODIFIED="1440055663337" TEXT="&#x5b9e;&#x9645;&#x4e0a;&#x662f;server&#x7684;call id"/>
</node>
<node CREATED="1440053525464" ID="ID_1912852030" MODIFIED="1440053533805" TEXT="__be16 pns_call_id;          /* call id of PNS */">
<node CREATED="1440055612551" ID="ID_201898983" MODIFIED="1440055657857" TEXT="&#x5b9e;&#x9645;&#x4e0a;&#x662f;client&#x7684;call id"/>
</node>
<node CREATED="1440053549583" ID="ID_583938113" MODIFIED="1440053551645" TEXT="struct nf_ct_gre_keymap *keymap[IP_CT_DIR_MAX]"/>
</node>
</node>
<node CREATED="1440055075818" ID="ID_348775120" MODIFIED="1440055095807" TEXT="&#x8c03;&#x7528;nf_nat_mangle_tcp_packet()&#x5bf9;&#x5305;&#x4e2d;&#x7684;call id&#x8fdb;&#x884c;&#x4fee;&#x6539;"/>
</node>
</node>
</node>
<node CREATED="1440052668442" ID="ID_1181713769" MODIFIED="1440055322126">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;reply&#26041;&#21521;&#30340;&#21253;&#26469;&#35828;&#65292;&#20027;&#35201;&#26159;&#37325;&#26144;&#23556;outgoing-call-reply&#28040;&#24687;&#20013;&#30340;peer call id&#65292;
    </p>
    <p>
      &#21363;&#23558;&#20854;&#24674;&#22797;&#20026;&#26144;&#23556;&#21069;&#30340;call id
    </p>
  </body>
</html></richcontent>
<node CREATED="1440052872215" ID="ID_189183811" MODIFIED="1440053075248" TEXT="pptp_inbound_pkt()">
<node CREATED="1440056215873" ID="ID_620062032" MODIFIED="1440056433309">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;exp_gre()&#28155;&#21152;expect connection
    </p>
    <p>
      original, reply&#20004;&#20010;&#26041;&#21521;&#19978;&#30340;expect connection&#37117;&#35201;&#28155;&#21152;
    </p>
  </body>
</html></richcontent>
<node CREATED="1440056468791" ID="ID_381800133" MODIFIED="1440056550147" TEXT="original&#x65b9;&#x5411;&#x7684;expect connection&#xff0c;&#x5176;src call id&#x662f;&#x91cd;&#x6620;&#x5c04;&#x4e4b;&#x540e;client&#x7684;call id&#xff0c;dest call id&#x662f;server&#x7684;call id"/>
<node CREATED="1440056468791" ID="ID_251879494" MODIFIED="1440056630104" TEXT="reply&#x65b9;&#x5411;&#x7684;expect connection&#xff0c;&#x5176;src call id&#x662f;server&#x7684;call id&#xff0c;dest call id&#x662f;&#x91cd;&#x6620;&#x5c04;&#x4e4b;&#x540e;client&#x7684;call id"/>
<node CREATED="1440056723197" ID="ID_1761646556" MODIFIED="1440058332522" TEXT="&#x8c03;&#x7528;nf_nat_pptp_exp_gre()&#x5bf9;&#x4e24;&#x4e2a;&#x65b9;&#x5411;&#x4e0a;&#x7684;expect connection&#x505a;NAT">
<node CREATED="1440056468791" ID="ID_123558101" MODIFIED="1440059000938">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;original&#26041;&#21521;&#30340;expect connection&#65292;&#23558;&#20854;src call id&#35843;&#25972;&#20026;client&#21407;&#22987;&#30340;call id&#65292;&#21363;&#37325;&#26144;&#23556;&#20043;&#21069;client&#30340;call id&#65292;
    </p>
    <p>
      &#21516;&#26102;&#23558;&#37325;&#26144;&#23556;&#20043;&#21518;client&#30340;call id&#23384;&#20648;&#22312;expect_orig-&gt;saved_proto.gre.key&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1440056468791" ID="ID_1604186588" MODIFIED="1440058915790" TEXT="&#x5bf9;reply&#x65b9;&#x5411;&#x7684;expect connection&#xff0c;&#x5339;&#x914d;&#x7684;tuple&#x5176;&#x5b9e;&#x6ca1;&#x6709;&#x53d8;&#x5316;&#xff0c;&#x53ea;&#x4e0d;&#x8fc7;&#x628a;client&#x539f;&#x59cb;&#x7684;call id&#x5b58;&#x50a8;&#x5728;expect_reply-&gt;saved_proto.gre.key&#x4e2d;"/>
</node>
<node CREATED="1440056659935" ID="ID_1421368709" MODIFIED="1440056685469" TEXT="&#x8c03;&#x7528;nf_ct_expect_related()&#x6dfb;&#x52a0;&#x4e24;&#x4e2a;&#x65b9;&#x5411;&#x4e0a;&#x7684;expect connection"/>
<node CREATED="1440056709075" ID="ID_1813610455" MODIFIED="1440056712124" TEXT="nf_ct_gre_keymap_add()"/>
</node>
<node CREATED="1440054980787" ID="ID_355641103" MODIFIED="1440055480766">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;nf_nat_pptp_inbound()&#23545;call id&#36827;&#34892;&#37325;&#26144;&#23556;
    </p>
    <p>
      net/ipv4/netfilter/nf_nat_pptp.c : pptp_inbound_pkt()
    </p>
  </body>
</html></richcontent>
<node CREATED="1440053362807" ID="ID_832737825" LINK="#ID_1264865367" MODIFIED="1440055761209" TEXT="&#x539f;&#x59cb;&#x7684;call id&#x4fdd;&#x5b58;&#x5728;nfct_nat(ct)-&gt;help.nat_pptp_info&#x4e2d;"/>
<node CREATED="1440053376743" ID="ID_215048330" LINK="#ID_1766216632" MODIFIED="1440055774833" TEXT="&#x6620;&#x5c04;&#x540e;&#x7684;call id&#x4fdd;&#x5b58;&#x5728;struct nf_ct_pptp_master *info = nfct_help_data(ct)&#x4e2d;"/>
<node CREATED="1440055075818" ID="ID_502588493" MODIFIED="1440055917849">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;nf_nat_mangle_tcp_packet()&#23558;&#21253;&#20013;&#30340;peer call id&#20462;&#25913;&#20026;client&#21407;&#22987;&#30340;call id
    </p>
    <p>
      client&#21407;&#22987;&#30340;call id&#20445;&#23384;&#22312;nfct_nat(ct)-&gt;help.nat_pptp_info . pns_call_id&#20013;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1440059120414" ID="ID_822064875" MODIFIED="1440059769363">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      PPTP&#25968;&#25454;&#36830;&#25509;&#24314;&#31435;&#26102;&#20250;&#25628;&#32034;&#21305;&#37197;expect connection&#65292;&#20174;&#32780;&#35843;&#29992;exp-&gt;expectfn()&#65292;&#21363;pptp_expectfn()
    </p>
    <p>
      &#20026;&#25968;&#25454;&#36830;&#25509;&#24314;&#31435;NAT&#20449;&#24687;&#21518;&#65292;&#26080;&#35770;&#26159;original&#36824;&#26159;reply&#26041;&#21521;&#65292;&#21253;&#37117;&#19981;&#20877;&#34987;&#38450;&#28779;&#22681;&#20002;&#24323;&#12290;
    </p>
  </body>
</html></richcontent>
<node CREATED="1440059266965" FOLDED="true" ID="ID_1482016147" MODIFIED="1440059800092">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      nf_nat_pptp_expectfn()
    </p>
    <p>
      net/ipv4/netfilter/nf_nat_pptp.c : pptp_nat_expected()
    </p>
  </body>
</html></richcontent>
<node CREATED="1440059405604" ID="ID_1392306555" MODIFIED="1440059603947" TEXT="&#x4e3a;&#x6570;&#x636e;&#x8fde;&#x63a5;&#x5efa;&#x7acb;DNAT&#x4fe1;&#x606f;&#xff0c;&#x8fd9;&#x4e3b;&#x8981;&#x662f;&#x4e3a;reply&#x65b9;&#x5411;&#x7684;&#x5305;&#x505a;DNAT&#x7528;&#xff0c;&#x5373;&#x5c06;WAN&#x4fa7;&#x6765;&#x7684;PPTP&#x6570;&#x636e;&#x5305;&#x7684;&#x76ee;&#x7684;call id&#x8f6c;&#x6362;&#x4e3a;client&#x7684;&#x539f;&#x59cb;call id">
<node CREATED="1440059786246" ID="ID_987126000" MODIFIED="1440059791012" TEXT="nf_nat_setup_info()"/>
</node>
<node CREATED="1440059405604" ID="ID_1119512445" MODIFIED="1440059666395" TEXT="&#x4e3a;&#x6570;&#x636e;&#x8fde;&#x63a5;&#x5efa;&#x7acb;SNAT&#x4fe1;&#x606f;&#xff0c;&#x8fd9;&#x4e3b;&#x8981;&#x662f;&#x4e3a;original&#x65b9;&#x5411;&#x7684;&#x5305;&#x505a;SNAT&#x7528;&#xff0c;&#x5373;&#x5c06;LAN&#x4fa7;&#x6765;&#x7684;PPTP&#x6570;&#x636e;&#x5305;&#x7684;&#x76ee;&#x7684;call id&#x8f6c;&#x6362;&#x4e3a;server&#x7684;call id">
<node CREATED="1440059786246" ID="ID_1022946894" MODIFIED="1440059791012" TEXT="nf_nat_setup_info()"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1439942705996" FOLDED="true" ID="ID_1189532241" MODIFIED="1440023009700" POSITION="right" TEXT="layer 4 state">
<node CREATED="1439942736401" FOLDED="true" ID="ID_220679981" MODIFIED="1440023007711" TEXT="tcp state transfer">
<node CREATED="1439945438103" ID="ID_1610639672" MODIFIED="1439945455040">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/Linux_TCP_state.png" />
  </body>
</html></richcontent>
<node CREATED="1439946741613" ID="ID_1082949385" MODIFIED="1439946827615">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tcp_timeouts[ xxx ] = {
    </p>
    <p>
      [TCP_CONNTRACK_SYN_SENT] =&#160;&#160;&#160;&#160;&#160;2 MINS,
    </p>
    <p>
      [TCP_CONNTRACK_SYN_RECV] = &#160;&#160;&#160;&#160;60 SECS,
    </p>
    <p>
      [TCP_CONNTRACK_ESTABLISHED] = &#160;&#160;&#160;&#160;5 DAYS,
    </p>
    <p>
      [TCP_CONNTRACK_FIN_WAIT] = &#160;&#160;&#160;&#160;2 MINS,
    </p>
    <p>
      [TCP_CONNTRACK_CLOSE_WAIT] = &#160;&#160;&#160;&#160;60 SECS,
    </p>
    <p>
      [TCP_CONNTRACK_LAST_ACK] = &#160;&#160;&#160;&#160;30 SECS,
    </p>
    <p>
      [TCP_CONNTRACK_TIME_WAIT] = &#160;&#160;&#160;&#160;2 MINS,
    </p>
    <p>
      [TCP_CONNTRACK_CLOSE] = &#160;&#160;&#160;&#160;10 SECS,
    </p>
    <p>
      [TCP_CONNTRACK_SYN_SENT2] =&#160;&#160;&#160;&#160;&#160;2 MINS,
    </p>
    <p>
      [TCP_CONNTRACK_RETRANS] = &#160;&#160;&#160;&#160;5 MINS,
    </p>
    <p>
      [TCP_CONNTRACK_UNACK] = &#160;&#160;&#160;&#160;5 MINS,
    </p>
    <p>
      };
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1439944792091" ID="ID_1975304647" MODIFIED="1439945145091" TEXT="TCP state definition">
<node CREATED="1439944808796" ID="ID_973332870" MODIFIED="1439944910179">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sNO&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_NONE
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sSS&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_SYN_SENT
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sSR&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_SYN_RECV
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sES&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_ESTABLISHED
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sFW&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_FIN_WAIT
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sCW&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_CLOSE_WAIT
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sLA&#160;&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_LAST_ACK
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sTW&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_TIME_WAIT
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sCL&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_CLOSE
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sS2 &#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_SYN_SENT2
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sIV &#160;&#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_MAX
    </p>
    <p>
      #define&#160;&#160;&#160;&#160;&#160;sIG &#160;&#160;&#160;&#160;&#160;&#160;TCP_CONNTRACK_IGNORE
    </p>
  </body>
</html></richcontent>
<node CREATED="1439944952323" ID="ID_1446013833" MODIFIED="1439945088412">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      enum tcp_conntrack {
    </p>
    <p>
      0, TCP_CONNTRACK_NONE,
    </p>
    <p>
      1, TCP_CONNTRACK_SYN_SENT,
    </p>
    <p>
      2, TCP_CONNTRACK_SYN_RECV,
    </p>
    <p>
      3, TCP_CONNTRACK_ESTABLISHED,
    </p>
    <p>
      4, TCP_CONNTRACK_FIN_WAIT,
    </p>
    <p>
      5, TCP_CONNTRACK_CLOSE_WAIT,
    </p>
    <p>
      6, TCP_CONNTRACK_LAST_ACK,
    </p>
    <p>
      7, TCP_CONNTRACK_TIME_WAIT,
    </p>
    <p>
      8, TCP_CONNTRACK_CLOSE,
    </p>
    <p>
      9, TCP_CONNTRACK_SYN_SENT2
    </p>
    <p>
      TCP_CONNTRACK_MAX,
    </p>
    <p>
      TCP_CONNTRACK_IGNORE,
    </p>
    <p>
      };
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1439942796409" ID="ID_1185298953" MODIFIED="1439942846791" TEXT="triggered by packets from original direction">
<node CREATED="1439942883612" ID="ID_1542037128" MODIFIED="1439945395754">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table border="0" style="width: 80%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 0; border-right-width: 0; border-bottom-width: 0; border-left-width: 0">
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            event\old
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sNO
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSS
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSR
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sES
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sFW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sS2
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sync
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSS
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSS
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSS
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSS
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sS2
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            synack
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSR
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSR
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            fin
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sFW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sFW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            ack
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sES
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sES
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sES
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            rst
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            none
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
      </tr>
    </table>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1439942796409" ID="ID_957611586" MODIFIED="1439945261656" TEXT="triggered by packets from reply direction">
<node CREATED="1439942883612" ID="ID_1006033296" MODIFIED="1439944617812">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <table border="0" style="width: 80%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 0; border-right-width: 0; border-bottom-width: 0; border-left-width: 0">
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            event\old
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sNO
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSS
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSR
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sES
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sFW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sS2
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sync
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sS2
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sS2
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            synack
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSR
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSR
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            fin
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sFW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sFW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sLA
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            ack
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sSR
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sES
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sTW
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIG
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            rst
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sCL
          </p>
        </td>
      </tr>
      <tr>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            none
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
        <td valign="top" style="width: 9%; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-width: 1; border-right-width: 1; border-bottom-width: 1; border-left-width: 1">
          <p style="margin-top: 1; margin-right: 1; margin-bottom: 1; margin-left: 1">
            sIV
          </p>
        </td>
      </tr>
    </table>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1439945504015" ID="ID_265291007" MODIFIED="1439945520388" TEXT="&#x5178;&#x578b;&#x7684;TCP&#x72b6;&#x6001;&#x8f6c;&#x79fb;&#x8fc7;&#x7a0b;">
<node CREATED="1439945524756" ID="ID_1765173033" MODIFIED="1439945575663" TEXT="LAN&#x4e3b;&#x52a8;&#x4fa7;&#x53d1;&#x8d77;TCP&#x8fde;&#x63a5;&#xff0c;&#x6700;&#x540e;&#x4e3b;&#x52a8;&#x5173;&#x95ed;TCP&#x8fde;&#x63a5;">
<node CREATED="1439945626832" ID="ID_481219891" MODIFIED="1439945766720" TEXT="DUT&#x6536;&#x5230;LAN&#x4fa7;&#x53d1;&#x51fa;&#x7684;sync&#xff0c;&#x8fde;&#x63a5;&#x7531;&#x521d;&#x59cb;&#x7684;sNO (0: none)&#x8f6c;&#x6362;&#x5230;sSS (1: sync sent)">
<node CREATED="1439945849049" ID="ID_1841235534" MODIFIED="1439945886705" TEXT="&#x5305;&#x4ece;original&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x6240;&#x4ee5;&#x7d22;&#x5f15;&#x4e0a;&#x9762;&#x7684;original&#x65b9;&#x5411;&#x7684;&#x8868;"/>
</node>
<node CREATED="1439945626832" ID="ID_849328130" MODIFIED="1439945929978" TEXT="DUT&#x6536;&#x5230;WAN&#x4fa7;&#x56de;&#x5e94;&#x7684;sync+ack&#xff0c;&#x8fde;&#x63a5;&#x7531;sSS (1: sync sent)&#x8f6c;&#x6362;&#x5230;sSR (2: sync recvd)">
<node CREATED="1439945849049" ID="ID_556889820" MODIFIED="1439945956146" TEXT="&#x5305;&#x4ece;reply&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x6240;&#x4ee5;&#x7d22;&#x5f15;&#x4e0a;&#x9762;&#x7684;reply&#x65b9;&#x5411;&#x7684;&#x8868;"/>
</node>
<node CREATED="1439945626832" ID="ID_457708697" MODIFIED="1439946035456" TEXT="DUT&#x6536;&#x5230;LAN&#x4fa7;&#x53d1;&#x51fa;&#x7684;ack&#xff0c;&#x8fde;&#x63a5;&#x7531;sSR (2: sync recvd)&#x8f6c;&#x6362;&#x5230;sES (3: established)">
<node CREATED="1439945849049" ID="ID_552208947" MODIFIED="1439945886705" TEXT="&#x5305;&#x4ece;original&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x6240;&#x4ee5;&#x7d22;&#x5f15;&#x4e0a;&#x9762;&#x7684;original&#x65b9;&#x5411;&#x7684;&#x8868;"/>
</node>
<node CREATED="1439946068248" ID="ID_1054251477" MODIFIED="1439946122724" TEXT="&#x5982;&#x679c;&#x6b64;&#x65f6;&#x4ec5;&#x4ec5;&#x6536;&#x5230;ack&#xff0c;&#x65e0;&#x8bba;&#x4ece;&#x54ea;&#x4e2a;&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x90fd;&#x4f1a;&#x4fdd;&#x6301;&#x5728;sES (3: established)&#x72b6;&#x6001;"/>
<node CREATED="1439945626832" ID="ID_1231319351" MODIFIED="1439946206879" TEXT="DUT&#x6536;&#x5230;LAN&#x4fa7;&#x53d1;&#x51fa;&#x7684;fin&#xff0c;&#x8fde;&#x63a5;&#x7531;sES (3: established)&#x8f6c;&#x6362;&#x5230;sFW (4: fin wait)">
<node CREATED="1439945849049" ID="ID_682977931" MODIFIED="1439945886705" TEXT="&#x5305;&#x4ece;original&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x6240;&#x4ee5;&#x7d22;&#x5f15;&#x4e0a;&#x9762;&#x7684;original&#x65b9;&#x5411;&#x7684;&#x8868;"/>
</node>
<node CREATED="1439945626832" ID="ID_1597127260" MODIFIED="1439946315788" TEXT="DUT&#x6536;&#x5230;WAN&#x4fa7;&#x56de;&#x5e94;&#x7684;ack&#xff0c;&#x8fde;&#x63a5;&#x7531;sFW (4: fin wait)&#x8f6c;&#x6362;&#x5230;sCW (5: close wait)">
<node CREATED="1439945849049" ID="ID_1277679333" MODIFIED="1439945956146" TEXT="&#x5305;&#x4ece;reply&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x6240;&#x4ee5;&#x7d22;&#x5f15;&#x4e0a;&#x9762;&#x7684;reply&#x65b9;&#x5411;&#x7684;&#x8868;"/>
</node>
<node CREATED="1439945626832" ID="ID_1692736335" MODIFIED="1439946389309" TEXT="DUT&#x6536;&#x5230;WAN&#x4fa7;&#x53d1;&#x51fa;&#x7684;fin&#xff0c;&#x8fde;&#x63a5;&#x7531;sCW (5: close wait)&#x8f6c;&#x6362;&#x5230;sLA (6: last ack)">
<node CREATED="1439945849049" ID="ID_1825104161" MODIFIED="1439945956146" TEXT="&#x5305;&#x4ece;reply&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x6240;&#x4ee5;&#x7d22;&#x5f15;&#x4e0a;&#x9762;&#x7684;reply&#x65b9;&#x5411;&#x7684;&#x8868;"/>
</node>
<node CREATED="1439945626832" ID="ID_799360950" MODIFIED="1439946465690" TEXT="DUT&#x6536;&#x5230;LAN&#x4fa7;&#x53d1;&#x51fa;&#x7684;ack&#xff0c;&#x8fde;&#x63a5;&#x7531;sLA (6: last ack)&#x8f6c;&#x6362;&#x5230;sTW (7: time wait)">
<node CREATED="1439945849049" ID="ID_1176969233" MODIFIED="1439945886705" TEXT="&#x5305;&#x4ece;original&#x65b9;&#x5411;&#x6536;&#x5230;&#xff0c;&#x6240;&#x4ee5;&#x7d22;&#x5f15;&#x4e0a;&#x9762;&#x7684;original&#x65b9;&#x5411;&#x7684;&#x8868;"/>
</node>
</node>
<node CREATED="1439946470469" ID="ID_713050059" MODIFIED="1439946551923" TEXT="&#x4efb;&#x4f55;&#x4e00;&#x4fa7;&#x7528;RST&#x5173;&#x95ed;TCP&#x8fde;&#x63a5;&#xff0c;&#x90fd;&#x4f1a;&#x5c06;TCP&#x72b6;&#x6001;&#x8f6c;&#x6362;&#x5230;sCL (8: closed)"/>
</node>
</node>
<node CREATED="1439942776515" ID="ID_488417193" MODIFIED="1439942784148" TEXT="tcp sequence check"/>
</node>
</node>
</map>
