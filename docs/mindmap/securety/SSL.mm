<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1331716907885" ID="ID_1888089759" MODIFIED="1331717298287" TEXT="SSL">
<node CREATED="1331717619929" ID="ID_582790190" MODIFIED="1332235497240" POSITION="right" TEXT=" TLS v1.0&#xa;(SSL v3.0)">
<node CREATED="1331717957983" FOLDED="true" ID="ID_1089720564" MODIFIED="1332235467875" TEXT="&#x7b80;&#x4ecb;">
<node CREATED="1331717968203" ID="ID_355455160" MODIFIED="1331717993530" TEXT="RFC 2246 (TLS v1.0)"/>
<node CREATED="1331718057165" ID="ID_1383809760" MODIFIED="1331718156994" TEXT="SSL&#x4ecb;&#x4e8e;application&#x548c;transport&#x4e24;&#x5c42;&#x4e4b;&#x95f4;, &#x4e3a;application&#x5c42;&#x63d0;&#x4f9b;&#x5b89;&#x5168;&#x8fde;&#x63a5;"/>
<node CREATED="1331718167091" FOLDED="true" ID="ID_1268657857" MODIFIED="1332235466462" TEXT="SSL&#x5185;&#x90e8;&#x5206;&#x4e3a;2&#x5c42;: &#xa;TLS Handshake Protocol&#xa;TLS Record Protocol&#xa;&#x4e0a;&#x5c42;&#x7684;&#x6570;&#x636e;&#x5c01;&#x88c5;&#x5728;&#x4e0b;&#x5c42;&#x7684;&#x6570;&#x636e;&#x4e4b;&#x4e2d;&#xa;">
<node CREATED="1331718311512" ID="ID_278416319" MODIFIED="1331718996737" TEXT="TLS Handshake Protocol&#x7684;&#x4f5c;&#x7528;:&#xa;1, &#x5728;server&#x548c;client&#x4e4b;&#x95f4;&#x8fdb;&#x884c;&#x76f8;&#x4e92;&#x8ba4;&#x8bc1;&#xa;2, &#x534f;&#x5546;&#x52a0;&#x5bc6;&#x7b97;&#x6cd5;&#xa;3, &#x5b9a;&#x671f;&#x66f4;&#x65b0;&#x4ea4;&#x6362;&#x52a0;&#x5bc6;&#x5bc6;&#x94a5;"/>
<node CREATED="1331718325469" ID="ID_89278991" MODIFIED="1331718633053" TEXT="TLS Record Protocol &#x7684;&#x4f5c;&#x7528;:&#xa;1, &#x786e;&#x4fdd;&#x8fde;&#x63a5;&#x7684;&#x79c1;&#x5bc6;&#x6027;: &#x4f7f;&#x7528;&#x5bf9;&#x7b49;&#x52a0;&#x5bc6;&#x65b9;&#x6cd5;(DES, RC4)&#x5bf9;&#x6570;&#x636e;&#x52a0;&#x5bc6;&#xa;2, &#x786e;&#x4fdd;&#x8fde;&#x63a5;&#x7684;&#x5b8c;&#x6574;&#x6027;: &#x6bcf;&#x4e2a;&#x6d88;&#x606f;&#x90fd;&#x5305;&#x542b;&#x5b8c;&#x6574;&#x6027;&#x6821;&#x9a8c;&#x7801;(SHA, MD5)"/>
</node>
</node>
<node CREATED="1331719655761" FOLDED="true" ID="ID_814864425" MODIFIED="1332235470658" TEXT="HMAC : &#x5b8c;&#x6574;&#x6027;&#x6821;&#x9a8c;">
<node CREATED="1331719838782" ID="ID_1126530654" MODIFIED="1331720047827" TEXT="HMAC&#x4e2d;&#x5305;&#x542b;&#x4e86;&#x5bc6;&#x94a5;&#x4fe1;&#x606f;,&#x56e0;&#x6b64;&#x5728;&#x4e0d;&#x77e5;&#x9053;&#xa;MAC secret&#x7684;&#x60c5;&#x51b5;&#x4e0b;&#x65e0;&#x6cd5;&#x4f2a;&#x9020;&#x5b8c;&#x6574;&#x6027;&#x4fe1;&#x606f;&#xa;HMAC&#x53ef;&#x4ee5;&#x914d;&#x5408;&#x591a;&#x79cd;hash&#x7b97;&#x6cd5;&#x4f7f;&#x7528;,&#x5e38;&#x89c1;&#x7684;&#x662f;: &#xa;HMAC_MD5(secret, data)&#xa;HMAC_SHA-1(secret, data)"/>
</node>
<node CREATED="1331720259137" FOLDED="true" ID="ID_1242314781" MODIFIED="1332235478164" TEXT="PRF (pseudo-random function)&#xa;&#x4f2a;&#x968f;&#x673a;&#x529f;&#x80fd;, &#x7528;&#x4e8e;&#x5c06;&#x5bc6;&#x94a5;&#x6269;&#x5c55;&#x5230;&#x4e0e;&#x660e;&#x6587;&#x540c;&#x6837;&#x7684;&#x957f;&#x5ea6;">
<node CREATED="1331720465169" FOLDED="true" ID="ID_1820804929" MODIFIED="1332235477403" TEXT="PRF(secret, label, seed) = &#xa;P_MD5(S1, label + seed)  XOR  P_SHA-1(S2, label + seed)">
<node CREATED="1331720613662" FOLDED="true" ID="ID_570796002" MODIFIED="1331997280365" TEXT="P_MD5(secret, seed),    P_SHA-1(secret, seed)&#xa;&#x8fd9;2&#x4e2a;&#x51fd;&#x6570;&#x7684;&#x5b9a;&#x4e49;&#x76f8;&#x540c;,&#x7528;P_hash(secret, seed)&#x8868;&#x793a;&#x5176;&#x4e2d;&#x4efb;&#x610f;&#x4e00;&#x4e2a;">
<node CREATED="1331720852461" FOLDED="true" ID="ID_1786698918" MODIFIED="1331997280358" TEXT="P_hash(secret, seed) = &#xa;&#x9;HMAC_hash(secret, A(1) + seed) +&#xa;&#x9;HMAC_hash(secret, A(2) + seed) +&#xa;&#x9;HMAC_hash(secret, A(3) + seed) + ...&#xa;">
<node CREATED="1331720922169" ID="ID_861211942" MODIFIED="1331720946879" TEXT="A(0) = seed&#xa;A(i)  = HMAC_hash(secret, A(i-1))&#xa;"/>
</node>
</node>
<node CREATED="1331720777520" ID="ID_16084936" MODIFIED="1331721268676" TEXT="S1,  S2 : &#x5c06;secret&#x5206;&#x4e3a;2&#x534a;,S1&#x4e3a;&#x524d;&#x534a;&#x90e8;&#x5206;,S2&#x4e3a;&#x540e;&#x534a;&#x90e8;&#x5206;"/>
<node CREATED="1331720791376" ID="ID_791634010" MODIFIED="1331721352865" TEXT="label,  seed : label&#x4e3a;&#x4e00;&#x4e2a;&#x5b57;&#x7b26;&#x4e32;, seed&#x4e3a;&#x968f;&#x673a;&#x79cd;&#x5b50;"/>
</node>
</node>
<node CREATED="1331988668614" FOLDED="true" ID="ID_183378684" MODIFIED="1332235493556" TEXT="TLS Record Protocol">
<node CREATED="1331988712332" FOLDED="true" ID="ID_1380421517" MODIFIED="1332235491187" TEXT="&#x4e3b;&#x8981;&#x529f;&#x80fd;">
<node CREATED="1331988730313" ID="ID_907060070" MODIFIED="1331988936746" TEXT="&#x4f20;&#x8f93;&#x8fc7;&#x7a0b; : &#x5c06;&#x4e0a;&#x5c42;&#x6570;&#x636e;&#x5212;&#x5206;&#x4e3a;&#x5757;,&#x518d;&#x538b;&#x7f29;&#x6570;&#x636e;,&#x6dfb;&#x52a0;&#x5b8c;&#x6574;&#x6027;&#x6821;&#x9a8c;,&#x5bf9;&#x6570;&#x636e;&#x8fdb;&#x884c;&#x52a0;&#x5bc6;,&#x6700;&#x540e;&#x5c06;&#x6570;&#x636e;&#x4f20;&#x9012;&#x7ed9;&#x4e0b;&#x9762;&#x7684;&#x4f20;&#x8f93;&#x5c42;"/>
<node CREATED="1331988730313" ID="ID_981393942" MODIFIED="1331989073521" TEXT="&#x63a5;&#x6536;&#x8fc7;&#x7a0b; : &#x4ece;&#x4e0b;&#x9762;&#x7684;&#x4f20;&#x8f93;&#x5c42;&#x63a5;&#x6536;&#x6570;&#x636e;,&#x89e3;&#x5bc6;, &#x518d;&#x6821;&#x9a8c;&#x6570;&#x636e;&#x7684;&#x5b8c;&#x6574;&#x6027;,&#x89e3;&#x538b;&#x7f29;&#x6570;&#x636e;,&#x5c06;&#x5206;&#x5757;&#x7684;&#x6570;&#x636e;&#x7ec4;&#x5408;&#x8d77;&#x6765;&#x4ea4;&#x7ed9;&#x4e0a;&#x5c42;&#x5e94;&#x7528;"/>
<node CREATED="1331989160311" FOLDED="true" ID="ID_1231928249" MODIFIED="1332235490034" TEXT="&#x4e0a;&#x5c42;&#x534f;&#x8bae;">
<node CREATED="1331989179639" ID="ID_1966189016" MODIFIED="1331989184532" TEXT="TLS handshake protocol"/>
<node CREATED="1331989195717" ID="ID_1843327429" MODIFIED="1331989200425" TEXT="TLS alert protocol"/>
<node CREATED="1331989209755" ID="ID_307845560" MODIFIED="1331989226742" TEXT="TLS change cipher spec protocol"/>
<node CREATED="1331989238683" ID="ID_114312267" MODIFIED="1331989243868" TEXT="TLS application data protocol"/>
</node>
</node>
<node CREATED="1331989563184" FOLDED="true" ID="ID_1996596793" MODIFIED="1332232990311" TEXT="connection state : &#x5305;&#x542b;4&#x79cd;&#x5e76;&#x5b58;&#x7684;&#x72b6;&#x6001;,&#xa;&#x5176;&#x4e2d;pending write/read states&#x7531;TLS Handshake Protocol&#x8bbe;&#x7f6e;,&#xa;TLS change cipher spec protocol&#x53ef;&#x4ee5;&#x5207;&#x6362;current/pending read states&#xa;&#x548c;current/pending write states,&#x5207;&#x6362;&#x4e4b;&#x540e;,&#x539f;&#x6765;pending&#x7684;&#x72b6;&#x6001;&#x53d8;&#x4e3a;&#xa;current&#x72b6;&#x6001;,&#x800c;pending&#x72b6;&#x6001;&#x5219;&#x53d8;&#x4e3a;&#x7a7a;&#x72b6;&#x6001;.&#xa;&#x6ce8;&#x610f; : client&#x7684;read states&#x5373;&#x662f;server&#x7684;write states,&#x53cd;&#x4e4b;&#x4ea6;&#x7136;">
<node CREATED="1331989590954" FOLDED="true" ID="ID_1963802987" MODIFIED="1332232984318" TEXT="current write states">
<node CREATED="1331989590954" FOLDED="true" ID="ID_1888661544" MODIFIED="1332232982589" TEXT="struct SecurityParameters">
<node CREATED="1331989752613" FOLDED="true" ID="ID_550555794" MODIFIED="1331997272989" TEXT="ConnectionEnd entity : &#x5b9e;&#x4f53;&#x626e;&#x6f14;&#x7684;&#x89d2;&#x8272;">
<node CREATED="1331989766681" ID="ID_1357955525" MODIFIED="1331989767920" TEXT="client"/>
<node CREATED="1331989774400" ID="ID_1099243435" MODIFIED="1331989775801" TEXT="server"/>
</node>
<node CREATED="1331989910579" FOLDED="true" ID="ID_1560151353" MODIFIED="1331997272989" TEXT="BulkCipherAlgorithm bulk_cipher_algorithm : &#xa;&#x52a0;&#x5bc6;&#x7b97;&#x6cd5;,&#x5b83;&#x786e;&#x5b9a;&#x4e86;&#x5982;&#x4e0b;&#x5c5e;&#x6027; :&#xa;&#x5bc6;&#x94a5;&#x957f;&#x5ea6;, &#x662f;&#x5757;&#x52a0;&#x5bc6;&#x8fd8;&#x662f;&#x6d41;&#x52a0;&#x5bc6;, &#x52a0;&#x5bc6;&#x5757;&#x7684;&#x5927;&#x5c0f;,&#xa;&#x662f;&#x4e0d;&#x662f;export cipher">
<node CREATED="1331989946771" ID="ID_400736662" MODIFIED="1331990559689" TEXT="null"/>
<node CREATED="1331989985907" ID="ID_1763942963" MODIFIED="1331990573675" TEXT="rc4"/>
<node CREATED="1331990039283" ID="ID_1570992043" MODIFIED="1331990591311" TEXT="rc2"/>
<node CREATED="1331990062340" ID="ID_1429050791" MODIFIED="1331990604506" TEXT="des"/>
<node CREATED="1331990611263" ID="ID_1440817561" MODIFIED="1331990612489" TEXT="3des"/>
<node CREATED="1331990620365" ID="ID_949428131" MODIFIED="1331990621524" TEXT="des40"/>
</node>
<node CREATED="1331990910901" FOLDED="true" ID="ID_830594470" MODIFIED="1331997272989" TEXT="CipherType cipher_type">
<node CREATED="1331990926489" ID="ID_1346388777" MODIFIED="1331990927717" TEXT="stream"/>
<node CREATED="1331990928296" ID="ID_571022676" MODIFIED="1331990933260" TEXT="block"/>
</node>
<node CREATED="1331990958659" ID="ID_134299920" MODIFIED="1331990969075" TEXT="uint8 key_size"/>
<node CREATED="1331990983589" ID="ID_1411660535" MODIFIED="1331990995512" TEXT="uint8 key_material_length"/>
<node CREATED="1331991008219" FOLDED="true" ID="ID_1743649374" MODIFIED="1331991040859" TEXT="IsExportable is_exportable">
<node CREATED="1331991030705" ID="ID_1047028770" MODIFIED="1331991035048" TEXT="true"/>
<node CREATED="1331991035563" ID="ID_1328759947" MODIFIED="1331991038624" TEXT="false"/>
</node>
<node CREATED="1331990137931" FOLDED="true" ID="ID_1302037053" MODIFIED="1331997272989" TEXT="MACAlgorithm mac_algorithm : &#xa;&#x5b8c;&#x6574;&#x6027;&#x6821;&#x9a8c;&#x7b97;&#x6cd5;, &#x5b83;&#x786e;&#x5b9a;&#x4e86;hash&#x7684;&#x5927;&#x5c0f;">
<node CREATED="1331990645439" ID="ID_576740501" MODIFIED="1331990647346" TEXT="null"/>
<node CREATED="1331990655006" ID="ID_1862737932" MODIFIED="1331990656520" TEXT="md5"/>
<node CREATED="1331990663625" ID="ID_754527812" MODIFIED="1331990665272" TEXT="sha"/>
</node>
<node CREATED="1331991086487" ID="ID_650146579" MODIFIED="1331991093185" TEXT="uint8 hash_size"/>
<node CREATED="1331990228089" ID="ID_1770965831" MODIFIED="1331991116724" TEXT="CompressionMethod compression_algorithm  : &#x538b;&#x7f29;&#x7b97;&#x6cd5;"/>
<node CREATED="1331990268376" FOLDED="true" ID="ID_1818933019" MODIFIED="1332232976832" TEXT="opaque master_secret[48] : 2&#x7aef;&#x5171;&#x4eab;&#x7684;48&#x5b57;&#x8282;secret">
<node CREATED="1332232692241" ID="ID_262602192" MODIFIED="1332232974687" TEXT="PRF(pre_master_secret, &quot;master secret&quot;, ClientHello.random + ServerHello.random)[0..47] &#xa;pre_master_secret&#x662f;&#x5728;clientKeyExchange&#x6d88;&#x606f;&#x4e2d;&#x4ea4;&#x6362;&#x7684;"/>
</node>
<node CREATED="1331990326302" ID="ID_1772295051" MODIFIED="1331991172421" TEXT="opaque client_random[32] : client&#x63d0;&#x4f9b;&#x7684;32&#x5b57;&#x8282;&#x503c;"/>
<node CREATED="1331990326302" ID="ID_1291673818" MODIFIED="1331991199010" TEXT="opaque server_random[32] : server&#x63d0;&#x4f9b;&#x7684;32&#x5b57;&#x8282;&#x503c;"/>
</node>
</node>
<node CREATED="1331989590954" FOLDED="true" ID="ID_670372091" MODIFIED="1331997272989" TEXT="current read states">
<node CREATED="1331991621918" ID="ID_213802858" LINK="#ID_1888661544" MODIFIED="1331991651446" TEXT="struct SecurityParameters"/>
</node>
<node CREATED="1331989590954" FOLDED="true" ID="ID_967663206" MODIFIED="1331997272990" TEXT="pending write states">
<node CREATED="1331991621918" ID="ID_714291775" LINK="#ID_1888661544" MODIFIED="1331991651446" TEXT="struct SecurityParameters"/>
</node>
<node CREATED="1331989590954" FOLDED="true" ID="ID_203081147" MODIFIED="1331997272990" TEXT="pending read states">
<node CREATED="1331991621918" ID="ID_1728226088" LINK="#ID_1888661544" MODIFIED="1331991651446" TEXT="struct SecurityParameters"/>
</node>
</node>
<node CREATED="1331989586385" ID="ID_800552365" MODIFIED="1332232622206" TEXT="&#x7531;SecurityParameters&#x751f;&#x6210;&#x7684;&#x53c2;&#x6570;">
<node CREATED="1331992913237" ID="ID_1488253492" MODIFIED="1331992915336" TEXT="client write MAC secret"/>
<node CREATED="1331992925273" ID="ID_73505558" MODIFIED="1331992926149" TEXT="server write MAC secret"/>
<node CREATED="1331992934841" ID="ID_1385782204" MODIFIED="1331992936395" TEXT="client write key"/>
<node CREATED="1331992945724" ID="ID_1941796956" MODIFIED="1331992946738" TEXT="server write key"/>
<node CREATED="1331992958643" ID="ID_1026085421" MODIFIED="1331992960461" TEXT="client write IV (for block ciphers only)"/>
<node CREATED="1331992969517" ID="ID_611902833" MODIFIED="1331992971260" TEXT="server write IV (for block ciphers only)"/>
<node CREATED="1331996061774" FOLDED="true" ID="ID_90789665" MODIFIED="1331997378754" TEXT="none exportable&#x7684;&#x5757;&#x52a0;&#x5bc6;&#x7b97;&#x6cd5;&#x5982;&#x4f55;&#x751f;&#x6210;&#x4e0a;&#x8ff0;&#x53c2;&#x6570;">
<node CREATED="1331996076774" ID="ID_197536166" MODIFIED="1331996159083" TEXT="&#x9996;&#x5148;&#x751f;&#x6210;&#x4e0a;&#x8ff0;6&#x4e2a;&#x53c2;&#x6570;&#x957f;&#x5ea6;&#x603b;&#x548c;&#x7684;&#x4e00;&#x4e2a;key_block, &#x5373;&#x4f7f;&#x7528;&#x4e0b;&#x9762;&#x7684;&#x7b97;&#x6cd5;:&#xa;key_block = PRF(SecurityParameters.master_secret,&#xa;                          &quot;key expansion&quot;,&#xa;                          SecurityParameters.server_random +&#xa;                          SecurityParameters.client_random);&#xa;"/>
<node CREATED="1331996174893" ID="ID_1357173969" MODIFIED="1331996237265" TEXT="&#x7136;&#x540e;&#x6309;&#x7167;&#x4e0a;&#x8ff0;&#x5404;&#x53c2;&#x6570;&#x7684;&#x957f;&#x5ea6;&#x5206;&#x5272;&#x6240;&#x751f;&#x6210;&#x7684;key_block&#x4ee5;&#x7ec4;&#x6210;&#x5404;&#x4e2a;&#x53c2;&#x6570;:&#xa;       client_write_MAC_secret[SecurityParameters.hash_size]&#xa;       server_write_MAC_secret[SecurityParameters.hash_size]&#xa;       client_write_key[SecurityParameters.key_material_length]&#xa;       server_write_key[SecurityParameters.key_material_length]&#xa;       client_write_IV[SecurityParameters.IV_size]&#xa;       server_write_IV[SecurityParameters.IV_size]&#xa;"/>
</node>
<node CREATED="1331996061774" FOLDED="true" ID="ID_1086963093" MODIFIED="1331997385450" TEXT="exportable&#x7684;&#x5757;&#x52a0;&#x5bc6;&#x7b97;&#x6cd5;&#x5982;&#x4f55;&#x751f;&#x6210;&#x4e0a;&#x8ff0;&#x53c2;&#x6570;">
<node CREATED="1331996076774" ID="ID_7108529" MODIFIED="1331996159083" TEXT="&#x9996;&#x5148;&#x751f;&#x6210;&#x4e0a;&#x8ff0;6&#x4e2a;&#x53c2;&#x6570;&#x957f;&#x5ea6;&#x603b;&#x548c;&#x7684;&#x4e00;&#x4e2a;key_block, &#x5373;&#x4f7f;&#x7528;&#x4e0b;&#x9762;&#x7684;&#x7b97;&#x6cd5;:&#xa;key_block = PRF(SecurityParameters.master_secret,&#xa;                          &quot;key expansion&quot;,&#xa;                          SecurityParameters.server_random +&#xa;                          SecurityParameters.client_random);&#xa;"/>
<node CREATED="1331996174893" ID="ID_1968042465" MODIFIED="1331996644138" TEXT="&#x7136;&#x540e;&#x6309;&#x7167;&#x4e0a;&#x8ff0;&#x5404;&#x53c2;&#x6570;&#x7684;&#x957f;&#x5ea6;&#x5206;&#x5272;&#x6240;&#x751f;&#x6210;&#x7684;key_block&#x4ee5;&#x7ec4;&#x6210;&#x5404;&#x4e2a;&#x53c2;&#x6570;:&#xa;       client_write_MAC_secret[SecurityParameters.hash_size]&#xa;       server_write_MAC_secret[SecurityParameters.hash_size]&#xa;       client_write_key[SecurityParameters.key_material_length]&#xa;       server_write_key[SecurityParameters.key_material_length]"/>
<node CREATED="1331996722492" FOLDED="true" ID="ID_1187697530" MODIFIED="1331997061358" TEXT="&#x6700;&#x7ec8;&#x7684;client_write_key&#x8fd8;&#x8981;&#x5728;&#x4e0a;&#x9762;&#x5df2;&#x7ecf;&#x751f;&#x6210;&#x7684;&#xa;client_write_key&#x57fa;&#x7840;&#x4e0a;&#x518d;&#x8fdb;&#x884c;&#x4e00;&#x4e2a;PRF&#x8fc7;&#x7a0b;&#xa;final_client_write_key =">
<node CREATED="1331996675924" ID="ID_464475740" MODIFIED="1331996718372" TEXT="PRF(SecurityParameters.client_write_key,&#xa;       &quot;client write key&quot;,&#xa;        SecurityParameters.client_random +&#xa;        SecurityParameters.server_random);&#xa;"/>
</node>
<node CREATED="1331996783019" FOLDED="true" ID="ID_1859367677" MODIFIED="1331997088545" TEXT="&#x6700;&#x7ec8;&#x7684;server_write_key&#x8fd8;&#x8981;&#x5728;&#x4e0a;&#x9762;&#x5df2;&#x7ecf;&#x751f;&#x6210;&#x7684;&#xa;server_write_key&#x57fa;&#x7840;&#x4e0a;&#x518d;&#x8fdb;&#x884c;&#x4e00;&#x4e2a;PRF&#x8fc7;&#x7a0b;&#xa;final_server_write_key =">
<node CREATED="1331996751391" ID="ID_1060637473" MODIFIED="1331996779682" TEXT="PRF(SecurityParameters.server_write_key,&#xa;       &quot;server write key&quot;,&#xa;       SecurityParameters.client_random +&#xa;       SecurityParameters.server_random);&#xa;"/>
</node>
<node CREATED="1331996837599" ID="ID_1715849115" MODIFIED="1331997204936" TEXT="&#x9996;&#x5148;&#x751f;&#x6210;2&#x4e2a;IV&#x53c2;&#x6570;&#x957f;&#x5ea6;&#x603b;&#x548c;&#x7684;&#x4e00;&#x4e2a;iv_block, &#x5373;&#x4f7f;&#x7528;&#x4e0b;&#x9762;&#x7684;&#x7b97;&#x6cd5;:&#xa;iv_block = PRF(&quot;&quot;, &quot;IV block&quot;, SecurityParameters.client_random &#xa;                                            +SecurityParameters.server_random);&#xa;&#x7136;&#x540e;&#x6309;&#x7167;2&#x4e2a;IV&#x53c2;&#x6570;&#x957f;&#x5ea6;&#x5206;&#x5272;&#x6240;&#x751f;&#x6210;&#x7684;iv_block&#x4ee5;&#x7ec4;&#x6210;&#x5404;&#x4e2a;&#x53c2;&#x6570;:&#xa;client_write_IV = client_write_IV[SecurityParameters.IV_size]&#xa;server_write_IV = server_write_IV[SecurityParameters.IV_size]"/>
</node>
</node>
<node CREATED="1331993344268" ID="ID_1600899100" MODIFIED="1331993409554" TEXT="sequence number : &#x6bcf;&#x4f20;&#x9001;&#x4e00;&#x4e2a;record&#x5e8f;&#x53f7;&#x52a0;1"/>
<node CREATED="1331993662839" FOLDED="true" ID="ID_16393618" MODIFIED="1332141597840" TEXT="&#x5bf9;&#x4e0a;&#x5c42;&#x6570;&#x636e;&#x7684;&#x5c01;&#x88c5;&#x8fc7;&#x7a0b;:&#xa;1, &#x9996;&#x5148;&#x5bf9;&#x4e0a;&#x5c42;&#x6570;&#x636e;&#x5206;&#x7247;,&#x6bcf;&#x7247;&#x4e0d;&#x8d85;&#x8fc7;2^14&#x5927;&#x5c0f;,&#x6b64;&#x65f6;&#x6570;&#x636e;&#x4e3a;&#x660e;&#x6587;.&#xa;2, &#x7136;&#x540e;&#x5bf9;struct TLSPlaintext.fragment&#x91c7;&#x7528;CompressionMethod&#x7b97;&#x6cd5;&#xa;    &#x8fdb;&#x884c;&#x538b;&#x7f29;,&#x6ce8;&#x610f;&#x538b;&#x7f29;&#x540e;&#x7684;&#x5185;&#x5bb9;&#x6bd4;&#x539f;&#x5185;&#x5bb9;&#x4e0d;&#x80fd;&#x957f;&#x8fc7;1024&#x5b57;&#x8282;&#xa;3, &#x5bf9;&#x538b;&#x7f29;&#x540e;&#x7684;&#x6570;&#x636e;&#x8fdb;&#x884c;MAC&#x5b8c;&#x6574;&#x6027;&#x6821;&#x9a8c;&#xa;4, &#x5bf9;&#x538b;&#x7f29;&#x540e;&#x7684;&#x6570;&#x636e;&#x53ca;&#x5176;MAC&#x5b8c;&#x6574;&#x6027;&#x6821;&#x9a8c;&#x7801;&#x8fdb;&#x884c;&#x52a0;&#x5bc6;">
<node CREATED="1331993800833" FOLDED="true" ID="ID_1901223704" MODIFIED="1332141596679" TEXT="struct TLSPlaintext">
<node CREATED="1331993821010" FOLDED="true" ID="ID_1637597152" MODIFIED="1332141595394" TEXT="ContentType type">
<node CREATED="1331993878843" ID="ID_1392316260" MODIFIED="1331993880830" TEXT="change_cipher_spec(20)"/>
<node CREATED="1331993889075" ID="ID_910248121" MODIFIED="1331993890667" TEXT="alert(21)"/>
<node CREATED="1331993902242" ID="ID_939545084" MODIFIED="1331993903499" TEXT="handshake(22)"/>
<node CREATED="1331993913572" ID="ID_668355589" MODIFIED="1331993915535" TEXT="application_data(23)"/>
</node>
<node CREATED="1331993834780" ID="ID_1742015499" MODIFIED="1331993836632" TEXT="ProtocolVersion version"/>
<node CREATED="1331993845832" ID="ID_1890552478" MODIFIED="1331994005463" TEXT="uint16 length : &#x6bcf;&#x5757;&#x957f;&#x5ea6;&#x4e0d;&#x8d85;&#x8fc7;2^14,&#x8d85;&#x8fc7;&#x5219;&#x5206;&#x4e3a;&#x591a;&#x7247;"/>
<node CREATED="1331993856906" ID="ID_604619585" MODIFIED="1331993858519" TEXT="opaque fragment[TLSPlaintext.length]"/>
</node>
<node CREATED="1331993800833" FOLDED="true" ID="ID_397602586" MODIFIED="1331997336488" TEXT="struct TLSCompressed">
<node CREATED="1331993821010" FOLDED="true" ID="ID_991709687" MODIFIED="1331993919995" TEXT="ContentType type">
<node CREATED="1331993878843" ID="ID_834650228" MODIFIED="1331993880830" TEXT="change_cipher_spec(20)"/>
<node CREATED="1331993889075" ID="ID_1367526463" MODIFIED="1331993890667" TEXT="alert(21)"/>
<node CREATED="1331993902242" ID="ID_909694991" MODIFIED="1331993903499" TEXT="handshake(22)"/>
<node CREATED="1331993913572" ID="ID_1750483382" MODIFIED="1331993915535" TEXT="application_data(23)"/>
</node>
<node CREATED="1331993834780" ID="ID_1215062524" MODIFIED="1331993836632" TEXT="ProtocolVersion version"/>
<node CREATED="1331993845832" ID="ID_93498797" MODIFIED="1331994005463" TEXT="uint16 length : &#x6bcf;&#x5757;&#x957f;&#x5ea6;&#x4e0d;&#x8d85;&#x8fc7;2^14,&#x8d85;&#x8fc7;&#x5219;&#x5206;&#x4e3a;&#x591a;&#x7247;"/>
<node CREATED="1331993856906" ID="ID_1590069273" MODIFIED="1331994395532" TEXT="opaque fragment[TLSCompressed.length]"/>
</node>
<node CREATED="1331993800833" FOLDED="true" ID="ID_1464721860" MODIFIED="1331997367416" TEXT="struct TLSCiphertext">
<node CREATED="1331993821010" FOLDED="true" ID="ID_653286526" MODIFIED="1331993919995" TEXT="ContentType type">
<node CREATED="1331993878843" ID="ID_1794273099" MODIFIED="1331993880830" TEXT="change_cipher_spec(20)"/>
<node CREATED="1331993889075" ID="ID_1486040327" MODIFIED="1331993890667" TEXT="alert(21)"/>
<node CREATED="1331993902242" ID="ID_122958589" MODIFIED="1331993903499" TEXT="handshake(22)"/>
<node CREATED="1331993913572" ID="ID_1096445589" MODIFIED="1331993915535" TEXT="application_data(23)"/>
</node>
<node CREATED="1331993834780" ID="ID_148624858" MODIFIED="1331993836632" TEXT="ProtocolVersion version"/>
<node CREATED="1331993845832" ID="ID_1320821100" MODIFIED="1331994005463" TEXT="uint16 length : &#x6bcf;&#x5757;&#x957f;&#x5ea6;&#x4e0d;&#x8d85;&#x8fc7;2^14,&#x8d85;&#x8fc7;&#x5219;&#x5206;&#x4e3a;&#x591a;&#x7247;"/>
<node CREATED="1331993856906" FOLDED="true" ID="ID_1257135924" MODIFIED="1331997362880" TEXT="opaque fragment[TLSCiphertext.length]&#xa;&#x8fd9;&#x91cc;&#x7684;&#x6570;&#x636e;&#x662f;&#x91c7;&#x7528;&#x5757;&#x52a0;&#x5bc6;&#x6216;&#x6d41;&#x52a0;&#x5bc6;&#x8fc7;&#x7684;&#x5bc6;&#x6587;,&#x800c;&#xa;&#x6839;&#x636e;CipherSpec.cipher_type&#x52a0;&#x5bc6;&#x524d;&#x7684;&#x5185;&#x5bb9;&#xa;&#x53ef;&#x80fd;&#x4e3a;GenericStreamCipher&#x6216;GenericBlockCipher&#xa;&#x5f53;&#x524d;record&#x7684;&#x521d;&#x59cb;&#x5316;&#x5411;&#x91cf;IV&#x53d6;&#x81ea;&#x524d;&#x4e00;&#x4e2a;record&#x7684;&#x5185;&#x5bb9;">
<node CREATED="1331995017522" FOLDED="true" ID="ID_761328500" MODIFIED="1331997358065" TEXT="struct GenericStreamCipher">
<node CREATED="1331995037546" ID="ID_1970971325" MODIFIED="1331995040236" TEXT="opaque content[TLSCompressed.length]"/>
<node CREATED="1331995050678" FOLDED="true" ID="ID_926236044" MODIFIED="1331997357162" TEXT="opaque MAC[CipherSpec.hash_size]">
<node CREATED="1331995165371" ID="ID_1125673182" MODIFIED="1331995314480" TEXT="MAC = &#xa;HMAC_hash(MAC_write_secret, seq_num + TLSCompressed.type +&#xa;                     TLSCompressed.version + TLSCompressed.length +&#xa;                     TLSCompressed.fragment))&#xa;&#x5177;&#x4f53;&#x7684;hash&#x7b97;&#x6cd5;&#x7531;SecurityParameters.mac_algorithm&#x786e;&#x5b9a;, +&#x8868;&#x793a;&#x8fde;&#x63a5;"/>
</node>
</node>
<node CREATED="1331995070637" FOLDED="true" ID="ID_274382947" MODIFIED="1331997361895" TEXT="struct GenericBlockCipher">
<node CREATED="1331995087332" ID="ID_535471816" MODIFIED="1331995088216" TEXT="opaque content[TLSCompressed.length]"/>
<node CREATED="1331995098295" ID="ID_1747733915" MODIFIED="1331995099912" TEXT="opaque MAC[CipherSpec.hash_size]"/>
<node CREATED="1331995111108" ID="ID_607209173" MODIFIED="1331995112880" TEXT="uint8 padding[GenericBlockCipher.padding_length]"/>
<node CREATED="1331995123014" ID="ID_794908179" MODIFIED="1331995461554" TEXT="uint8 padding_length : &#x5c06;&#x6570;&#x636e;&#x586b;&#x5145;&#x5230;&#x5757;&#x957f;&#x7684;&#x6574;&#x6570;&#x500d;"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1332141603092" FOLDED="true" ID="ID_1991507623" MODIFIED="1332142105558" TEXT="TLS Change cipher spec protocol">
<node CREATED="1332141637927" FOLDED="true" ID="ID_52533588" MODIFIED="1332141669117" TEXT="struct ChangeCipherSpec">
<node CREATED="1332141643711" FOLDED="true" ID="ID_1341167354" MODIFIED="1332141668047" TEXT="type">
<node CREATED="1332141660161" ID="ID_1903945580" MODIFIED="1332141664437" TEXT="change_cipher_spec = 1"/>
</node>
</node>
<node CREATED="1332141692671" FOLDED="true" ID="ID_730374316" MODIFIED="1332142103592" TEXT="&#x4e3b;&#x8981;&#x529f;&#x80fd;">
<node CREATED="1332141754959" ID="ID_792343727" MODIFIED="1332141857618" TEXT="client&#x548c;server&#x4e92;&#x53d1;&#x6b64;&#x6d88;&#x606f;&#x901a;&#x544a;&#x5bf9;&#x7aef;&#x5c06;&#x7528;&#x65b0;&#x7684;CipherSpec&#x548c;keys&#x5904;&#x7406;&#x4e0b;&#x4e00;&#x4e2a;record"/>
<node CREATED="1332141890290" ID="ID_1719214474" MODIFIED="1332141962095" TEXT="&#x53d1;&#x51fa;&#x6b64;&#x6d88;&#x606f;&#x540e;, &#x53d1;&#x9001;&#x8005;&#x5c06;pending write state&#x590d;&#x5236;&#x4e3a;current write state"/>
<node CREATED="1332141890290" ID="ID_1973927876" MODIFIED="1332142002468" TEXT="&#x63a5;&#x6536;&#x6b64;&#x6d88;&#x606f;&#x540e;, &#x63a5;&#x6536;&#x8005;&#x5c06;pending read state&#x590d;&#x5236;&#x4e3a;current read state"/>
<node CREATED="1332142029068" ID="ID_1665380085" MODIFIED="1332142087625" TEXT="&#x6b64;&#x6d88;&#x606f;&#x5c06;&#x5728;&#x5b89;&#x5168;&#x53c2;&#x6570;&#x534f;&#x5546;&#x5b8c;&#x6210;&#x540e;, &#x4f46;&#x5728;finished&#x6d88;&#x606f;&#x524d;&#x53d1;&#x9001;"/>
</node>
</node>
<node CREATED="1332142196899" FOLDED="true" ID="ID_719037742" MODIFIED="1332143432957" TEXT="TLS Alert protocol ">
<node CREATED="1332142215683" FOLDED="true" ID="ID_1071741429" MODIFIED="1332143431177" TEXT="struct Alert">
<node CREATED="1332142236000" FOLDED="true" ID="ID_305733717" MODIFIED="1332143429379" TEXT="AlertLevel level">
<node CREATED="1332142266507" ID="ID_13908939" MODIFIED="1332142268600" TEXT="warning(1)"/>
<node CREATED="1332142278693" ID="ID_525786950" MODIFIED="1332143029663" TEXT="fatal(2) : &#x544a;&#x8b66;&#x7ea7;&#x522b;&#x4e3a;fatal&#x65f6;, &#x63a5;&#x6536;&#x8005;&#x548c;&#x53d1;&#x9001;&#x8005;&#x90fd;&#x5e94;&#x5173;&#x95ed;&#x8fde;&#x63a5;"/>
</node>
<node CREATED="1332142247035" FOLDED="true" ID="ID_1441960713" MODIFIED="1332142932331" TEXT="AlertDescription description">
<node CREATED="1332142297676" ID="ID_1409149027" MODIFIED="1332142859130" TEXT="close_notify(0) : &#x901a;&#x77e5;&#x5bf9;&#x7aef;&#x5173;&#x95ed;&#x8fde;&#x63a5;"/>
<node CREATED="1332142311049" ID="ID_1728451727" MODIFIED="1332142313771" TEXT="unexpected_message(10)"/>
<node CREATED="1332142323333" ID="ID_1147458167" MODIFIED="1332142326268" TEXT="bad_record_mac(20)"/>
<node CREATED="1332142334439" ID="ID_1603900093" MODIFIED="1332142336271" TEXT="decryption_failed(21)"/>
<node CREATED="1332142347664" ID="ID_275266182" MODIFIED="1332142349739" TEXT="record_overflow(22)"/>
<node CREATED="1332142361955" ID="ID_542053406" MODIFIED="1332142364356" TEXT="decompression_failure(30)"/>
<node CREATED="1332142376452" ID="ID_1263956356" MODIFIED="1332142378350" TEXT="handshake_failure(40)"/>
<node CREATED="1332142388913" ID="ID_508988569" MODIFIED="1332142390891" TEXT="bad_certificate(42)"/>
<node CREATED="1332142402839" ID="ID_751191219" MODIFIED="1332142404100" TEXT="unsupported_certificate(43)"/>
<node CREATED="1332142413805" ID="ID_766655052" MODIFIED="1332142415703" TEXT="certificate_revoked(44)"/>
<node CREATED="1332142424590" ID="ID_395201787" MODIFIED="1332142426584" TEXT="certificate_expired(45)"/>
<node CREATED="1332142436374" ID="ID_1817296804" MODIFIED="1332142438540" TEXT="certificate_unknown(46)"/>
<node CREATED="1332142449202" ID="ID_616820703" MODIFIED="1332142450937" TEXT="illegal_parameter(47)"/>
<node CREATED="1332142461229" ID="ID_57846583" MODIFIED="1332142463098" TEXT="unknown_ca(48)"/>
<node CREATED="1332142473715" ID="ID_1589789132" MODIFIED="1332142475853" TEXT="access_denied(49)"/>
<node CREATED="1332142485158" ID="ID_653581282" MODIFIED="1332142486963" TEXT="decode_error(50)"/>
<node CREATED="1332142496497" ID="ID_1940523314" MODIFIED="1332142497945" TEXT="decrypt_error(51)"/>
<node CREATED="1332142508280" ID="ID_620664500" MODIFIED="1332142510039" TEXT="export_restriction(60)"/>
<node CREATED="1332142520494" ID="ID_784845399" MODIFIED="1332142522074" TEXT="protocol_version(70)"/>
<node CREATED="1332142532724" ID="ID_192065627" MODIFIED="1332142535162" TEXT="insufficient_security(71)"/>
<node CREATED="1332142543793" ID="ID_1595616674" MODIFIED="1332142546165" TEXT="internal_error(80)"/>
<node CREATED="1332142555393" ID="ID_1896080619" MODIFIED="1332142557118" TEXT="user_canceled(90)"/>
<node CREATED="1332142567277" ID="ID_402957455" MODIFIED="1332142569631" TEXT="no_renegotiation(100)"/>
</node>
</node>
</node>
<node CREATED="1332143434676" FOLDED="true" ID="ID_415213302" MODIFIED="1332235418341" TEXT="TLS Handshake Protocol">
<node CREATED="1332143482024" FOLDED="true" ID="ID_495293742" MODIFIED="1332233312621" TEXT="&#x57fa;&#x672c;&#x8fc7;&#x7a0b;">
<node CREATED="1332143493633" FOLDED="true" ID="ID_1643239935" MODIFIED="1332145400911" TEXT="client&#x548c;server&#x76f8;&#x4e92;&#x4ea4;&#x6362;hello&#x6d88;&#x606f;, &#x4ee5;&#x534f;&#x5546;&#x8fde;&#x63a5;&#x53c2;&#x6570; :">
<node CREATED="1332143579775" ID="ID_1640722633" MODIFIED="1332143581805" TEXT="Protocol Version"/>
<node CREATED="1332143595052" ID="ID_534961281" MODIFIED="1332143605584" TEXT="Session ID"/>
<node CREATED="1332143615282" ID="ID_34871221" MODIFIED="1332143617326" TEXT="Cipher Suite"/>
<node CREATED="1332143627179" ID="ID_1391198949" MODIFIED="1332143629169" TEXT="Compression Method"/>
<node CREATED="1332143642728" ID="ID_338113319" MODIFIED="1332143644761" TEXT="ClientHello.random"/>
<node CREATED="1332143655514" ID="ID_66348400" MODIFIED="1332143656950" TEXT="ServerHello.random"/>
</node>
<node CREATED="1332144533131" ID="ID_199613782" MODIFIED="1332144565245" TEXT="server&#x5411;client&#x53d1;&#x9001;&#x81ea;&#x5df1;&#x7684;&#x7b7e;&#x540d;&#x8bc1;&#x4e66;"/>
<node CREATED="1332144669782" ID="ID_664617371" MODIFIED="1332145434936" TEXT="[&#x53ef;&#x9009;] server&#x5411;client&#x53d1;&#x9001;key exchange&#x6d88;&#x606f;"/>
<node CREATED="1332144741893" ID="ID_1392376567" MODIFIED="1332145446853" TEXT="[&#x53ef;&#x9009;] server&#x5411;client&#x53d1;&#x9001;CertificateRequest&#x6d88;&#x606f;,&#x4ece;client&#x8bf7;&#x6c42;&#x8bc1;&#x4e66;&#x4ee5;&#x4fbf;&#x81ea;&#x5df1;&#x5bf9;client&#x8fdb;&#x884c;&#x8ba4;&#x8bc1;"/>
<node CREATED="1332144882699" ID="ID_871238930" MODIFIED="1332153190980" TEXT="server&#x5411;client&#x53d1;&#x9001;HelloDone&#x6d88;&#x606f;,&#x8868;&#x793a;&#x5fc5;&#x8981;&#x6570;&#x636e;&#x53d1;&#x9001;&#x5b8c;&#x6210;"/>
<node CREATED="1332144533131" ID="ID_778292447" MODIFIED="1332145503705" TEXT="[&#x53ef;&#x9009;] &#x5982;&#x679c;server&#x5411;client&#x8bf7;&#x6c42;&#x8bc1;&#x4e66;&#x5219;client&#x5411;server&#x53d1;&#x9001;&#x81ea;&#x5df1;&#x7684;&#x7b7e;&#x540d;&#x8bc1;&#x4e66;"/>
<node CREATED="1332144669782" ID="ID_941344922" MODIFIED="1332145037022" TEXT="client&#x5411;server&#x53d1;&#x9001;key exchange&#x6d88;&#x606f;"/>
<node CREATED="1332145131051" ID="ID_620725697" MODIFIED="1332145686130" TEXT="[&#x53ef;&#x9009;] &#x5982;&#x679c;client&#x5411;server&#x53d1;&#x9001;&#x4e86;&#x7b7e;&#x540d;&#x8bc1;&#x4e66;, &#x5219;client&#x5e94;&#x5411;server&#x53d1;&#x9001;CertificateVerify&#x6d88;&#x606f;&#x786e;&#x8ba4;server&#x7684;&#x8bc1;&#x4e66;"/>
<node CREATED="1332145300942" ID="ID_958761339" MODIFIED="1332145317183" TEXT="client&#x5411;server&#x53d1;&#x9001;ChangeCipherSpec&#x6d88;&#x606f;"/>
<node CREATED="1332145740458" ID="ID_106237718" MODIFIED="1332145787021" TEXT="client&#x4f7f;&#x7528;&#x65b0;&#x534f;&#x5546;&#x7684;&#x5b89;&#x5168;&#x53c2;&#x6570;&#x5411;server&#x53d1;&#x9001;finished&#x6d88;&#x606f;"/>
<node CREATED="1332145300942" ID="ID_1027846240" MODIFIED="1332145835102" TEXT="server&#x5411;client&#x53d1;&#x9001;ChangeCipherSpec&#x6d88;&#x606f;"/>
<node CREATED="1332145740458" ID="ID_1477503006" MODIFIED="1332145856481" TEXT="server&#x4f7f;&#x7528;&#x65b0;&#x534f;&#x5546;&#x7684;&#x5b89;&#x5168;&#x53c2;&#x6570;&#x5411;client&#x53d1;&#x9001;finished&#x6d88;&#x606f;"/>
<node CREATED="1332145875177" ID="ID_1310732563" MODIFIED="1332145907654" TEXT="&#x4f7f;&#x7528;&#x65b0;&#x534f;&#x5546;&#x7684;&#x5b89;&#x5168;&#x53c2;&#x6570;&#x4ea4;&#x6362;&#x4e0a;&#x5c42;&#x5e94;&#x7528;&#x6570;&#x636e;"/>
</node>
<node CREATED="1332146475771" FOLDED="true" ID="ID_12812519" MODIFIED="1332235417179" TEXT="&#x6d88;&#x606f;&#x683c;&#x5f0f; : struct Handshake">
<node CREATED="1332146519330" FOLDED="true" ID="ID_35605721" MODIFIED="1332233009143" TEXT="HandshakeType msg_type">
<node CREATED="1332147084825" ID="ID_1534850973" MODIFIED="1332147088332" TEXT="hello_request(0)"/>
<node CREATED="1332147097766" ID="ID_1430390892" MODIFIED="1332147099858" TEXT="client_hello(1)"/>
<node CREATED="1332147108472" ID="ID_1804000651" MODIFIED="1332147110214" TEXT="server_hello(2)"/>
<node CREATED="1332147118348" ID="ID_1639745935" MODIFIED="1332147119901" TEXT="certificate(11)"/>
<node CREATED="1332147129209" ID="ID_86683308" MODIFIED="1332147131452" TEXT="server_key_exchange (12)"/>
<node CREATED="1332147141001" ID="ID_1906514295" MODIFIED="1332147142323" TEXT="certificate_request(13)"/>
<node CREATED="1332147152002" ID="ID_1085946327" MODIFIED="1332147153101" TEXT="server_hello_done(14)"/>
<node CREATED="1332147163765" ID="ID_1932855774" MODIFIED="1332147164974" TEXT="certificate_verify(15)"/>
<node CREATED="1332147174428" ID="ID_911822767" MODIFIED="1332147176200" TEXT="client_key_exchange(16)"/>
<node CREATED="1332147185350" ID="ID_66070032" MODIFIED="1332147187205" TEXT="finished(20)"/>
</node>
<node CREATED="1332146531384" ID="ID_1488308684" MODIFIED="1332146533571" TEXT="uint24 length"/>
<node CREATED="1332146547403" FOLDED="true" ID="ID_1339107084" MODIFIED="1332235415867" TEXT="body : &#x5177;&#x4f53;&#x5185;&#x5bb9;&#x6839;&#x636e;msg_type&#x786e;&#x5b9a;">
<node CREATED="1332146625223" FOLDED="true" ID="ID_1707336243" MODIFIED="1332147756644" TEXT="&#x82e5;msg_type = hello_request&#x5219;body&#x4e3a; : HelloRequest">
<node CREATED="1332147402825" ID="ID_1428122385" MODIFIED="1332147426414" TEXT="server&#x53ef;&#x4ee5;&#x5728;&#x4efb;&#x4f55;&#x65f6;&#x5019;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;"/>
<node CREATED="1332147448212" ID="ID_1862731304" MODIFIED="1332147592919" TEXT="&#x6b64;&#x6d88;&#x606f;&#x4ee3;&#x8868;server&#x5e0c;&#x671b;client&#x53d1;&#x9001;&#x4e00;&#x4e2a;hello&#x6d88;&#x606f;&#x4ee5;&#x5f00;&#x542f;&#x65b0;&#x7684;&#x534f;&#x5546;.&#xa;&#x5982;&#x679c;client&#x6b63;&#x5904;&#x4e8e;&#x534f;&#x5546;&#x8fc7;&#x7a0b;&#x4e2d;,&#x5219;&#x53ef;&#x4ee5;&#x5ffd;&#x7565;&#x6b64;&#x6d88;&#x606f;.&#x82e5;client&#x4e0d;&#x54cd;&#x5e94;&#xa;&#x6b64;&#x6d88;&#x606f;,&#x5373;&#x6ca1;&#x6709;&#x53d1;&#x9001;&#x51fa;hello&#x6d88;&#x606f;,&#x5219;server&#x53ef;&#x9009;&#x62e9;&#x5173;&#x95ed;&#x8fde;&#x63a5;."/>
<node CREATED="1332147428685" FOLDED="true" ID="ID_19265841" MODIFIED="1332147445646" TEXT="struct HelloRequest">
<node CREATED="1332147436749" ID="ID_1107981437" MODIFIED="1332147442228" TEXT="&#x7a7a;"/>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_445912092" MODIFIED="1332233009144" TEXT="&#x82e5;msg_type = client_hello&#x5219;body&#x4e3a; : ClientHello">
<node CREATED="1332147726418" ID="ID_1052988565" MODIFIED="1332148341769" TEXT="client&#x7b2c;&#x4e00;&#x6b21;&#x8fde;&#x63a5;&#x5230;server&#x65f6;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;&#xa;client&#x53d1;&#x51fa;hello&#x6d88;&#x606f;&#x540e;,&#x7b49;&#x5f85;server&#x56de;&#x5e94;hello&#x6d88;&#x606f;,&#xa;&#x5728;server&#x7684;hello&#x6d88;&#x606f;&#x4e4b;&#x524d;&#x6536;&#x5230;&#x7684;&#x4efb;&#x4f55;server&#x7684;&#x6d88;&#x606f;&#xa;&#x88ab;&#x5f53;&#x505a;fatal&#x9519;&#x8bef;,&#x4ece;&#x800c;&#x5173;&#x95ed;&#x8fde;&#x63a5;."/>
<node CREATED="1332147791239" FOLDED="true" ID="ID_1588177350" MODIFIED="1332149463580" TEXT="struct ClientHello">
<node CREATED="1332147808771" ID="ID_375204481" MODIFIED="1332147810105" TEXT="ProtocolVersion client_version"/>
<node CREATED="1332147820019" FOLDED="true" ID="ID_320907703" MODIFIED="1332233009143" TEXT="Random random">
<node CREATED="1332148396613" ID="ID_1099295957" MODIFIED="1332148466995" TEXT="uint32 gmt_unix_time : &#x7cfb;&#x7edf;&#x5f53;&#x524d;&#x65f6;&#x95f4;"/>
<node CREATED="1332148409171" ID="ID_1834681264" MODIFIED="1332148477731" TEXT="opaque random_bytes[28] : &#x968f;&#x673a;&#x5b57;&#x8282;"/>
</node>
<node CREATED="1332147829399" ID="ID_767060373" MODIFIED="1332148055030" TEXT="SessionID session_id : &#x5f53;client&#x5e0c;&#x671b;&#x5efa;&#x7acb;&#x65b0;&#x8fde;&#x63a5;&#x800c;&#x4e0d;&#x662f;&#x6062;&#x590d;&#x8001;&#x8fde;&#x63a5;&#x65f6;&#x5e94;&#x5c06;&#x6b64;&#x503c;&#x8bbe;&#x4e3a;&#x7a7a;"/>
<node CREATED="1332147841070" ID="ID_1903098295" MODIFIED="1332148181044" TEXT="CipherSuite cipher_suites : &#x52a0;&#x5bc6;&#x7b97;&#x6cd5;, &#x4f18;&#x5148;&#x7ea7;&#x4ece;&#x9ad8;&#x5230;&#x4f4e;"/>
<node CREATED="1332147853241" ID="ID_337144372" MODIFIED="1332148199255" TEXT="CompressionMethod compression_methods : &#x538b;&#x7f29;&#x7b97;&#x6cd5;, &#x4f18;&#x5148;&#x7ea7;&#x4ece;&#x9ad8;&#x5230;&#x4f4e;"/>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_776461480" MODIFIED="1332233009145" TEXT="&#x82e5;msg_type = server_hello&#x5219;body&#x4e3a; : ServerHello">
<node CREATED="1332147726418" ID="ID_1081205130" MODIFIED="1332148768941" TEXT="server&#x53d1;&#x9001;hello&#x6d88;&#x606f;&#x56de;&#x5e94;client&#x53d1;&#x51fa;&#x7684;hello&#x6d88;&#x606f;"/>
<node CREATED="1332147791239" FOLDED="true" ID="ID_1974073392" MODIFIED="1332149122557" TEXT="struct ServerHello">
<node CREATED="1332147808771" ID="ID_1239494189" MODIFIED="1332147810105" TEXT="ProtocolVersion client_version"/>
<node CREATED="1332147820019" FOLDED="true" ID="ID_1245518311" MODIFIED="1332233009145" TEXT="Random random">
<node CREATED="1332148396613" ID="ID_226559709" MODIFIED="1332148466995" TEXT="uint32 gmt_unix_time : &#x7cfb;&#x7edf;&#x5f53;&#x524d;&#x65f6;&#x95f4;"/>
<node CREATED="1332148409171" ID="ID_445891997" MODIFIED="1332148477731" TEXT="opaque random_bytes[28] : &#x968f;&#x673a;&#x5b57;&#x8282;"/>
</node>
<node CREATED="1332147829399" ID="ID_1415260772" MODIFIED="1332149025808" TEXT="SessionID session_id : &#xa;&#x82e5;ClientHello.session_id&#x4e0d;&#x4e3a;&#x7a7a;&#x4e14;server&#x540c;&#x610f;&#x6062;&#x590d;&#x6b64;&#x8fde;&#x63a5;&#x5219;&#x6b64;&#x5904;&#x5e94;&#x4e0e;ClientHello.session_id&#x76f8;&#x540c;&#xa;&#x82e5;ClientHello.session_id&#x4e0d;&#x4e3a;&#x7a7a;&#x4e14;server&#x4e0d;&#x540c;&#x610f;&#x6062;&#x590d;&#x6b64;&#x8fde;&#x63a5;&#x5219;&#x6b64;&#x5904;&#x5e94;&#x586b;server&#x5e0c;&#x671b;&#x6062;&#x590d;&#x7684;&#x8fde;&#x63a5;&#x6216;&#x7a7a;"/>
<node CREATED="1332147841070" ID="ID_770635589" MODIFIED="1332149079631" TEXT="CipherSuite cipher_suites : client&#x548c;server&#x90fd;&#x540c;&#x610f;&#x7684;&#x52a0;&#x5bc6;&#x7b97;&#x6cd5;"/>
<node CREATED="1332147853241" ID="ID_963172705" MODIFIED="1332149089877" TEXT="CompressionMethod compression_methods : client&#x548c;server&#x90fd;&#x540c;&#x610f;&#x7684;&#x538b;&#x7f29;&#x7b97;&#x6cd5;"/>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_1439206299" MODIFIED="1332233009146" TEXT="&#x82e5;msg_type = certificate&#x5219;body&#x4e3a; : Certificate">
<node CREATED="1332149168877" FOLDED="true" ID="ID_451893156" MODIFIED="1332150243115" TEXT="server&#x5728;&#x53d1;&#x9001;hello&#x4e4b;&#x540e;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;, client&#x6536;&#x5230;certificate_request&#x540e;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;&#xa;&#x8bc1;&#x4e66;&#x7c7b;&#x578b;&#x5e94;&#x4e0e;key exchange&#x7b97;&#x6cd5;&#x5339;&#x914d;,&#x4e14;&#x5e94;&#x4e3a;X.509v3&#x8bc1;&#x4e66;&#xa;&#x6d88;&#x606f;&#x5185;&#x5e94;&#x5305;&#x542b;certificate key,&#x4e14;&#x7b7e;&#x540d;&#x7b97;&#x6cd5;&#x5e94;&#x4e0e;certificate key&#x5339;&#x914d;">
<node CREATED="1332149749126" ID="ID_1022520523" MODIFIED="1332149968993" TEXT="RSA                      with RSA public key&#xa;RSA_EXPORT         with RSA public key&#xa;DHE_DSS              with DSS public key&#xa;DHE_DSS_EXPORT with DSS public key&#xa;DHE_RSA              with RSA public key&#xa;DHE_RSA_EXPORT with RSA public key&#xa;DH_DSS                with Diffie-Hellman key&#xa;DH_RSA                with Diffie-Hellman key"/>
</node>
<node CREATED="1332150060253" FOLDED="true" ID="ID_588586108" MODIFIED="1332232786219" TEXT="struct Certificate">
<node CREATED="1332150074384" FOLDED="true" ID="ID_1349538684" MODIFIED="1332232784999" TEXT="ASN.1Cert certificate_list">
<node CREATED="1332150085162" ID="ID_555548828" MODIFIED="1332150087047" TEXT="opaque ASN.1Cert"/>
</node>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_66234366" MODIFIED="1332233009147" TEXT="&#x82e5;msg_type = server_key_exchange&#x5219;body&#x4e3a; : ServerKeyExchange">
<node CREATED="1332151556654" FOLDED="true" ID="ID_12418082" MODIFIED="1332151882776" TEXT="server&#x5728;&#x53d1;&#x9001;certificate&#x6d88;&#x606f;&#x540e;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;,server&#x4ec5;&#x5728;certificate&#x6d88;&#x606f;&#x4e2d;&#xa;&#x6ca1;&#x6709;&#x5305;&#x542b;&#x8db3;&#x591f;&#x4fe1;&#x606f;&#x4ee5;&#x4ea4;&#x6362;master secret&#x65f6;&#x624d;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;">
<node CREATED="1332151739178" ID="ID_1809318631" MODIFIED="1332151832918" TEXT="&#x9700;&#x8981;&#x53d1;&#x9001;key exchange&#x6d88;&#x606f;&#x7684;key exchange&#x65b9;&#x6cd5;:&#xa;           RSA_EXPORT&#xa;           DHE_DSS&#xa;           DHE_DSS_EXPORT&#xa;           DHE_RSA&#xa;           DHE_RSA_EXPORT&#xa;           DH_anon"/>
<node CREATED="1332151739178" ID="ID_1683744159" MODIFIED="1332151876710" TEXT="&#x4e0d;&#x9700;&#x8981;&#x53d1;&#x9001;key exchange&#x6d88;&#x606f;&#x7684;key exchange&#x65b9;&#x6cd5;:&#xa;           RSA&#xa;           RSA_EXPORT&#xa;           DH_DSS&#xa;           DH_RS"/>
</node>
<node CREATED="1332152011720" FOLDED="true" ID="ID_1338108149" MODIFIED="1332232777940" TEXT="struct ServerKeyExchange">
<node CREATED="1332152203963" FOLDED="true" ID="ID_1533589706" MODIFIED="1332232763036" TEXT="&#x82e5;KeyExchangeAlgorithm&#x4e3a;diffie_hellman, &#x5219;&#x6b64;&#x5904;&#x4e3a; : ServerDHParams params&#xa;&#x82e5;KeyExchangeAlgorithm&#x4e3a;rsa, &#x5219;&#x6b64;&#x5904;&#x4e3a; : ServerRSAParams params">
<node CREATED="1332152310625" FOLDED="true" ID="ID_967109319" MODIFIED="1332232761016" TEXT="ServerDHParams params">
<node CREATED="1332152343403" ID="ID_1594818597" MODIFIED="1332152346094" TEXT="opaque dh_p"/>
<node CREATED="1332152346940" ID="ID_1141852919" MODIFIED="1332152359406" TEXT="opaque dh_g"/>
<node CREATED="1332152351587" ID="ID_778931416" MODIFIED="1332152356408" TEXT="opaque dh_Ys"/>
</node>
<node CREATED="1332152297772" FOLDED="true" ID="ID_685160291" MODIFIED="1332232761914" TEXT="ServerRSAParams params">
<node CREATED="1332152376625" ID="ID_1938640761" MODIFIED="1332152378408" TEXT="opaque rsa_modulus"/>
<node CREATED="1332152387065" ID="ID_846062661" MODIFIED="1332152388671" TEXT="opaque rsa_exponent"/>
</node>
</node>
<node CREATED="1332152190379" FOLDED="true" ID="ID_863860138" MODIFIED="1332232776619" TEXT="Signature signed_params">
<node CREATED="1332152603865" FOLDED="true" ID="ID_639019367" MODIFIED="1332232772301" TEXT="&#x5f53;SignatureAlgorithm&#x4e3a;anonymous&#x65f6;">
<node CREATED="1332152613643" ID="ID_1210904144" MODIFIED="1332152616636" TEXT="&#x7a7a;"/>
</node>
<node CREATED="1332152610145" FOLDED="true" ID="ID_512844280" MODIFIED="1332232773880" TEXT="&#x5f53;SignatureAlgorithm&#x4e3a;rsa&#x65f6;">
<node CREATED="1332152674371" FOLDED="true" ID="ID_465867214" MODIFIED="1332154148840" TEXT="opaque md5_hash[16]">
<node CREATED="1332152729132" ID="ID_582761610" MODIFIED="1332152731492" TEXT="MD5(ClientHello.random + ServerHello.random + ServerParams)"/>
</node>
<node CREATED="1332152686541" FOLDED="true" ID="ID_1122282045" MODIFIED="1332152753354" TEXT="opaque sha_hash[20]">
<node CREATED="1332152743502" ID="ID_1834437081" MODIFIED="1332152745870" TEXT="SHA(ClientHello.random + ServerHello.random + ServerParams)"/>
</node>
</node>
<node CREATED="1332152610145" FOLDED="true" ID="ID_1191971179" MODIFIED="1332232775644" TEXT="&#x5f53;SignatureAlgorithm&#x4e3a;dsa&#x65f6;">
<node CREATED="1332152697585" FOLDED="true" ID="ID_1907976600" MODIFIED="1332152753976" TEXT="opaque sha_hash[20]">
<node CREATED="1332152748715" ID="ID_1997256525" MODIFIED="1332152750245" TEXT="SHA(ClientHello.random + ServerHello.random + ServerParams)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_1687291597" MODIFIED="1332233009148" TEXT="&#x82e5;msg_type = certificate_request&#x5219;body&#x4e3a; : CertificateRequest">
<node CREATED="1332152863070" ID="ID_1409537133" MODIFIED="1332152878399" TEXT="server&#x5728;Key Exchange&#x6d88;&#x606f;&#x540e;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;"/>
<node CREATED="1332152918449" FOLDED="true" ID="ID_888095530" MODIFIED="1332153643873" TEXT="struct CertificateRequest">
<node CREATED="1332152949023" FOLDED="true" ID="ID_83002119" MODIFIED="1332153080084" TEXT="ClientCertificateType certificate_types&#xa;&#x8bc1;&#x4e66;&#x7c7b;&#x578b;,&#x4f18;&#x5148;&#x7ea7;&#x4ece;&#x9ad8;&#x5230;&#x4f4e;">
<node CREATED="1332152968486" ID="ID_1916246225" MODIFIED="1332152970353" TEXT="rsa_sign(1)"/>
<node CREATED="1332153000829" ID="ID_55094054" MODIFIED="1332153002859" TEXT="dss_sign(2)"/>
<node CREATED="1332153011057" ID="ID_69721225" MODIFIED="1332153012700" TEXT="rsa_fixed_dh(3)"/>
<node CREATED="1332153020644" ID="ID_157311521" MODIFIED="1332153022267" TEXT="dss_fixed_dh(4)"/>
</node>
<node CREATED="1332153081435" ID="ID_1216735075" MODIFIED="1332153106072" TEXT="DistinguishedName certificate_authorities&#xa;&#x53ef;&#x63a5;&#x53d7;&#x7684;&#x8bc1;&#x4e66;&#x53d1;&#x884c;&#x65b9;"/>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_1368817683" MODIFIED="1332233009149" TEXT="&#x82e5;msg_type = server_hello_done&#x5219;body&#x4e3a; : ServerHelloDone">
<node CREATED="1332153249740" ID="ID_1056076507" MODIFIED="1332153307674" TEXT="server&#x5728;&#x5fc5;&#x8981;&#x6570;&#x636e;&#x53d1;&#x9001;&#x5b8c;&#x6210;&#x540e;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;, client&#x6536;&#x5230;&#x6b64;&#x6d88;&#x606f;&#x540e;&#x5f00;&#x59cb;&#x9a8c;&#x8bc1;server&#x7684;&#x8bc1;&#x4e66;"/>
<node CREATED="1332153241723" FOLDED="true" ID="ID_1567008863" MODIFIED="1332153317691" TEXT="struct ServerHelloDone">
<node CREATED="1332153313548" ID="ID_1168196696" MODIFIED="1332153316993" TEXT="&#x7a7a;"/>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_1191453369" MODIFIED="1332233009150" TEXT="&#x82e5;msg_type = certificate&#x5219;body&#x4e3a; : Client certificate">
<node CREATED="1332153552452" ID="ID_1850018982" MODIFIED="1332153698252" TEXT="&#x5f53;server&#x8bf7;&#x6c42;&#x8bc1;&#x4e66;&#x4e14;server&#x53d1;&#x9001;&#x4e86;helloDone&#x65f6;client&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;&#xa;&#x5982;&#x679c;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;&#x5219;&#x5e94;&#x4e3a;client&#x7ee7;hello&#x6d88;&#x606f;&#x540e;&#x7684;&#x7b2c;&#x4e00;&#x4e2a;&#x6d88;&#x606f;"/>
<node CREATED="1332153629686" ID="ID_1397334178" LINK="#ID_588586108" MODIFIED="1332153639345" TEXT="struct certificate"/>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_122927727" MODIFIED="1332233009150" TEXT="&#x82e5;msg_type = certificate_verify&#x5219;body&#x4e3a; : CertificateVerify">
<node CREATED="1332153552452" ID="ID_1511291897" MODIFIED="1332153698252" TEXT="&#x5f53;server&#x8bf7;&#x6c42;&#x8bc1;&#x4e66;&#x4e14;server&#x53d1;&#x9001;&#x4e86;helloDone&#x65f6;client&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;&#xa;&#x5982;&#x679c;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;&#x5219;&#x5e94;&#x4e3a;client&#x7ee7;hello&#x6d88;&#x606f;&#x540e;&#x7684;&#x7b2c;&#x4e00;&#x4e2a;&#x6d88;&#x606f;"/>
<node CREATED="1332153838524" FOLDED="true" ID="ID_935276210" MODIFIED="1332154278201" TEXT="struct CertificateVerify">
<node CREATED="1332153998684" FOLDED="true" ID="ID_269139578" LINK="#ID_863860138" MODIFIED="1332154273452" TEXT="Signature signature">
<node CREATED="1332154170347" ID="ID_70115023" MODIFIED="1332154264521" TEXT="MD5(handshake_messages) : hash&#x5185;&#x5bb9;&#x4e3a;&#x6b64;&#x6d88;&#x606f;&#x4e4b;&#x524d;&#x53d1;&#x9001;&#x548c;&#x63a5;&#x6536;&#x7684;&#x6d88;&#x606f;&#x5185;&#x5bb9;&#x7684;&#x5408;&#x5e76;"/>
<node CREATED="1332154182453" ID="ID_1414226720" MODIFIED="1332154268995" TEXT="SHA(handshake_messages) : hash&#x5185;&#x5bb9;&#x4e3a;&#x6b64;&#x6d88;&#x606f;&#x4e4b;&#x524d;&#x53d1;&#x9001;&#x548c;&#x63a5;&#x6536;&#x7684;&#x6d88;&#x606f;&#x5185;&#x5bb9;&#x7684;&#x5408;&#x5e76;"/>
</node>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_959354108" MODIFIED="1332235414681" TEXT="&#x82e5;msg_type = client_key_exchange&#x5219;body&#x4e3a; : ClientKeyExchange">
<node CREATED="1332231734351" ID="ID_512570149" MODIFIED="1332233607746" TEXT="client&#x6536;&#x5230;server&#x7684;helloDone&#x6d88;&#x606f;&#x540e;&#x53d1;&#x9001;&#x5b8c;certificate&#x518d;&#x53d1;&#x9001;&#x6b64;&#x6d88;&#x606f;&#xa;&#x6b64;&#x6d88;&#x606f;&#x786e;&#x5b9a;&#x4e86;premaster secret, &#x5b83;&#x7528;&#x4e8e;&#x4ea7;&#x751f;master secret.&#xa;&#x5982;&#x679c;RSA&#x88ab;&#x7528;&#x4e8e;key&#x4ea4;&#x6362;,&#x5219;premaster secret&#x88ab;client&#x7528;server&#x7684;&#x516c;&#x94a5;&#x52a0;&#x5bc6;&#x540e;&#x53d1;&#x9001;&#x7ed9;server&#xa;&#x5982;&#x679c;Diffie-Hellman&#x88ab;&#x7528;&#x4e8e;key&#x4ea4;&#x6362;,&#x5219;premaster secret&#x901a;&#x8fc7;&#x8ba1;&#x7b97;dh_p, dh_g, dh_Ys&#x5f97;&#x5230;"/>
<node CREATED="1332231918304" FOLDED="true" ID="ID_1516651487" MODIFIED="1332232824726" TEXT="struct ClientKeyExchange">
<node CREATED="1332152310625" FOLDED="true" ID="ID_724127537" MODIFIED="1332232812466" TEXT="&#x82e5;KeyExchangeAlgorithm&#x4e3a;diffie_hellman, &#x5219;&#x6b64;&#x5904;&#x4e3a; : ClientDiffieHellmanPublic">
<node CREATED="1332152343403" ID="ID_277281427" MODIFIED="1332232431432" TEXT="&#x82e5;PublicValueEncoding&#x4e3a;implicit, &#x5219;&#x6d88;&#x606f;&#x4e3a;&#x7a7a;"/>
<node CREATED="1332152351587" ID="ID_1662494041" MODIFIED="1332232501373" TEXT="&#x82e5;PublicValueEncoding&#x4e3a;explicit, &#x5219;&#x6b64;&#x5904;&#x4e3a;opaque dh_Ys"/>
</node>
<node CREATED="1332152297772" FOLDED="true" ID="ID_476931625" MODIFIED="1332232822685" TEXT="&#x82e5;KeyExchangeAlgorithm&#x4e3a;rsa, &#x5219;&#x6b64;&#x5904;&#x4e3a; : EncryptedPreMasterSecret">
<node CREATED="1332232219935" FOLDED="true" ID="ID_267755249" MODIFIED="1332232375510" TEXT="public-key-encrypted PreMasterSecret pre_master_secret&#xa;&#x8fd9;&#x91cc;&#x8868;&#x660e;PreMasterSecret&#x662f;&#x7528;public key&#x52a0;&#x5bc6;&#x8fc7;&#x7684;">
<node CREATED="1332232120842" ID="ID_1789394433" MODIFIED="1332232123845" TEXT="ProtocolVersion client_version"/>
<node CREATED="1332232138049" ID="ID_484988774" MODIFIED="1332232139446" TEXT="opaque random[46]"/>
</node>
</node>
</node>
</node>
<node CREATED="1332146625223" FOLDED="true" ID="ID_762149143" MODIFIED="1332233009152" TEXT="&#x82e5;msg_type = finished&#x5219;body&#x4e3a; : Finished">
<node CREATED="1332154358856" ID="ID_1782422131" MODIFIED="1332154648114" TEXT="server&#x548c;client&#x5728;&#x63a5;&#x6536;&#x5230;change cipher spec&#x6d88;&#x606f;&#x540e;&#x7528;&#x65b0;&#x7684;&#x5b89;&#x5168;&#x53c2;&#x6570;&#xa;&#x52a0;&#x5bc6;&#x6b64;&#x6d88;&#x606f;&#x518d;&#x53d1;&#x9001;&#x7ed9;&#x5bf9;&#x7aef;,&#x4ee5;&#x9a8c;&#x8bc1;key&#x4ea4;&#x6362;&#x548c;&#x8ba4;&#x8bc1;&#x8fc7;&#x7a0b;&#x5df2;&#x6210;&#x529f;&#x5b8c;&#x6210;.&#xa;finished&#x6d88;&#x606f;&#x662f;&#x7b2c;&#x4e00;&#x4e2a;&#x53d7;&#x4fdd;&#x62a4;&#x7684;&#x6d88;&#x606f;.&#xa;&#x5f53;&#x4e00;&#x7aef;&#x53d1;&#x9001;&#x5b8c;finished&#x6d88;&#x606f;, &#x5df2;&#x6536;&#x5230;&#x5bf9;&#x7aef;&#x7684;finished&#x6d88;&#x606f;, &#x4e14;&#x9a8c;&#x8bc1;&#x5b8c;&#x5bf9;&#x7aef;&#x7684;&#x6d88;&#x606f;&#x540e;,&#xa;&#x5c31;&#x53ef;&#x4ee5;&#x5411;&#x5bf9;&#x7aef;&#x53d1;&#x9001;&#x5e94;&#x7528;&#x5c42;&#x6570;&#x636e;&#x4e86;"/>
<node CREATED="1332154782856" FOLDED="true" ID="ID_1594557467" MODIFIED="1332155009759" TEXT="struct Finished">
<node CREATED="1332154799276" FOLDED="true" ID="ID_248487957" MODIFIED="1332155006480" TEXT="opaque verify_data[12]">
<node CREATED="1332154813602" FOLDED="true" ID="ID_17868054" MODIFIED="1332155005025" TEXT="PRF(master_secret, &#xa;       finished_label, &#xa;       MD5(handshake_messages) + SHA-1(handshake_messages)) &#xa;[0..11]">
<node CREATED="1332154870714" ID="ID_1946289273" MODIFIED="1332154902685" TEXT="finished_label : &#x5b57;&#x7b26;&#x4e32;server finished&#x6216;client finished"/>
<node CREATED="1332154918069" ID="ID_286227137" MODIFIED="1332155000818" TEXT="handshake_messages : &#x63e1;&#x624b;&#x8fc7;&#x7a0b;&#x4e2d;&#x6240;&#x6709;&#x6d88;&#x606f;&#x7684;&#x603b;&#x548c;, &#x4f46;&#x4e0d;&#x5305;&#x62ec;&#x672c;&#x6d88;&#x606f;&#xa;&#x8fd9;&#x91cc;&#x7684;&#x6d88;&#x606f;&#x6307;&#x7684;&#x662f;record&#x7684;&#x4e0a;&#x5c42;&#x6d88;&#x606f;,&#x4e0d;&#x5305;&#x62ec;record&#x7684;&#x5934;&#x90e8;"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1331717657983" ID="ID_1370070939" MODIFIED="1331717689101" POSITION="left" TEXT="OpenSSL">
<node CREATED="1332234394644" ID="ID_952911138" MODIFIED="1335321501012" TEXT="&#x5178;&#x578b;&#x7528;&#x6cd5;">
<node CREATED="1332234412987" ID="ID_142350126" MODIFIED="1332234462676" TEXT="1, &#x52a0;&#x8f7d;libssl.so"/>
<node CREATED="1332234447246" ID="ID_956480943" MODIFIED="1332234466810" TEXT="2, &#x8c03;&#x7528;SSL_library_init"/>
<node CREATED="1332234657329" FOLDED="true" ID="ID_1087242270" MODIFIED="1332234842033" TEXT="3, &#x8c03;&#x7528;SSL_CTX *SSL_CTX_new(SSL_METHOD *meth)&#x4ee5;&#x521b;&#x5efa;&#x4e00;&#x4e2a;SSL_CTX&#x7ed3;&#x6784;">
<node CREATED="1332234739884" ID="ID_194257183" MODIFIED="1332234838159" TEXT="&#x6240;&#x4f20;&#x5165;&#x7684;SSL_METHOD&#x53ef;&#x4ee5;&#x901a;&#x8fc7;&#x8c03;&#x7528;&#x4ee5;&#x4e0b;&#x51fd;&#x6570;&#x5f97;&#x5230;&#xa;SSL_METHOD *SSLv2_client_method(void)&#xa;SSL_METHOD *SSLv2_server_method(void)&#xa;SSL_METHOD *SSLv3_client_method(void)&#xa;SSL_METHOD *SSLv3_server_method(void)&#xa;SSL_METHOD *TLSv1_client_method(void)&#xa;SSL_METHOD *TLSv1_server_method(void)"/>
</node>
<node CREATED="1332234997012" ID="ID_1624463394" MODIFIED="1332235236610" TEXT="4, &#x8c03;&#x7528;int SSL_CTX_use_certificate_file(SSL_CTX *ctx, char *file, int type)&#x52a0;&#x8f7d;&#x8bc1;&#x4e66;"/>
<node CREATED="1332235035748" ID="ID_1343595844" MODIFIED="1332235255990" TEXT="5, &#x8c03;&#x7528;int SSL_CTX_use_PrivateKey_file(SSL_CTX *ctx, char *file, int type)&#x52a0;&#x8f7d;&#x79c1;&#x94a5;"/>
<node CREATED="1332235359195" ID="ID_1729900322" MODIFIED="1332236880145" TEXT="6, &#x8c03;&#x7528;int SSL_CTX_check_private_key(const SSL_CTX *ctx)&#x68c0;&#x67e5;&#x79c1;&#x94a5;&#x548c;&#x8bc1;&#x4e66;&#x662f;&#x5426;&#x76f8;&#x7b26;&#xa;server&#x7528;&#x79c1;&#x94a5;&#x5bf9;&#x8bc1;&#x4e66;&#x7b7e;&#x540d;,&#x800c;client&#x7528;&#x516c;&#x94a5;&#x5bf9;&#x8bc1;&#x4e66;&#x8fdb;&#x884c;&#x9a8c;&#x8bc1;,&#x516c;&#x94a5;&#x7531;client&#x4ece;&#x8bc1;&#x4e66;&#x9881;&#x53d1;&#x673a;&#x6784;&#x83b7;&#x5f97;"/>
<node CREATED="1332237223043" ID="ID_43941805" MODIFIED="1332237299992" TEXT="7, &#x5982;&#x679c;&#x5bf9;&#x4e00;&#x4e2a;&#x8bc1;&#x4e66;&#x7684;&#x9a8c;&#x8bc1;&#x9700;&#x8981;&#x5176;&#x5b83;&#x8bc1;&#x4e66;&#x4f5c;&#x4e3a;&#x524d;&#x63d0;,&#x5219;&#x9700;&#x8981;&#x8c03;&#x7528;&#xa;int SSL_CTX_use_certificate_chain_file(SSL_CTX *ctx, const char *file)&#xa;&#x94fe;&#x5f0f;&#x5730;&#x52a0;&#x8f7d;&#x8bc1;&#x4e66;"/>
<node CREATED="1332237590824" ID="ID_217362436" MODIFIED="1332237636381" TEXT="8, &#x8c03;&#x7528;int SSL_set_fd(SSL *ssl, int fd)&#x7ed1;&#x5b9a;socket&#x4e0e;SSL&#x4e0a;&#x4e0b;&#x6587;"/>
<node CREATED="1332237732242" ID="ID_1406525124" MODIFIED="1332238014973" TEXT="9, &#x5bf9;&#x4e8e;server&#x800c;&#x8a00;, &#x8c03;&#x7528;int SSL_accept(SSL *ssl)&#x4ee5;&#x7b49;&#x5f85;client&#x53d1;&#x8d77;TLS handshake&#x8fc7;&#x7a0b;,&#xa;   &#x6b64;&#x8c03;&#x7528;&#x5728;&#x63e1;&#x624b;&#x5b8c;&#x6210;&#x540e;&#x8fd4;&#x56de;.&#xa;   &#x5bf9;&#x4e8e;client&#x800c;&#x8a00;, &#x8c03;&#x7528;int SSL_connect(SSL *ssl)&#x4ee5;&#x53d1;&#x8d77;TLS handshake&#x8fc7;&#x7a0b;,&#xa;   &#x6b64;&#x8c03;&#x7528;&#x5728;&#x63e1;&#x624b;&#x5b8c;&#x6210;&#x540e;&#x8fd4;&#x56de;."/>
<node CREATED="1332238147737" ID="ID_300825345" MODIFIED="1332238199039" TEXT="10, &#x8c03;&#x7528;&#x4ee5;&#x4e0b;&#x51fd;&#x6570;&#x8bfb;&#x5199;&#x6570;&#x636e;&#xa;int SSL_read(SSL *ssl, void *buf, int num)&#xa;int SSL_write(SSL *ssl, void *buf, int num)"/>
<node CREATED="1332238234192" ID="ID_1377791289" MODIFIED="1332238364687" TEXT="11, &#x8c03;&#x7528;&#x4ee5;&#x4e0b;&#x51fd;&#x6570;&#x4ee5;&#x5173;&#x95ed;&#x8fde;&#x63a5;:&#xa;int SSL_shutdown(SSL *ssl) : &#x5173;&#x95ed;SSL&#x5957;&#x63a5;&#x5b57;;&#xa;void SSL_free(SSL *ssl) : &#x91ca;&#x653e;SSL&#x5957;&#x63a5;&#x5b57;;&#xa;void SSL_CTX_free(SSL_CTX *ctx) : &#x91ca;&#x653e;SSL&#x73af;&#x5883;; "/>
</node>
<node CREATED="1335259780838" ID="ID_843015744" MODIFIED="1335259787955" TEXT="&#x8bc1;&#x4e66;">
<node CREATED="1335259843402" ID="ID_557263969" MODIFIED="1335259848415" TEXT="&#x539f;&#x7406;">
<node CREATED="1335259851626" ID="ID_817648356" MODIFIED="1335260642665" TEXT="&#x7b7e;&#x540d;&#x8bc1;&#x4e66;&#x7684;&#x4e3b;&#x8981;&#x4f5c;&#x7528;&#x662f;&#x544a;&#x8bc9;client(&#x5373;web browser)&#x67d0;&#x4e2a;&#x5b9e;&#x4f53;(&#x5373;web server)&#x7684;&#x516c;&#x94a5;,&#xa;&#x4ee5;&#x4fbf;client&#x7528;server&#x7684;&#x516c;&#x94a5;&#x6765;&#x89e3;&#x5bc6;server&#x7528;&#x79c1;&#x94a5;&#x52a0;&#x5bc6;&#x8fc7;&#x7684;&#x4e1c;&#x897f;.&#xa;&#x4e3a;&#x4e86;&#x4fdd;&#x8bc1;&#x5b9e;&#x4f53;&#x4e0e;&#x516c;&#x94a5;&#x5bf9;&#x5e94;&#x5173;&#x7cfb;&#x7684;&#x6b63;&#x786e;&#x6027;,&#x8bc1;&#x4e66;&#x5fc5;&#x987b;&#x7ecf;&#x8fc7;CA(&#x7b7e;&#x53d1;&#x673a;&#x6784;)&#x7684;&#x7b7e;&#x540d;.&#xa;client&#x7528;CA&#x7684;&#x516c;&#x94a5;&#x89e3;&#x5bc6;&#x7b7e;&#x540d;,&#x770b;&#x89e3;&#x5bc6;&#x540e;&#x7684;&#x5185;&#x5bb9;&#x662f;&#x5426;&#x4e0e;CA&#x7684;&#x540d;&#x79f0;&#x4e00;&#x81f4;,&#x82e5;&#x4e00;&#x81f4;&#x5219;&#x4fe1;&#x4efb;&#x6b64;&#x8bc1;&#x4e66;,&#x6545;&#x800c;&#xa;&#x53ef;&#x4ee5;&#x91c7;&#x7528;&#x8bc1;&#x4e66;&#x4e2d;&#x5b9e;&#x4f53;&#x7684;&#x516c;&#x94a5;."/>
</node>
<node CREATED="1335260651806" ID="ID_1893328476" MODIFIED="1335260674108" TEXT="&#x521b;&#x5efa;&#x81ea;&#x7b7e;&#x540d;&#x8bc1;&#x4e66;">
<node CREATED="1335260701944" ID="ID_816047497" MODIFIED="1335260783230" TEXT="&#x751f;&#x6210;private key&#xa;openssl genrsa -des3 -passout file:passout.txt -out www.xpfan.com.key 1024"/>
<node CREATED="1335260807671" ID="ID_1700230104" MODIFIED="1335260842699" TEXT="&#x521b;&#x5efa;&#x8bc1;&#x4e66;&#x7b7e;&#x540d;&#x8bf7;&#x6c42;(CSR)&#xa;openssl req -new -key www.xpfan.com.key -passin file:passout.txt -out www.xpfan.com.csr"/>
<node CREATED="1335260859173" ID="ID_188031014" MODIFIED="1335260889314" TEXT="&#x521b;&#x5efa;&#x81ea;&#x7b7e;&#x540d;&#x8bc1;&#x4e66;&#xa;openssl x509 -req -days 365 -in www.xpfan.com.csr -signkey www.xpfan.com.key &#xa;-passin file:passout.txt -out www.xpfan.com.crt"/>
</node>
</node>
</node>
</node>
</map>
