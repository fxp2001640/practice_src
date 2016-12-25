<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1431804028896" ID="ID_1208462320" MODIFIED="1431804049784" TEXT="tunnel">
<node CREATED="1431804066996" ID="ID_303077011" MODIFIED="1431804070529" POSITION="right" TEXT="l2tp">
<node CREATED="1420157483077" FOLDED="true" ID="ID_421377610" MODIFIED="1431804328663" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1420157513646" FOLDED="true" ID="ID_46083250" MODIFIED="1431804257021" TEXT="&#x534f;&#x8bae;&#x6d41;&#x7a0b;">
<node CREATED="1420157523740" ID="ID_1518392498" MODIFIED="1431804255671">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="../linux_kernel/pic/l2tp_sequence.gif" />
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1420930693145" ID="ID_1447109662" MODIFIED="1431804258093" TEXT="packet format">
<node CREATED="1420930791541" FOLDED="true" ID="ID_1855992887" MODIFIED="1431804287779" TEXT="data packet">
<node CREATED="1420930820946" ID="ID_915954254" MODIFIED="1431804269178">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="../linux_kernel/pic/l2tp_packet_format_1.gif" />
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1420933842878" ID="ID_1950999296" MODIFIED="1431804283413">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="../linux_kernel/pic/l2tp_packet_format_3.png" />
    </p>
  </body>
</html></richcontent>
<node CREATED="1420934094061" ID="ID_1230636959" MODIFIED="1420934100554" TEXT="ppp header">
<node CREATED="1420934102799" ID="ID_1183870796" MODIFIED="1420934112420" TEXT="address"/>
<node CREATED="1420934113018" ID="ID_611376556" MODIFIED="1420934116124" TEXT="control"/>
<node CREATED="1420934116954" ID="ID_508713450" MODIFIED="1420934120083" TEXT="protocol">
<node CREATED="1421041966910" ID="ID_356809530" MODIFIED="1421042150286">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      PPP_IP 0x21 /* Internet Protocol */
    </p>
    <p>
      PPP_AT 0x29 /* AppleTalk Protocol */
    </p>
    <p>
      PPP_IPX 0x2b /* IPX protocol */
    </p>
    <p>
      PPP_VJC_COMP 0x2d /* VJ compressed TCP */
    </p>
    <p>
      PPP_VJC_UNCOMP 0x2f /* VJ uncompressed TCP */
    </p>
    <p>
      PPP_MP 0x3d /* Multilink protocol */
    </p>
    <p>
      PPP_IPV6 0x57 /* Internet Protocol Version 6 */
    </p>
    <p>
      PPP_COMPFRAG 0xfb /* fragment compressed below bundle */
    </p>
    <p>
      PPP_COMP 0xfd /* compressed packet */
    </p>
    <p>
      PPP_MPLS_UC 0x0281 /* Multi Protocol Label Switching - Unicast */
    </p>
    <p>
      PPP_MPLS_MC 0x0283 /* Multi Protocol Label Switching - Multicast */
    </p>
    <p>
      PPP_IPCP 0x8021 /* IP Control Protocol */
    </p>
    <p>
      PPP_ATCP 0x8029 /* AppleTalk Control Protocol */
    </p>
    <p>
      PPP_IPXCP 0x802b /* IPX Control Protocol */
    </p>
    <p>
      PPP_IPV6CP 0x8057 /* IPv6 Control Protocol */
    </p>
    <p>
      PPP_CCPFRAG 0x80fb /* CCP at link level (below MP bundle) */
    </p>
    <p>
      PPP_CCP 0x80fd /* Compression Control Protocol */
    </p>
    <p>
      PPP_MPLSCP 0x80fd /* MPLS Control Protocol */
    </p>
    <p>
      PPP_LCP 0xc021 /* Link Control Protocol */
    </p>
    <p>
      PPP_PAP 0xc023 /* Password Authentication Protocol */
    </p>
    <p>
      PPP_LQR 0xc025 /* Link Quality Report protocol */
    </p>
    <p>
      PPP_CHAP 0xc223 /* Cryptographic Handshake Auth. Protocol */
    </p>
    <p>
      PPP_CBCP 0xc029 /* Callback Control Protocol */
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1420934146607" ID="ID_464425813" MODIFIED="1420934151584" TEXT="l2tp header">
<node CREATED="1420934153186" ID="ID_1044350332" MODIFIED="1420934156457" TEXT="T">
<node CREATED="1420934161097" ID="ID_355541484" MODIFIED="1420934178790" TEXT="0: data message"/>
<node CREATED="1420934179341" ID="ID_1258753215" MODIFIED="1420934186933" TEXT="1: control message"/>
</node>
<node CREATED="1420934188991" ID="ID_65508111" MODIFIED="1420934191927" TEXT="L">
<node CREATED="1420934193498" ID="ID_1000876126" MODIFIED="1420934203024" TEXT="length field present"/>
</node>
<node CREATED="1420934207352" ID="ID_1579456781" MODIFIED="1420934212086" TEXT="X">
<node CREATED="1420934213469" ID="ID_624650938" MODIFIED="1420934219020" TEXT="reserved"/>
</node>
<node CREATED="1420934220733" ID="ID_1944398702" MODIFIED="1420934223901" TEXT="O">
<node CREATED="1420934225014" ID="ID_1513947351" MODIFIED="1420934233781" TEXT="offset field present"/>
</node>
<node CREATED="1420934240467" ID="ID_1914806369" MODIFIED="1420934243504" TEXT="P">
<node CREATED="1420934244877" ID="ID_327742056" MODIFIED="1420934251422" TEXT="priority"/>
</node>
<node CREATED="1420934297173" ID="ID_1010721995" MODIFIED="1420934303256" TEXT="Ver">
<node CREATED="1420934304323" ID="ID_1997724019" MODIFIED="1420934319806" TEXT="2: L2tp protocol version 2"/>
</node>
<node CREATED="1420934348781" ID="ID_1856639937" MODIFIED="1420934353926" TEXT="Length">
<node CREATED="1420934356510" ID="ID_1319163627" MODIFIED="1420934364997" TEXT="total length of message"/>
</node>
<node CREATED="1420934368164" ID="ID_1271387895" MODIFIED="1420934373843" TEXT="Tunnel ID"/>
<node CREATED="1420934374394" ID="ID_1294834636" MODIFIED="1420934379630" TEXT="Session ID"/>
<node CREATED="1420934381483" ID="ID_752404738" MODIFIED="1420934384016" TEXT="Ns">
<node CREATED="1420934410208" ID="ID_337806523" MODIFIED="1420934420688" TEXT="sequence number for this message"/>
</node>
<node CREATED="1420934423078" ID="ID_465253276" MODIFIED="1420934424651" TEXT="Nr">
<node CREATED="1420934425951" ID="ID_1785994888" MODIFIED="1420934538923" TEXT="sequence number expected in the next message to be received"/>
</node>
<node CREATED="1420934586138" ID="ID_1798724415" MODIFIED="1420934590924" TEXT="Offset">
<node CREATED="1420934591642" ID="ID_380532760" MODIFIED="1420934604225" TEXT="number of octets past the L2TP header at which the payload data is expected to start"/>
</node>
</node>
</node>
<node CREATED="1420933955819" ID="ID_1698430385" MODIFIED="1420934959204" TEXT="ppp header&#x4e2d;&#x7684;protocol&#x57df;&#x6307;&#x660e;&#x4e86;ppp payload&#x662f;&#x4ec0;&#x4e48;&#x7c7b;&#x578b;&#x7684;&#x6570;&#x636e;">
<node CREATED="1420933955819" ID="ID_1883339524" MODIFIED="1420934973956" TEXT="0x0021: IP Protocol version 4"/>
<node CREATED="1420934982343" ID="ID_1951774648" MODIFIED="1420935116324" TEXT="0xc021: ppp link control protocol (ppp LCP)"/>
<node CREATED="1420935042316" ID="ID_42171457" MODIFIED="1420935120918" TEXT="0x8021: ppp internet  protocol control protocol (ppp IPCP)"/>
</node>
<node CREATED="1420939727392" ID="ID_1393045414" MODIFIED="1420939772761" TEXT="&#x5bf9;&#x4e8e;data packet, l2tp header&#x4e2d;&#x7684;Ns, Nr, Offset&#x57df;&#x4e00;&#x822c;&#x662f;&#x6ca1;&#x6709;&#x7684;"/>
</node>
<node CREATED="1420930717714" FOLDED="true" ID="ID_373519052" MODIFIED="1431804325259" TEXT="control packet">
<node CREATED="1420945633953" ID="ID_1235611370" MODIFIED="1431804296333">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="../linux_kernel/pic/l2tp_packet_format_5.png" />
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1420945663886" ID="ID_254227616" MODIFIED="1431804306844">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="../linux_kernel/pic/l2tp_packet_format_4.png" />
    </p>
  </body>
</html></richcontent>
<node CREATED="1420945714260" FOLDED="true" ID="ID_784543722" MODIFIED="1420946087755" TEXT="AVP">
<node CREATED="1420945732317" ID="ID_1522998433" MODIFIED="1420945737144" TEXT="M">
<node CREATED="1420945738665" ID="ID_585495338" MODIFIED="1420945851870">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      mandatory
    </p>
    <p>
      &#33509;&#25509;&#25910;&#26041;&#19981;&#33021;&#35782;&#21035;&#27492;AVP&#65292;&#21017;&#24212;&#20002;&#24323;&#27492;&#21253;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1420945855721" ID="ID_657372993" MODIFIED="1420945858443" TEXT="H">
