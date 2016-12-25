<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1323850767572" ID="ID_1993589151" MODIFIED="1323850799733" TEXT="traffic control">
<node CREATED="1323850990858" FOLDED="true" ID="ID_1618283244" MODIFIED="1329456245122" POSITION="right" TEXT="ingress">
<node CREATED="1323851491343" ID="ID_277422141" MODIFIED="1323851495658" TEXT="action">
<node CREATED="1323851497000" ID="ID_482883803" MODIFIED="1323851500229" TEXT="police"/>
</node>
<node CREATED="1323851939479" ID="ID_1119095727" MODIFIED="1323851963303" TEXT="ingress QoS process">
<node CREATED="1323851980762" ID="ID_1964931763" MODIFIED="1323851982675" TEXT="netif_receive_skb">
<node CREATED="1323852634394" ID="ID_64233849" MODIFIED="1323852636908" TEXT="handle_ing">
<node CREATED="1323853072780" ID="ID_1800044975" MODIFIED="1323853296424" TEXT="ing_filter&#xa;&#x5982;&#x679c;&#x8fd4;&#x56de;TC_ACT_SHOT&#x6216;TC_ACT_STOLEN&#x5219;&#x5e94;&#x4e22;&#x5f03;&#x6b64;&#x5305;">
<node CREATED="1323853463619" ID="ID_341873656" MODIFIED="1323853515427" TEXT="&#x5982;&#x679c;&#x6b64;&#x5305;&#x88ab;&#x91cd;&#x5b9a;&#x5411;&#x7684;&#x6b21;&#x6570;&#x8d85;&#x51fa;&#x9650;&#x5236;&#x5219;&#x4e22;&#x5f03;&#x6b64;&#x5305;"/>
<node CREATED="1323853542816" ID="ID_1021502245" MODIFIED="1323853565876" TEXT="&#x5728;skb-&gt;tc_verd&#x4e2d;&#x6807;&#x8bb0;&#x52a0;1&#x540e;&#x7684;&#x91cd;&#x5b9a;&#x5411;&#x6b21;&#x6570;"/>
<node CREATED="1323853577275" ID="ID_1825241397" MODIFIED="1323853592587" TEXT="&#x5728;skb-&gt;tc_verd&#x4e2d;&#x6807;&#x8bb0;AT_INGRESS"/>
<node CREATED="1323853608638" ID="ID_1409879484" MODIFIED="1323853643743" TEXT="&#x8c03;&#x7528;qdisc_enqueue_root&#x5c06;&#x5305;&#x653e;&#x5165;&#x5165;&#x53e3;&#x8bbe;&#x5907;&#x6240;&#x5173;&#x8054;&#x7684;qdisc&#x4e2d;"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1323850998451" ID="ID_1680256628" MODIFIED="1323851003119" POSITION="left" TEXT="egress">
<node CREATED="1323854845161" ID="ID_767762343" MODIFIED="1323854849269" TEXT="qdisc">
<node CREATED="1323854892684" ID="ID_1996771537" MODIFIED="1323854896243" TEXT="pfifo"/>
<node CREATED="1323854896847" ID="ID_1640418874" MODIFIED="1323854900207" TEXT="bfifo"/>
<node CREATED="1329456272543" ID="ID_1904609629" MODIFIED="1329456276212" TEXT="htb">
<node CREATED="1329456286150" ID="ID_1996399569" MODIFIED="1329456294463" TEXT="&#x57fa;&#x672c;&#x539f;&#x7406;">
<node CREATED="1329464146939" FOLDED="true" ID="ID_960930407" MODIFIED="1329477406250" TEXT="&#x6846;&#x67b6;">
<node CREATED="1329464157126" ID="ID_365524028" MODIFIED="1329464587757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="pic/htb_framework.jpg" />
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1329464976160" FOLDED="true" ID="ID_813083780" MODIFIED="1329477409813" TEXT="class&#x76f8;&#x5173;&#x6982;&#x5ff5;">
<node CREATED="1329465585046" ID="ID_1354460208" MODIFIED="1329477392733" TEXT="class&#x5206;&#x7c7b;:&#xa;&#x6ca1;&#x6709;child&#x7684;&#x79f0;&#x4e3a;leaf class,&#x6709;child&#x7684;&#x79f0;&#x4e3a;inner class.&#xa;&#x62a5;&#x6587;&#x53ea;&#x80fd;queue&#x5728;leaf class&#x4e2d;."/>
<node CREATED="1329465035911" ID="ID_1421679453" MODIFIED="1329465084980" TEXT="AR(assured rate) : &#x4fdd;&#x8bc1;&#x901f;&#x7387;"/>
<node CREATED="1329465091433" ID="ID_1337169031" MODIFIED="1329465118799" TEXT="CR(ceil rate) : &#x5cf0;&#x503c;&#x901f;&#x7387;"/>
<node CREATED="1329465120389" ID="ID_432149745" MODIFIED="1329465339998" TEXT="R(actual rate) : &#x5b9e;&#x9645;&#x901f;&#x7387;&#xa;&#x5b83;&#x662f;&#x62a5;&#x6587;&#x79bb;&#x5f00;&#x6b64;class&#x7684;&#x901f;&#x7387;,&#x7cfb;&#x7edf;&#x4ee5;&#x4e00;&#x4e2a;&#x5f88;&#x5c0f;&#x7684;&#x65f6;&#x95f4;&#x95f4;&#x9694;&#x68c0;&#x6d4b;&#x6b64;&#x901f;&#x7387;.&#xa;&#x4e00;&#x4e2a;inner class&#x7684;R&#x503c;&#x4e3a;&#x5176;&#x4e0b;&#x5c5e;&#x6240;&#x6709;leaf class&#x7684;R&#x503c;&#x4e4b;&#x548c;."/>
<node CREATED="1329465359759" ID="ID_1397496275" MODIFIED="1329465471397" TEXT="level : class &#x5728;&#x6811;&#x4e2d;&#x7684;&#x4f4d;&#x7f6e;, &#xa;&#x53f6;&#x5b50;&#x8282;&#x70b9;&#x7684;level&#x4e3a; 0 , &#xa;&#x6839;&#x8282;&#x70b9;&#x7684;level&#x4e3a;TC_HTB_MAXDEPTH-1(7),&#xa;inner&#x8282;&#x70b9;&#x7684;level&#x4e3a;parent level  - 1"/>
<node CREATED="1329465493116" ID="ID_1411413289" MODIFIED="1329465519153" TEXT="P (priority) : class&#x7684;&#x4f18;&#x5148;&#x7ea7;"/>
<node CREATED="1329465521216" ID="ID_1719171227" MODIFIED="1329465553126" TEXT="Q(quantum) : &#x91cf;&#x5b50;"/>
<node CREATED="1329475161403" ID="ID_1774518964" MODIFIED="1329475365300" TEXT="&#x989c;&#x8272;:&#xa;&#x5f53;R &gt; CR&#x65f6;&#x4e3a;&#x7ea2;&#x8272;,&#x5f53;AR &lt; R &lt;= CR&#x65f6;&#x4e3a;&#x9ec4;&#x8272;,&#x5f53;R &lt;= AR&#x65f6;&#x4e3a;&#x7eff;&#x8272;"/>
<node CREATED="1329475404229" ID="ID_964763316" MODIFIED="1329475668536" TEXT="D(c) : &#x6240;&#x6709;&#x9700;&#x8981;&#x5411;c&#x501f;&#x4ee4;&#x724c;&#x7684;leaf class&#x7684;&#x5217;&#x8868;&#xa;&#x5982;&#x679c;&#x4e00;&#x4e2a;leaf class&#x9700;&#x8981;&#x53d1;&#x5305;&#x4e14;&#x6b64;leaf class&#x5230;c&#x4e4b;&#x95f4;&#x8def;&#x5f84;&#x4e0a;&#x7684;&#x6240;&#x6709;&#xa;inner class&#x5747;&#x4e3a;&#x9ec4;&#x8272;,&#x5219;&#x6b64;leaf class&#x5728;D(c)&#x4e2d;."/>
</node>
<node CREATED="1329475723701" FOLDED="true" ID="ID_1672012574" MODIFIED="1329476785503" TEXT="&#x5e26;&#x5bbd;&#x5206;&#x914d;">
<node CREATED="1329475855083" ID="ID_1387124875" MODIFIED="1329476294787" TEXT="&#x8282;&#x70b9;c&#x53ef;&#x4ee5;&#x5206;&#x914d;&#x5230;&#x7684;&#x5e26;&#x5bbd;&#x4e3a;:Rc = min(CRc, ARc + Bc)&#xa;&#x5176;&#x4e2d;Bc&#x8868;&#x793a;&#x53ef;&#x4ee5;&#x4ece;&#x7956;&#x5148;&#x501f;&#x5230;&#x7684;&#x5e26;&#x5bbd;,&#x5176;&#x5b9a;&#x4e49;&#x5982;&#x4e0b;:&#xa;                                Qc Rp&#xa;Bc = ---------------------------------------------------- if min(Pi over D(p)) &gt;= Pc&#xa;         sum[Qi over D(p) where Pi = Pc]&#xa;&#xa;Bc = 0                                                   otherwise&#xa;&#x5f0f;&#x4e2d;&#x5c0f;p&#x8868;&#x793a;c&#x7684;&#x7236;&#x8282;&#x70b9;,&#x82e5;&#x6ca1;&#x6709;&#x7236;&#x8282;&#x70b9;&#x5219;Bc = 0"/>
<node CREATED="1329476324621" ID="ID_1884674742" MODIFIED="1329476680384" TEXT="&#x9996;&#x5148;&#x67e5;&#x770b;&#x7236;&#x8282;&#x70b9;&#x4e0b;&#x6240;&#x6709;&#x9700;&#x8981;&#x5411;&#x7236;&#x8282;&#x70b9;p&#x501f;&#x4ee4;&#x724c;&#x7684;&#x53f6;&#x5b50;&#x8282;&#x70b9;D(p).&#x82e5;&#x5b83;&#x4eec;&#x4e2d;&#x6709;&#x7ed3;&#x70b9;&#x7684;Pi &lt; Pc&#x8868;&#x793a;&#xa;&#x6709;&#x8282;&#x70b9;&#x7684;&#x4f18;&#x5148;&#x7ea7;&#x6bd4;c&#x8282;&#x70b9;&#x9ad8;,&#x5219;&#x5e94;&#x4f18;&#x5148;&#x6ee1;&#x8db3;&#x5b83;,&#x6240;&#x4ee5;c&#x8282;&#x70b9;&#x65e0;&#x6cd5;&#x4ece;&#x7236;&#x8282;&#x70b9;&#x501f;&#x5230;&#x4ee4;&#x724c;,&#x6545;Bc = 0.&#xa;&#x82e5;&#x6ca1;&#x6709;&#x4f18;&#x5148;&#x7ea7;&#x66f4;&#x9ad8;&#x7684;&#x8282;&#x70b9;,&#x5219;&#x5e94;&#x5728;&#x4e0e;c&#x8282;&#x70b9;&#x76f8;&#x540c;&#x4f18;&#x5148;&#x7ea7;&#x7684;&#x8282;&#x70b9;(Pi = Pc)&#x4e2d;&#x6309;&#x7167;&#x5404;&#x8282;&#x70b9;&#x7684;Qi&#x5e73;&#x5206;&#xa;&#x7236;&#x8282;&#x70b9;p&#x7684;&#x5e26;&#x5bbd;.&#xa;                       Qc Rp&#xa;---------------------------------------------------- &#xa;  sum[Qi over D(p) where Pi = Pc]"/>
</node>
<node CREATED="1329476787805" FOLDED="true" ID="ID_703877644" MODIFIED="1329478124785" TEXT="&#x8c03;&#x5ea6;&#x7b56;&#x7565;">
<node CREATED="1329476824205" ID="ID_1217496334" MODIFIED="1329477819596" TEXT="self feed&#xa;htb_sched::row&#x79f0;&#x4e3a;self feed.&#x5b83;&#x662f;&#x4e00;&#x4e2a;&#x4e8c;&#x7ef4;&#x6570;&#x7ec4;,&#x6bcf;&#x4e2a;&#x5143;&#x7d20;&#x90fd;&#x662f;&#x4e00;&#x68f5;&#x7ea2;&#x9ed1;&#x6811;.&#xa;htb&#x6811;&#x5f62;&#x7ed3;&#x6784;&#x4e2d;&#x82e5;&#x67d0;&#x4e2a;class&#x9700;&#x8981;&#x53d1;&#x5305;&#x4e14;&#x5176;&#x989c;&#x8272;&#x4e3a;&#x7eff;&#x8272;&#x5219;&#x5e94;&#x6309;&#x5176;level&#x548c;priority&#xa;&#x5c06;&#x5b83;&#x653e;&#x5165;self feed&#x4e2d;.&#x82e5;class&#x4e0d;&#x518d;&#x9700;&#x8981;&#x53d1;&#x5305;&#x6216;&#x5176;&#x989c;&#x8272;&#x4e0d;&#x518d;&#x4e3a;&#x7eff;&#x8272;&#x5219;&#x5e94;&#x5c06;&#x5b83;&#x4ece;&#xa;self feed&#x76f8;&#x5e94;&#x7684;level&#x548c;priority&#x4e2d;&#x5220;&#x9664;."/>
<node CREATED="1329476840823" ID="ID_193299659" MODIFIED="1329477731776" TEXT="inner feed&#xa;htb_class::un.inner.feed&#x79f0;&#x4e3a;inner feed,&#x5b83;&#x662f;&#x4e00;&#x4e2a;&#x6570;&#x7ec4;,&#x6bcf;&#x4e2a;&#x5143;&#x7d20;&#x90fd;&#x662f;&#x4e00;&#x68f5;&#x7ea2;&#x9ed1;&#x6811;&#xa;&#x6bcf;&#x4e2a;inner class&#x90fd;&#x6709;inner feed.&#x82e5;&#x4e00;&#x4e2a;class&#x7684;&#x989c;&#x8272;&#x4e3a;&#x9ec4;&#x8272;&#x5219;&#x5e94;&#x6309;priority&#x5c06;&#x5176;&#x653e;&#x5165;&#xa;&#x7236;&#x8282;&#x70b9;&#x7684;inner feed&#x4e2d;.&#x82e5;&#x4e00;&#x4e2a;class&#x7684;&#x989c;&#x8272;&#x4e0d;&#x518d;&#x4e3a;&#x9ec4;&#x8272;&#x5219;&#x5e94;&#x5c06;&#x5176;&#x4ece;&#x7236;&#x8282;&#x70b9;inner feed&#xa;&#x5bf9;&#x5e94;&#x7684;&#x6309;priority&#x4e2d;&#x5220;&#x9664;."/>
<node CREATED="1329476845850" ID="ID_993588748" MODIFIED="1329478089854" TEXT="wait queue&#xa;htb_sched::wait_pq&#x79f0;&#x4e3a;wait queue.&#x82e5;&#x67d0;&#x4e2a;class&#x7684;&#x989c;&#x8272;&#x4e3a;&#x9ec4;&#x8272;&#x6216;&#x7ea2;&#x8272;,&#x5219;&#x5e94;&#x6309;&#xa;level&#x5c06;&#x5176;&#x653e;&#x5165;wait queue&#x4e2d;.wait queue&#x6309;&#x7167;&#x5404;class&#x7684;&#x989c;&#x8272;&#x53d8;&#x6362;&#x7b49;&#x5f85;&#x65f6;&#x95f4;(&#x5373;&#xa;htb_class::pq_key)&#x6392;&#x5e8f;."/>
</node>
</node>
<node CREATED="1329456295371" ID="ID_499648599" MODIFIED="1329465400434" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1329456337886" FOLDED="true" ID="ID_1679000181" MODIFIED="1329477974724" TEXT="struct htb_sched">
<node CREATED="1329456362355" ID="ID_1847348219" MODIFIED="1329456365337" TEXT="struct Qdisc_class_hash clhash"/>
<node CREATED="1329456392679" ID="ID_743293820" MODIFIED="1329456395246" TEXT="struct list_head drops[TC_HTB_NUMPRIO]"/>
<node CREATED="1329456416649" FOLDED="true" ID="ID_489209882" MODIFIED="1329457436816" TEXT="struct rb_root row[TC_HTB_MAXDEPTH][TC_HTB_NUMPRIO]">
<node CREATED="1329456505332" ID="ID_855662702" MODIFIED="1329457363810" TEXT="&#x7b80;&#x79f0;self feed : &#xa;&#x6240;&#x6709;class&#x88ab;&#x7ec4;&#x7ec7;&#x5728;&#x6bcf;&#x4e2a;level&#x7684;&#x6bcf;&#x4e2a;priority&#x4e2d;.&#xa;&#x5f53;&#x67d0;&#x4e2a;level = L&#xff0c;priority = P  &#x7684;class  &#x6709;&#x5305;&#x53d1;&#x9001;&#x4e14;&#x4e3a;&#x7eff;&#x8272;&#x65f6;&#xff0c;&#xa;&#x5e94;&#x5c06;&#x5176;&#x52a0;&#x5165;&#x8fd9;&#x91cc;level = L&#xff0c;priority = P  &#x7684;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;.&#xa;&#x5f53;class&#x4e0d;&#x518d;&#x9700;&#x8981;&#x53d1;&#x9001;&#x5305;&#x6216;&#x4e0d;&#x518d;&#x4e3a;&#x7eff;&#x8272;&#x65f6;&#x5e94;&#x5c06;&#x5176;&#x4ece;self feed&#x4e2d;&#x5220;&#x9664;.&#xa;&#x8c03;&#x5ea6;&#x65f6;&#xff0c;&#x9009;&#x62e9;level  &#x6700;&#x4f4e;priority  &#x6700;&#x9ad8;&#x7684;&#x7ea2;&#x9ed1;&#x6811;&#x8fdb;&#x884c;&#x8c03;&#x5ea6;."/>
</node>
<node CREATED="1329456615853" FOLDED="true" ID="ID_1588562093" MODIFIED="1329457272682" TEXT="int row_mask[TC_HTB_MAXDEPTH]">
<node CREATED="1329456650233" ID="ID_285271855" MODIFIED="1329456787736" TEXT="&#x5728;self feed(&#x5373;&#x4e0a;&#x9762;&#x7684;row[x][x])&#x4e2d;&#x6bcf;&#x4e2a;level&#x4e0a;&#x54ea;&#x4e9b;priority&#x4e0a;&#x6709;class,&#xa;&#x5219;priority&#x5bf9;&#x5e94;&#x7684;bit&#x4f4d;&#x7f6e;1."/>
</node>
<node CREATED="1329456857106" FOLDED="true" ID="ID_1588461814" MODIFIED="1329457090965" TEXT="struct rb_node *ptr[TC_HTB_MAXDEPTH][TC_HTB_NUMPRIO]">
<node CREATED="1329456900586" ID="ID_1456013468" MODIFIED="1329457074019" TEXT="self feed&#x7684;&#x6bcf;&#x4e2a;&#x5143;&#x7d20;&#x90fd;&#x662f;&#x4e00;&#x68f5;&#x7ea2;&#x9ed1;&#x6811;,&#x6811;&#x4e2d;&#x6240;&#x6709;class&#x5177;&#x6709;&#x76f8;&#x540c;&#x7684;level&#x548c;priority.&#xa;&#x9488;&#x5bf9;&#x4e0a;&#x9762;&#x6bcf;&#x4e2a;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;&#x7684;&#x6240;&#x6709;class &#xff0c;&#x5e94;&#x4ee5;DRR &#x65b9;&#x5f0f;&#x8fdb;&#x884c;&#x8f6e;&#x8be2;&#x8c03;&#x5ea6;&#xff0c;&#xa;&#x6240;&#x4ee5;&#x8fd9;&#x91cc;&#x7684;ptr &#x8bb0;&#x5f55;&#x4e86;&#x6bcf;&#x4e2a;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;&#x6700;&#x540e;&#x4e00;&#x4e2a;&#x88ab;&#x8c03;&#x5ea6;&#x7684;class&#xff0c;&#x4ee5;&#x4fbf;&#x4e0b;&#x6b21;&#x8c03;&#x5ea6;&#x65f6;&#xa;&#x76f4;&#x63a5;&#x53d6;&#x4e0a;&#x6b21;&#x6700;&#x540e;&#x4e00;&#x4e2a;class &#x7684;&#x4e0b;&#x4e00;&#x4e2a;class &#x8fdb;&#x884c;&#x8c03;&#x5ea6;&#x3002;"/>
</node>
<node CREATED="1329456871914" ID="ID_730791026" MODIFIED="1329456873821" TEXT="u32 last_ptr_id[TC_HTB_MAXDEPTH][TC_HTB_NUMPRIO]"/>
<node CREATED="1329457115394" FOLDED="true" ID="ID_1212646704" MODIFIED="1329477972759" TEXT="struct rb_root wait_pq[TC_HTB_MAXDEPTH]">
<node CREATED="1329457154001" ID="ID_1893023616" MODIFIED="1329457434367" TEXT="&#x6240;&#x6709;class&#x88ab;&#x7ec4;&#x7ec7;&#x5728;self feed&#x7684;&#x6bcf;&#x4e2a;level&#x6bcf;&#x4e2a;priority&#x4e2d;.&#xa;&#x5f53;&#x67d0;&#x4e2a;level = L&#xff0c;priority = P  &#x7684;class&#x7531;&#x7eff;&#x8272;&#x53d8;&#x4e3a;&#x9ec4;&#x8272;&#x6216;&#x7ea2;&#x8272;&#x65f6;&#xff0c;&#xa;&#x5e94;&#x5c06;&#x5176;&#x52a0;&#x5165;&#x8fd9;&#x91cc;level = L&#xff0c;priority = P  &#x7684;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;.&#xa;&#x5f53;class&#x53d8;&#x4e3a;&#x7eff;&#x8272;&#x65f6;&#x5e94;&#x5c06;&#x5176;&#x4ece;&#x8fd9;&#x91cc;&#x7684;wai queue&#x4e2d;&#x5220;&#x9664;."/>
</node>
<node CREATED="1329457459469" FOLDED="true" ID="ID_1072461045" MODIFIED="1329457527011" TEXT="psched_time_t near_ev_cache[TC_HTB_MAXDEPTH]">
<node CREATED="1329457489589" ID="ID_1552489241" MODIFIED="1329457524803" TEXT="&#x4e0a;&#x9762;wait_pq&#x4e2d;&#x6700;&#x65e9;&#x89e6;&#x53d1;&#x7684;&#x4e8b;&#x4ef6;&#x7684;&#x65f6;&#x95f4;&#x70b9;"/>
</node>
<node CREATED="1329457545341" FOLDED="true" ID="ID_147274060" MODIFIED="1329457579229" TEXT="int defcls">
<node CREATED="1329457560984" ID="ID_53137402" MODIFIED="1329457573821" TEXT="&#x672a;&#x5339;&#x914d;&#x4efb;&#x4f55;filter&#x7684;&#x5305;&#x5c06;&#x88ab;&#x5206;&#x914d;&#x5230;&#x6b64;&#x5904;&#x6307;&#x5b9a;&#x7684;class&#x4e2d;&#x53bb;"/>
</node>
<node CREATED="1329457597997" FOLDED="true" ID="ID_1002259001" MODIFIED="1329457735165" TEXT="struct tcf_proto *filter_list">
<node CREATED="1329457608408" ID="ID_1788678313" MODIFIED="1329457677529" TEXT="&#x5206;&#x7c7b;&#x89c4;&#x5219;,&#x7528;&#x4e8e;&#x628a;&#x5305;&#x5206;&#x7c7b;&#x5230;&#x6b64;&#x8c03;&#x5ea6;&#x5668;&#x5185;&#x67d0;&#x4e2a;class"/>
</node>
<node CREATED="1329457756991" ID="ID_1863217658" MODIFIED="1329457760044" TEXT="int rate2quantum"/>
<node CREATED="1329457773444" ID="ID_632622387" MODIFIED="1329457775635" TEXT="psched_time_t now"/>
<node CREATED="1329457782758" ID="ID_803053944" MODIFIED="1329457785860" TEXT="struct qdisc_watchdog watchdog"/>
<node CREATED="1329457801043" FOLDED="true" ID="ID_1692861636" MODIFIED="1329457996037" TEXT="struct sk_buff_head direct_queue">
<node CREATED="1329457988262" ID="ID_1650101629" MODIFIED="1329457990907" TEXT="&#x5bf9;&#x4e8e;&#x65e0;&#x9700;&#x6574;&#x5f62;&#x7684;&#x5305;&#xff0c;&#x76f4;&#x63a5;&#x8ba9;&#x5176;&#x901a;&#x8fc7;&#xff0c;&#x5373;&#x5c06;&#x6b64;&#x5305;&#x653e;&#x5165;&#x8fd9;&#x91cc;&#x7684;direct_queue"/>
</node>
<node CREATED="1329457815242" ID="ID_1050828153" MODIFIED="1329457817045" TEXT="int direct_qlen"/>
<node CREATED="1329457828016" ID="ID_1499476675" MODIFIED="1329457831372" TEXT="long direct_pkts"/>
<node CREATED="1329457841316" ID="ID_92182694" MODIFIED="1329457842983" TEXT="unsigned int warned"/>
</node>
<node CREATED="1329458034208" FOLDED="true" ID="ID_825125498" MODIFIED="1329465429910" TEXT="struct htb_class">
<node CREATED="1329458051061" ID="ID_117853653" MODIFIED="1329458055166" TEXT="struct Qdisc_class_common common"/>
<node CREATED="1329458068875" ID="ID_580468049" MODIFIED="1329458071581" TEXT="struct gnet_stats_basic_packed bstats">
<node CREATED="1329458080645" ID="ID_871207865" MODIFIED="1329458086967" TEXT="&#x5b57;&#x8282;&#x6570;, &#x5305;&#x6570;&#x7edf;&#x8ba1;"/>
</node>
<node CREATED="1329458106734" ID="ID_1029687052" MODIFIED="1329458108994" TEXT="struct gnet_stats_queue qstats">
<node CREATED="1329458124213" ID="ID_1581089845" MODIFIED="1329458126043" TEXT="&#x961f;&#x5217;&#x4fe1;&#x606f;&#x7edf;&#x8ba1;"/>
</node>
<node CREATED="1329458141040" ID="ID_468961969" MODIFIED="1329458142947" TEXT="struct gnet_stats_rate_est rate_est">
<node CREATED="1329458154919" ID="ID_1008614413" MODIFIED="1329458157057" TEXT="&#x901f;&#x7387;&#x7edf;&#x8ba1;, &#x5b57;&#x8282;&#x7387;, &#x5305;&#x7387;"/>
</node>
<node CREATED="1329458176846" ID="ID_1451005142" MODIFIED="1329458180557" TEXT="struct tc_htb_xstats xstats">
<node CREATED="1329458190653" ID="ID_857566459" MODIFIED="1329458192781" TEXT="HTB&#x7edf;&#x8ba1;&#x4fe1;&#x606f;, &#x501f;&#x51fa;, &#x501f;&#x5165;, &#x4ee4;&#x724c;&#x7b49;&#x53c2;&#x6570;"/>
</node>
<node CREATED="1329458208014" ID="ID_267407722" MODIFIED="1329458209607" TEXT="int refcnt">
<node CREATED="1329458220826" ID="ID_85670849" MODIFIED="1329458222778" TEXT="HTB&#x7c7b;&#x522b;&#x5f15;&#x7528;&#x8ba1;&#x6570;"/>
</node>
<node CREATED="1329458249789" FOLDED="true" ID="ID_835184368" MODIFIED="1329465428662" TEXT="int level">
<node CREATED="1329458277403" ID="ID_1893466722" MODIFIED="1329458432181" TEXT="&#x672c;class&#x6240;&#x5728;&#x7684;level.&#xa;&#x5728;&#x6811;&#x4e2d;&#x7684;&#x5c42;&#x6b21;, &#x53f6;&#x5b50;&#x8282;&#x70b9;&#x7684;level&#x4e3a; 0 , &#x6839;&#x8282;&#x70b9;&#x7684;level&#x4e3a;TC_HTB_MAXDEPTH-1(7),&#xa;inner&#x8282;&#x70b9;&#x7684;level&#x4e3a;parent level  - 1"/>
</node>
<node CREATED="1329458456184" FOLDED="true" ID="ID_995441654" MODIFIED="1329458525762" TEXT="unsigned int children">
<node CREATED="1329458468815" ID="ID_1959887710" MODIFIED="1329458484013" TEXT="&#x5b50;&#x8282;&#x70b9;&#x6570;&#x91cf;"/>
</node>
<node CREATED="1329458503600" FOLDED="true" ID="ID_571383478" MODIFIED="1329458526577" TEXT="struct htb_class *parent">
<node CREATED="1329458512355" ID="ID_969671634" MODIFIED="1329458520839" TEXT="&#x7236;&#x8282;&#x70b9;"/>
</node>
<node CREATED="1329458569513" FOLDED="true" ID="ID_482872547" MODIFIED="1329458590753" TEXT="int prio">
<node CREATED="1329458582112" ID="ID_1485177385" MODIFIED="1329458588589" TEXT="&#x8282;&#x70b9;&#x4f18;&#x5148;&#x7ea7;"/>
</node>
<node CREATED="1329458603200" ID="ID_309368428" MODIFIED="1329458606642" TEXT="int quantum"/>
<node CREATED="1329458631571" FOLDED="true" ID="ID_1568787163" MODIFIED="1329459453705" TEXT="union un">
<node CREATED="1329458663969" FOLDED="true" ID="ID_70552379" MODIFIED="1329458842051" TEXT="struct htb_class_leaf leaf">
<node CREATED="1329458710059" FOLDED="true" ID="ID_425206092" MODIFIED="1329458839636" TEXT="struct Qdisc *q">
<node CREATED="1329458715481" ID="ID_1602010597" MODIFIED="1329458737564" TEXT="&#x53f6;&#x5b50;&#x8282;&#x70b9;&#x4e0b;&#x6240;&#x6302;&#x7684;&#x8c03;&#x5ea6;&#x5668;"/>
</node>
<node CREATED="1329458757988" FOLDED="true" ID="ID_519059883" MODIFIED="1329458840324" TEXT="int deficit[TC_HTB_MAXDEPTH]">
<node CREATED="1329458773438" ID="ID_704699160" MODIFIED="1329458776065" TEXT="&#x4e0d;&#x540c;&#x5c42;&#x6b21;&#x6df1;&#x5ea6;&#x7684;&#x8d64;&#x5b57;"/>
</node>
<node CREATED="1329458791930" FOLDED="true" ID="ID_1083925705" MODIFIED="1329458840980" TEXT="struct list_head drop_list">
<node CREATED="1329458807820" ID="ID_126193536" MODIFIED="1329458809238" TEXT="&#x6302;&#x63a5;&#x5230;&#x4e22;&#x5305;&#x94fe;&#x8868;"/>
</node>
</node>
<node CREATED="1329458684582" FOLDED="true" ID="ID_1732477980" MODIFIED="1329459452250" TEXT="struct htb_class_inner inner">
<node CREATED="1329458834091" FOLDED="true" ID="ID_1509798015" MODIFIED="1329459196768" TEXT="struct rb_root feed[TC_HTB_NUMPRIO]">
<node CREATED="1329458876427" ID="ID_1968741909" MODIFIED="1329459154374" TEXT="&#x7b80;&#x79f0;inner feed :&#xa;&#x5f53;&#x6b64;class &#x7684;&#x67d0;&#x4e2a;&#x4f18;&#x5148;&#x7ea7;&#x4e3a;P  &#x7684;child &#x989c;&#x8272;&#x53d8;&#x4e3a;&#x9ec4;&#x8272;&#x65f6;&#xff0c;&#x5c06;&#x5176;&#x52a0;&#x5165;&#x8fd9;&#x91cc;&#x4f18;&#x5148;&#x7ea7;P  &#x7684;&#x7ea2;&#x9ed1;&#x6811;&#xa;&#x5f53;&#x6b64;class &#x7684;&#x67d0;&#x4e2a;&#x4f18;&#x5148;&#x7ea7;P  &#x7ea2;&#x9ed1;&#x6811;&#x4e0d;&#x4e3a;&#x7a7a;&#x65f6;&#xff0c;&#xa;------&#x82e5;&#x6b64;class &#x4e3a;&#x7eff;&#x8272;&#xff0c;&#x5219;&#x5e94;&#x5c06;&#x6b64;class &#x653e;&#x5165;htb_sched::row&#x4e2d;&#x6b64;class&#x5bf9;&#x5e94;level&#x7684;&#x4f18;&#x5148;&#x7ea7;P&#x7684;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;&#xa;------&#x82e5;&#x6b64;class &#x4e3a;&#x9ec4;&#x8272;&#xff0c;&#x5219;&#x5e94;&#x5c06;&#x6b64;class &#x653e;&#x5165;parent class::un.inner.feed&#x7684;&#x4f18;&#x5148;&#x7ea7;P  &#x7ea2;&#x9ed1;&#x6811;&#x4e2d;&#xa;------&#x82e5;&#x6b64;class &#x4e3a;&#x7ea2;&#x8272;&#xff0c;&#x5219;&#x5e94;&#x5c06;&#x6b64;class &#x4ece;htb_sched::row&#x548c;parent class::un.inner.feed&#x7684;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;&#x5220;&#x9664;&#xa;&#x6b64;&#x5904;&#x7684;&#x7ea2;&#x9ed1;&#x6811;&#x6309;&#x7167;class id &#x7ec4;&#x7ec7;&#x3002;"/>
</node>
<node CREATED="1329459219875" FOLDED="true" ID="ID_1018335601" MODIFIED="1329459363910" TEXT="struct rb_node *ptr[TC_HTB_NUMPRIO]">
<node CREATED="1329459238888" ID="ID_1025477511" MODIFIED="1329459356973" TEXT="&#x9488;&#x5bf9;inner feed(&#x5373;&#x4e0a;&#x9762;&#x7684;feed)&#x6bcf;&#x4e2a;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;&#x7684;&#x6240;&#x6709;class &#xff0c;&#x5e94;&#x4ee5;DRR &#x65b9;&#x5f0f;&#x8fdb;&#x884c;&#x8f6e;&#x8be2;&#x8c03;&#x5ea6;&#xff0c;&#xa;&#x6240;&#x4ee5;&#x8fd9;&#x91cc;&#x7684;ptr &#x8bb0;&#x5f55;&#x4e86;&#x6bcf;&#x4e2a;&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;&#x6700;&#x540e;&#x4e00;&#x4e2a;&#x88ab;&#x8c03;&#x5ea6;&#x7684;class&#xff0c;&#x4ee5;&#x4fbf;&#x4e0b;&#x6b21;&#x8c03;&#x5ea6;&#x65f6;&#x76f4;&#x63a5;&#x53d6;&#x8fd9;&#x4e2a;&#xa;class &#x7684;&#x4e0b;&#x4e00;&#x4e2a;class &#x8fdb;&#x884c;&#x8c03;&#x5ea6;&#x3002;"/>
</node>
<node CREATED="1329459390330" FOLDED="true" ID="ID_804332900" MODIFIED="1329459430074" TEXT="u32 last_ptr_id[TC_HTB_NUMPRIO]">
<node CREATED="1329459410333" ID="ID_1218921141" MODIFIED="1329459420968" TEXT="&#x5728;&#x505a;htb_deactivate_prios  &#x65f6;&#xff0c;&#x76f8;&#x5e94;&#x4f18;&#x5148;&#x7ea7;&#x7ea2;&#x9ed1;&#x6811;&#x4e0a;&#x6700;&#x540e;&#x4e00;&#x4e2a;&#x88ab;&#x5220;&#x9664;&#x7684;class  &#x7684;ID&#xff0c;&#xa;&#x5373;&#x6700;&#x540e;&#x4e00;&#x4e2a;&#x88ab;&#x8c03;&#x5ea6;&#x7684;class"/>
</node>
</node>
</node>
<node CREATED="1329459457941" FOLDED="true" ID="ID_495003007" MODIFIED="1329459682035" TEXT="struct rb_node node[TC_HTB_NUMPRIO]">
<node CREATED="1329459501876" ID="ID_429988686" MODIFIED="1329459676241" TEXT="class  &#x901a;&#x8fc7;&#x6b64;&#x8282;&#x70b9;&#x5c06;&#x81ea;&#x5df1;&#x6302;&#x63a5;&#x5230;parent class::un.inner.feed&#x7ea2;&#x9ed1;&#x6811;&#x6216;htb_sched::row&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;.&#xa;class  &#x53ef;&#x6839;&#x636e;&#x81ea;&#x5df1;&#x7684;feed&#x7ea2;&#x9ed1;&#x6811;&#x60c5;&#x51b5;&#x5c06;&#x81ea;&#x5df1;&#x6302;&#x63a5;&#x5230;parent class::un.inner.feed&#x7684;&#x591a;&#x4e2a;feed&#x4f18;&#x5148;&#x7ea7;&#x7ea2;&#x9ed1;&#x6811;&#xa;&#x6216;htb_sched::row&#x7684;&#x591a;&#x4e2a;row &#x4f18;&#x5148;&#x7ea7; &#x7ea2;&#x9ed1;&#x6811;&#x4e2d;"/>
</node>
<node CREATED="1329459699075" FOLDED="true" ID="ID_651586888" MODIFIED="1329459742189" TEXT="struct rb_node pq_node">
<node CREATED="1329459716164" ID="ID_1191376518" MODIFIED="1329459737676" TEXT="class  &#x901a;&#x8fc7;&#x6b64;&#x8282;&#x70b9;&#x5c06;&#x81ea;&#x5df1;&#x6302;&#x63a5;&#x5230;htb_sched::wait_pq&#x7ea2;&#x9ed1;&#x6811;&#x4e2d;"/>
</node>
<node CREATED="1329459757168" FOLDED="true" ID="ID_176129678" MODIFIED="1329459775045" TEXT="psched_time_t pq_key">
<node CREATED="1329459767371" ID="ID_1914184295" MODIFIED="1329459773290" TEXT="event&#x89e6;&#x53d1;&#x65f6;&#x95f4;"/>
</node>
<node CREATED="1329459792137" FOLDED="true" ID="ID_1744960094" MODIFIED="1329459918506" TEXT="int prio_activity">
<node CREATED="1329459804737" ID="ID_88445397" MODIFIED="1329459873880" TEXT="&#x5bf9;&#x4e8e;&#x53f6;&#x5b50;&#x8282;&#x70b9;&#x800c;&#x8a00;&#xff0c;prio_activity  &#x4e2d;&#x4ec5;&#x6709;&#x81ea;&#x5df1;prio  &#x5bf9;&#x5e94;&#x7684;&#x4f4d;&#x7f6e;&#x4e00;&#xff0c;&#x8868;&#x793a;&#x672c;&#x5b50;&#x8282;&#x70b9;&#x6709;&#x5305;&#x9700;&#x8981;&#x53d1;&#x9001;&#xa;&#x5bf9;&#x4e8e;inner&#x8282;&#x70b9;&#x800c;&#x8a00;&#xff0c;prio_activity  &#x8868;&#x793a;&#x81ea;&#x5df1;&#x7684;inner feed  (&#x89c1;&#x4e0a;&#x9762;) &#x4e2d;&#x6709;&#x54ea;&#x4e9b;&#x4f18;&#x5148;&#x7ea7;&#x6811;&#x975e;&#x7a7a;"/>
</node>
<node CREATED="1329459919632" FOLDED="true" ID="ID_1511998568" MODIFIED="1329459989067" TEXT="enum htb_cmode cmode">
<node CREATED="1329459937807" ID="ID_379264529" MODIFIED="1329459946899" TEXT="HTB_CANT_SEND : &#x7ea2;&#x8272;"/>
<node CREATED="1329459960521" ID="ID_1851225853" MODIFIED="1329459967051" TEXT="HTB_MAY_BORROW : &#x9ec4;&#x8272;"/>
<node CREATED="1329459979852" ID="ID_1301057854" MODIFIED="1329459985450" TEXT="HTB_CAN_SEND : &#x7eff;&#x8272;"/>
</node>
<node CREATED="1329460028419" ID="ID_307284008" MODIFIED="1329460031242" TEXT="struct tcf_proto *filter_list">
<node CREATED="1329460040478" ID="ID_1251543651" MODIFIED="1329460042219" TEXT="&#x7528;&#x4e8e;&#x5c06;&#x5305;&#x5206;&#x914d;&#x5230;child class  &#x7684;&#x8fc7;&#x6ee4;&#x5668;"/>
</node>
<node CREATED="1329460057201" ID="ID_342608239" MODIFIED="1329460058936" TEXT="int filter_cnt"/>
<node CREATED="1329460073654" ID="ID_1071966016" MODIFIED="1329460075429" TEXT="struct qdisc_rate_table *rate"/>
<node CREATED="1329460091692" ID="ID_56091722" MODIFIED="1329460093519" TEXT="struct qdisc_rate_table *ceil"/>
<node CREATED="1329460107463" ID="ID_275748623" MODIFIED="1329460112038" TEXT="long buffer"/>
<node CREATED="1329460113020" ID="ID_80554454" MODIFIED="1329460119480" TEXT="long cbuffer"/>
<node CREATED="1329460132187" FOLDED="true" ID="ID_1391861928" MODIFIED="1329460161625" TEXT="psched_tdiff_t mbuffer">
<node CREATED="1329460144409" ID="ID_468846801" MODIFIED="1329460146774" TEXT="&#x6700;&#x5927;&#x7b49;&#x5f85;&#x65f6;&#x95f4;"/>
</node>
<node CREATED="1329460162712" ID="ID_229306681" MODIFIED="1329460177693" TEXT="long tokens"/>
<node CREATED="1329460164484" ID="ID_956412533" MODIFIED="1329460171558" TEXT="long ctokens"/>
<node CREATED="1329460195459" FOLDED="true" ID="ID_368598726" MODIFIED="1329460209325" TEXT="psched_time_t t_c">
<node CREATED="1329460206634" ID="ID_1391644531" MODIFIED="1329460208387" TEXT="&#x68c0;&#x67e5;&#x70b9;&#x65f6;&#x95f4;"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1323854118675" FOLDED="true" ID="ID_1309990798" MODIFIED="1329456246570" POSITION="right" TEXT="general operation">
<node CREATED="1323854167504" ID="ID_1180993174" MODIFIED="1323854170710" TEXT="qdisc">
<node CREATED="1323854188554" ID="ID_886864594" MODIFIED="1323854191242" TEXT="qdisc_enqueue_root">
<node CREATED="1323854250098" ID="ID_1863511262" MODIFIED="1323854251683" TEXT="qdisc_enqueue">
<node CREATED="1323854262783" ID="ID_1653014130" MODIFIED="1323854314540" TEXT="&#x8c03;&#x7528;qdisc_calculate_pkt_len&#x8ba1;&#x7b97;&#x5305;&#x957f;&#x5e76;&#xa;&#x4fdd;&#x5b58;&#x5728;qdisc_skb_cb(skb)-&gt;pkt_len&#x4e2d;"/>
<node CREATED="1323854332989" ID="ID_925988911" MODIFIED="1323854345553" TEXT="&#x8c03;&#x7528;qdisc&#x7684;enqueue&#x51fd;&#x6570;"/>
</node>
</node>
<node CREATED="1323855302644" ID="ID_1038660702" MODIFIED="1323855355237" TEXT="tc_modify_qdisc&#xa;&#x521b;&#x5efa;&#x6216;&#x4fee;&#x6539;&#x67d0;&#x4e2a;&#x8bbe;&#x5907;&#x5173;&#x8054;&#x7684;qdisc&#xa;&#x7531;netlink&#x6d88;&#x606f;&#x89e6;&#x53d1;">
<node CREATED="1323857456091" FOLDED="true" ID="ID_889576091" MODIFIED="1325657765241" TEXT="&#x5982;&#x679c;tc&#x547d;&#x4ee4;&#x4e2d;&#x6307;&#x5b9a;&#x4e86;parent&#x53c2;&#x6570;">
<node CREATED="1323857557910" ID="ID_626702621" MODIFIED="1323857572883" TEXT="&#x5982;&#x679c;parent&#x53c2;&#x6570;&#x4e3a;ROOT">
<node CREATED="1323858101872" ID="ID_516082382" MODIFIED="1323858133371" TEXT="&#x6240;&#x8981;&#x53d6;&#x4ee3;&#x7684;qdisc&#x4e3a;dev-&gt;_tx[0],qdisc_sleeping"/>
</node>
<node CREATED="1323857557910" ID="ID_356827977" MODIFIED="1323857589961" TEXT="&#x5982;&#x679c;parent&#x53c2;&#x6570;&#x4e3a;ingress">
<node CREATED="1323858015079" ID="ID_414450198" MODIFIED="1323858030126" TEXT="&#x6240;&#x8981;&#x53d6;&#x4ee3;&#x7684;qdisc&#x4e3a;dev-&gt;rx_queue.qdisc_sleeping"/>
</node>
<node CREATED="1323857557910" ID="ID_1642758145" MODIFIED="1323857612248" TEXT="&#x5982;&#x679c;parent&#x53c2;&#x6570;&#x4e3a;xxx:xxx">
<node CREATED="1323857792204" ID="ID_177974521" MODIFIED="1323857919289" TEXT="&#x7528;class id xxx:xxx&#x7684;&#x524d;&#x534a;&#x90e8;&#x5206;&#x627e;&#x5230;&#x5bf9;&#x5e94;&#x7684;qdisc"/>
<node CREATED="1323857792204" ID="ID_1817942258" MODIFIED="1323858050206" TEXT="&#x5728;&#x6240;&#x627e;&#x5230;&#x7684;qdisc&#x4e2d;&#x6839;&#x636e;class id xxx:xxx&#x627e;&#x5230;&#x5bf9;&#x5e94;&#x7684;class&#xff0c;&#xa;&#x518d;&#x627e;&#x5230;&#x6b64;class&#x4e0b;&#x6302;&#x8f7d;&#x7684;qdisc&#xff0c;&#x6b64;&#x5373;&#x4e3a;&#x6240;&#x8981;&#x53d6;&#x4ee3;&#x7684;qdisc"/>
</node>
<node CREATED="1323858182521" ID="ID_1903670493" MODIFIED="1323858290040" TEXT="&#x5982;&#x679c;&#x6240;&#x8981;&#x53d6;&#x4ee3;&#x7684;qdisc&#x7684;handle&#x6307;&#x9488;&#x4e3a;&#x7a7a;&#x5219;&#x6240;&#x8981;&#x53d6;&#x4ee3;&#x7684;qdisc&#x4e0d;&#x5b58;&#x5728;"/>
<node CREATED="1323858414980" FOLDED="true" ID="ID_199739080" MODIFIED="1325657761514" TEXT="&#x5982;&#x679c;&#x6ca1;&#x627e;&#x5230;Qdisc, &#x6216;&#x6ca1;&#x5728;tc&#x547d;&#x4ee4;&#x4e2d;&#x6307;&#x5b9a;handle, &#x6216;&#x8005;&#x627e;&#x5230;&#x7684;Qdisc handle&#x548c;tc&#x547d;&#x4ee4;&#x4e2d;&#x4e0d;&#x540c;">
<node CREATED="1323858603354" ID="ID_1351457781" MODIFIED="1323858605844" TEXT="&#x5982;&#x679c;Qdisc&#x5b58;&#x5728;&#x4f46;&#x4e0d;&#x662f;&#x66f4;&#x65b0;&#x547d;&#x4ee4;, &#x8fd4;&#x56de;&#x5bf9;&#x8c61;&#x5b58;&#x5728;&#x9519;&#x8bef;"/>
<node CREATED="1323858637303" ID="ID_516192112" MODIFIED="1323858698036" TEXT="TC&#x547d;&#x4ee4;&#x4e2d;&#x6307;&#x5b9a;&#x7684;handle&#x503c;&#x7684;&#x4f4e;16&#x4f4d;&#x5fc5;&#x987b;&#x4e3a;0&#xff0c;&#x5373;&#x5e94;&#x4e3a;xxxx:&#x7684;&#x5f62;&#x5f0f;"/>
<node CREATED="1323858751239" ID="ID_1515989599" MODIFIED="1323858798256" TEXT="&#x5982;&#x679c;&#x6839;&#x636e;tc&#x547d;&#x4ee4;&#x4e2d;&#x7684;handle&#x67e5;&#x627e;&#x4e0d;&#x5230;&#x5bf9;&#x5e94;&#x7684;qdisc&#x5219;&#x9700;&#x8981;&#x521b;&#x5efa;&#x65b0;&#x7684;qdisc"/>
<node CREATED="1323858851106" ID="ID_48273864" MODIFIED="1323858896082" TEXT="&#x5982;&#x679c;&#x627e;&#x5230;&#x4e86;&#x8bbe;&#x7f6e;&#x4e86;NLM_F_EXCL&#x6392;&#x65a5;&#x6807;&#x5fd7;, &#x8fd4;&#x56de;&#x5bf9;&#x8c61;&#x5b58;&#x5728;&#x9519;&#x8bef;"/>
<node CREATED="1324015322022" ID="ID_241424069" MODIFIED="1324015447893" TEXT="&#x5982;&#x679c;TC&#x547d;&#x4ee4;&#x4e2d;&#x6307;&#x5b9a;&#x4e86;handle&#x503c;&#xff0c;&#x4f46;&#x662f;&#x65b0;&#x7684;qdisc&#x548c;&#x6240;&#x8981;&#x53d6;&#x4ee3;&#x7684;qdisc&#x4e0d;&#x662f;&#x540c;&#x4e00;&#x7c7b;&#x5219;&#x51fa;&#x9519;&#x8fd4;&#x56de;"/>
<node CREATED="1324015511003" ID="ID_1500878582" MODIFIED="1324015538777" TEXT="&#x786e;&#x8ba4;&#x6ca1;&#x6709;&#x73af;&#x56de;"/>
<node CREATED="1324015802609" ID="ID_1570849190" MODIFIED="1324015880688" TEXT="&#x82e5;&#x6ca1;&#x6709;&#x6307;&#x5b9a;handle&#x53c2;&#x6570;&#x4e14;&#x6ca1;&#x6709;&#x6240;&#x8981;&#x53d6;&#x4ee3;&#x7684;&#x8001;&#x7684;qdisc&#x5219;&#x9700;&#x8981;&#x521b;&#x5efa;&#x65b0;&#x7684;qdisc"/>
<node CREATED="1324015929623" ID="ID_1317626838" MODIFIED="1324015972777" TEXT="&#x82e5;&#x6ca1;&#x6709;&#x6307;&#x5b9a;handle&#x53c2;&#x6570;&#x4e14;&#x547d;&#x4ee4;&#x6307;&#x5b9a;&#x8981;&#x66ff;&#x6362;&#x8001;&#x7684;qdisc&#x5219;&#x4e5f;&#x9700;&#x8981;&#x521b;&#x5efa;&#x65b0;&#x7684;qdisc"/>
</node>
</node>
<node CREATED="1323857456091" ID="ID_1370078941" MODIFIED="1323857499938" TEXT="&#x5982;&#x679c;tc&#x547d;&#x4ee4;&#x4e2d;&#x6ca1;&#x6709;&#x6307;&#x5b9a;parent&#x53c2;&#x6570;">
<node CREATED="1324015588772" ID="ID_1258491677" MODIFIED="1324015611162" TEXT="&#x5982;&#x679c;&#x6ca1;&#x6709;&#x6307;&#x5b9a;handle&#x53c2;&#x6570;&#x5219;&#x9519;&#x8bef;&#x8fd4;&#x56de;"/>
<node CREATED="1324015611917" ID="ID_328357827" MODIFIED="1324015658530" TEXT="&#x6839;&#x636e;TC&#x547d;&#x4ee4;&#x4e2d;&#x7684;handle&#x53c2;&#x6570;&#x67e5;&#x627e;&#x5230;&#x5bf9;&#x5e94;&#x7684;qdisc"/>
</node>
<node CREATED="1324015889180" ID="ID_487693423" MODIFIED="1324016233047" TEXT="&#x7528;&#x65b0;&#x7684;qdisc&#x66ff;&#x6362;&#x8001;&#x7684;qdisc&#xa;(&#x6ce8;&#x610f;&#x65b0;&#x8001;qdisc&#x5e94;&#x4e3a;&#x540c;&#x4e00;&#x7c7b;&#x522b;)">
<node CREATED="1324016187719" ID="ID_1872926873" MODIFIED="1324016189761" TEXT="qdisc_change">
<node CREATED="1324016341543" ID="ID_1642339488" MODIFIED="1324016362493" TEXT="&#x8c03;&#x7528;&#x8001;&#x7684;qdisc&#x7684;sch-&gt;ops-&gt;change&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1324016621981" ID="ID_650801209" MODIFIED="1324016698146" TEXT="&#x5982;&#x679c;TC&#x547d;&#x4ee4;&#x4e2d;&#x6307;&#x5b9a;&#x4e86;size table&#x5219;&#x521b;&#x5efa;size table&#x5e76;&#x7528;sch-&gt;stab&#x6307;&#x5411;&#x8fd9;&#x4e2a;size table"/>
<node CREATED="1324016774330" ID="ID_1852249213" MODIFIED="1324016826593" TEXT="&#x5982;&#x679c;TC&#x547d;&#x4ee4;&#x4e2d;&#x6307;&#x5b9a;&#x4e86;rate table&#x5219;&#x8c03;&#x7528;gen_replace_estimator&#x521b;&#x5efa;&#x6d4b;&#x901f;&#x5668;"/>
</node>
<node CREATED="1324016196405" ID="ID_1693634551" MODIFIED="1324016197053" TEXT="qdisc_notify"/>
</node>
<node CREATED="1324016073530" ID="ID_156695185" MODIFIED="1325657302426" TEXT="&#x521b;&#x5efa;&#x65b0;&#x7684;qdisc : qdisc_create">
<node CREATED="1325657334057" ID="ID_1439001036" MODIFIED="1325657384970" TEXT="&#x83b7;&#x53d6;&#x8c03;&#x5ea6;&#x5668;&#x7684;&#x64cd;&#x4f5c;&#x96c6;struct Qdisc_ops *ops&#xff0c;&#x82e5;&#x8c03;&#x5ea6;&#x5668;&#x5bf9;&#x5e94;&#x7684;&#x5185;&#x6838;&#x6a21;&#x5757;&#x8fd8;&#x672a;&#x52a0;&#x8f7d;&#x5219;&#x52a0;&#x8f7d;&#x4e4b;"/>
<node CREATED="1325657424417" ID="ID_424917444" MODIFIED="1325657437200" TEXT="&#x5206;&#x914d;struct Qdisc&#x7ed3;&#x6784;"/>
<node CREATED="1325657466986" ID="ID_326174354" MODIFIED="1325657490117" TEXT="&#x521d;&#x59cb;&#x5316;sch-&gt;parent&#x548c;sch-&gt;handle"/>
<node CREATED="1325657517839" ID="ID_351099543" MODIFIED="1325657578806" TEXT="&#x8c03;&#x7528;&#x8c03;&#x5ea6;&#x5668;&#x7684;&#x521d;&#x59cb;&#x5316;&#x51fd;&#x6570;sch-&gt;ops-&gt;init"/>
<node CREATED="1325657639538" ID="ID_1726302914" MODIFIED="1325657679066" TEXT="&#x82e5;TC&#x547d;&#x4ee4;&#x6307;&#x5b9a;&#x521b;&#x5efa;size table&#x5219;&#x5728;sch-&gt;stab&#x4e0a;&#x521b;&#x5efa;size table"/>
<node CREATED="1325657639538" ID="ID_314192312" MODIFIED="1325657751889" TEXT="&#x82e5;TC&#x547d;&#x4ee4;&#x6307;&#x5b9a;&#x521b;&#x5efa;rate table&#x5219;&#x5728;sch-&gt;bstats, sch-&gt;rate_est&#x4e0a;&#x521b;&#x5efa;&#x6d4b;&#x901f;&#x5668;"/>
<node CREATED="1325658831109" ID="ID_1506242826" MODIFIED="1325658842240" TEXT="&#x8fd4;&#x56de;&#x6240;&#x521b;&#x5efa;&#x7684;&#x8c03;&#x5ea6;&#x5668;"/>
</node>
</node>
</node>
</node>
<node CREATED="1323854593174" FOLDED="true" ID="ID_467229106" MODIFIED="1329456251888" POSITION="left" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1323854673430" ID="ID_136765711" MODIFIED="1323854679605" TEXT="schedule">
<node CREATED="1323854688450" ID="ID_767652103" MODIFIED="1323854690947" TEXT="pktsched_init">
<node CREATED="1323854789207" ID="ID_1270489290" MODIFIED="1323854808245" TEXT="&#x6ce8;&#x518c;qdisc : pfifo"/>
<node CREATED="1323854789207" ID="ID_748363175" MODIFIED="1323854818430" TEXT="&#x6ce8;&#x518c;qdisc : bfifo"/>
<node CREATED="1323854939014" ID="ID_1430067711" MODIFIED="1323854986790" TEXT="&#x5728;proc&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x6dfb;&#x52a0;psched&#x76ee;&#x5f55;"/>
<node CREATED="1323855086798" ID="ID_1548332798" MODIFIED="1323855098779" TEXT="&#x6ce8;&#x518c;&#x63a5;&#x6536;netlink&#x6d88;&#x606f;">
<node CREATED="1323855115318" ID="ID_317505464" LINK="#ID_1038660702" MODIFIED="1323855379451" TEXT="RTM_NEWQDISC = tc_modify_qdisc"/>
<node CREATED="1323855128986" ID="ID_551571543" MODIFIED="1323855206327" TEXT="RTM_DELQDISC = tc_get_qdisc"/>
<node CREATED="1323855143111" ID="ID_1713367924" MODIFIED="1323855201224" TEXT="RTM_GETQDISC = tc_get_qdisc"/>
<node CREATED="1323855154655" ID="ID_1183790158" MODIFIED="1323855195419" TEXT="RTM_NEWTCLASS = tc_ctl_tclass"/>
<node CREATED="1323855165080" ID="ID_1213139662" MODIFIED="1323855189330" TEXT="RTM_DELTCLASS = tc_ctl_tclass"/>
<node CREATED="1323855176326" ID="ID_406048049" MODIFIED="1323855183430" TEXT="RTM_GETTCLASS = tc_ctl_tclass"/>
</node>
</node>
</node>
</node>
<node CREATED="1323854731325" FOLDED="true" ID="ID_468244700" MODIFIED="1329456248577" POSITION="right" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1325657966175" ID="ID_441672793" MODIFIED="1325657968530" TEXT="struct Qdisc">
<node CREATED="1325657979259" ID="ID_947191705" MODIFIED="1325657986523" TEXT="enqueue&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325657996944" ID="ID_610110242" MODIFIED="1325658002339" TEXT="dequeue&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658025672" ID="ID_1201687554" MODIFIED="1325658026606" TEXT="flags">
<node CREATED="1325658034594" ID="ID_1851117644" MODIFIED="1325658039306" TEXT="TCQ_F_BUILTIN"/>
<node CREATED="1325658045760" ID="ID_813330034" MODIFIED="1325658047850" TEXT="TCQ_F_THROTTLED"/>
<node CREATED="1325658055411" ID="ID_694877627" MODIFIED="1325658057097" TEXT="TCQ_F_INGRESS"/>
<node CREATED="1325658064954" ID="ID_1386141740" MODIFIED="1325658065774" TEXT="TCQ_F_WARN_NONWC"/>
</node>
<node CREATED="1325658078430" FOLDED="true" ID="ID_600283648" MODIFIED="1325659332628" TEXT="struct Qdisc_ops *ops">
<node CREATED="1325658476376" ID="ID_1547499635" MODIFIED="1325658482653" TEXT="next"/>
<node CREATED="1325658483329" FOLDED="true" ID="ID_841240662" MODIFIED="1325659329829" TEXT="struct Qdisc_class_ops *cl_ops &#x8c03;&#x5ea6;&#x5668;&#x5185;&#x90e8;&#x7c7b;&#x64cd;&#x4f5c;&#x96c6;">
<node CREATED="1325659186498" ID="ID_1712331059" MODIFIED="1325659305616" TEXT="graft&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659198307" ID="ID_954838166" MODIFIED="1325659307405" TEXT="leaf&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659206298" ID="ID_1965786083" MODIFIED="1325659309371" TEXT="qlen_notify&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659214330" ID="ID_1574251604" MODIFIED="1325659310993" TEXT="get&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659222651" ID="ID_817988941" MODIFIED="1325659312552" TEXT="put&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659230972" ID="ID_1119928259" MODIFIED="1325659314047" TEXT="change&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659239117" ID="ID_335508910" MODIFIED="1325659315532" TEXT="delete&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659247247" ID="ID_1329007662" MODIFIED="1325659316980" TEXT="walk&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659256409" ID="ID_1525451877" MODIFIED="1325659318560" TEXT="tcf_chain&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659266103" ID="ID_302460804" MODIFIED="1325659320338" TEXT="bind_tcf&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659276611" ID="ID_1999319557" MODIFIED="1325659321944" TEXT="unbind_tcf&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659283564" ID="ID_1074874518" MODIFIED="1325659323341" TEXT="dump&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325659291518" ID="ID_1161586006" MODIFIED="1325659324482" TEXT="dump_stats&#x51fd;&#x6570;&#x6307;&#x9488;"/>
</node>
<node CREATED="1325658536659" ID="ID_1062613521" MODIFIED="1325658537364" TEXT="id"/>
<node CREATED="1325658544087" ID="ID_1108496120" MODIFIED="1325658544756" TEXT="priv_size"/>
<node CREATED="1325658551157" ID="ID_974708214" MODIFIED="1325658616643" TEXT="enqueue&#x51fd;&#x6570;&#x6307;&#x9488; &#xff1a;&#x5c06;&#x4e00;&#x4e2a;&#x5305;&#x653e;&#x5165;&#x8c03;&#x5ea6;&#x5668;"/>
<node CREATED="1325658563689" ID="ID_1480305988" MODIFIED="1325658631801" TEXT="dequeue&#x51fd;&#x6570;&#x6307;&#x9488; &#xff1a;&#x4ece;&#x8c03;&#x5ea6;&#x5668;&#x53d6;&#x51fa;&#x4e00;&#x4e2a;&#x5305;"/>
<node CREATED="1325658579248" ID="ID_158681693" MODIFIED="1325658588965" TEXT="peek&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658645898" ID="ID_1231554553" MODIFIED="1325658654932" TEXT="drop&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658663550" ID="ID_378080585" MODIFIED="1325658808451" TEXT="init&#x51fd;&#x6570;&#x6307;&#x9488; &#xff1a;&#x521b;&#x5efa;&#x8c03;&#x5ea6;&#x5668;&#x65f6;&#x8c03;&#x7528;&#x7684;&#x521d;&#x59cb;&#x5316;&#x51fd;&#x6570;"/>
<node CREATED="1325658671140" ID="ID_1342977986" MODIFIED="1325658722374" TEXT="reset&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658679140" ID="ID_1392875855" MODIFIED="1325658724862" TEXT="destroy&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658686499" ID="ID_1287771680" MODIFIED="1325658727236" TEXT="change&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658694163" ID="ID_553083760" MODIFIED="1325658729466" TEXT="dump&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658702292" ID="ID_1448772987" MODIFIED="1325658731639" TEXT="dump_stats&#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658711035" ID="ID_706001431" MODIFIED="1325658711773" TEXT="owner"/>
</node>
<node CREATED="1325658117630" ID="ID_1077409332" MODIFIED="1325658127185" TEXT="struct qdisc_size_table *stab"/>
<node CREATED="1325658135745" ID="ID_10478542" MODIFIED="1325658168642" TEXT="list &#x5217;&#x8868;"/>
<node CREATED="1325658152006" ID="ID_1608430874" MODIFIED="1325658166420" TEXT="handle &#x53e5;&#x67c4;"/>
<node CREATED="1325658179575" ID="ID_1559469346" MODIFIED="1325658203717" TEXT="parent &#x7236;&#x7c7b;"/>
<node CREATED="1325658214452" ID="ID_901033489" MODIFIED="1325658223137" TEXT="refcnt &#x5f15;&#x7528;&#x8ba1;&#x6570;"/>
<node CREATED="1325658237026" FOLDED="true" ID="ID_325160229" MODIFIED="1325659646165" TEXT="struct gnet_stats_rate_est rate_est &#x6d4b;&#x901f;&#x5668;">
<node CREATED="1325659592561" ID="ID_1835120269" MODIFIED="1325659615678" TEXT="bps : byte per second"/>
<node CREATED="1325659617412" ID="ID_1276018955" MODIFIED="1325659627773" TEXT="pps : packet per second"/>
</node>
<node CREATED="1325658273132" ID="ID_510730008" MODIFIED="1325658282001" TEXT="reshape_fail &#x51fd;&#x6570;&#x6307;&#x9488;"/>
<node CREATED="1325658290113" ID="ID_375163855" MODIFIED="1325658291730" TEXT="u32_node"/>
<node CREATED="1325658326780" ID="ID_229738558" MODIFIED="1325658328046" TEXT="gso_skb"/>
<node CREATED="1325658346854" ID="ID_69544089" MODIFIED="1325658348762" TEXT="state"/>
<node CREATED="1325658360493" ID="ID_1230539309" MODIFIED="1325658370076" TEXT="struct sk_buff_head q"/>
<node CREATED="1325658385334" ID="ID_1970699705" MODIFIED="1325658386703" TEXT="struct gnet_stats_basic_packed bstats"/>
<node CREATED="1325658396605" ID="ID_1979735114" MODIFIED="1325658406723" TEXT="struct gnet_stats_queue qstats"/>
</node>
</node>
<node CREATED="1323854744414" ID="ID_919882876" MODIFIED="1323854755680" POSITION="left" TEXT="&#x5168;&#x5c40;&#x53d8;&#x91cf;"/>
<node CREATED="1325659675366" ID="ID_1409758072" MODIFIED="1329456257197" POSITION="right" TEXT="&#x57fa;&#x672c;&#x539f;&#x7406;">
<node CREATED="1325659689167" ID="ID_1531681207" MODIFIED="1325659695998" TEXT="&#x6d4b;&#x901f;&#x5668;"/>
</node>
</node>
</map>
