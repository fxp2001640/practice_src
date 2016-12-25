<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1299483659647" ID="ID_1743884373" MODIFIED="1299483671291" TEXT="CTC-QOS">
<node CREATED="1299483759277" ID="ID_552887463" MODIFIED="1299570051373" POSITION="right" TEXT="SP">
<node CREATED="1299483779687" ID="ID_1611419322" MODIFIED="1299570052398" TEXT="htb qdisc">
<node CREATED="1299483807065" FOLDED="true" ID="ID_1470099238" MODIFIED="1299564325289" TEXT="htb class: id=1:1, ceil = &#x603b;&#x5e26;&#x5bbd;">
<node CREATED="1299484565487" FOLDED="true" ID="ID_1060796717" MODIFIED="1299563364230">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:10, priority=0,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#29992;&#20110;VOIP&#25511;&#21046;&#25968;&#25454;
    </p>
  </body>
</html></richcontent>
<node CREATED="1299484742697" ID="ID_990563901" MODIFIED="1299484750538" TEXT="sfq qdisc"/>
</node>
<node CREATED="1299484579681" FOLDED="true" ID="ID_1573721656" MODIFIED="1299563366750">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:11, priority=1,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#29992;&#20110;VOIP&#36127;&#36733;&#25968;&#25454;
    </p>
  </body>
</html></richcontent>
<node CREATED="1299484753867" ID="ID_934359068" MODIFIED="1299484760345" TEXT="sfq qdisc"/>
</node>
<node CREATED="1299484054163" FOLDED="true" ID="ID_1774680072" MODIFIED="1299563369878">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:12, priority=2,ceil=&#24635;&#24102;&#23485;&#160;
    </p>
    <p>
      &#29992;&#20110;&#29992;&#25143;&#25351;&#23450;&#30340;&#20998;&#31867;&#21040;queue 1&#30340;&#25968;&#25454;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1299484228045" ID="ID_335980161" MODIFIED="1299484235807" TEXT="sfq qdisc"/>
</node>
<node CREATED="1299484092615" FOLDED="true" ID="ID_1390298596" MODIFIED="1299563371630">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:13, priority=3,ceil=&#24635;&#24102;&#23485;&#160;
    </p>
    <p>
      &#29992;&#20110;&#29992;&#25143;&#25351;&#23450;&#30340;&#20998;&#31867;&#21040;queue 2&#30340;&#25968;&#25454;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1299484242358" ID="ID_1540630156" MODIFIED="1299484244194" TEXT="sfq qdisc "/>
</node>
<node CREATED="1299484097023" FOLDED="true" ID="ID_1658460506" MODIFIED="1299563373455">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:14, priority=4,ceil=&#24635;&#24102;&#23485;&#160;
    </p>
    <p>
      &#29992;&#20110;&#29992;&#25143;&#25351;&#23450;&#30340;&#20998;&#31867;&#21040;queue 3&#30340;&#25968;&#25454;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1299484246462" ID="ID_1456199098" MODIFIED="1299484247555" TEXT="sfq qdisc "/>
</node>
<node CREATED="1299484101112" FOLDED="true" ID="ID_1852445118" MODIFIED="1299563375063">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:15, priority=5,ceil=&#24635;&#24102;&#23485;&#160;
    </p>
    <p>
      &#29992;&#20110;&#29992;&#25143;&#25351;&#23450;&#30340;&#20998;&#31867;&#21040;queue 4&#30340;&#25968;&#25454;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1299484250351" ID="ID_357843298" MODIFIED="1299484251329" TEXT="sfq qdisc "/>