<node CREATED="1420945860260" ID="ID_1346055507" MODIFIED="1420945880808" TEXT="value&#x90e8;&#x5206;&#x662f;&#x5426;&#x5df2;&#x52a0;&#x5bc6;"/>
</node>
<node CREATED="1420945886921" ID="ID_568316021" MODIFIED="1420945893533" TEXT="length">
<node CREATED="1420945894683" ID="ID_1338642965" MODIFIED="1420945912273" TEXT="&#x6574;&#x4e2a;AVP&#x7684;&#x957f;&#x5ea6;"/>
</node>
<node CREATED="1420945926272" ID="ID_1955551864" MODIFIED="1420945939917" TEXT="Vendor ID">
<node CREATED="1420945942337" ID="ID_1361394995" MODIFIED="1420945964200" TEXT="&#x5382;&#x5546;&#x8bc6;&#x522b;&#x7801;"/>
</node>
<node CREATED="1420945966687" ID="ID_720918024" MODIFIED="1420945974731" TEXT="Type">
<node CREATED="1420945985058" ID="ID_1912528690" MODIFIED="1420946027604" TEXT="AVP&#x7c7b;&#x578b;"/>
</node>
<node CREATED="1420946030961" ID="ID_334688026" MODIFIED="1420946036914" TEXT="Value">
<node CREATED="1420946038223" ID="ID_1275703458" MODIFIED="1420946073140" TEXT="AVP&#x7684;&#x503c;&#xff0c;&#x5176;&#x683c;&#x5f0f;&#x53d6;&#x51b3;&#x4e8e;Type&#x548c;Vendor ID"/>
</node>
</node>
<node CREATED="1420934146607" FOLDED="true" ID="ID_485193291" MODIFIED="1420946085196" TEXT="l2tp header">
<node CREATED="1420934153186" ID="ID_1535455367" MODIFIED="1420934156457" TEXT="T">
<node CREATED="1420934161097" ID="ID_436824810" MODIFIED="1420934178790" TEXT="0: data message"/>
<node CREATED="1420934179341" ID="ID_1084179253" MODIFIED="1420934186933" TEXT="1: control message"/>
</node>
<node CREATED="1420934188991" ID="ID_92389755" MODIFIED="1420934191927" TEXT="L">
<node CREATED="1420934193498" ID="ID_926563727" MODIFIED="1420934203024" TEXT="length field present"/>
</node>
<node CREATED="1420934207352" ID="ID_1882667152" MODIFIED="1420934212086" TEXT="X">
<node CREATED="1420934213469" ID="ID_453429472" MODIFIED="1420934219020" TEXT="reserved"/>
</node>
<node CREATED="1420934220733" ID="ID_1747517593" MODIFIED="1420934223901" TEXT="O">
<node CREATED="1420934225014" ID="ID_1498476301" MODIFIED="1420934233781" TEXT="offset field present"/>
</node>
<node CREATED="1420934240467" ID="ID_1999746055" MODIFIED="1420934243504" TEXT="P">
<node CREATED="1420934244877" ID="ID_1496785397" MODIFIED="1420934251422" TEXT="priority"/>
</node>
<node CREATED="1420934297173" ID="ID_145915264" MODIFIED="1420934303256" TEXT="Ver">
<node CREATED="1420934304323" ID="ID_435255610" MODIFIED="1420934319806" TEXT="2: L2tp protocol version 2"/>
</node>
<node CREATED="1420934348781" ID="ID_686373275" MODIFIED="1420934353926" TEXT="Length">
<node CREATED="1420934356510" ID="ID_876520560" MODIFIED="1420934364997" TEXT="total length of message"/>
</node>
<node CREATED="1420934368164" ID="ID_1853638094" MODIFIED="1420934373843" TEXT="Tunnel ID"/>
<node CREATED="1420934374394" ID="ID_644755419" MODIFIED="1420934379630" TEXT="Session ID"/>
<node CREATED="1420934381483" ID="ID_1821412138" MODIFIED="1420934384016" TEXT="Ns">
<node CREATED="1420934410208" ID="ID_916615348" MODIFIED="1420934420688" TEXT="sequence number for this message"/>
</node>
<node CREATED="1420934423078" ID="ID_439755801" MODIFIED="1420934424651" TEXT="Nr">
<node CREATED="1420934425951" ID="ID_806838533" MODIFIED="1420934538923" TEXT="sequence number expected in the next message to be received"/>
</node>
<node CREATED="1420934586138" ID="ID_460827343" MODIFIED="1420934590924" TEXT="Offset">
<node CREATED="1420934591642" ID="ID_885659711" MODIFIED="1420934604225" TEXT="number of octets past the L2TP header at which the payload data is expected to start"/>
</node>
</node>
</node>
<node CREATED="1420946121989" ID="ID_1986014558" MODIFIED="1420946174660" TEXT="&#x5bf9;&#x4e8e;control packet&#xff0c;l2tp header&#x4e2d;&#x7684;Ns, Nr&#x662f;&#x5fc5;&#x987b;&#x8981;&#x6709;&#x7684;"/>
<node CREATED="1420946197913" ID="ID_1277922731" MODIFIED="1420947739799">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21019;&#24314;&#19968;&#20010;tunnel&#28041;&#21450;&#30340;&#21253;
    </p>
    <p>
      &#21019;&#24314;tunnel&#20027;&#35201;&#26159;&#20132;&#25442;&#24444;&#27492;&#30340;tunnel id
    </p>
    <p>
      &#33509;&#21457;&#21253;&#26102;&#36824;&#19981;&#30693;&#36947;&#23545;&#31471;&#22312;&#27492;&#25511;&#21046;&#36830;&#25509;&#20013;&#25152;&#20351;&#29992;&#30340;tunnel id&#65292;&#21017;l2tp header&#20013;&#30340;tunnel id&#20351;&#29992;0&#65292;&#27604;&#22914;SCCRQ&#20013;
    </p>
    <p>
      &#33509;&#21457;&#21253;&#26102;&#24050;&#30693;&#36947;&#23545;&#31471;&#22312;&#27492;&#25511;&#21046;&#36830;&#25509;&#20013;&#25152;&#20351;&#29992;&#30340;tunnel id&#65292;&#21017;l2tp header&#20013;&#30340;tunnel id&#20351;&#29992;&#25152;&#30693;&#30340;id&#65292;&#27604;&#22914;SCCRP&#21644;SCCCN&#20013;
    </p>
    <p>
      &#22312;&#25511;&#21046;&#36890;&#36947;&#20013;&#19981;&#20351;&#29992;session id&#65292;&#21363;l2tp header&#20013;&#30340;session id&#22343;&#20026;0
    </p>
  </body>
