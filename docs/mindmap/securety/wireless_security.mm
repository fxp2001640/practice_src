<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1295592382192" ID="ID_502513602" MODIFIED="1295592405458" TEXT="&#x65e0;&#x7ebf;&#x5b89;&#x5168;">
<node CREATED="1295592399872" FOLDED="true" ID="ID_1375032851" MODIFIED="1295792453495" POSITION="right" TEXT="WEP">
<node CREATED="1295592433489" ID="ID_1326636099" MODIFIED="1295592449593" TEXT="&#x5bc6;&#x94a5;&#x4ea7;&#x751f;&#x65b9;&#x6cd5;"/>
<node CREATED="1295592451998" FOLDED="true" ID="ID_1097518594" MODIFIED="1295792451560" TEXT="&#x52a0;&#x5bc6;&#x65b9;&#x6cd5;">
<node CREATED="1295592709880" FOLDED="true" ID="ID_189329249" MODIFIED="1295597018373" TEXT="&#x52a0;&#x5bc6;">
<node CREATED="1295595477489" ID="ID_1388316560" MODIFIED="1295595494644">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="wep-ok.png" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1295592717759" FOLDED="true" ID="ID_834116054" MODIFIED="1295596735384" TEXT="&#x89e3;&#x5bc6;">
<node CREATED="1295596661477" ID="ID_1904776172" MODIFIED="1295596714579">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="wep-decrypt-ok.jpg" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1295596743151" FOLDED="true" ID="ID_1117888165" MODIFIED="1295597418431" TEXT="&#x6982;&#x5ff5;">
<node CREATED="1295596809235" ID="ID_1491542524" MODIFIED="1295597284973" TEXT="ICV&#xff1a;&#x5b8c;&#x6574;&#x6027;&#x6821;&#x9a8c;&#x503c;&#xff0c;&#x548c;&#x5305;&#x5185;&#x5bb9;&#x4e00;&#x8d77;&#x88ab;&#x52a0;&#x5bc6;"/>
<node CREATED="1295596819377" ID="ID_504030822" MODIFIED="1295597223684" TEXT="IV&#xff1a;&#x521d;&#x59cb;&#x5411;&#x91cf;&#xff0c;&#x7531;&#x53d1;&#x9001;&#x65b9;&#x968f;&#x673a;&#x4ea7;&#x751f;&#xff0c;&#x5e76;&#x548c;&#x5e27;&#x540c;&#x65f6;&#x4f20;&#x8f93;&#x7ed9;&#x63a5;&#x6536;&#x65b9;"/>
<node CREATED="1295596826855" ID="ID_140740495" MODIFIED="1295597413979" TEXT="RC4&#xff1a;&#x5bf9;&#x79f0;&#x6027;&#x6d41;&#x5bc6;&#x7801;&#x7b97;&#x6cd5;"/>
<node CREATED="1295596836558" ID="ID_99987952" MODIFIED="1295597312924" TEXT="Key Number&#xff1a;&#x5bc6;&#x94a5;&#x7d22;&#x5f15;&#xff0c;0-4"/>
</node>
<node CREATED="1295596776089" FOLDED="true" ID="ID_202872239" MODIFIED="1295792448624" TEXT="&#x7b97;&#x6cd5;(RC4)">
<node CREATED="1295597426389" ID="ID_636090703" MODIFIED="1295597431472" TEXT="&#x6982;&#x5ff5;"/>
<node CREATED="1295597466245" FOLDED="true" ID="ID_1950159544" MODIFIED="1295792444335" TEXT="KSA(&#x5bc6;&#x94a5;&#x8c03;&#x5ea6;&#x7b97;&#x6cd5;)">
<node CREATED="1295597618834" ID="ID_257293447" MODIFIED="1295597628328" TEXT="&#x76ee;&#x7684;"/>
<node CREATED="1295597632471" FOLDED="true" ID="ID_589391641" MODIFIED="1295792441407" TEXT="&#x7b97;&#x6cd5;">
<node CREATED="1295597646309" ID="ID_198106656" MODIFIED="1295598109223">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      void RSA(char *sbox, int sbox_size, char *key, int key_size)
    </p>
    <p>
      {
    </p>
    <p>
      &#160;&#160;&#160;&#160;int i, j = 0;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;for(i = 0; i &lt; sbox_size; i++)
    </p>
    <p>
      &#160;&#160;&#160;&#160;{
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sbox[i] = i;
    </p>
    <p>
      &#160;&#160;&#160;&#160;}
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;for(i = 0; i &lt; sbox_size; i++)
    </p>
    <p>
      &#160;&#160;&#160;&#160;{
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;j = (j + sbox[i] + key[i % key_size]) % sbox_size;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;swap(sbox[i], sbox[j]);
    </p>
    <p>
      &#160;&#160;&#160;&#160;}
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1295597533345" FOLDED="true" ID="ID_1793401350" MODIFIED="1295792446015" TEXT="PRGA(&#x4f2a;&#x968f;&#x673a;&#x5b50;&#x5bc6;&#x7801;&#x751f;&#x6210;&#x7b97;&#x6cd5;)">
<node CREATED="1295598138301" ID="ID_1027557913" MODIFIED="1295598146402" TEXT="&#x76ee;&#x7684;"/>
<node CREATED="1295598150115" FOLDED="true" ID="ID_1400683820" MODIFIED="1295792437980" TEXT="&#x7b97;&#x6cd5;">
<node CREATED="1295598155146" ID="ID_1352155463" MODIFIED="1295598566839">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      void PRGA(char *sbox, int sbox_size, char *data, int data_size)
    </p>
    <p>
      {
    </p>
    <p>
      &#160;&#160;&#160;&#160;int cnt, i, j;
    </p>
    <p>
      &#160;&#160;&#160;&#160;char sub_k;
    </p>
    <p>
      
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;for(cnt = 0; cnt &lt; data_size; cnt++)
    </p>
    <p>
      &#160;&#160;&#160;&#160;{
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;i = (i + 1) % sbox_size;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;j = (j + sbox[i]) % sbox_size;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;swap(sbox[i], sbox[j]);
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;sub_k = sbox[(sbox[i] + sbox[j])%sbox_size];
    </p>
    <p>
      &#160;&#160;&#160;&#160;}
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1295597588247" ID="ID_1164496952" MODIFIED="1295597601973" TEXT="&#x52a0;&#x5bc6;/&#x89e3;&#x5bc6;"/>
</node>
</node>
<node CREATED="1295592461268" ID="ID_849490907" MODIFIED="1295592471597" TEXT="&#x6821;&#x9a8c;&#x65b9;&#x6cd5;"/>
</node>
<node CREATED="1295592408782" ID="ID_1145270979" MODIFIED="1295850656080" POSITION="left" TEXT="WPA">
<node CREATED="1295592474706" FOLDED="true" ID="ID_158999150" MODIFIED="1295862586799" TEXT="&#x8ba4;&#x8bc1;&#x65b9;&#x6cd5;">
<node CREATED="1295592520906" ID="ID_763560549" MODIFIED="1295850661288" TEXT="WPA&#x4f01;&#x4e1a;&#x7248; 802.1X">
<node CREATED="1295792652438" ID="ID_1466255537" MODIFIED="1295856049086" TEXT="&#x67b6;&#x6784;&#x539f;&#x7406;">
<node CREATED="1295792789201" FOLDED="true" ID="ID_949329926" MODIFIED="1295856052323" TEXT="&#x53c2;&#x4e0e;&#x8005;">
<node CREATED="1295792810298" ID="ID_1488179971" MODIFIED="1295792812851" TEXT="&#x8bf7;&#x6c42;&#x65b9;"/>
<node CREATED="1295792828275" ID="ID_17434242" MODIFIED="1295792830489" TEXT="&#x8ba4;&#x8bc1;&#x65b9;"/>
<node CREATED="1295792853613" ID="ID_1263756869" MODIFIED="1295792856073" TEXT="&#x6388;&#x6743;&#x670d;&#x52a1;&#x5668;"/>
</node>
<node CREATED="1295793138915" FOLDED="true" ID="ID_267100500" MODIFIED="1295853618592" TEXT="&#x57fa;&#x4e8e;&#x7aef;&#x53e3;&#x7684;&#x7f51;&#x7edc;&#x8bbf;&#x95ee;&#x63a7;&#x5236;">
<node CREATED="1295793162485" ID="ID_187705771" MODIFIED="1295793257042" TEXT="&#x975e;&#x6388;&#x6743;&#x7aef;&#x53e3;&#xff1a;&#x59cb;&#x7ec8;&#x5904;&#x4e8e;&#x53cc;&#x5411;&#x8fde;&#x901a;&#x72b6;&#x6001;&#xff0c;&#x4ec5;&#x5141;&#x8bb8;&#x4f20;&#x9012;EAPoL&#x534f;&#x8bae;&#x5e27;"/>
<node CREATED="1295793177950" ID="ID_1909155552" MODIFIED="1295793331673" TEXT="&#x6388;&#x6743;&#x7aef;&#x53e3;&#xff1a;&#x4ec5;&#x5728;&#x8ba4;&#x8bc1;&#x901a;&#x8fc7;&#x7684;&#x72b6;&#x6001;&#x4e0b;&#x6253;&#x5f00;&#xff0c;&#x7528;&#x4e8e;&#x63d0;&#x4f9b;internet&#x670d;&#x52a1;"/>
<node CREATED="1295850922413" FOLDED="true" ID="ID_484856387" MODIFIED="1295853617152" TEXT="&#x6388;&#x6743;&#x7aef;&#x53e3;&#x72b6;&#x6001;&#x63a7;&#x5236;">
<node CREATED="1295851529008" ID="ID_769749112" MODIFIED="1295851851861" TEXT="SystemAuthControl&#xff1a;&#xa;&#x503c;&#x4e3a;enable&#x65f6;&#xff0c;AuthControlledPortStatus&#x6839;&#x636e;AuthControlledPortControl&#x8bbe;&#x5b9a;;&#xa;&#x503c;&#x4e3a;disable&#x65f6;&#xff0c;AuthControlledPortStatus&#x5f3a;&#x5236;&#x4e3a;unauthorized"/>
<node CREATED="1295851579463" ID="ID_145526359" MODIFIED="1295852075617">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      AuthControlledPortControl&#65306;
    </p>
    <p>
      &#20540;&#20026;ForceUnauthorized&#26102;&#65292;AuthControlledPortStatus &#24378;&#21046;&#20026;unauthorized
    </p>
    <p>
      &#20540;&#20026;ForceAuthorized&#26102;&#65292;AuthControlledPortStatus &#24378;&#21046;&#20026;Authorized
    </p>
    <p>
      &#20540;&#20026;Auto&#26102;&#65292;AuthControlledPortStatus&#26681;&#25454;&#35748;&#35777;&#29366;&#24577;&#30830;&#23450;
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1295851597894" ID="ID_1061189795" MODIFIED="1295852204445">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      AuthControlledPortStatus&#65306;
    </p>
    <p>
      &#20540;&#20026;Authorized&#26102;&#65292;&#31471;&#21475;&#20026;&#21463;&#25511;&#29366;&#24577;&#65292;&#20801;&#35768;&#35775;&#38382;internet&#26381;&#21153;
    </p>
    <p>
      &#20540;&#20026;unauthorized&#26102;&#65292;&#31471;&#21475;&#20026;&#38750;&#25480;&#26435;&#29366;&#24577;&#65292;&#19981;&#20801;&#35768;&#35775;&#38382;internet&#26381;&#21153;
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1295851604560" ID="ID_11757450" MODIFIED="1295852439948">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MAC enable/disable&#65306;
    </p>
    <p>
      &#20540;&#20026;enable&#26102;&#65292;AuthControlledPortStatus&#26681;&#25454;SystemAuthControl&#21644;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;AuthControlledPortControl&#30830;&#23450;
    </p>
    <p>
      &#20540;&#20026;disable&#26102;&#65292;AuthControlledPortStatus&#24378;&#21046;&#20026;unauthorized
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1295853140880" FOLDED="true" ID="ID_1124852746" MODIFIED="1295853614312" TEXT="&#x6388;&#x6743;&#x7aef;&#x53e3;&#x65b9;&#x5411;&#x63a7;&#x5236;">
<node CREATED="1295853196990" ID="ID_308128948" MODIFIED="1295853545470">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      AdminControlledDirections&#65306;
    </p>
    <p>
      &#20540;&#20026;both&#26102;&#65292;OperControlledDirections&#24378;&#21046;&#20026;both
    </p>
    <p>
      &#20540;&#20026;in&#26102;&#65292;&#24403;&#31471;&#21475;mac enable&#26102;OperControlledDirections&#35774;&#20026;in;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#24403;&#31471;&#21475;&#20026;bridge&#31471;&#21475;&#19988;&#36830;&#25509;&#20854;&#20182;bridge&#26102;OperControlledDirections&#35774;&#20026;both
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#24403;&#31471;&#21475;&#20026;bridge&#31471;&#21475;&#19988;&#38750;&#36830;&#25509;&#29992;&#25143;&#30340;&#36793;&#32536;&#31471;&#21475;&#26102;OperControlledDirections&#35774;&#20026;both
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1295853218117" ID="ID_987632251" MODIFIED="1295853222743" TEXT="OperControlledDirections&#xff1a;"/>
</node>
</node>
<node CREATED="1295794212470" ID="ID_563901175" MODIFIED="1295794334967" TEXT="&#x8bf7;&#x6c42;&#x65b9;&#x4e0e;&#x8ba4;&#x8bc1;&#x65b9;&#x4e4b;&#x95f4;&#x91c7;&#x7528;EAPOL&#x534f;&#x8bae;&#xff0c;&#xa;&#x8ba4;&#x8bc1;&#x65b9;&#x4e0e;&#x6388;&#x6743;&#x670d;&#x52a1;&#x5668;&#x4e4b;&#x95f4;&#x91c7;&#x7528;RADIUS&#x534f;&#x8bae;"/>
<node CREATED="1295794678097" ID="ID_1374895132" MODIFIED="1295794727290" TEXT="802.11&#x8ba4;&#x8bc1;&#x548c;&#x5173;&#x8054;&#x5b8c;&#x6210;&#x540e;&#x5f00;&#x59cb;802.1X&#x8ba4;&#x8bc1;"/>
</node>
<node CREATED="1295792588202" ID="ID_309633470" MODIFIED="1295792634218" TEXT="EAPOL">
<node CREATED="1295855518317" FOLDED="true" ID="ID_1481138101" MODIFIED="1295859326977" TEXT="&#x62a5;&#x6587;&#x683c;&#x5f0f;">
<node CREATED="1295855762284" ID="ID_1333629253" MODIFIED="1295855773225">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="eapol.jpg" />
  </body>
</html>
</richcontent>
</node>
<node CREATED="1295856059698" ID="ID_1403075743" MODIFIED="1295856330724">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      EAPOL-Start&#65306;
    </p>
    <p>
      &#30003;&#35831;&#26041;&#21487;&#20197;&#20027;&#21160;&#21457;&#20986;EAPOL-Start&#24103;&#65292;&#35831;&#27714;&#24320;&#22987;&#35748;&#35777;&#12290;
    </p>
    <p>
      &#35748;&#35777;&#26041;&#20250;&#21457;&#20986;&#19968;&#20010;EAP-Request/Identity&#24103;&#20316;&#20026;&#21709;&#24212;&#12290;
    </p>
    <p>
      EAPOL-Start&#24103;&#30340;body&#37096;&#20998;&#20026;&#31354;&#65292;&#21363;body length&#20026;0
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1295856535426" ID="ID_834180883" MODIFIED="1295856674376">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      EAPOL-Logoff&#65306;
    </p>
    <p>
      &#24403;&#30003;&#35831;&#26041;&#19981;&#20877;&#38656;&#35201;&#32593;&#32476;&#26102;&#65292;&#21487;&#21457;&#20986;EAPOL-Logoff&#24103;&#65292;
    </p>
    <p>
      &#35753;&#31471;&#21475;&#22238;&#21040;unauthorized&#29366;&#24577;
    </p>
    <p>
      EAPOL-Logoff&#24103;&#30340;body&#37096;&#20998;&#20026;&#31354;&#65292;&#21363;body length&#20026;0
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1295855537540" ID="ID_612059688" MODIFIED="1295855542552" TEXT="EAP"/>
</node>
<node CREATED="1295794205085" ID="ID_34850630" MODIFIED="1295794208565" TEXT="RADIUS"/>
</node>
<node CREATED="1295592554604" ID="ID_395234835" MODIFIED="1295592609988" TEXT="WPA&#x4e2a;&#x4eba;&#x7248; PSK(&#x9884;&#x5148;&#x5171;&#x4eab;&#x5bc6;&#x94a5;Pre-Shared Key)"/>
</node>
<node CREATED="1295592492103" FOLDED="true" ID="ID_1929504440" MODIFIED="1295862629429" TEXT="&#x52a0;&#x5bc6;&#x65b9;&#x6cd5;">
<node CREATED="1295592623103" ID="ID_1453113156" MODIFIED="1295592664580" TEXT="TKIP(Temporary Key Integrity Protocol)"/>
</node>
<node CREATED="1295592502557" FOLDED="true" ID="ID_229900428" MODIFIED="1295794753655" TEXT="&#x6821;&#x9a8c;&#x65b9;&#x6cd5;">
<node CREATED="1295592670103" ID="ID_324554035" MODIFIED="1295592688428" TEXT="MIC(&#x4fe1;&#x606f;&#x5b8c;&#x6574;&#x6027;&#x68c0;&#x67e5;)"/>
</node>
<node CREATED="1295862595342" ID="ID_1834544461" MODIFIED="1295862736876" TEXT="&#x5bc6;&#x94a5;&#x7ba1;&#x7406;">
<node CREATED="1295862799359" ID="ID_1999041597" MODIFIED="1295862810194" TEXT="&#x5bc6;&#x94a5;&#x7684;&#x5c42;&#x6b21;&#x7ed3;&#x6784;">
<node CREATED="1295862827158" ID="ID_1543874279" MODIFIED="1295862912043" TEXT="&#x6210;&#x5bf9;&#x5bc6;&#x94a5;(pairwise key)">
<node CREATED="1295863115188" FOLDED="true" ID="ID_1645409350" MODIFIED="1295864592417" TEXT="&#x7ed3;&#x6784;">
<node CREATED="1295863180002" ID="ID_1742429720" MODIFIED="1295863362513" TEXT="TKIP TK&#xff1a;&#x6570;&#x636e;&#x52a0;&#x5bc6;&#x5bc6;&#x94a5;&#xff0c;&#x7528;&#x4e8e;&#x52a0;&#x5bc6;&#x5355;&#x64ad;&#x5e27;&#x7684;128&#x4f4d;&#x5bc6;&#x94a5;"/>
<node CREATED="1295863273126" ID="ID_171257579" MODIFIED="1295863347690" TEXT="TKIP MIC Key&#xff1a;&#x6570;&#x636e;&#x5b8c;&#x6574;&#x6027;&#x5bc6;&#x94a5;&#xff0c;&#x7528;&#x4e8e;&#x4e3a;&#x5355;&#x64ad;&#x5e27;&#x8ba1;&#x7b97;MIC&#x7684;128&#x4f4d;&#x5bc6;&#x94a5;"/>
<node CREATED="1295863376291" ID="ID_575568481" MODIFIED="1295863479564" TEXT="EAPOL KEK&#xff1a;EAPOL-Key&#x52a0;&#x5bc6;&#x5bc6;&#x94a5;&#xff0c;&#x7528;&#x4e8e;&#x52a0;&#x5bc6;EAPOL-Key&#x5e27;&#x7684;128&#x4f4d;&#x5bc6;&#x94a5;"/>
<node CREATED="1295863497967" ID="ID_1023366324" MODIFIED="1295863532679" TEXT="EAPOL KCK&#xff1a;EAPOL-Key&#x5b8c;&#x6574;&#x6027;&#x5bc6;&#x94a5;&#xff0c;&#x7528;&#x4e8e;&#x4e3a;EAPOL-Key&#x5e27;&#x8ba1;&#x7b97;MIC&#x7684;128&#x4f4d;&#x5bc6;&#x94a5;"/>
</node>
<node CREATED="1295863131187" ID="ID_419998628" MODIFIED="1295864191096" TEXT="PTK(pairwise transient key)&#x751f;&#x6210;&#x65b9;&#x6cd5;">
<node CREATED="1295863638938" ID="ID_1956450326" MODIFIED="1295863713003" TEXT="&#x6210;&#x5bf9;&#x4e3b;&#x5bc6;&#x94a5;(PMK)&#xff1a;&#x5728;&#x8ba4;&#x8bc1;&#x8fc7;&#x7a0b;&#x4e2d;&#x786e;&#x5b9a;&#xff0c;&#x7531;&#x7533;&#x8bf7;&#x65b9;&#x548c;&#x8ba4;&#x8bc1;&#x65b9;&#x5171;&#x4eab;"/>
<node CREATED="1295863932591" ID="ID_1526694593" MODIFIED="1295863984458" TEXT="&#x8ba4;&#x8bc1;&#x65b9;&#x7684;Nonce&#xff1a;&#x7531;&#x8ba4;&#x8bc1;&#x65b9;&#x968f;&#x673a;&#x751f;&#x6210;"/>
<node CREATED="1295863989797" ID="ID_1752790099" MODIFIED="1295864000398" TEXT="&#x8ba4;&#x8bc1;&#x65b9;&#x7684;MAC"/>
<node CREATED="1295864004621" ID="ID_1788674921" MODIFIED="1295864037779" TEXT="&#x7533;&#x8bf7;&#x65b9;&#x7684;Nonce&#xff1a;&#x7531;&#x7533;&#x8bf7;&#x65b9;&#x968f;&#x673a;&#x751f;&#x6210;"/>
<node CREATED="1295864040196" ID="ID_1448264432" MODIFIED="1295864051052" TEXT="&#x7533;&#x8bf7;&#x65b9;&#x7684;MAC"/>
<node CREATED="1295864216758" ID="ID_1863599075" MODIFIED="1295864308094" TEXT="&#x5bc6;&#x94a5;&#x5c55;&#x5f00;(PRF Expansion)">
<node CREATED="1295864317690" ID="ID_1003319444" MODIFIED="1295864583556">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21033;&#29992;&#20266;&#38543;&#26426;&#20989;&#25968;&#23558;PMK&#65292;&#35748;&#35777;&#26041;&#30340;Nonce&#65292;&#35748;&#35777;&#26041;&#30340;MAC&#65292;&#30003;&#35831;&#26041;&#30340;MAC&#65292;
    </p>
    <p>
      &#30003;&#35831;&#26041;&#30340;MAC&#23637;&#24320;&#20026;512&#20301;&#30340;&#23494;&#38053;&#65292;&#20998;&#20026;4&#20010;128&#20301;&#30340;&#23494;&#38053;&#65292;&#20998;&#21035;&#20026;TKIP TK&#65292;
    </p>
    <p>
      TKIP MIC Key&#65292;EAPOL KEK&#65292;EAPOL KCK&#12290;
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1295862915139" ID="ID_636148472" MODIFIED="1295863081294" TEXT="&#x7ec4;&#x5bc6;&#x94a5;(group key)">
<node CREATED="1295863144323" ID="ID_1591157369" MODIFIED="1295863150340" TEXT="&#x7ed3;&#x6784;"/>
<node CREATED="1295863152715" ID="ID_839982529" MODIFIED="1295863160858" TEXT="&#x751f;&#x6210;&#x65b9;&#x6cd5;"/>
</node>
</node>
<node CREATED="1295862815942" ID="ID_773602317" MODIFIED="1295862824194" TEXT="&#x5bc6;&#x94a5;&#x66f4;&#x65b0;"/>
</node>
</node>
<node CREATED="1295592419452" ID="ID_1004308112" MODIFIED="1295592426180" POSITION="right" TEXT="WAPI"/>
<node CREATED="1295795399169" FOLDED="true" ID="ID_1294017912" MODIFIED="1295834837715" POSITION="left" TEXT="802.11&#x8eab;&#x4efd;&#x9a8c;&#x8bc1;">
<node CREATED="1295795417082" ID="ID_918728763" MODIFIED="1295795463358" TEXT="&#x5f00;&#x653e;&#x7cfb;&#x7edf;&#x8eab;&#x4efd;&#x9a8c;&#x8bc1;(open-system authentication)"/>
<node CREATED="1295795467694" ID="ID_1642538305" MODIFIED="1295795515215" TEXT="&#x5171;&#x4eab;&#x5bc6;&#x94a5;&#x8eab;&#x4efd;&#x9a8c;&#x8bc1;(shared-key authentication)"/>
</node>
<node CREATED="1295835838228" FOLDED="true" ID="ID_25188631" MODIFIED="1295850652695" POSITION="right" TEXT="&#x5f00;&#x6e90;&#x4ee3;&#x7801;&#x5b9e;&#x73b0;">
<node CREATED="1295835856099" FOLDED="true" ID="ID_466520291" MODIFIED="1295850651887" TEXT="hostapd">
<node CREATED="1295835919865" ID="ID_260800086" LINK="http://hostap.epitest.fi" MODIFIED="1295835962283" TEXT="web site"/>
<node CREATED="1295836308811" ID="ID_1247981788" MODIFIED="1295836317590" TEXT="&#x4ee3;&#x7801;&#x76ee;&#x5f55;"/>
<node CREATED="1295836323891" FOLDED="true" ID="ID_178768360" MODIFIED="1295850647807" TEXT="&#x7cfb;&#x7edf;&#x67b6;&#x6784;">
<node CREATED="1295836344434" ID="ID_889326561" MODIFIED="1295836563746">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="hostapd.jpg" />
  </body>
</html>
</richcontent>
</node>
</node>
</node>
</node>
</node>
</map>