</node>
<node CREATED="1299483945288" ID="ID_71548232" MODIFIED="1299484527366">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:98, priority=6,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#26242;&#26410;&#20351;&#29992;&#65292;&#29992;&#20110;&#26410;&#26469;&#25193;&#23637;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299484005542" ID="ID_1171223284" MODIFIED="1299484547873">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:99, priority=7,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#26242;&#26410;&#20351;&#29992;&#65292;&#29992;&#20110;&#26410;&#26469;&#25193;&#23637;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1299489048548" ID="ID_1450181433" MODIFIED="1299492860657" TEXT="htb filter: priority=0, handle=0x1234,flowid=1:10"/>
<node CREATED="1299489297405" ID="ID_202739818" MODIFIED="1299563468083" TEXT="htb filter: priority=1, handle=0x1235,flowid=1:11 "/>
<node CREATED="1299488470704" ID="ID_1973640148" MODIFIED="1299488720633" TEXT="htb filter: priority=2, handle=100,flowid=1:12"/>
<node CREATED="1299488749853" ID="ID_599248429" MODIFIED="1299488807249" TEXT="htb filter: priority=3, handle=101,flowid=1:13 "/>
<node CREATED="1299488755078" ID="ID_1731876306" MODIFIED="1299488798808" TEXT="htb filter: priority=4, handle=102,flowid=1:14 "/>
<node CREATED="1299488759662" ID="ID_1672709866" MODIFIED="1299488789418" TEXT="htb filter: priority=5, handle=103,flowid=1:15 "/>
</node>
</node>
<node CREATED="1299555245587" FOLDED="true" ID="ID_1868598915" MODIFIED="1299566599466" POSITION="left" TEXT="classify">
<node CREATED="1299554198904" ID="ID_1428844250" MODIFIED="1299563704203">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      iptables -t mangle -I PREROUTING (classify rule 1) -j MARK --set-mark 100
    </p>
    <p>
      iptables -t mangle -I PREROUTING (classify rule 2) -j MARK --set-mark 101
    </p>
    <p>
      iptables -t mangle -I PREROUTING (classify rule x) -j MARK --set-mark (100+x)
    </p>
    <p>
      iptables -t mangle -I PREROUTING (classify rule n) -j MARK --set-mark (n)
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1299563986837" FOLDED="true" ID="ID_1044031609" MODIFIED="1299566598554">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      iptables -t mangle -A POSTROUTING
    </p>
    <p>
      -p udp --dport 5060
    </p>
    <p>
      -j CONNMARK --set-mark 5/7
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1299563986837" ID="ID_587348576" MODIFIED="1299565381735">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      iptables -t mangle -A POSTROUTING
    </p>
    <p>
      -m connmark --mark 5/7
    </p>
    <p>
      -m conntrack ! --ctstate EXPECTED
    </p>
    <p>
      -j MARK --set-mark 0x1234
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1299563986837" ID="ID_954113993" MODIFIED="1299565413403">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      iptables -t mangle -A POSTROUTING
    </p>
    <p>
      -m connmark --mark 5/7
    </p>
    <p>
      -m conntrack --ctstate EXPECTED
    </p>
    <p>
      -j MARK --set-mark 0x1235
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node CREATED="1299553560430" FOLDED="true" ID="ID_449506747" MODIFIED="1299563972820" POSITION="left" TEXT="cos remark">
<node CREATED="1299553781949" FOLDED="true" ID="ID_1611434851" MODIFIED="1299563969788" TEXT="match mark, set skb-&gt;priority">
<node CREATED="1299554929107" ID="ID_355852753" MODIFIED="1299563715373" TEXT="iptables -t mangle -I FORWARDING -m mark --mark 100 -j CLASSIFY --set-class 0:5"/>
<node CREATED="1299562679807" ID="ID_1624569836" MODIFIED="1299563717815" TEXT="iptables -t mangle -I FORWARDING -m mark --mark 101 -j CLASSIFY --set-class 0:6"/>
<node CREATED="1299562685288" ID="ID_1981544763" MODIFIED="1299563721814" TEXT="iptables -t mangle -I FORWARDING -m mark --mark (100+x) -j CLASSIFY --set-class 0:(5+x) "/>
<node CREATED="1299562689952" ID="ID_992167867" MODIFIED="1299562751803" TEXT="iptables -t mangle -I FORWARDING -m mark --mark (n) -j CLASSIFY --set-class 0:(n)"/>
</node>
<node CREATED="1299553996147" ID="ID_1232473251" MODIFIED="1299554062468">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      vconfig set egress map:
    </p>
    <p>
      skb-&gt;priority&#160;&#160;&#160;&#160;to&#160;&#160;&#160;&#160;remarked cos
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1299553574072" FOLDED="true" ID="ID_1724525157" MODIFIED="1299563974948" POSITION="left" TEXT="dscp remark">
<node CREATED="1299553781949" FOLDED="true" ID="ID_722057878" MODIFIED="1299563974116">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      match mark, set dscp
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1299554929107" ID="ID_176024365" MODIFIED="1299563188014" TEXT="iptables -t mangle -I PREROUTING -m mark --mark 10 -j DSCP --set-dscp (dscp1)"/>
<node CREATED="1299554929107" ID="ID_1710855714" MODIFIED="1299563252669" TEXT="iptables -t mangle -I PREROUTING -m mark --mark 11 -j DSCP --set-dscp (dscp2)"/>
<node CREATED="1299554929107" ID="ID_1766464994" MODIFIED="1299563280016" TEXT="iptables -t mangle -I PREROUTING -m mark --mark (10+x) -j DSCP --set-dscp (dscpx)"/>
<node CREATED="1299554929107" ID="ID_486758407" MODIFIED="1299563265629" TEXT="iptables -t mangle -I PREROUTING -m mark --mark (n) -j DSCP --set-dscp (dscpn)"/>
</node>
</node>
<node CREATED="1299483769445" FOLDED="true" ID="ID_1114746085" MODIFIED="1299570050604" POSITION="right" TEXT="WRR">
<node CREATED="1299485897584" FOLDED="true" ID="ID_1947276228" MODIFIED="1299570049821" TEXT="htb qdisc">
<node CREATED="1299485914802" ID="ID_434837722" MODIFIED="1299569965488" TEXT="htb class: id=1:1, ceil = &#x603b;&#x5e26;&#x5bbd;">
<node CREATED="1299485965151" ID="ID_1102814716" MODIFIED="1299486292220">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:10, priority=0,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#29992;&#20110;VOIP&#25511;&#21046;&#25968;&#25454;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299485980569" ID="ID_223857308" MODIFIED="1299486309389">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:11, priority=1,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#29992;&#20110;VOIP&#36127;&#36733;&#25968;&#25454;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299486144369" ID="ID_1812848596" MODIFIED="1299569970116">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:12, priority=2,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#29992;&#20110;&#29992;&#25143;&#25351;&#23450;&#38656;&#35201;WRR&#35843;&#24230;&#30340;&#25968;&#25454;
    </p>
  </body>