</html></richcontent>
<node CREATED="1420946251718" FOLDED="true" ID="ID_1736756740" MODIFIED="1431804319258" TEXT="SCCRQ">
<node CREATED="1420946283742" ID="ID_1758962735" MODIFIED="1420946291177" TEXT="control message AVP">
<node CREATED="1420946357843" ID="ID_1350483328" MODIFIED="1420946400079" TEXT="&#x6307;&#x660e;message type&#x4e3a;Start_Control_Request"/>
</node>
<node CREATED="1420946428618" ID="ID_983206335" MODIFIED="1420946436986" TEXT="protocol version AVP">
<node CREATED="1420946439148" ID="ID_1392424855" MODIFIED="1420946506113" TEXT="&#x6307;&#x660e;l2tp&#x534f;&#x8bae;&#x7684;version&#x548c;revision"/>
</node>
<node CREATED="1420946541576" ID="ID_559865008" MODIFIED="1420946574055" TEXT="framing capabilities AVP">
<node CREATED="1420946596531" ID="ID_850241075" MODIFIED="1420946613621" TEXT="&#x6307;&#x660e;&#x652f;&#x6301;&#x54ea;&#x4e9b;&#x6210;&#x5e27;&#x6280;&#x672f;">
<node CREATED="1420946622596" ID="ID_790496703" MODIFIED="1420946628879" TEXT="Async framing"/>
<node CREATED="1420946629488" ID="ID_1689062968" MODIFIED="1420946641132" TEXT="Sync framing"/>
</node>
</node>
<node CREATED="1420946659034" ID="ID_1572631334" MODIFIED="1420946664477" TEXT="Host name AVP">
<node CREATED="1420946665791" ID="ID_1098160994" MODIFIED="1420946696642" TEXT="&#x6307;&#x660e;&#x53d1;&#x9001;&#x65b9;&#x7684;host name"/>
</node>
<node CREATED="1420946718186" ID="ID_337410984" MODIFIED="1420946731378" TEXT="Assigned tunnel ID AVP">
<node CREATED="1420946732599" ID="ID_1819609379" MODIFIED="1420946773359" TEXT="&#x6307;&#x660e;&#x53d1;&#x9001;&#x65b9;&#x51c6;&#x5907;&#x5728;&#x6b64;&#x63a7;&#x5236;&#x901a;&#x9053;&#x4e2d;&#x4f7f;&#x7528;&#x7684;tunnel id"/>
</node>
</node>
<node CREATED="1420946251718" FOLDED="true" ID="ID_1596203026" MODIFIED="1420947277220" TEXT="SCCRP">
<node CREATED="1420946283742" ID="ID_480314854" MODIFIED="1420946291177" TEXT="control message AVP">
<node CREATED="1420946357843" ID="ID_1878777330" MODIFIED="1420947190272" TEXT="&#x6307;&#x660e;message type&#x4e3a;Start_Control_Reply"/>
</node>
<node CREATED="1420946428618" ID="ID_1945484547" MODIFIED="1420946436986" TEXT="protocol version AVP">
<node CREATED="1420946439148" ID="ID_184573785" MODIFIED="1420946506113" TEXT="&#x6307;&#x660e;l2tp&#x534f;&#x8bae;&#x7684;version&#x548c;revision"/>
</node>
<node CREATED="1420946541576" ID="ID_547276457" MODIFIED="1420946574055" TEXT="framing capabilities AVP">
<node CREATED="1420946596531" ID="ID_1823001792" MODIFIED="1420946613621" TEXT="&#x6307;&#x660e;&#x652f;&#x6301;&#x54ea;&#x4e9b;&#x6210;&#x5e27;&#x6280;&#x672f;">
<node CREATED="1420946622596" ID="ID_1878542851" MODIFIED="1420946628879" TEXT="Async framing"/>
<node CREATED="1420946629488" ID="ID_1273440629" MODIFIED="1420946641132" TEXT="Sync framing"/>
</node>
</node>
<node CREATED="1420946659034" ID="ID_1595410389" MODIFIED="1420946664477" TEXT="Host name AVP">
<node CREATED="1420946665791" ID="ID_973385630" MODIFIED="1420946696642" TEXT="&#x6307;&#x660e;&#x53d1;&#x9001;&#x65b9;&#x7684;host name"/>
</node>
<node CREATED="1420947218854" ID="ID_562402421" MODIFIED="1420947229202" TEXT="receive window size AVP">
<node CREATED="1420947237334" ID="ID_760966920" MODIFIED="1420947253167" TEXT="&#x6307;&#x660e;receive window size"/>
</node>
<node CREATED="1420946718186" ID="ID_150071173" MODIFIED="1420946731378" TEXT="Assigned tunnel ID AVP">
<node CREATED="1420946732599" ID="ID_1222307120" MODIFIED="1420946773359" TEXT="&#x6307;&#x660e;&#x53d1;&#x9001;&#x65b9;&#x51c6;&#x5907;&#x5728;&#x6b64;&#x63a7;&#x5236;&#x901a;&#x9053;&#x4e2d;&#x4f7f;&#x7528;&#x7684;tunnel id"/>
</node>
</node>
<node CREATED="1420946251718" FOLDED="true" ID="ID_1336681878" MODIFIED="1420947918217" TEXT="SCCCN">
<node CREATED="1420946283742" ID="ID_1241086435" MODIFIED="1420946291177" TEXT="control message AVP">
<node CREATED="1420946357843" ID="ID_1485696641" MODIFIED="1420947420570" TEXT="&#x6307;&#x660e;message type&#x4e3a;Start_Control_Connected"/>
</node>
</node>
<node CREATED="1420947885732" FOLDED="true" ID="ID_450502059" MODIFIED="1420947968253" TEXT="ZLB ACK">
<node CREATED="1420947927953" ID="ID_470028410" MODIFIED="1420947962585" TEXT="&#x4ec5;&#x4f5c;ack&#x4e4b;&#x7528;&#xff0c;&#x8868;&#x793a;&#x6536;&#x5230;&#x4e86;SCCCN"/>
</node>
</node>
<node CREATED="1420946197913" ID="ID_1090456195" MODIFIED="1420949124176">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21019;&#24314;&#19968;&#20010;session&#28041;&#21450;&#30340;&#21253;
    </p>
    <p>
      &#21019;&#24314;session&#20027;&#35201;&#26159;&#20132;&#25442;&#24444;&#27492;&#30340;session id
    </p>
    <p>
      &#33509;&#21457;&#21253;&#26102;&#36824;&#19981;&#30693;&#36947;&#23545;&#31471;&#22312;&#27492;&#25968;&#25454;&#36830;&#25509;&#20013;&#25152;&#20351;&#29992;&#30340;session id&#65292;&#21017;l2tp header&#20013;&#30340;session id&#20351;&#29992;0&#65292;&#27604;&#22914;ICRQ&#20013;
    </p>
    <p>
      &#33509;&#21457;&#21253;&#26102;&#24050;&#30693;&#36947;&#23545;&#31471;&#22312;&#27492;&#25968;&#25454;&#36830;&#25509;&#20013;&#25152;&#20351;&#29992;&#30340;session id&#65292;&#21017;l2tp header&#20013;&#30340;session id&#20351;&#29992;&#25152;&#30693;&#30340;id&#65292;&#27604;&#22914;ICRP&#21644;ICCN&#20013;
    </p>
    <p>
      &#19968;&#20010;session&#20174;&#23646;&#20110;&#19968;&#20010;tunnel&#65292;&#19968;&#20010;tunnel&#21487;&#20197;&#21253;&#21547;&#22810;&#20010;session
    </p>
    <p>
      &#21019;&#24314;session&#26102;&#21644;&#21019;&#24314;session&#21518;&#30340;&#25968;&#25454;&#36890;&#36947;&#20013;&#65292;l2tp header&#20013;&#30340;tunnel&#160; id&#20026;session&#25152;&#20174;&#23646;&#30340;tunnel&#30340;id
    </p>
  </body>
</html></richcontent>
<node CREATED="1420946251718" ID="ID_1720668086" MODIFIED="1420948037917" TEXT="ICRQ">
<node CREATED="1420946283742" ID="ID_1384786816" MODIFIED="1420946291177" TEXT="control message AVP">
<node CREATED="1420946357843" ID="ID_123012289" MODIFIED="1420948065375" TEXT="&#x6307;&#x660e;message type&#x4e3a;Incoming_Call_Request"/>
</node>
<node CREATED="1420946718186" ID="ID_1537197377" MODIFIED="1420948085561" TEXT="Assigned session AVP">
<node CREATED="1420946732599" ID="ID_1437860745" MODIFIED="1420948107285" TEXT="&#x6307;&#x660e;&#x53d1;&#x9001;&#x65b9;&#x51c6;&#x5907;&#x5728;&#x6b64;&#x6570;&#x636e;&#x901a;&#x9053;&#x4e2d;&#x4f7f;&#x7528;&#x7684;session id"/>
</node>
<node CREATED="1420946428618" ID="ID_174002337" MODIFIED="1420948152462" TEXT="Call serial number AVP">
<node CREATED="1420946439148" ID="ID_1069443974" MODIFIED="1420948208386" TEXT="&#x4e00;&#x4e2a;session&#x5c31;&#x662f;&#x4e00;&#x4e2a;call&#xff0c;&#x8fd9;&#x91cc;&#x6307;&#x660e;call&#x7684;serial number"/>
</node>
</node>
<node CREATED="1420946251718" ID="ID_1883966954" MODIFIED="1420948224924" TEXT="ICRP">
<node CREATED="1420946283742" ID="ID_424688784" MODIFIED="1420946291177" TEXT="control message AVP">
<node CREATED="1420946357843" ID="ID_893204828" MODIFIED="1420948344143" TEXT="&#x6307;&#x660e;message type&#x4e3a;Incoming_Call_Reply"/>
</node>
<node CREATED="1420946718186" ID="ID_729863738" MODIFIED="1420948085561" TEXT="Assigned session AVP">
<node CREATED="1420946732599" ID="ID_1168689425" MODIFIED="1420948107285" TEXT="&#x6307;&#x660e;&#x53d1;&#x9001;&#x65b9;&#x51c6;&#x5907;&#x5728;&#x6b64;&#x6570;&#x636e;&#x901a;&#x9053;&#x4e2d;&#x4f7f;&#x7528;&#x7684;session id"/>
</node>
</node>
<node CREATED="1420946251718" ID="ID_348746124" MODIFIED="1420948409769" TEXT="ICCN">
<node CREATED="1420946283742" ID="ID_135870312" MODIFIED="1420946291177" TEXT="control message AVP">
<node CREATED="1420946357843" ID="ID_579270877" MODIFIED="1420948428265" TEXT="&#x6307;&#x660e;message type&#x4e3a;Incoming_Call_Connected"/>
</node>
<node CREATED="1420946541576" ID="ID_455052459" MODIFIED="1420948476826" TEXT="framing type AVP">
<node CREATED="1420946596531" ID="ID_171792765" MODIFIED="1420948505150" TEXT="&#x6307;&#x660e;&#x6b64;&#x6570;&#x636e;&#x901a;&#x9053;&#x4e2d;&#x4f7f;&#x7528;&#x54ea;&#x79cd;&#x6210;&#x5e27;&#x6280;&#x672f;">
<node CREATED="1420946622596" ID="ID_1111264158" MODIFIED="1420946628879" TEXT="Async framing"/>
<node CREATED="1420946629488" ID="ID_56080673" MODIFIED="1420946641132" TEXT="Sync framing"/>
</node>
</node>
<node CREATED="1420948528682" ID="ID_550442586" MODIFIED="1420948536592" TEXT="connect speed AVP">
<node CREATED="1420948628108" ID="ID_1108627393" MODIFIED="1420948717483" TEXT="&#x6307;&#x660e;&#x6b64;&#x6570;&#x636e;&#x901a;&#x9053;&#x4e2d;&#x4f7f;&#x7528;&#x7684;&#x53d1;&#x9001;&#x901f;&#x7387;&#xff0c;&#x5355;&#x4f4d;&#x4e3a;bps"/>
</node>
</node>
<node CREATED="1420947885732" ID="ID_332484145" MODIFIED="1420948721609" TEXT="ZLB ACK">
<node CREATED="1420947927953" ID="ID_272184885" MODIFIED="1420948727347" TEXT="&#x4ec5;&#x4f5c;ack&#x4e4b;&#x7528;&#xff0c;&#x8868;&#x793a;&#x6536;&#x5230;&#x4e86;ICCN"/>
</node>
</node>
</node>
</node>
<node CREATED="1420159573147" FOLDED="true" ID="ID_860714525" MODIFIED="1431804243169" TEXT="&#x7f16;&#x7a0b;&#x6a21;&#x578b;">
<node CREATED="1420159631602" ID="ID_24183634" MODIFIED="1431804204832">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <img src="../linux_kernel/pic/l2tp_program_model.png" />
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1420159633820" FOLDED="true" ID="ID_28583040" MODIFIED="1431804241495" TEXT="xl2tpd&#x7f16;&#x7a0b;&#x6a21;&#x578b;">
<node CREATED="1420159683271" FOLDED="true" ID="ID_1182898665" MODIFIED="1431804229433">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;l2tp control connection&#24314;&#31435;&#26102;&#65292;xl2tpd&#24212;&#25171;&#24320;&#19968;&#20010;tunnel management pppol2tp socket
    </p>
    <p>
      &#35774;&#32622;&#22909;&#21442;&#25968;(fd, s_tunnel, s_session, d_tunnel, d_session)&#21518;&#35843;&#29992;connect&#31995;&#32479;&#35843;&#29992;&#65292;&#36890;&#30693;l2tp&#39537;&#21160;
    </p>
    <p>
      
    </p>
    <p>
      &#36825;&#26159;&#19968;&#20010;&#19987;&#38376;&#29992;&#20110;&#36319;l2tp&#39537;&#21160;&#36890;&#20449;&#30340;socket&#65292;xl2tpd&#21487;&#20197;&#20351;&#29992;&#27492;socket&#25511;&#21046;l2tp tunnel&#30340;&#19968;&#20123;&#34892;&#20026;
    </p>
    <p>
      &#27880;&#24847;&#27492;&#22788;&#26159;&#20026;l2tp tunnel&#24314;&#31435;&#30340;&#25511;&#21046;&#31649;&#29702;&#29992;&#30340;socket&#65292;
    </p>
    <p>
      &#25152;&#20197;5&#20803;&#21442;&#25968;(fd, s_tunnel, s_session, d_tunnel, d_session)&#20013;&#30340;s_session&#21644;d_session&#22343;&#20026;0
    </p>
  </body>