</html></richcontent>
<node CREATED="1299486454833" FOLDED="true" ID="ID_827574723" MODIFIED="1299563511381" TEXT="wrr qdisc">
<node CREATED="1299486479372" ID="ID_910786800" MODIFIED="1299489622583" TEXT="wrr class: id=2:100,weight=w1,nfmark=100 "/>
<node CREATED="1299486535346" ID="ID_1294606959" MODIFIED="1299489634010" TEXT="wrr class: id=2:101,weight=w2,nfmark=101 "/>
<node CREATED="1299486539146" ID="ID_143106553" MODIFIED="1299489647080" TEXT="wrr class: id=2:102,weight=w3,nfmark=102 "/>
<node CREATED="1299486542154" ID="ID_442997255" MODIFIED="1299489659085" TEXT="wrr class: id=2:103,weight=w4,nfmark=103 "/>
</node>
</node>
<node CREATED="1299486158843" ID="ID_185985255" MODIFIED="1299486414376">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:98, priority=6,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#26242;&#26410;&#20351;&#29992;&#65292;&#29992;&#20110;&#26410;&#26469;&#25193;&#23637;&#160;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1299486163107" ID="ID_61003708" MODIFIED="1299486718839">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      htb class: id=1:99, priority=7,ceil=&#24635;&#24102;&#23485;
    </p>
    <p>
      &#26242;&#26410;&#20351;&#29992;&#65292;&#29992;&#20110;&#26410;&#26469;&#25193;&#23637;&#160;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1299489708839" ID="ID_804177327" MODIFIED="1299492838431" TEXT="htb filter: priority=0, handle=0x1234,flowid=1:10  "/>
<node CREATED="1299489720401" ID="ID_1277782656" MODIFIED="1299563523337" TEXT="htb filter: priority=1, handle=0x1235,flowid=1:11  "/>
<node CREATED="1299489435700" ID="ID_1289274471" MODIFIED="1299489525467" TEXT="htb filter: priority=2, handle=100,flowid=1:12  "/>
<node CREATED="1299489445860" ID="ID_1082848578" MODIFIED="1299489550205" TEXT="htb filter: priority=3, handle=101,flowid=1:12  "/>
<node CREATED="1299489456422" ID="ID_1553288801" MODIFIED="1299489554797" TEXT="htb filter: priority=4, handle=102,flowid=1:12  "/>
<node CREATED="1299489464614" ID="ID_107405843" MODIFIED="1299489558903" TEXT="htb filter: priority=5, handle=103,flowid=1:12  "/>
</node>
</node>
</node>
</map>