</html></richcontent>
<node CREATED="1420160068969" ID="ID_192857039" MODIFIED="1420160126830">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;kernel_fd = socket(AF_PPPOX, SOCK_DGRAM, PX_PROTO_OL2TP);
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if (kernel_fd &gt;= 0) {
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct sockaddr_pppol2tp sax;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct sockaddr_in const *peer_addr;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;peer_addr = l2tp_tunnel_get_peer_addr(tunnel);
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;memset(&amp;sax, 0, sizeof(sax));
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.sa_family = AF_PPPOX;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.sa_protocol = PX_PROTO_OL2TP;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.fd = udp_fd;&#160;&#160;&#160;&#160;&#160;&#160;&#160;/* fd of tunnel UDP socket */
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.addr.sin_addr.s_addr = peer_addr-&gt;sin_addr.s_addr;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.addr.sin_port = peer_addr-&gt;sin_port;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.addr.sin_family = AF_INET;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.s_tunnel = tunnel_id;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.s_session = 0;&#160;&#160;&#160;&#160;&#160;/* special case: mgmt socket */
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.d_tunnel = 0;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.d_session = 0;&#160;&#160;&#160;&#160;&#160;/* special case: mgmt socket */
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;connect(kernel_fd, (struct sockaddr *)&amp;sax, sizeof(sax) ) &#65307;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;}
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1420160478805" ID="ID_1528534345" MODIFIED="1420160481861" TEXT="pppol2tp_connect">
<node CREATED="1420162128052" ID="ID_1054065644" MODIFIED="1420171128021" TEXT="&#x521b;&#x5efa;&#x4e00;&#x4e2a;struct l2tp_tunnel&#x5e76;&#x5c06;&#x5176;&#x4e0e;udp socket&#x5173;&#x8054;&#x8d77;&#x6765;">
<node CREATED="1420162334403" ID="ID_1356901887" MODIFIED="1420162336712" TEXT="int l2tp_tunnel_create(struct net *net, int fd, int version, u32 tunnel_id, u32 peer_tunnel_id, struct l2tp_tunnel_cfg *cfg, struct l2tp_tunnel **tunnelp)">
<node CREATED="1420162383931" ID="ID_279006988" MODIFIED="1420162507296">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20998;&#37197;&#19968;&#20010;struct l2tp_tunnel&#32467;&#26500;&#65292;&#24182;&#21021;&#22987;&#21270;&#20854;&#20004;&#31471;tunnel id&#21644;&#23553;&#35013;&#26041;&#24335;
    </p>
    <p>
      tunnel-&gt;tunnel_id
    </p>
    <p>
      tunnel-&gt;peer_tunnel_id
    </p>
    <p>
      tunnel-&gt;encap&#65292;&#23553;&#35013;&#26041;&#24335;&#26159;L2TP_ENCAPTYPE_UDP
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1420162576650" ID="ID_202714520" LINK="#ID_1342950021" MODIFIED="1421033342024">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;udp socket&#21464;&#20026;&#19968;&#20010;encapsulation socket&#65292;
    </p>
    <p>
      &#23558;&#20854;&#23553;&#35013;&#26041;&#24335;&#25913;&#20026;UDP_ENCAP_L2TPINUDP&#65306;udp_sk(sk)-&gt;encap_type = UDP_ENCAP_L2TPINUDP
    </p>
    <p>
      &#23558;&#20854;&#25910;&#21253;&#20989;&#25968;&#25913;&#20026;l2tp_udp_encap_recv&#65306;udp_sk(sk)-&gt;encap_rcv = l2tp_udp_encap_recv
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1420162619243" ID="ID_1969520970" MODIFIED="1420162637273" TEXT="&#x5c06;tunnel&#x4e0e;udp socket&#x5173;&#x8054;&#x8d77;&#x6765;">
<node CREATED="1420162760414" ID="ID_448853754" MODIFIED="1420162761899" TEXT="struct udp_sock">
<node CREATED="1420162786508" ID="ID_929362186" MODIFIED="1420162788407" TEXT="struct inet_sock inet">
<node CREATED="1420162851028" ID="ID_1793714297" MODIFIED="1420162909941">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      void *sk_user_data
    </p>
    <p>
      &#36825;&#20010;&#25351;&#38024;&#23601;&#25351;&#21521;&#20102;&#26032;&#21019;&#24314;&#30340;struct l2tp_tunnel
    </p>
  </body>
</html></richcontent>
<node CREATED="1420162914473" ID="ID_1777791920" MODIFIED="1420162916145" TEXT="struct l2tp_tunnel"/>
</node>
</node>
</node>
</node>
<node CREATED="1420162681529" ID="ID_130675357" MODIFIED="1420162711466" TEXT="&#x5c06;tunnel&#x6dfb;&#x52a0;&#x5230;struct l2tp_net pn-&gt;l2tp_tunnel_list&#x94fe;&#x8868;&#x4e2d;"/>
</node>
<node CREATED="1421029578165" ID="ID_264068329" MODIFIED="1421029796151">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tunnel-&gt;recv_payload_hook = pppol2tp_recv_payload_hook
    </p>
    <p>
      &#28155;&#21152;&#27492;hook&#30340;&#30446;&#30340;&#26159;&#22312;&#23558;ppp frame(&#21253;&#21547;ppp header&#21644;ppp payload)&#20256;&#36882;&#32473;ppp generic&#23618;&#26102;&#65292;&#21024;&#38500;ppp header&#20013;&#30340;address(0xff)&#21644;control(0x03)&#22495;&#65292;&#22240;&#20026;&#36825;&#20004;&#20010;&#22495;&#22312;&#21457;&#36865;&#25968;&#25454;&#21253;&#26102;&#20063;&#26159;&#30001;ppp channel&#23618;&#28155;&#21152;&#30340;&#65292;&#25152;&#20197;&#35841;&#28155;&#21152;&#35841;&#21024;&#38500;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1420171080609" ID="ID_1379511999" MODIFIED="1420171120497" TEXT="&#x521b;&#x5efa;&#x4e00;&#x4e2a;struct l2tp_session&#x5e76;&#x5c06;&#x5176;&#x4e0e;udp socket&#x5173;&#x8054;&#x8d77;&#x6765;">
<node CREATED="1420171083264" ID="ID_1584669282" MODIFIED="1420171087773" TEXT="struct l2tp_session *l2tp_session_create(int priv_size, struct l2tp_tunnel *tunnel, u32 session_id, u32 peer_session_id, struct l2tp_session_cfg *cfg)">
<node CREATED="1421030058570" ID="ID_1050960848" MODIFIED="1421030178258">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20998;&#37197;&#19968;&#20010;struct l2tp_session&#32467;&#26500;&#65292;&#24182;&#21021;&#22987;&#21270;&#20854;&#20004;&#31471;session id
    </p>
    <p>
      &#24182;&#23558;session&#20851;&#32852;&#21040;tunnel&#65306;session-&gt;tunnel = tunnel
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1421030240281" ID="ID_1883705950" MODIFIED="1421030287977">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25351;&#23450;&#19968;&#20010;&#21457;&#21253;&#26102;&#22914;&#20309;&#26500;&#24314;l2tp header&#30340;&#20989;&#25968;&#65306;
    </p>
    <p>
      session-&gt;build_header = l2tp_build_l2tpv2_header
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1421030404506" ID="ID_1678676602" MODIFIED="1421030522672">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25351;&#23450;l2tp header&#30340;&#38271;&#24230;&#65306;session-&gt;hdr_len
    </p>
    <p>
      &#40664;&#35748;&#24773;&#20917;&#19979;&#23427;&#20026;6(2byte flags, 2byte tunnel id, 2byte session id)&#65292;&#22914;&#26524;&#25910;&#21457;&#24207;&#21015;&#21495;&#21017;&#20877;&#21152;4(2byte Ns, 2byte Nr)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1421030617632" ID="ID_1016658113" MODIFIED="1421030644620" TEXT="&#x5c06;session&#x6dfb;&#x52a0;&#x5230;tunnel-&gt;session_hlist&#x94fe;&#x8868;&#x4e2d;"/>
<node CREATED="1421030679146" ID="ID_664645241" MODIFIED="1421030727437" TEXT="&#x5c06;sessin&#x6dfb;&#x52a0;&#x5230;&#x5168;&#x5c40;&#x94fe;&#x8868;struct l2tp_net-&gt;l2tp_session_hlist&#x4e2d;"/>
</node>
<node CREATED="1421030802881" ID="ID_1110932205" MODIFIED="1421030909388">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21021;&#22987;&#21270;(struct pppol2tp_session *)(session-&gt;priv)
    </p>
    <p>
      &#36825;&#20010;&#31169;&#26377;&#25968;&#25454;&#32467;&#26500;&#20027;&#35201;&#29992;&#26469;&#20445;&#23384;session&#23545;&#24212;&#30340;pppox socket&#21644;&#29992;&#26469;&#21457;&#36865;&#25968;&#25454;&#21253;&#30340;udp socket
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1421031121760" ID="ID_271265178" LINK="#ID_1548505761" MODIFIED="1421034738121">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      session-&gt;recv_skb = pppol2tp_recv
    </p>
    <p>
      &#27492;&#25910;&#21253;&#20989;&#25968;&#20174;udp socket&#25910;&#21253;&#65292;&#28982;&#21518;&#23558;&#25968;&#25454;&#21253;&#20256;&#36882;&#21040;ppp generic&#23618;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1421031272253" ID="ID_1697303351" MODIFIED="1421031293176" TEXT="&#x521d;&#x59cb;&#x5316;session&#x6240;&#x5173;&#x8054;&#x7684;struct ppp_channel">
<node CREATED="1421031354557" ID="ID_1320237876" MODIFIED="1421031369230" TEXT=".private = pppol2tp socket"/>
<node CREATED="1421031397129" ID="ID_1244683270" MODIFIED="1421031405570" TEXT=".ops = &amp;pppol2tp_chan_ops">
<node CREATED="1421031420364" ID="ID_1470389961" MODIFIED="1421031421696" TEXT=".start_xmit =  pppol2tp_xmit"/>
</node>
</node>
<node CREATED="1421031445826" ID="ID_435648159" MODIFIED="1421031488463" TEXT="&#x8c03;&#x7528;ppp_register_net_channel()&#x5c06;session&#x5173;&#x8054;&#x7684;struct ppp_channel&#x6ce8;&#x518c;&#x5230;ppp generic&#x5c42;"/>
</node>
</node>
</node>
<node CREATED="1420159683271" FOLDED="true" ID="ID_70109164" MODIFIED="1431804236047">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;l2tp session&#24314;&#31435;&#26102;&#65292;xl2tpd&#24212;&#25171;&#24320;&#19968;&#20010;session pppol2tp data socket
    </p>
    <p>
      &#35774;&#32622;&#22909;&#21442;&#25968;(fd, s_tunnel, s_session, d_tunnel, d_session)&#21518;&#35843;&#29992;connect&#31995;&#32479;&#35843;&#29992;&#65292;&#36890;&#30693;l2tp&#39537;&#21160;
    </p>
    <p>
      
    </p>
    <p>
      &#36825;&#26159;&#19968;&#20010;&#19987;&#38376;&#29992;&#20110;&#36319;l2tp&#39537;&#21160;&#36890;&#20449;&#30340;socket&#65292;xl2tpd&#21487;&#20197;&#20351;&#29992;&#27492;socket&#25511;&#21046;l2tp session&#30340;&#19968;&#20123;&#34892;&#20026;
    </p>
    <p>
      &#27880;&#24847;&#27492;&#22788;&#26159;&#20026;l2tp session&#24314;&#31435;&#30340;&#25511;&#21046;&#31649;&#29702;&#29992;&#30340;socket&#65292;
    </p>
    <p>
      &#25152;&#20197;5&#20803;&#21442;&#25968;(fd, s_tunnel, s_session, d_tunnel, d_session)&#20013;&#30340;s_session&#21644;d_session&#19981;&#24212;&#20026;0
    </p>
  </body>
</html></richcontent>
<node CREATED="1420160068969" ID="ID_1517921911" MODIFIED="1420172776711">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;kernel_fd = socket(AF_PPPOX, SOCK_DGRAM, PX_PROTO_OL2TP);
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;if (kernel_fd &gt;= 0) {
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct sockaddr_pppol2tp sax;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct sockaddr_in const *peer_addr;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;peer_addr = l2tp_tunnel_get_peer_addr(tunnel);
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;memset(&amp;sax, 0, sizeof(sax));
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.sa_family = AF_PPPOX;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.sa_protocol = PX_PROTO_OL2TP;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.fd = udp_fd;&#160;&#160;&#160;&#160;&#160;&#160;&#160;/* fd of tunnel UDP socket */
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.addr.sin_addr.s_addr = peer_addr-&gt;sin_addr.s_addr;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.addr.sin_port = peer_addr-&gt;sin_port;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.addr.sin_family = AF_INET;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.s_tunnel&#160;&#160;= tunnel_id;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.s_session = session_id;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.d_tunnel&#160;&#160;= peer_tunnel_id;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sax.pppol2tp.d_session = peer_session_id;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;connect(kernel_fd, (struct sockaddr *)&amp;sax, sizeof(sax) ) &#65307;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;}
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1420160478805" ID="ID_1528434714" MODIFIED="1420160481861" TEXT="pppol2tp_connect">
<node CREATED="1420162128052" ID="ID_1965971649" MODIFIED="1420172972667" TEXT="&#x627e;&#x5230;tunnel_id&#x5bf9;&#x5e94;&#x7684;struct l2tp_tunnel"/>
<node CREATED="1420171080609" ID="ID_228928806" MODIFIED="1420171120497" TEXT="&#x521b;&#x5efa;&#x4e00;&#x4e2a;struct l2tp_session&#x5e76;&#x5c06;&#x5176;&#x4e0e;udp socket&#x5173;&#x8054;&#x8d77;&#x6765;">
<node CREATED="1420171083264" ID="ID_1080353695" MODIFIED="1420171087773" TEXT="struct l2tp_session *l2tp_session_create(int priv_size, struct l2tp_tunnel *tunnel, u32 session_id, u32 peer_session_id, struct l2tp_session_cfg *cfg)"/>
</node>
<node CREATED="1420173389051" ID="ID_470752961" MODIFIED="1420173410495" TEXT="&#x5728;ppp generic&#x5c42;&#x6ce8;&#x518c;ppp channel">
<node CREATED="1420181792809" ID="ID_1501900227" MODIFIED="1420181794148" TEXT="ppp_register_net_channel"/>
</node>
</node>
</node>
<node CREATED="1421026946472" ID="ID_556799994" MODIFIED="1421027110219">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      session&#24314;&#31435;&#21518;&#20250;&#21551;&#21160;pppd&#65292;pppd&#21021;&#22987;&#21270;&#36807;&#31243;&#20013;&#20250;&#21152;&#36733;pppol2tp&#36825;&#20010;plugin
    </p>
    <p>
      &#27492;&#26102;pppd&#20013;&#30340;&#20840;&#23616;&#21464;&#37327;the_channel&#20250;&#34987;&#21021;&#22987;&#21270;&#25104;struct channel pppol2tp_channel
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1421027166138" ID="ID_193530532" MODIFIED="1421027218511" TEXT="pppd&#x5728;&#x521d;&#x59cb;&#x5316;&#x7684;&#x540e;&#x9762;&#x9636;&#x6bb5;&#x4f1a;&#x542f;&#x7528;ppp interface&#xff0c;&#x5373;start_link()">
<node CREATED="1421027223884" ID="ID_784990726" MODIFIED="1421027318296" TEXT="&#x9996;&#x5148;&#x4f1a;&#x7528;xl2tpd&#x4f20;&#x8fc7;&#x6765;&#x7684;fd, &#x5373;session-&gt;pppox_fd&#x6765;&#x67e5;&#x8be2;channel&#x7684;index"/>
<node CREATED="1421027346273" ID="ID_1982105369" MODIFIED="1421027394392" TEXT="&#x6253;&#x5f00;&#x5b57;&#x7b26;&#x8bbe;&#x5907;/dev/ppp&#xff0c;&#x5e76;&#x5c06;&#x6587;&#x4ef6;&#x63cf;&#x8ff0;&#x7b26;attach&#x5230;&#x4e0a;&#x9762;&#x67e5;&#x8be2;&#x5230;&#x7684;channel"/>
<node CREATED="1421027346273" ID="ID_692828966" MODIFIED="1421027449398" TEXT="&#x518d;&#x6253;&#x5f00;&#x5b57;&#x7b26;&#x8bbe;&#x5907;/dev/ppp&#xff0c;&#x5e76;&#x5c06;&#x6587;&#x4ef6;&#x63cf;&#x8ff0;&#x7b26;attach&#x5230;&#x65b0;&#x521b;&#x5efa;&#x7684;&#x7684;ppp unit"/>
<node CREATED="1421027472147" ID="ID_139580315" MODIFIED="1421027522788" TEXT="&#x5c06;&#x4e0a;&#x9762;&#x521b;&#x5efa;&#x7684;channel&#x8fde;&#x63a5;connect&#x5230;&#x4e0a;&#x9762;&#x521b;&#x5efa;&#x7684;ppp unit"/>
</node>
<node CREATED="1421027547994" ID="ID_1012464708" MODIFIED="1421027577238" TEXT="&#x81f3;&#x6b64;&#xff0c;&#x8bbe;&#x5907;&#x6a21;&#x578b;&#x6784;&#x5efa;&#x5b8c;&#x6bd5;&#xff0c;&#x53ef;&#x4ee5;&#x5f00;&#x59cb;&#x6536;&#x53d1;&#x5305;&#x4e86;"/>
</node>
</node>
</node>
<node CREATED="1431804334722" ID="ID_1919531883" MODIFIED="1431805322756" TEXT="xl2tpd">
<node CREATED="1431804432320" ID="ID_464206013" MODIFIED="1431804439413" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1431805329277" FOLDED="true" ID="ID_468270200" MODIFIED="1431830450840" TEXT="&#x914d;&#x7f6e;&#x6587;&#x4ef6;">
<node CREATED="1431805691330" FOLDED="true" ID="ID_1395746196" MODIFIED="1431807551278" TEXT="[global]">
<node CREATED="1431805816540" ID="ID_582725977" MODIFIED="1431805848234" TEXT="listen-addr = 192.168.10.100"/>
<node CREATED="1431805892864" ID="ID_1741718054" MODIFIED="1431805896507" TEXT="port = 1701"/>
<node CREATED="1431805909841" FOLDED="true" ID="ID_1201231519" MODIFIED="1431806053576" TEXT="saref refinfo = 3">
<node CREATED="1431805983565" ID="ID_896288667" MODIFIED="1431805984821" TEXT="SAref IP_IPSEC_REFINFO number"/>
</node>
<node CREATED="1431806054918" FOLDED="true" ID="ID_1408164631" MODIFIED="1431806084860" TEXT="rand source = dev">
<node CREATED="1431806075135" ID="ID_757628569" MODIFIED="1431806077620" TEXT="dev"/>
<node CREATED="1431806078548" ID="ID_1261493658" MODIFIED="1431806080268" TEXT="egd"/>
<node CREATED="1431806080899" ID="ID_203323138" MODIFIED="1431806082899" TEXT="sys"/>
</node>
<node CREATED="1431806097607" ID="ID_710324935" MODIFIED="1431806110733" TEXT="auth file = /path/to/auth/file"/>
<node CREATED="1431806393885" ID="ID_1833531693" MODIFIED="1431806396886" TEXT="access control = yes"/>
<node CREATED="1431806412620" ID="ID_1572839335" MODIFIED="1431806415565" TEXT="force userspace = yes"/>
<node CREATED="1431806567516" ID="ID_745135756" MODIFIED="1431806570759" TEXT="debug avp = yes"/>
<node CREATED="1431806609984" ID="ID_712048500" MODIFIED="1431806612742" TEXT="debug network = yes"/>
<node CREATED="1431806622662" ID="ID_1208925126" MODIFIED="1431806625570" TEXT="debug packet = yes"/>
<node CREATED="1431806635036" ID="ID_291432792" MODIFIED="1431806638139" TEXT="debug tunnel = yes"/>
<node CREATED="1431806647520" ID="ID_1302129384" MODIFIED="1431806650364" TEXT="debug state = yes"/>
<node CREATED="1431806664956" ID="ID_1946669337" MODIFIED="1431806668168" TEXT="ipsec saref = yes"/>
</node>
<node CREATED="1431805721165" FOLDED="true" ID="ID_1134040036" MODIFIED="1431807547797" TEXT="[lns]">
<node CREATED="1431806150314" ID="ID_665841318" MODIFIED="1431806185824" TEXT="exclusive = yes"/>
<node CREATED="1431806451454" ID="ID_253997362" MODIFIED="1431806465736" TEXT="ip range = 192.168.4.2-192.168.4.200"/>
<node CREATED="1431806536743" ID="ID_1111638720" MODIFIED="1431806550424" TEXT="no ip range = 192.168.4.100-192.168.4.150"/>
<node CREATED="1431806726491" ID="ID_1143317120" MODIFIED="1431806746314" TEXT="lac = 192.168.10.100-192.168.10.200"/>
<node CREATED="1431806726491" ID="ID_803684926" MODIFIED="1431806771254" TEXT="no lac = 192.168.10.150-192.168.10.180"/>
<node CREATED="1431806792243" ID="ID_1460640113" MODIFIED="1431806795014" TEXT="assign ip = yes"/>
<node CREATED="1431806814772" ID="ID_1431240013" MODIFIED="1431806821037" TEXT="local ip = 192.168.4.1"/>
<node CREATED="1431806910793" ID="ID_1812203726" MODIFIED="1431806913551" TEXT="length bit = yes"/>
<node CREATED="1431806925651" ID="ID_1011928732" MODIFIED="1431806928300" TEXT="hidden bit = yes"/>
<node CREATED="1431806979939" ID="ID_1706662380" MODIFIED="1431806983689" TEXT="require pap = yes"/>
<node CREATED="1431806999031" ID="ID_439827825" MODIFIED="1431807001899" TEXT="require chap = yes"/>
<node CREATED="1431807021451" ID="ID_927506852" MODIFIED="1431807024104" TEXT="require authentication = yes"/>
<node CREATED="1431807033480" ID="ID_1449261067" MODIFIED="1431807035846" TEXT="require auth = yes"/>
<node CREATED="1431807047116" ID="ID_759150014" MODIFIED="1431807049651" TEXT="refuse pap =yes"/>
<node CREATED="1431807058942" ID="ID_815846141" MODIFIED="1431807061451" TEXT="refuse chap = yes"/>
<node CREATED="1431807073139" ID="ID_1672795162" MODIFIED="1431807076059" TEXT="refuse authentication = yes"/>
<node CREATED="1431807088937" ID="ID_575221559" MODIFIED="1431807091853" TEXT="refuse auth = yes"/>
<node CREATED="1431807107663" ID="ID_957291472" MODIFIED="1431807110266" TEXT="unix authentication = yes"/>
<node CREATED="1431807180405" ID="ID_87161859" MODIFIED="1431807183203" TEXT="unix auth = yes"/>
<node CREATED="1431807201232" ID="ID_1943286584" MODIFIED="1431807205514" TEXT="name = xxx"/>
<node CREATED="1431807225987" ID="ID_1037287083" MODIFIED="1431807230246" TEXT="hostname = xxx"/>
<node CREATED="1431807259257" ID="ID_1377509854" MODIFIED="1431807262282" TEXT="ppp debug = yes"/>
<node CREATED="1431807276702" ID="ID_617146723" MODIFIED="1431807290500" TEXT="pppoptfile = /path/to/ppp/option/file"/>
<node CREATED="1431807322332" ID="ID_870753488" MODIFIED="1431807326637" TEXT="call rws = 1200">
<node CREATED="1431807328862" ID="ID_858355275" MODIFIED="1431807334457" TEXT="receive windown size"/>
</node>
<node CREATED="1431807322332" ID="ID_639955777" MODIFIED="1431807375867" TEXT="tunnel rws = 1200">
<node CREATED="1431807328862" ID="ID_940584841" MODIFIED="1431807334457" TEXT="receive windown size"/>
</node>
<node CREATED="1431807418097" ID="ID_1499847910" MODIFIED="1431807421098" TEXT="flow bit = yes"/>
<node CREATED="1431807431932" ID="ID_1816518908" MODIFIED="1431807434550" TEXT="challenge = yes"/>
<node CREATED="1431807461157" ID="ID_851021289" MODIFIED="1431807465759" TEXT="tx bps = 2000"/>
<node CREATED="1431807461157" ID="ID_1190159100" MODIFIED="1431807475015" TEXT="rx bps = 2000"/>
<node CREATED="1431807461157" ID="ID_845169720" MODIFIED="1431807531158" TEXT="bps = 2000">
<node CREATED="1431807532360" ID="ID_1743168774" MODIFIED="1431807538925" TEXT="both for tx and rx"/>
</node>
</node>
<node CREATED="1431805725914" FOLDED="true" ID="ID_226117921" MODIFIED="1431807550025" TEXT="[lac]">
<node CREATED="1431806207904" ID="ID_831392630" MODIFIED="1431806211319" TEXT="autodial = yes"/>
<node CREATED="1431806226606" ID="ID_804747831" MODIFIED="1431806229576" TEXT="redial = yes"/>
<node CREATED="1431806248411" ID="ID_205285686" MODIFIED="1431806254180" TEXT="redial timeout = 6"/>
<node CREATED="1431806341286" ID="ID_5149745" MODIFIED="1431806354138" TEXT="lns = 192.168.10.1:1701"/>
<node CREATED="1431806373488" ID="ID_151981457" MODIFIED="1431806376333" TEXT="max redials = 6"/>
<node CREATED="1431806824498" ID="ID_387495765" MODIFIED="1431806830371" TEXT="local ip = 192.168.4.2"/>
<node CREATED="1431806855842" ID="ID_849262099" MODIFIED="1431806864234" TEXT="remote ip = 192.168.4.1"/>
<node CREATED="1431806887873" ID="ID_924718681" MODIFIED="1431806890296" TEXT="defaultroute = yes"/>
<node CREATED="1431806905012" ID="ID_1738561314" MODIFIED="1431806908576" TEXT="length bit = yes"/>
<node CREATED="1431806931033" ID="ID_3790099" MODIFIED="1431806933690" TEXT="hidden bit = yes"/>
<node CREATED="1431806979939" ID="ID_168403874" MODIFIED="1431806983689" TEXT="require pap = yes"/>
<node CREATED="1431806999031" ID="ID_204763241" MODIFIED="1431807001899" TEXT="require chap = yes"/>
<node CREATED="1431807021451" ID="ID_337929975" MODIFIED="1431807024104" TEXT="require authentication = yes"/>
<node CREATED="1431807033480" ID="ID_48711984" MODIFIED="1431807035846" TEXT="require auth = yes"/>
<node CREATED="1431807047116" ID="ID_772808022" MODIFIED="1431807049651" TEXT="refuse pap =yes"/>
<node CREATED="1431807058942" ID="ID_664032494" MODIFIED="1431807061451" TEXT="refuse chap = yes"/>
<node CREATED="1431807073139" ID="ID_364513310" MODIFIED="1431807076059" TEXT="refuse authentication = yes"/>
<node CREATED="1431807088937" ID="ID_451210551" MODIFIED="1431807091853" TEXT="refuse auth = yes"/>
<node CREATED="1431807201232" ID="ID_467144783" MODIFIED="1431807205514" TEXT="name = xxx"/>
<node CREATED="1431807233173" ID="ID_1047939662" MODIFIED="1431807236221" TEXT="hostname = xxx"/>
<node CREATED="1431807252688" ID="ID_1088666811" MODIFIED="1431807255634" TEXT="ppp debug = yes"/>
<node CREATED="1431807276702" ID="ID_744598" MODIFIED="1431807290500" TEXT="pppoptfile = /path/to/ppp/option/file"/>
<node CREATED="1431807322332" ID="ID_874411842" MODIFIED="1431807326637" TEXT="call rws = 1200">
<node CREATED="1431807328862" ID="ID_1514415165" MODIFIED="1431807334457" TEXT="receive windown size"/>
</node>
<node CREATED="1431807322332" ID="ID_1162937763" MODIFIED="1431807375867" TEXT="tunnel rws = 1200">
<node CREATED="1431807328862" ID="ID_289682481" MODIFIED="1431807334457" TEXT="receive windown size"/>
</node>
<node CREATED="1431807411239" ID="ID_311126218" MODIFIED="1431807414052" TEXT="flow bit = yes"/>
<node CREATED="1431807438361" ID="ID_1338273148" MODIFIED="1431807441073" TEXT="challenge = yes"/>
<node CREATED="1431807461157" ID="ID_1287350650" MODIFIED="1431807465759" TEXT="tx bps = 2000"/>
<node CREATED="1431807461157" ID="ID_571305724" MODIFIED="1431807475015" TEXT="rx bps = 2000"/>
<node CREATED="1431807461157" ID="ID_828096239" MODIFIED="1431807531158" TEXT="bps = 2000">
<node CREATED="1431807532360" ID="ID_395284751" MODIFIED="1431807538925" TEXT="both for tx and rx"/>
</node>
</node>
<node CREATED="1431805730757" ID="ID_1608945849" MODIFIED="1431805735625" TEXT="[default]"/>
</node>
<node CREATED="1431830881128" FOLDED="true" ID="ID_1720721411" MODIFIED="1431832998921" TEXT="struct lac">
<node CREATED="1431831636273" ID="ID_606472" MODIFIED="1431831636273" TEXT=" struct lac *next"/>
<node CREATED="1431831636273" ID="ID_1509413041" MODIFIED="1431831636273" TEXT=" struct host *lns"/>
<node CREATED="1431831636273" ID="ID_1095377140" MODIFIED="1431831636273" TEXT=" struct schedule_entry *rsched"/>
<node CREATED="1431831636273" ID="ID_649803825" MODIFIED="1431831636273" TEXT=" int tun_rws"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int call_rws"/>
<node CREATED="1431831636273" ID="ID_281664097" MODIFIED="1431831636273" TEXT=" int rxspeed"/>
<node CREATED="1431831636273" ID="ID_1756277414" MODIFIED="1431831636273" TEXT=" int txspeed"/>
<node CREATED="1431831636273" ID="ID_1928664787" MODIFIED="1431832258403">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int active
    </p>
    <p>
      &#27492;lac&#27491;&#22312;&#20351;&#29992;&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int hbit"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int lbit"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int challenge"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int localaddr"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int remoteaddr"/>
<node CREATED="1431831636273" ID="ID_723085680" MODIFIED="1431831636273" TEXT=" char authname[STRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char password[STRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char peername[STRLEN]"/>
<node CREATED="1431831636273" ID="ID_1548207313" MODIFIED="1431831636273" TEXT=" char hostname[STRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char entname[STRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int authpeer"/>
<node CREATED="1431831636273" ID="ID_1365966797" MODIFIED="1431831636273" TEXT=" int authself"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int pap_require"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int chap_require"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int pap_refuse"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int chap_refuse"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int idle"/>
<node CREATED="1431831636273" ID="ID_362574590" MODIFIED="1431832217302">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int autodial
    </p>
    <p>
      lac&#34987;&#28155;&#21152;&#21518;&#21363;&#33258;&#21160;&#25320;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_941421070" MODIFIED="1431831636273" TEXT=" int defaultroute"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int redial"/>
<node CREATED="1431831636273" ID="ID_1588219516" MODIFIED="1431832561594">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int rmax
    </p>
    <p>
      &#20801;&#35768;&#23581;&#35797;&#30340;&#26368;&#22823;&#25320;&#21495;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431832434609" ID="ID_1000611279" MODIFIED="1431832551610">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int rtries
    </p>
    <p>
      &#36804;&#20170;&#20026;&#27490;&#23581;&#35797;&#36807;&#30340;&#25320;&#21495;&#27425;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431832457842" ID="ID_1581936573" MODIFIED="1431832458382" TEXT="int rtimeout"/>
<node CREATED="1431832469552" ID="ID_374853727" MODIFIED="1431832470241" TEXT="char pppoptfile[STRLEN]"/>
<node CREATED="1431831636273" ID="ID_1785186506" MODIFIED="1431831636273" TEXT=" int debug"/>
<node CREATED="1431831713022" ID="ID_400780021" LINK="#ID_79941325" MODIFIED="1431831725478" TEXT="struct tunnel *t"/>
<node CREATED="1431831682595" ID="ID_1002533980" LINK="#ID_1441095394" MODIFIED="1431831701682" TEXT="struct call *c"/>
</node>
<node CREATED="1431831636273" FOLDED="true" ID="ID_277803094" MODIFIED="1431841600508" TEXT=" struct lns *lns">
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct lns *next"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int exclusive"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int active"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int localaddr"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int tun_rws"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int call_rws"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int rxspeed"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int txspeed"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int hbit"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int lbit"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int challenge"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int authpeer"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int authself"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char authname[STRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char peername[STRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char hostname[STRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char entname[STRLEN]"/>
<node CREATED="1431831636273" ID="ID_1358349310" MODIFIED="1431841598096">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct iprange *lacs
    </p>
    <p>
      &#34987;&#20801;&#35768;&#36830;&#25509;&#21040;&#27492;lns&#30340;lac
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_737374994" MODIFIED="1431831636273" TEXT=" struct iprange *range"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int assign_ip"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int passwdauth"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int pap_require"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int chap_require"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int pap_refuse"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int chap_refuse"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int idle"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int pridns"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int secdns"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int priwins"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int secwins"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int proxyarp"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int proxyauth"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int debug"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char pppoptfile[STRLEN]"/>
<node CREATED="1431831636273" ID="ID_21151469" LINK="#ID_79941325" MODIFIED="1431831813681" TEXT=" struct tunnel *t"/>
</node>
<node CREATED="1431831636273" FOLDED="true" ID="ID_79941325" MODIFIED="1431969902367" TEXT=" struct tunnel *t">
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct call *call_head"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct tunnel *next"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int fc"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct schedule_entry *hello"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int ourfc"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int bc"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int hbit"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int ourbc"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" _u64 tb"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" _u64 ourtb"/>
<node CREATED="1431831636273" ID="ID_1527633322" MODIFIED="1431836200289">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int tid
    </p>
    <p>
      &#23545;&#31471;&#30340;tunnel id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" IPsecSAref_t refme"/>
<node CREATED="1431831636273" ID="ID_1598876233" MODIFIED="1431831636273" TEXT=" IPsecSAref_t refhim"/>
<node CREATED="1431831636273" ID="ID_1740743875" MODIFIED="1431836217813">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int ourtid
    </p>
    <p>
      &#26412;&#31471;&#30340;tunnel id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_24823137" MODIFIED="1431969897306">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int qtid
    </p>
    <p>
      &#38656;&#35201;&#36864;&#20986;&#30340;tunnel id&#65292;&#19968;&#33324;&#22312;tunnel&#19978;&#25910;&#21040;&#19968;&#20010;StopCCN&#28040;&#24687;&#26102;&#23558;assigned tunnel id&#36825;&#20010;avp&#20869;&#30340;&#20540;&#22635;&#21040;&#36825;&#37324;&#30340;qtid&#65292;
    </p>
    <p>
      &#28982;&#21518;control_finish()&#29366;&#24577;&#26426;&#20013;&#20250;&#23558;&#27492;qtid&#23545;&#24212;&#30340;tunnel-&gt;self&#26029;&#24320;&#36830;&#25509;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_1498769661" MODIFIED="1431831636273" TEXT=" int firmware"/>
<node CREATED="1431833258582" ID="ID_1415284794" MODIFIED="1431833301625">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct sockaddr_in peer
    </p>
    <p>
      &#25152;&#36830;&#25509;&#30340;&#23545;&#31471;&#30340;IP&#21644;port
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_1912044261" MODIFIED="1431831636273" TEXT=" int debug"/>
<node CREATED="1431831636273" ID="ID_1091120881" MODIFIED="1431831636273" TEXT=" int nego"/>
<node CREATED="1431831636273" ID="ID_637331380" MODIFIED="1431831636273" TEXT=" int count"/>
<node CREATED="1431831636273" FOLDED="true" ID="ID_1051823216" MODIFIED="1431838459557" TEXT=" int state">
<node CREATED="1431835808223" ID="ID_890515366" MODIFIED="1431835819177" TEXT="0: &#x521d;&#x59cb;&#x72b6;&#x6001;"/>
<node CREATED="1431835833519" ID="ID_1419532367" MODIFIED="1431835848051" TEXT="SCCRQ&#xff1a;&#x5df2;&#x7ecf;&#x9001;&#x51fa;SCCRQ&#x6d88;&#x606f;"/>
</node>
<node CREATED="1431831636273" ID="ID_186589594" MODIFIED="1431838527231">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;_u16 control_seq_num
    </p>
    <p>
      &#26412;&#31471;&#21457;&#36865;&#30340;&#19979;&#19968;&#20010;control packet&#30340;&#24207;&#21015;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_1713487683" MODIFIED="1431838556823">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;_u16 control_rec_seq_num
    </p>
    <p>
      &#26399;&#24453;&#25509;&#25910;&#30340;&#19979;&#19968;&#20010;control packet&#30340;&#24207;&#21015;&#21495;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int cLr"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char hostname[MAXSTRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char vendor[MAXSTRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct challenge chal_us"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct challenge chal_them"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char secret[MAXSTRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int sanity"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int rws"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int ourrws"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int rxspeed"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int txspeed"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int udp_fd"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int pppox_fd"/>
<node CREATED="1431831636273" ID="ID_392213353" LINK="#ID_1441095394" MODIFIED="1431833518035" TEXT=" struct call *self"/>
<node CREATED="1431831636273" ID="ID_398020175" LINK="#ID_277803094" MODIFIED="1431833498472" TEXT=" struct lns *lns"/>
<node CREATED="1431831636273" ID="ID_1258199159" LINK="#ID_1720721411" MODIFIED="1431833507918" TEXT=" struct lac *lac"/>
</node>
<node CREATED="1431831636273" FOLDED="true" ID="ID_1441095394" MODIFIED="1431969799890" TEXT=" struct call *c">
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int lbit"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int seq_reqd"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int tx_pkts"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int rx_pkts"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int tx_bytes"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int rx_bytes"/>
<node CREATED="1431831636273" FOLDED="true" ID="ID_354142841" MODIFIED="1431831650885" TEXT=" struct schedule_entry *zlb_xmit">
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct timeval tv"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" void (*func) (void *)"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" void *data"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct schedule_entry *next"/>
</node>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int prx"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int state"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int frame"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct call *next"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int debug"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int msgtype"/>
<node CREATED="1431831636273" ID="ID_1146789393" MODIFIED="1431836283500">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int ourcid
    </p>
    <p>
      &#26412;&#31471;&#30340;call id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_449366474" MODIFIED="1431836297320">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int cid
    </p>
    <p>
      &#23545;&#31471;&#30340;call id
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_477829428" MODIFIED="1431969531296">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int qcid
    </p>
    <p>
      &#38656;&#35201;&#36864;&#20986;&#30340;call id&#65292;&#19968;&#33324;&#22312;call&#19978;&#25910;&#21040;&#19968;&#20010;CDN&#28040;&#24687;&#26102;&#23558;assigned session id&#36825;&#20010;avp&#20869;&#30340;&#20540;&#22635;&#21040;&#36825;&#37324;&#30340;qcid&#65292;
    </p>
    <p>
      &#28982;&#21518;control_finish()&#29366;&#24577;&#26426;&#20013;&#20250;&#23558;&#27492;qcid&#23545;&#24212;&#30340;call&#26029;&#24320;&#36830;&#25509;&#12290;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" ID="ID_1812451898" MODIFIED="1431831636273" TEXT=" int bearer"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" unsigned int serno"/>
<node CREATED="1431831636273" ID="ID_1422510318" MODIFIED="1431831636273" TEXT=" unsigned int addr"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int txspeed"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int rxspeed"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int ppd"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int physchan"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char dialed[MAXSTRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char dialing[MAXSTRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char subaddy[MAXSTRLEN]"/>
<node CREATED="1431831636273" FOLDED="true" ID="ID_1399662943" MODIFIED="1431837359464" TEXT=" int needclose">
<node CREATED="1431837293916" ID="ID_663469834" MODIFIED="1431837348542">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;needclose&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;closing&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;state
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;=========&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=======&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;=====
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;0&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;0&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Running
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;1&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;0&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Send Closing notice
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;1&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;1&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Waiting for closing notice
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;0&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;1&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Closing ZLB received, actulaly close
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431831636273" ID="ID_1339976256" MODIFIED="1431831636273" TEXT=" int closing"/>
<node CREATED="1431831636273" ID="ID_1478693212" LINK="#ID_79941325" MODIFIED="1431831791353" TEXT=" struct tunnel *container"/>
<node CREATED="1431831636273" ID="ID_1099090193" MODIFIED="1431934238960">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int fd
    </p>
    <p>
      &#36890;&#36807;&#20869;&#26680;&#31354;&#38388;&#25910;&#21457;&#25968;&#25454;&#21253;&#26102;&#19981;&#20351;&#29992;&#27492;&#20540;&#65292;&#36890;&#36807;&#29992;&#25143;&#31354;&#38388;&#25910;&#21457;&#25968;&#25454;&#21253;&#26102;&#20351;&#29992;&#27492;&#20540;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct termios *oldptyconf"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int die"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int nego"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int pppd"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int result"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int error"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int fbit"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int ourfbit"/>
<node CREATED="1431831636273" ID="ID_1287536840" MODIFIED="1431836551873">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int cnu
    </p>
    <p>
      &#38656;&#35201;&#21457;&#36865;&#19968;&#20010;control packet&#20197;&#26356;&#26032;&#23545;&#31471;&#23545;&#25105;&#30340;&#24207;&#21015;&#21495;&#30340;&#35748;&#30693;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" int pnu"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char errormsg[MAXSTRLEN]"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" struct timeval lastsent"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" _u16 data_seq_num"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" _u16 data_rec_seq_num"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" _u16 closeSs"/>
<node CREATED="1431831636273" ID="ID_1488060589" MODIFIED="1431831636273" TEXT=" int pLr"/>
<node CREATED="1431831750613" ID="ID_888687670" LINK="#ID_277803094" MODIFIED="1431831837321" TEXT="struct lns *lns"/>
<node CREATED="1431831636273" ID="ID_1612242193" LINK="#ID_1720721411" MODIFIED="1431831851241" TEXT=" struct lac *lac"/>
<node CREATED="1431831636273" MODIFIED="1431831636273" TEXT=" char dial_no[128]"/>
</node>
</node>
<node CREATED="1431804451514" ID="ID_1594010434" MODIFIED="1431804643003" TEXT="&#x57fa;&#x672c;&#x6d41;&#x7a0b;">
<node CREATED="1431804548338" ID="ID_735898868" MODIFIED="1431805197267">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &quot;/var/run/xl2tpd/l2tp-control&quot;
    </p>
    <p>
      control_fd &#21487;&#35835;&#65292;&#34920;&#31034;&#25509;&#25910;&#21040;&#20102;xl2tpd-control&#30340;&#21629;&#20196;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1431805025039" ID="ID_784694085" MODIFIED="1431805151774">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      UDP 127.0.0.1:1701
    </p>
    <p>
      server_socket &#21487;&#35835;
    </p>
  </body>
</html></richcontent>
<node CREATED="1431989309516" FOLDED="true" ID="ID_723911707" MODIFIED="1431990657280" TEXT="client side">
<node CREATED="1431989632902" FOLDED="true" ID="ID_6167248" MODIFIED="1431989871070">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      SCCRP received
    </p>
    <p>
      send SCCCN
    </p>
  </body>
</html></richcontent>
<node CREATED="1431989642078" ID="ID_1322747175" MODIFIED="1431989650594">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_SCCRP.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431989809296" FOLDED="true" ID="ID_736125879" MODIFIED="1431990223880" TEXT="send ICRQ">
<node CREATED="1431989743203" ID="ID_488515881" MODIFIED="1431989750399">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_ICRQ.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431990295811" FOLDED="true" ID="ID_1209320476" MODIFIED="1431990341365">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ICRP received
    </p>
    <p>
      send ICCN
    </p>
  </body>
</html></richcontent>
<node CREATED="1431990324981" ID="ID_1557633159" MODIFIED="1431990330568">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_ICCN.PNG" />
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1431989305069" FOLDED="true" ID="ID_1269395315" MODIFIED="1432003663200" TEXT="server side">
<node CREATED="1431989322083" FOLDED="true" ID="ID_105716584" MODIFIED="1431989900382">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      SCCRQ received
    </p>
    <p>
      send SCCRP
    </p>
  </body>
</html></richcontent>
<node CREATED="1431989493937" ID="ID_825008371" MODIFIED="1431989502010">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_SCCRQ.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431990022553" FOLDED="true" ID="ID_1931036744" MODIFIED="1431990044078" TEXT="SCCCN received">
<node CREATED="1431990031217" ID="ID_1663197482" MODIFIED="1431990038164">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_SCCCN.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431990047772" FOLDED="true" ID="ID_658048878" MODIFIED="1431990220123">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ICRQ received
    </p>
    <p>
      send ICRP
    </p>
  </body>
</html></richcontent>
<node CREATED="1431990209036" ID="ID_773935936" MODIFIED="1431990218341">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_ICRP.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431990468628" FOLDED="true" ID="ID_95750689" MODIFIED="1431990484605" TEXT="ICCN received">
<node CREATED="1431990477596" ID="ID_971932163" MODIFIED="1431990483058">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_ICCN_received.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431990601008" FOLDED="true" ID="ID_1700945859" MODIFIED="1432003495140" TEXT="StopCCN received">
<node CREATED="1431990619374" ID="ID_1416611335" MODIFIED="1431990633907">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_StopCCN.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1431990638139" FOLDED="true" ID="ID_454469065" MODIFIED="1432003658637" TEXT="CDN received">
<node CREATED="1431990645458" ID="ID_1342373049" MODIFIED="1431990651303">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_CDN.PNG" />
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1431839227353" FOLDED="true" ID="ID_1747962278" MODIFIED="1431989912101" TEXT="&#x7cfb;&#x7edf;&#x521d;&#x59cb;&#x5316;">
<node CREATED="1431989261748" ID="ID_818636647" MODIFIED="1431989284554">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_flows_init.PNG" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1432002676671" FOLDED="true" ID="ID_1385696094" MODIFIED="1432003891120" TEXT="close call">
<node CREATED="1432003164211" ID="ID_881703213" MODIFIED="1432003168380" TEXT="server side">
<node CREATED="1432003199651" ID="ID_387028738" MODIFIED="1432003285166">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25910;&#21040;StopCCN&#26102;&#35774;&#32622;
    </p>
    <p>
      tunnel-&gt;self-&gt;needclose = 0
    </p>
    <p>
      tunnel-&gt;self-&gt;closing = -1
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1432003368746" ID="ID_877976998" MODIFIED="1432003396303" TEXT="&#x8fd9;&#x5c06;&#x5bfc;&#x81f4;tunnel&#x53ca;&#x5176;&#x4ee5;&#x4e0b;&#x7684;&#x6240;&#x6709;call&#x88ab;&#x9500;&#x6bc1;"/>
</node>
<node CREATED="1432003199651" ID="ID_778984063" MODIFIED="1432003535551">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25910;&#21040;CDN&#26102;&#35774;&#32622;
    </p>
    <p>
      call-&gt;needclose = 0
    </p>
    <p>
      call-&gt;closing = -1
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1432003368746" ID="ID_940885802" MODIFIED="1432003545168" TEXT="&#x8fd9;&#x5c06;&#x5bfc;&#x81f4;&#x5bf9;&#x5e94;&#x7684;call&#x88ab;&#x9500;&#x6bc1;"/>
</node>
</node>
<node CREATED="1432003169160" ID="ID_122417200" MODIFIED="1432003172379" TEXT="client side">
<node CREATED="1432003199651" ID="ID_765984779" MODIFIED="1432003873853">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25910;&#21040;&#23545;StopCCN&#25110;CDN&#30340;&#22238;&#24212;,&#21363;ZLB&#26102;&#35774;&#32622;
    </p>
    <p>
      call-&gt;needclose = 0&#65292;call-&gt;closing &#20445;&#25345;&#21407;&#20540; -1
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1432003368746" ID="ID_547390183" MODIFIED="1432003545168" TEXT="&#x8fd9;&#x5c06;&#x5bfc;&#x81f4;&#x5bf9;&#x5e94;&#x7684;call&#x88ab;&#x9500;&#x6bc1;"/>
</node>
</node>
<node CREATED="1432002688241" ID="ID_130817964" MODIFIED="1432002700454">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/l2tp_close_call.PNG" />
  </body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
</map>
