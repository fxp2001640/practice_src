<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1334197289016" ID="ID_1415129615" MODIFIED="1362565806254" TEXT="openwrt">
<node CREATED="1334197927691" FOLDED="true" ID="ID_682440207" MODIFIED="1361951101699" POSITION="right" TEXT="make&#x7cfb;&#x7edf;">
<node CREATED="1334198211390" FOLDED="true" ID="ID_1465613351" MODIFIED="1361951101681" TEXT="Makefile">
<node CREATED="1334198230399" FOLDED="true" ID="ID_557248153" MODIFIED="1342681948147" TEXT="include&#x5305;&#x542b;&#x7684;&#x6587;&#x4ef6;">
<node CREATED="1334286379980" FOLDED="true" ID="ID_1274181227" MODIFIED="1342681948146" TEXT="Makefile&#x7b2c;1&#x8f6e;&#x6267;&#x884c;&#x65f6;&#x5305;&#x542b;&#x7684;&#x6587;&#x4ef6;">
<node CREATED="1334198242480" FOLDED="true" ID="ID_669568320" MODIFIED="1342681948145" TEXT="include/host.mk">
<node CREATED="1334198250097" FOLDED="true" ID="ID_1723767415" MODIFIED="1334286373099" TEXT="tmp/.host.mk">
<node CREATED="1334198274371" ID="ID_650381863" MODIFIED="1334198312591">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      HOST_OS:=Linux
    </p>
    <p>
      HOST_ARCH:=i686
    </p>
    <p>
      GNU_HOST_NAME:=i486-linux-gnu
    </p>
    <p>
      TAR:=/bin/tar
    </p>
    <p>
      FIND:=/usr/bin/find
    </p>
    <p>
      BASH:=/bin/bash
    </p>
    <p>
      FIND_L=/usr/bin/find -L $(1)
    </p>
    <p>
      XARGS:=xargs -r
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1334286450465" ID="ID_82006389" MODIFIED="1334286451695" TEXT="include/debug.mk"/>
<node CREATED="1334286461170" ID="ID_373802922" MODIFIED="1334286462158" TEXT="include/depends.mk"/>
<node CREATED="1334286471042" ID="ID_1050281194" MODIFIED="1334286472190" TEXT="include/toplevel.mk"/>
</node>
<node CREATED="1334286506421" FOLDED="true" ID="ID_1125740235" MODIFIED="1342681948146" TEXT="Makefile&#x7b2c;2&#x8f6e;&#x6267;&#x884c;&#x65f6;&#x5305;&#x542b;&#x7684;&#x6587;&#x4ef6;">
<node CREATED="1334286523830" ID="ID_1933237665" MODIFIED="1334286525044" TEXT="rules.mk"/>
<node CREATED="1334286537959" ID="ID_1525571964" MODIFIED="1334286543348" TEXT="include/depends.mk"/>
<node CREATED="1334286554568" ID="ID_905021856" MODIFIED="1334286559607" TEXT="include/subdir.mk"/>
<node CREATED="1334286569417" ID="ID_709164904" MODIFIED="1334286570896" TEXT="target/Makefile"/>
<node CREATED="1334286579833" ID="ID_1951720805" MODIFIED="1334286581648" TEXT="package/Makefile"/>
<node CREATED="1334286592474" ID="ID_1447650169" MODIFIED="1334286593595" TEXT="tools/Makefile"/>
<node CREATED="1334286602331" ID="ID_893911708" MODIFIED="1334286603527" TEXT="toolchain/Makefile"/>
</node>
</node>
<node CREATED="1334210736352" FOLDED="true" ID="ID_811477135" MODIFIED="1361951101680">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      world: (Makefile:14)
    </p>
    <p>
      &#26681;&#25454;&#21464;&#37327;OPENWRT_BUILD&#20540;&#30340;&#19981;&#21516;,2&#36718;&#36827;&#20837;Makefile&#25191;&#34892;&#36335;&#24452;&#26159;&#19981;&#19968;&#26679;&#30340;
    </p>
    <p>
      &#31532;&#19968;&#36718;&#25191;&#34892;19-29&#20043;&#38388;&#30340;&#20195;&#30721;,&#31532;&#20108;&#36718;&#25191;&#34892;31-99&#20043;&#38388;&#30340;&#20195;&#30721;,
    </p>
  </body>
</html></richcontent>
<node CREATED="1334211128123" FOLDED="true" ID="ID_1401167752" MODIFIED="1361951101680" TEXT="%:: (include/toplevel.mk:133)">
<node CREATED="1334211338105" FOLDED="true" ID="ID_1436398293" MODIFIED="1342681948153" TEXT="@+OPENWRT_BUILD= QUIET=0 remake V=99 -r -s prereq (include/toplevel.mk:134)">
<node CREATED="1334211856509" FOLDED="true" ID="ID_97565334" MODIFIED="1342681948153" TEXT="prereq:: prepare-tmpinfo .config (include/toplevel.mk:129)">
<node CREATED="1334211948995" FOLDED="true" ID="ID_1556791497" MODIFIED="1342681948149" TEXT="prepare-tmpinfo: FORCE (include/toplevel.mk:49)">
<node CREATED="1341299848299" ID="ID_1114072762" LINK="#ID_1304025856" MODIFIED="1341299909027" TEXT="&#x626b;&#x63cf;package"/>
<node CREATED="1341299862137" ID="ID_173092282" LINK="#ID_1304025856" MODIFIED="1341299920650" TEXT="&#x626b;&#x63cf;target"/>
<node CREATED="1341300148998" FOLDED="true" ID="ID_108113595" MODIFIED="1341988162134">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#25195;&#25551;&#21040;&#30340;package&#20449;&#24687;&#38598;&#20013;&#21040;tmp/.packageinfo&#25991;&#20214;&#20013;
    </p>
    <p>
      &#23558;&#25195;&#25551;&#21040;&#30340;target&#20449;&#24687;&#38598;&#20013;&#21040;tmp/.targetinfo&#25991;&#20214;&#20013;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341987583333" ID="ID_1718982637" MODIFIED="1341987726267" TEXT="Source-Makefile : &#x5b9a;&#x4e49;package&#x7684;makefile&#x6587;&#x4ef6;, &#x4ee5;&#x4e0b;&#x4fe1;&#x606f;&#x5747;&#x4ece;&#x6b64;&#x6587;&#x4ef6;&#x4e2d;&#x6536;&#x96c6;"/>
<node CREATED="1341987631587" ID="ID_1946506754" MODIFIED="1341987694338" TEXT="Package : &#x7531;&#x53d8;&#x91cf; PKG_NAME &#x6307;&#x5b9a;"/>
<node CREATED="1341987736767" ID="ID_1024033943" MODIFIED="1341987790424" TEXT="Version : &#x7531;PKG_VERSION - PKG_RELEASE&#x4e24;&#x4e2a;&#x53d8;&#x91cf;&#x7ec4;&#x6210;"/>
<node CREATED="1341987805212" ID="ID_895246061" MODIFIED="1341987825815" TEXT="Depends : &#x7531;&#x53d8;&#x91cf; DEPENDS &#x6307;&#x5b9a;"/>
<node CREATED="1341987837082" ID="ID_1596210421" MODIFIED="1341987839896" TEXT="Provides :"/>
<node CREATED="1341987847962" ID="ID_991243134" MODIFIED="1341987865285" TEXT="Section : &#x7531;&#x53d8;&#x91cf;SECTION&#x6307;&#x5b9a;"/>
<node CREATED="1341987872537" ID="ID_1463805843" MODIFIED="1341987889060" TEXT="Category : &#x7531;&#x53d8;&#x91cf;CATEGORY&#x6307;&#x5b9a;"/>
<node CREATED="1341987896856" ID="ID_175422136" MODIFIED="1341987914794" TEXT="Title : &#x7531;&#x53d8;&#x91cf;TITLE&#x6307;&#x5b9a;"/>
<node CREATED="1341987924103" ID="ID_357637033" MODIFIED="1341987944273" TEXT="Maintainer : &#x7531;&#x53d8;&#x91cf;MAINTAINER&#x6307;&#x5b9a;"/>
<node CREATED="1341987952214" ID="ID_265830673" MODIFIED="1341987973456" TEXT="Source : &#x7531;&#x53d8;&#x91cf;PKG_SOURCE&#x6307;&#x5b9a;"/>
<node CREATED="1341987983957" ID="ID_1118250134" MODIFIED="1341987985896" TEXT="Type :"/>
<node CREATED="1341988008340" ID="ID_1846680230" MODIFIED="1341988029279" TEXT="Kernel-Config : &#x7531;&#x53d8;&#x91cf;KCONFIG&#x6307;&#x5b9a;"/>
<node CREATED="1341988037491" ID="ID_1968212071" MODIFIED="1341988071197" TEXT="Description : &#x7531;&#x5b8f;Package/xxx/description&#x6307;&#x5b9a;"/>
<node CREATED="1341988088289" ID="ID_978132528" MODIFIED="1341988110988" TEXT="http://xxx : &#x7531;&#x53d8;&#x91cf;URL&#x6307;&#x5b9a;"/>
<node CREATED="1341988121951" ID="ID_1875725567" MODIFIED="1341988153930" TEXT="Config : &#x7531;&#x5b8f;Package/xxx/config&#x6307;&#x5b9a;"/>
</node>
<node CREATED="1341300148998" ID="ID_1271641428" MODIFIED="1341300294719">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#25195;&#25551;&#21040;&#30340;package&#30340;&#37197;&#32622;&#36873;&#39033;&#38598;&#20013;&#21040;tmp/.config-package.in&#25991;&#20214;&#20013;
    </p>
    <p>
      &#23558;&#25195;&#25551;&#21040;&#30340;target&#30340;&#37197;&#32622;&#36873;&#39033;&#38598;&#20013;&#21040;tmp/.config-target.in&#25991;&#20214;&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341986188939" FOLDED="true" ID="ID_753247150" MODIFIED="1341989619732" TEXT="&#x5229;&#x7528;tmp/.packageinfo&#x751f;&#x6210;tmp/.packagedeps">
<node CREATED="1341986239258" ID="ID_470564512" MODIFIED="1341987117842">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#29983;&#25104;&#21464;&#37327;package-m&#21644;package-y&#20197;&#36873;&#25321;&#32534;&#35793;&#21738;&#20123;&#21253;
    </p>
    <p>
      package-$(CONFIG_PACKAGE_xxx) += feeds/xxx
    </p>
    <p>
      &#38024;&#23545;tmp/.packageinfo&#37324;&#38754;&#30340;&#27599;&#19968;&#20010;&#21253;&#29983;&#25104;&#19978;&#36848;&#19968;&#34892;&#20449;&#24687;,&#20854;&#20013;
    </p>
    <p>
      CONFIG_PACKAGE_xxx&#30340;xxx&#29992;package info&#30340;Package&#23383;&#27573;&#26367;&#20195;
    </p>
    <p>
      &#32780;feeds/xxx&#25351;&#21521;&#20102;&#36825;&#20010;xxx&#25152;&#22312;&#30340;&#30446;&#24405;, &#30001;package info&#20013;&#30340;Source-Makefile&#25351;&#26126;
    </p>
    <p>
      CONFIG_PACKAGE_xxx&#30340;&#20540;&#26159;m&#36824;&#26159;y&#26159;&#30001;&#37197;&#32622;&#20915;&#23450;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1334223404059" FOLDED="true" ID="ID_1820898341" MODIFIED="1341303109085">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .config: scripts/config/conf prepare-tmpinfo tmp/.prereq-build (include/toplevel.mk:60)
    </p>
    <p>
      &#26816;&#26597;&#26159;&#21542;&#26377;.config&#25991;&#20214;&#22914;&#26524;&#27809;&#26377;&#21017;&#35843;&#29992;make menuconfig&#29983;&#25104;
    </p>
  </body>
</html></richcontent>
<node CREATED="1334223701600" FOLDED="true" ID="ID_1264175054" MODIFIED="1341302850029" TEXT="scripts/config/conf: tmp/.prereq-build: (include/toplevel.mk:39)">
<node CREATED="1334223993332" FOLDED="true" ID="ID_1202276782" MODIFIED="1341302844030" TEXT="tmp/.prereq-build: include/prereq-build.mk (include/toplevel.mk:111)">
<node CREATED="1341300890220" FOLDED="true" ID="ID_280543385" MODIFIED="1341301505481" TEXT="include/prereq-build.mk prereq (include/prereq.mk:11)">
<node CREATED="1341301366306" ID="ID_443358720" MODIFIED="1341301480433">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      nclude/prereq-build.mk
    </p>
    <p>
      &#26816;&#26597;&#26576;&#20123;&#24037;&#20855;&#30340;&#29256;&#26412;&#26159;&#21542;&#27491;&#30830;
    </p>
    <p>
      &#26816;&#26597;&#26576;&#20123;&#24037;&#20855;&#26159;&#21542;&#23384;&#22312;
    </p>
    <p>
      &#26816;&#26597;&#26576;&#20123;&#22836;&#25991;&#20214;&#26159;&#21542;&#23384;&#22312;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1341300904858" ID="ID_800661578" MODIFIED="1341301542355" TEXT="&#x751f;&#x6210;tmp/.prereq-build&#x6587;&#x4ef6;,&#x8868;&#x793a;prereq-build&#x68c0;&#x67e5;&#x5df2;&#x7ecf;&#x5b8c;&#x6210;,&#x8d77;&#x5230;&#x65f6;&#x95f4;&#x6233;&#x7684;&#x4f5c;&#x7528;"/>
</node>
</node>
<node CREATED="1334224144735" ID="ID_535458999" LINK="#ID_1556791497" MODIFIED="1341300485325" TEXT="prepare-tmpinfo: FORCE (include/toplevel.mk:49)"/>
<node CREATED="1334223993332" ID="ID_131832648" LINK="#ID_1202276782" MODIFIED="1334224702149" TEXT="tmp/.prereq-build: include/prereq-build.mk (include/toplevel.mk:111)"/>
</node>
<node CREATED="1334224471269" ID="ID_1136639758" LINK="#ID_1202276782" MODIFIED="1334224694941" TEXT="make  -r -s tmp/.prereq-build OPENWRT_BUILD= QUIET=0"/>
<node CREATED="1334224868113" FOLDED="true" ID="ID_1208308426" MODIFIED="1342681948152" TEXT="make  V=99 -r -s prereq">
<node CREATED="1334225223866" FOLDED="true" ID="ID_1936017910" MODIFIED="1342681948149" TEXT="prereq: wrt_p4_src/staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.target_prereq tmp/.prereq_packages&#xa;(Makefile:73)">
<node CREATED="1334225759615" ID="ID_275232227" MODIFIED="1334225791128" TEXT="wrt_p4_src/staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.target_prereq: wrt_p4_src/tmp/.build .config"/>
<node CREATED="1334225853061" ID="ID_125061868" MODIFIED="1334226075623">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tmp/.prereq_packages: .config (makefile:61)
    </p>
    <p>
      &#22788;&#29702;prereq&#21253;,prereq&#21253;&#21363;&#27491;&#24120;&#21253;&#20043;&#21069;&#22788;&#29702;&#30340;&#21253;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1334211729316" FOLDED="true" ID="ID_1639040228" MODIFIED="1361951101679">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      @+$(SUBMAKE) -r $@ (include/toplevel.mk:134)
    </p>
    <p>
      &#20351;&#29992;&#21629;&#20196;&quot;make V=99&quot;&#26102;&#32763;&#35793;&#20026;&quot;make&#160;&#160;-w -r world&quot;
    </p>
    <p>
      &#31532;2&#36718;&#36827;&#20837;Makefile,&#22240;&#27492;&#26102;OPENWRT_BUILD=1&#25925;&#25191;&#34892;31-99&#20043;&#38388;&#30340;&#20195;&#30721;
    </p>
  </body>
</html></richcontent>
<node CREATED="1334226818120" FOLDED="true" ID="ID_1542892318" MODIFIED="1361951101666" TEXT="world: &#xa;prepare &#xa;$(target/stamp-compile) &#xa;$(package/stamp-cleanup) &#xa;$(package/stamp-compile) &#xa;$(package/stamp-install) &#xa;$(package/stamp-rootfs-prepare) &#xa;$(target/stamp-install) &#xa;FORCE&#xa;(makefile:76)&#xa;&#x53d8;&#x91cf;$(target/stamp-compile) &#x5b9a;&#x4e49;&#x5728;target/Makefile:16, &#xa;&#x5bf9;&#x5e94;&#x6587;&#x4ef6;staging_dir/target-xxx/stamp/.target_compile&#xa;&#xa;&#x53d8;&#x91cf;$(package/stamp-cleanup) &#x5b9a;&#x4e49;&#x5728;package/Makefile:99&#xa;&#x5bf9;&#x5e94;&#x6587;&#x4ef6;staging_dir/target-xxx/stamp/.package_cleanup&#xa;&#xa;&#x53d8;&#x91cf;$(package/stamp-compile) &#x5b9a;&#x4e49;&#x5728;package/Makefile:100&#xa;&#x5bf9;&#x5e94;&#x6587;&#x4ef6;staging_dir/target-xxx/stamp/.package_compile&#xa;&#xa;&#x53d8;&#x91cf;$(package/stamp-install) &#x5b9a;&#x4e49;&#x5728;package/Makefile:101&#xa;&#x5bf9;&#x5e94;&#x6587;&#x4ef6;staging_dir/target-xxx/stamp/.package_install&#xa;&#xa;&#x53d8;&#x91cf;$(package/stamp-rootfs-prepare) &#x5b9a;&#x4e49;&#x5728;package/Makefile:102&#xa;&#x5bf9;&#x5e94;&#x6587;&#x4ef6;staging_dir/target-xxx/stamp/.package_rootfs-prepare&#xa;&#xa;&#x53d8;&#x91cf;$(target/stamp-install) &#x5b9a;&#x4e49;&#x5728;target/Makefile:17&#xa;&#x5bf9;&#x5e94;&#x6587;&#x4ef6;staging_dir/target-xxx/stamp/.target_install&#xa;&#xa;&#x8fd9;6&#x4e2a;target&#x5b9a;&#x4e49;&#x5728;Makefile&#x7684;40-45&#x884c;">
<node CREATED="1334227158190" FOLDED="true" ID="ID_157437390" MODIFIED="1361951101665">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      prepare:
    </p>
    <p>
      $(target/stamp-compile)
    </p>
    <p>
      .config
    </p>
    <p>
      $(tools/stamp-install)
    </p>
    <p>
      $(toolchain/stamp-install)
    </p>
    <p>
      (makefile:51,75)
    </p>
    <p>
      &#21464;&#37327;$(target/stamp-compile)&#23450;&#20041;&#22312;target/Makefile:16
    </p>
    <p>
      &#23545;&#24212;&#25991;&#20214;wrt_p4_src/staging_dir/target-xxx/stamp/.target_compile
    </p>
    <p>
      
    </p>
    <p>
      &#21464;&#37327;$(tools/stamp-install)&#23450;&#20041;&#22312;tools/Makefile:104
    </p>
    <p>
      &#23545;&#24212;&#25991;&#20214;wrt_p4_src/staging_dir/target-xxx/stamp/.tools_install_nnynn
    </p>
    <p>
      
    </p>
    <p>
      &#21464;&#37327;$(toolchain/stamp-install)&#23450;&#20041;&#22312;toolchain/Makefile:74
    </p>
    <p>
      &#23545;&#24212;&#25991;&#20214;wrt_p4_src/staging_dir/toolchain-xxx/stamp/.toolchain_install
    </p>
    <p>
      
    </p>
  </body>
</html></richcontent>
<node CREATED="1334283491700" FOLDED="true" ID="ID_1725341318" MODIFIED="1361951101664">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      wrt_p4_src/staging_dir/target-xxx/stamp/.target_compile:
    </p>
    <p>
      wrt_p4_src/tmp/.build
    </p>
    <p>
      wrt_p4_src/staging_dir/toolchain-xxx/stamp/.toolchain_install
    </p>
    <p>
      wrt_p4_src/staging_dir/target-xxx/stamp/.tools_install_nnynn
    </p>
    <p>
      wrt_p4_src/build_dir/target-xxx/.prepared
    </p>
    <p>
      (Makefile:40, target/Makefile:15)
    </p>
    <p>
      &#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#24403;&#26102;&#38388;&#25139;wrt_p4_src/staging_dir/target-xxx/stamp/.target_compile&#27604;&#36739;&#26087;&#26102;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#25191;&#34892;make target/compile
    </p>
    <p>
      2, &#26356;&#26032;&#26102;&#38388;&#25139;wrt_p4_src/staging_dir/target-xxx/stamp/.target_compile
    </p>
  </body>
</html></richcontent>
<node CREATED="1334283942371" ID="ID_1862621598" MODIFIED="1334283967135">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      wrt_p4_src/tmp/.build
    </p>
    <p>
      &#24050;&#23436;&#25104;,&#35265;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1334283870878" FOLDED="true" ID="ID_481742971" MODIFIED="1354010451152">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      wrt_p4_src/staging_dir/toolchain-xxx/stamp/.toolchain_install:
    </p>
    <p>
      wrt_p4_src/tmp/.build
    </p>
    <p>
      wrt_p4_src/staging_dir/toolchain-xxx/stamp/.gcc-initial_installed
    </p>
    <p>
      wrt_p4_src/staging_dir/target-xxx/stamp/.tools_install_nnynn
    </p>
    <p>
      (toolchain/Makefile:74, Makefile:39)
    </p>
    <p>
      &#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#24403;&#26102;&#38388;&#25139;staging_dir/toolchain-xxx/stamp/.toolchain_install&#27604;&#36739;&#26087;&#26102;&#25191;&#34892;make tools/install
    </p>
    <p>
      2, &#26356;&#26032;&#26102;&#38388;&#25139;staging_dir/toolchain-xxx/stamp/.toolchain_install
    </p>
  </body>
</html></richcontent>
<node CREATED="1334283942371" ID="ID_198210146" MODIFIED="1334283967135">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      wrt_p4_src/tmp/.build
    </p>
    <p>
      &#24050;&#23436;&#25104;,&#35265;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1334284212518" ID="ID_993685386" MODIFIED="1334299109515" TEXT="gcc&#x5b89;&#x88c5;&#x5b8c;&#x6210;&#x540e;&#x4f1a;&#x521b;&#x5efa;&#x6587;&#x4ef6;&#xa;wrt_p4_src/staging_dir/toolchain-xxx/stamp/.gcc-initial_installed"/>
<node CREATED="1334284295708" ID="ID_962410430" MODIFIED="1334299156246" TEXT="wrt_p4_src/staging_dir/target-xxx/stamp/.tools_install_nnynn: wrt_p4_src/tmp/.build&#xa;(tools/Makefile:104)"/>
</node>
<node CREATED="1334299361885" ID="ID_1425649041" LINK="#ID_962410430" MODIFIED="1334299381438" TEXT="wrt_p4_src/staging_dir/target-xxx/stamp/.tools_install_nnynn"/>
<node CREATED="1334299481925" ID="ID_1140600991" MODIFIED="1341309578989">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      wrt_p4_src/build_dir/target-xxx/.prepared : Makefile
    </p>
    <p>
      (Makefile:47)
    </p>
    <p>
      &#26356;&#26032;build_dir/target-xxx/.prepared&#30340;&#26102;&#38388;&#25139;&#34920;&#31034;target&#24050;&#20934;&#22791;&#22909;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341481052662" FOLDED="true" ID="ID_1935996139" MODIFIED="1361951101663">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      target/compile:
    </p>
    <p>
      wrt_p4_src/tmp/.build
    </p>
    <p>
      wrt_p4_src/staging_dir/toolchain-mips_xxx/stamp/.toolchain_install
    </p>
    <p>
      wrt_p4_src/staging_dir/toolchain-mips_xxx/stamp/.tools_install_nnnnn
    </p>
    <p>
      wrt_p4_src/build_dir/target-xxx/.prepared
    </p>
    <p>
      target/Makefile:21&#30340;subdir&#20026;target&#30340;&#21508;&#23376;&#30446;&#24405;&#23450;&#20041;&#20102;compile&#30446;&#26631;:
    </p>
    <p>
      target/linux/compile
    </p>
  </body>
</html></richcontent>
<node CREATED="1341481066132" FOLDED="true" ID="ID_1083854307" MODIFIED="1361951101662">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      target/linux/compile
    </p>
    <p>
      &#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, $(SUBMAKE) -C target/linux compile BUILD_VARIANT=&quot;&quot;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341482419711" FOLDED="true" ID="ID_1930392512" MODIFIED="1361951101661">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      compile:
    </p>
    <p>
      &#160;&#160;&#160;&#160;make -C $(BOARD) compile
    </p>
    <p>
      (target/linux/Makefile:12)
    </p>
  </body>
</html></richcontent>
<node CREATED="1341483710418" ID="ID_165173827" LINK="#ID_139852251" MODIFIED="1341909986561">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      compile&#26159;&#22312;target/linux/db12x-2.6.31/Makefile:38&#20013;
    </p>
    <p>
      &#30001;&#35843;&#29992;BuildTarget&#26469;&#23450;&#20041;&#29983;&#25104;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1341985133989" ID="ID_1303857620" LINK="#ID_1935996139" MODIFIED="1341985156612" TEXT="$(target/stamp-compile) "/>
<node CREATED="1341985180131" ID="ID_1537841264" MODIFIED="1341985181813" TEXT="$(package/stamp-cleanup) "/>
<node CREATED="1341985212642" FOLDED="true" ID="ID_776931036" MODIFIED="1342681948157">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      $(package/stamp-compile)&#160;:
    </p>
    <p>
      tmp/.build
    </p>
    <p>
      staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.target_compile
    </p>
    <p>
      staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.package_cleanup
    </p>
    <p>
      (package/Makefile:100, Makefile:42)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#24403;&#26102;&#38388;&#25139;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.package_compile&#27604;&#36739;&#26087;&#26102;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#25191;&#34892;make package/compile
    </p>
    <p>
      2, &#26356;&#26032;&#26102;&#38388;&#25139;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.package_compile
    </p>
  </body>
</html></richcontent>
<node CREATED="1341993384768" FOLDED="true" ID="ID_1476860470" MODIFIED="1342089092828">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      package/compile :
    </p>
    <p>
      package/xxx1/compile
    </p>
    <p>
      package/xxxn/compile
    </p>
    <p>
      (package/Makefile:104)
    </p>
    <p>
      &#20854;&#20013;xxx1,xxxn&#36873;&#25321;&#21738;&#20123;package&#26159;
    </p>
    <p>
      &#30001;&#21464;&#37327;package/buildirs&#25351;&#23450;&#30340;
    </p>
    <p>
      (package/Makefile:11)
    </p>
    <p>
      &#32780;package-y&#21017;&#26159;&#30001;&#25991;&#20214;tmp/.packagedeps&#23450;&#20041;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341993515083" ID="ID_1746657023" MODIFIED="1341993666144">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      package/xxx1/compile
    </p>
    <p>
      (package/Makefile:104)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, make -C package/xxx1 compile
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1342085168983" FOLDED="true" ID="ID_1551959357" MODIFIED="1342681948157">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      $(package/stamp-install)&#160;: $(package/stamp-compile)&#160;
    </p>
    <p>
      (package/Makefile:101, Makefile:43)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#24403;&#26102;&#38388;&#25139;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.package_install&#27604;&#36739;&#26087;&#26102;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#25191;&#34892;make package/install
    </p>
    <p>
      2, &#26356;&#26032;&#26102;&#38388;&#25139;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.package_install
    </p>
  </body>
</html></richcontent>
<node CREATED="1341993384768" FOLDED="true" ID="ID_1643778315" MODIFIED="1342089092180">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      package/install :
    </p>
    <p>
      package/xxx1/install
    </p>
    <p>
      package/xxxn/install
    </p>
    <p>
      (package/Makefile:104)
    </p>
    <p>
      &#20854;&#20013;xxx1,xxxn&#36873;&#25321;&#21738;&#20123;package&#26159;
    </p>
    <p>
      &#30001;&#21464;&#37327;package/buildirs&#25351;&#23450;&#30340;
    </p>
    <p>
      (package/Makefile:11)
    </p>
    <p>
      &#32780;package-y&#21017;&#26159;&#30001;&#25991;&#20214;tmp/.packagedeps&#23450;&#20041;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341993515083" ID="ID_1584911204" LINK="#ID_1881202412" MODIFIED="1342087503787">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      package/xxx1/install
    </p>
    <p>
      (package/Makefile:104)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, make -C package/xxx1 install
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1342087710483" ID="ID_377064377" MODIFIED="1342088447401">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      package/rootfs-prepare : tmp/.build
    </p>
    <p>
      (package/Makefile:64)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, make package/preconfig(&#27492;&#30446;&#26631;&#19981;&#23384;&#22312;)
    </p>
    <p>
      2,&#20934;&#22791;&#30446;&#24405;TARGET_DIR = build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#21024;&#38500;&#27492;&#30446;&#24405;&#20013;&#19968;&#20123;&#19981;&#24517;&#35201;&#30340;&#25991;&#20214;,&#22914;.svn&#31561;, &#21024;&#38500;&#30446;&#24405;$(TARGET_DIR)/usr/lib/opkg
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342088482004" FOLDED="true" ID="ID_1416751795" MODIFIED="1342681948160">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      $(target/stamp-install) :
    </p>
    <p>
      $(package/stamp-compile)
    </p>
    <p>
      $(package/stamp-install)
    </p>
    <p>
      $(package/stamp-rootfs-prepare)
    </p>
    <p>
      $(target/stamp-compile)&#160;&#160;
    </p>
    <p>
      tmp/.build
    </p>
    <p>
      (target/Makefile:19, Makefile:45)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#24403;&#26102;&#38388;&#25139;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.target_install&#27604;&#36739;&#26087;&#26102;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#25191;&#34892;make target/install
    </p>
    <p>
      2, &#26356;&#26032;&#26102;&#38388;&#25139;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.target_install
    </p>
  </body>
</html></richcontent>
<node CREATED="1342089071773" FOLDED="true" ID="ID_1898979411" MODIFIED="1342681948159">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      target/install : target/linux/install
    </p>
    <p>
      target/Makefile:21&#30340;subdir&#20026;target&#30340;&#21508;&#23376;&#30446;&#24405;&#23450;&#20041;&#20102;install&#30446;&#26631;:
    </p>
    <p>
      target/linux/install
    </p>
  </body>
</html></richcontent>
<node CREATED="1342089120827" FOLDED="true" ID="ID_1244708564" MODIFIED="1342681948158">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      target/linux/install
    </p>
    <p>
      &#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, $(SUBMAKE) -C target/linux install BUILD_VARIANT=&quot;&quot;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341482419711" FOLDED="true" ID="ID_1396513747" MODIFIED="1342681948158">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      install:
    </p>
    <p>
      &#160;&#160;&#160;&#160;make -C $(BOARD) install
    </p>
    <p>
      (target/linux/Makefile:12)
    </p>
  </body>
</html></richcontent>
<node CREATED="1342089370881" ID="ID_1095211486" LINK="#ID_1060510585" MODIFIED="1342089498980">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      install&#26159;&#22312;target/linux/db12x-2.6.31/Makefile:38&#20013;
    </p>
    <p>
      &#30001;&#35843;&#29992;BuildTarget&#26469;&#23450;&#20041;&#29983;&#25104;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1334284835265" FOLDED="true" ID="ID_469036280" MODIFIED="1361951101698" TEXT="&#x5e38;&#x7528;&#x5b8f;">
<node CREATED="1334284851442" FOLDED="true" ID="ID_73054486" MODIFIED="1342681948177">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      stampfile &lt;subdir&gt; &lt;name&gt; &lt;target&gt; &lt;depends&gt; &lt;config options&gt; &lt;stampfile location&gt;
    </p>
    <p>
      &#27492;&#23439;&#29992;&#20110;&#23450;&#20041;&#19968;&#20010;&#21464;&#37327;,&#20197;&#21450;&#21464;&#37327;&#23545;&#24212;&#30340;target.&#20854;&#20013;&#21464;&#37327;&#20026;:&lt;subdir&gt;/stamp-&lt;target&gt;&#21464;&#37327;&#30340;&#20540;&#23545;&#24212;&#20102;
    </p>
    <p>
      &#19968;&#20010;&#30495;&#23454;&#30340;&#25991;&#20214;&#21363;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.&lt;name&gt;_&lt;target&gt;
    </p>
    <p>
      &#32780;&#21464;&#37327;&#23545;&#24212;&#30340;target&#22312;&#26816;&#26597;&#20381;&#36182;&#20851;&#31995;&#21518;&#26356;&#26032;&#21464;&#37327;&#23545;&#24212;&#30495;&#23454;&#25991;&#20214;&#30340;&#26102;&#38388;&#25139;,&#20197;&#21033;&#20110;make&#23545;&#27604;&#26032;&#26087;
    </p>
    <p>
      &#26102;&#38388;&#25139;&#22312;make $(&lt;subdir&gt;/flags-&lt;target&gt;) &lt;subdir&gt;/&lt;target&gt;&#20043;&#21518;&#25165;&#36827;&#34892;&#26356;&#26032;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341467208924" ID="ID_1938637004" MODIFIED="1341467327881">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23450;&#20041;&#21464;&#37327; : &lt;subdir&gt;/stamp-&lt;target&gt;
    </p>
    <p>
      &#21464;&#37327;&#30340;&#20540;&#20026;: staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.&lt;name&gt;_&lt;target&gt;
    </p>
    <p>
      &#23427;&#23545;&#24212;&#19968;&#20010;&#30495;&#23454;&#30340;&#26102;&#38388;&#25139;&#25991;&#20214;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341467499625" ID="ID_1641488476" MODIFIED="1341467865008">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23450;&#20041;&#30446;&#26631; : &lt;subdir&gt;/stamp-&lt;target&gt;
    </p>
    <p>
      &#30446;&#26631;&#20381;&#36182;&#20110;: tmp/.build &lt;depends&gt;
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;: 1, &#24403;&#23450;&#20041;&#30340;&#26102;&#38388;&#25139;&#25991;&#20214;&#27604;&#19978;&#36848;2&#20010;&#20381;&#36182;&#25991;&#20214;&#26087;&#26102;, &#25191;&#34892;&#21629;&#20196;make &lt;subdir&gt;/&lt;target&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;2, &#26356;&#26032;&#26102;&#38388;&#25139;&#25991;&#20214;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341467208924" ID="ID_464658564" MODIFIED="1341468114752">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23450;&#20041;&#21464;&#37327; : &lt;subdir&gt;/clean
    </p>
    <p>
      &#21464;&#37327;&#30340;&#20540;&#20026;: &lt;subdir&gt;/stamp-&lt;target&gt;/clean
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341467499625" ID="ID_1445134972" MODIFIED="1341468186543">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23450;&#20041;&#30446;&#26631; : &lt;subdir&gt;/stamp-&lt;target&gt;/clean
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;: 1, rm -f &lt;subdir&gt;/stamp-&lt;target&gt;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1334302643632" FOLDED="true" ID="ID_1993294001" MODIFIED="1353981983389">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      subdir &lt;subdir&gt;
    </p>
    <p>
      &#26631;&#20934;&#30340;&#23884;&#22871;&#30446;&#24405;&#32534;&#35793;&#26041;&#27861;,
    </p>
    <p>
      &#23376;&#30446;&#24405;&#30001;&#21464;&#37327;&lt;subdir&gt;/builddirs&#25351;&#23450;, &#32534;&#35793;&#30446;&#26631;&#30001;&#21464;&#37327;SUBTARGETS&#25351;&#23450;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341992584127" ID="ID_1854229907" MODIFIED="1341993073319">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20030;&#20363;&#32780;&#35328;, &lt;subdir&gt;&#20026;package, &#32780;&lt;subdir&gt;/builddirs&#20026; xxx1 xxx2, &#32534;&#35793;&#30446;&#26631;&#20026;compile install
    </p>
    <p>
      &#21017;&#23545;subdir &lt;subdir&gt;&#30340;&#35843;&#29992;&#23558;&#20250;&#20135;&#29983;&#20197;&#19979;&#20960;&#20010;&#30446;&#26631;:
    </p>
    <p>
      package/compile : package/xxx1/compile package/xxx2/compile
    </p>
    <p>
      package/install : package/xxx1/install package/xxx2/install
    </p>
    <p>
      package/xxx1/compile :
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;make -C package/xxx1 compile
    </p>
    <p>
      package/xxx1/install :
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;make -C package/xxx1 install
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1334303322639" ID="ID_811248937" MODIFIED="1334303324983" TEXT="BuildPackage"/>
<node CREATED="1334303334480" FOLDED="true" ID="ID_602533383" MODIFIED="1354001526557" TEXT="BuildTarget">
<node CREATED="1341474405615" FOLDED="true" ID="ID_121372684" MODIFIED="1354001525677" TEXT="&#x9700;&#x8981;&#x7528;&#x5230;&#x7684;&#x5b9a;&#x4e49;">
<node CREATED="1341474793200" ID="ID_1213070907" MODIFIED="1341474802770" TEXT="ARCH:=mips"/>
<node CREATED="1341474816221" ID="ID_1052984847" MODIFIED="1341474817720" TEXT="BOARD:=db12x-2.6.31"/>
<node CREATED="1341474831483" ID="ID_768540907" MODIFIED="1341474838567" TEXT="BOARDNAME:=DB12x-2.6.31"/>
<node CREATED="1341474857448" ID="ID_93192439" MODIFIED="1341474858803" TEXT="FEATURES:=squashfs jffs2"/>
<node CREATED="1341474875878" ID="ID_1879019917" MODIFIED="1341474886828" TEXT="CFLAGS:=-Os -pipe -mips32r2 -mtune=74kc"/>
<node CREATED="1341474904898" ID="ID_519508994" MODIFIED="1341474906926" TEXT="SUBTARGETS:=generic"/>
<node CREATED="1341474917537" ID="ID_1706521903" MODIFIED="1341474919236" TEXT="LINUX_VERSION:=2.6.31"/>
<node CREATED="1341474928496" ID="ID_1851930123" MODIFIED="1341474930315" TEXT="DEVICE_TYPE:=bridge"/>
<node CREATED="1341475208030" ID="ID_1781505153" MODIFIED="1341475229223" TEXT="DEFAULT_PACKAGES += hostapd-mini"/>
<node CREATED="1341474960908" ID="ID_778281857" MODIFIED="1341803998367" TEXT="Target/Description"/>
<node CREATED="1341474971706" FOLDED="true" ID="ID_77561571" MODIFIED="1341974110454" TEXT="$(eval $(call BuildTarget))">
<node CREATED="1341475749420" ID="ID_356465984" LINK="#ID_1658866871" MODIFIED="1341475898410">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24212;&#22312;SUBTARGETS&#19979;&#25918;&#19968;&#20010;config-&lt;LINUX_VERSION&gt;&#30340;&#37197;&#32622;&#25991;&#20214;
    </p>
    <p>
      &#37324;&#38754;&#20026;&#25903;&#25345;&#27492;board&#24517;&#39035;&#30340;&#20869;&#26680;&#37197;&#32622;&#36873;&#39033;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341475965586" ID="ID_1954877568" MODIFIED="1341476106730">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#38656;&#35201;&#23545;&#20869;&#26680;&#25171;&#34917;&#19969;&#21017;&#24212;&#22312;xxx-board&#30446;&#24405;&#19979;&#21019;&#24314;patches-&lt;LINUX_VERSION&gt;&#30446;&#24405;
    </p>
    <p>
      &#20854;&#20013;&#20026;&#38656;&#35201;&#25171;&#19978;&#30340;&#34917;&#19969;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341478127690" ID="ID_1235655536" LINK="#ID_1579253123" MODIFIED="1341478171301" TEXT="&#x5fc5;&#x987b;&#x521b;&#x5efa;&#x6587;&#x4ef6;xxx-board/image/Makefile"/>
</node>
</node>
</node>
<node CREATED="1341476563065" FOLDED="true" ID="ID_1323817059" MODIFIED="1342681948180" TEXT="BuildImage">
<node CREATED="1341915618691" ID="ID_671598100" MODIFIED="1341915628174" TEXT="&#x5177;&#x4f53;&#x5185;&#x5bb9;"/>
<node CREATED="1341915629523" FOLDED="true" ID="ID_365166559" MODIFIED="1342681948180" TEXT="&#x9700;&#x8981;&#x7528;&#x5230;&#x7684;&#x5b9a;&#x4e49;">
<node CREATED="1341974869689" ID="ID_407648058" MODIFIED="1341976265661" TEXT="JFFS2_BLOCKSIZE : 64k 128k-nand"/>
<node CREATED="1341974574372" ID="ID_1767417406" MODIFIED="1341974659499">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      CONFIG_BIG_ENDIAN
    </p>
    <p>
      &#30830;&#23450;&#20102;JFFS2OPTS&#21644;SQUASHFS_OPTS
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341974758541" ID="ID_249037693" MODIFIED="1341974820461">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      CONFIG_LINUX_xxx
    </p>
    <p>
      &#30830;&#23450;&#20102;USE_SQUASHFS3
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341975031826" ID="ID_1459374269" MODIFIED="1341975033141" TEXT="CONFIG_TARGET_ROOTFS_JFFS2"/>
<node CREATED="1341975044098" ID="ID_828395703" MODIFIED="1341975045320" TEXT="CONFIG_TARGET_ROOTFS_SQUASHFS"/>
<node CREATED="1341977555615" ID="ID_325904970" MODIFIED="1341977802000">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Image/BuildKernel : &#20027;&#35201;&#26159;&#23545;&#24050;&#29983;&#25104;&#30340;&#20869;&#26680;&#38236;&#20687;&#25991;&#20214;&#36827;&#34892;&#21387;&#32553;,
    </p>
    <p>
      &#21487;&#20197;&#35843;&#29992; CompressLzma&#21644;MkImageLzma&#21327;&#21161;&#22788;&#29702;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341977540751" ID="ID_1956817866" MODIFIED="1341978017889" TEXT="Image/Build : &#x4e3b;&#x8981;&#x662f;&#x5c06;&#x5df2;&#x751f;&#x6210;&#x7684;&#x5185;&#x6838;&#x955c;&#x50cf;&#x6587;&#x4ef6;&#x548c;&#x6839;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x7ec4;&#x5408;&#x6210;&#x5347;&#x7ea7;&#x6587;&#x4ef6;"/>
</node>
</node>
<node CREATED="1341482190492" FOLDED="true" ID="ID_551793847" MODIFIED="1361951101697" TEXT="include/target">
<node CREATED="1341482218104" ID="ID_1699024923" MODIFIED="1341482954769" TEXT="PLATFORM_DIR = target/linux/$(BOARD) &#x5373;target/linux/db12x-2.6.31"/>
<node CREATED="1341482670481" ID="ID_1670408568" MODIFIED="1341482818897" TEXT="SUBTARGET = generic &#x5373;target/linux/$(BOARD)&#x4e0b;&#x6709;target.mk&#x6587;&#x4ef6;&#x7684;&#x5b50;&#x76ee;&#x5f55;"/>
<node CREATED="1341482890390" ID="ID_908934635" MODIFIED="1341483071315" TEXT="TARGETID = $(BOARD)/$(SUBTARGET) &#x5373;db12x-2.6.31/generic"/>
<node CREATED="1341483041444" ID="ID_181697314" MODIFIED="1341483089912" TEXT="PLATFORM_SUBDIR = $(PLATFORM_DIR)/$(SUBTARGET), &#x5373;target/linux/db12x-2.6.31/generic"/>
<node CREATED="1341483266808" ID="ID_1328320487" MODIFIED="1341483278434" TEXT="include target/linux/db12x-2.6.31/generic/target.mk"/>
<node CREATED="1341483266808" ID="ID_220251315" MODIFIED="1341804410703" TEXT="include target/linux/db12x-2.6.31/generic/profiles/*.mk"/>
<node CREATED="1341804483526" ID="ID_28217540" MODIFIED="1341804494925" TEXT="include include/kernel-version.mk"/>
<node CREATED="1341804510149" ID="ID_1761644981" MODIFIED="1341804529874" TEXT="GENERIC_PLATFORM_DIR = target/linux/generic-2.6"/>
<node CREATED="1341804538756" ID="ID_401261829" MODIFIED="1341804555862" TEXT="GENERIC_PATCH_DIR = target/linux/generic-2.6/patches"/>
<node CREATED="1341804564083" ID="ID_40220097" MODIFIED="1341804579240" TEXT="GENERIC_FILES_DIR = target/linux/generic-2.6/files"/>
<node CREATED="1341804695181" ID="ID_1966401564" MODIFIED="1341804697091" TEXT="GENERIC_LINUX_CONFIG"/>
<node CREATED="1341804703805" ID="ID_223656965" MODIFIED="1341804705683" TEXT="LINUX_CONFIG"/>
<node CREATED="1341804750635" ID="ID_1156986603" MODIFIED="1341804752833" TEXT="LINUX_SUBCONFIG"/>
<node CREATED="1341804787402" ID="ID_108150969" MODIFIED="1341804788919" TEXT="LINUX_CONFCMD"/>
<node CREATED="1341804887766" ID="ID_1024060427" MODIFIED="1341804896097" TEXT="include include/kernel.mk"/>
<node CREATED="1341804887766" ID="ID_943263736" MODIFIED="1341804918138" TEXT="include include/kernel-build.mk"/>
<node CREATED="1341804931972" FOLDED="true" ID="ID_1091213641" MODIFIED="1361951101695" TEXT="BuildTarget = BuildKernel">
<node CREATED="1341814076333" FOLDED="true" ID="ID_1263383881" MODIFIED="1361951101695" TEXT="&#x5177;&#x4f53;&#x5185;&#x5bb9;">
<node CREATED="1354005147162" ID="ID_986065004" MODIFIED="1354005423821">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Build/Quilt(include/quilt.mk:167)
    </p>
    <p>
      &#21363;Quilt/Template(include/quilt.mk:127)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1354000948743" ID="ID_1548288793" MODIFIED="1354000983131" TEXT="$(call Download,kernel)"/>
<node CREATED="1341814181961" FOLDED="true" ID="ID_1181880276" MODIFIED="1361951101681" TEXT="STAMP_PREPARED = build_dir/linux-ar71xx_generic/linux-3.3.8/.prepared&#xa;&#x76ee;&#x6807;&#x5bf9;&#x5e94;&#x4e86;&#x540c;&#x8def;&#x5f84;&#x7684;&#x65f6;&#x95f4;&#x6233;&#x6587;&#x4ef6;, &#x6267;&#x884c;&#x76ee;&#x6807;&#x7684;&#x547d;&#x4ee4;&#x540e;&#x4f1a;&#x66f4;&#x65b0;&#x6b64;&#x6587;&#x4ef6;&#x7684;&#x65f6;&#x95f4;&#x6233;&#xa;(include/kernel-build.mk:65)&#xa;&#x9700;&#x8981;&#x6267;&#x884c;&#x7684;&#x547d;&#x4ee4;:&#xa;1, Kernel/Prepare &#x6b64;&#x5373; Kernel/Prepare/Default (include/kernel-defaults.mk:43)&#xa;2, &#x66f4;&#x65b0;&#x6587;&#x4ef6;build_dir/linux-ar71xx_generic/linux-3.3.8/.prepared&#x7684;&#x65f6;&#x95f4;&#x6233;">
<node CREATED="1341814424015" ID="ID_1508307877" MODIFIED="1341814445907">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      LINUX_DIR = $(KERNEL_BUILD_DIR)/linux-$(LINUX_VERSION)
    </p>
    <p>
      include/kernel.mk:38
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1354002074728" ID="ID_1450010605" MODIFIED="1354002174193" TEXT="1, &#x5c06;dl&#x76ee;&#x5f55;&#x4e0b;&#x4e0b;&#x8f7d;&#x7684;linux-3.3.8.tar.bz2&#x538b;&#x7f29;&#x5305;&#x89e3;&#x538b;&#x5230;build_dir/linux-ar71xx_generic/linux-3.3.8"/>
<node CREATED="1354002201241" FOLDED="true" ID="ID_1287699210" MODIFIED="1354004217220" TEXT="2, &#x8c03;&#x7528;Kernel/Patch&#x5373;Kernel/Patch/Default(include/quilt.mk:92)">
<node CREATED="1354002321065" ID="ID_760686491" MODIFIED="1354002369233" TEXT="1, rm -rf build_dir/linux-ar71xx_generic/linux-3.3.8/patches"/>
<node CREATED="1354002321065" ID="ID_657391961" MODIFIED="1354002394438" TEXT="2, mkdir -p build_dir/linux-ar71xx_generic/linux-3.3.8/patches"/>
<node CREATED="1354002415786" ID="ID_835970306" MODIFIED="1354002588969">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3, &#23558;&#20197;&#19979;&#30446;&#24405;&#20013;&#30340;&#25991;&#20214;&#22797;&#21046;&#21040;build_dir/linux-ar71xx_generic/linux-3.3.8
    </p>
    <p>
      &#160;&#160;&#160;&#160;3.1 target/linux/generic/files
    </p>
    <p>
      &#160;&#160;&#160;&#160;3.2 target/linux/ar71xx/files
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1354003203518" ID="ID_674961679" MODIFIED="1354003308379" TEXT="4, &#x5220;&#x9664;build_dir/linux-ar71xx_generic/linux-3.3.8&#x76ee;&#x5f55;&#x4e0b;patch&#x8fc7;&#x7a0b;&#x4e2d;&#x9057;&#x7559;&#x7684;&#x6587;&#x4ef6;: *.rej, *.orig"/>
<node CREATED="1354003908930" ID="ID_1643245691" MODIFIED="1354004147379" TEXT="5, &#x5c06;target/linux/generic/patches-3.3&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x8865;&#x4e01;patch&#x5230;&#xa;    &#x5185;&#x6838;&#x76ee;&#x5f55;build_dir/linux-ar71xx_generic/linux-3.3.8&#xa;    &#x6b64;&#x79cd;&#x8865;&#x4e01;&#x79f0;&#x4e3a;generic&#x8865;&#x4e01;"/>
<node CREATED="1354003908930" ID="ID_861081782" MODIFIED="1354004112811" TEXT="6, &#x5c06;target/linux/ar71xx/patches-3.3&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x8865;&#x4e01;patch&#x5230;&#xa;    &#x5185;&#x6838;&#x76ee;&#x5f55;build_dir/linux-ar71xx_generic/linux-3.3.8&#xa;    &#x6b64;&#x79cd;&#x8865;&#x4e01;&#x79f0;&#x4e3a;platform&#x8865;&#x4e01;"/>
</node>
<node CREATED="1354004260004" ID="ID_288378451" MODIFIED="1354004284832" TEXT="3, &#x66f4;&#x65b0;&#x6587;&#x4ef6;build_dir/linux-ar71xx_generic/linux-3.3.8/.quilt_used&#x7684;&#x65f6;&#x95f4;&#x6233;"/>
</node>
<node CREATED="1341823962632" ID="ID_433812769" MODIFIED="1341824007012" TEXT="&#x76ee;&#x6807; build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/symtab.txt"/>
<node CREATED="1341823962632" ID="ID_340249720" MODIFIED="1341824027538" TEXT="&#x76ee;&#x6807; build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/symtab.h"/>
<node CREATED="1341824075155" FOLDED="true" ID="ID_784224808" LINK="#ID_689530214" MODIFIED="1361951101686" TEXT="&#x76ee;&#x6807; STAMP_CONFIGURED = build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.configured :&#xa;build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.prepared&#xa;$(LINUX_KCONFIG_LIST)&#xa;.config&#xa;build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.quilt_checked&#xa;&#x76ee;&#x6807;&#x5bf9;&#x5e94;&#x4e86;&#x540c;&#x8def;&#x5f84;&#x7684;&#x65f6;&#x95f4;&#x6233;&#x6587;&#x4ef6;, &#x6267;&#x884c;&#x76ee;&#x6807;&#x7684;&#x547d;&#x4ee4;&#x540e;&#x4f1a;&#x66f4;&#x65b0;&#x6b64;&#x6587;&#x4ef6;&#x7684;&#x65f6;&#x95f4;&#x6233;&#xa;(include/kernel-build.mk:99, include/quilt.mk:128)&#xa;&#x8981;&#x6267;&#x884c;&#x7684;&#x547d;&#x4ee4;:&#xa;1, Kernel/Configure = $(call Kernel/Configure/Default) (include/kernel-build.mk:25)">
<node CREATED="1341824282715" ID="ID_181776127" LINK="#ID_1181880276" MODIFIED="1341824290451" TEXT="STAMP_PREPARED"/>
<node CREATED="1354011721231" FOLDED="true" ID="ID_1361737545" MODIFIED="1354012033001">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      $(LINUX_KCONFIG_LIST) &#20869;&#26680;&#37197;&#32622;&#25991;&#20214;&#21015;&#34920;,&#21253;&#25324;:
    </p>
    <p>
      generic&#30340; : target/linux/generic/config-3.3
    </p>
    <p>
      platform&#30340; : target/linux/ar71xx/config-3.3
    </p>
    <p>
      subtarget&#30340; : target/linux/ar71xx/generic/config-default
    </p>
  </body>
</html></richcontent>
<node CREATED="1341824343577" ID="ID_113017552" MODIFIED="1342089858843" TEXT="$(GENERIC_LINUX_CONFIG) = target/linux/generic-2.6/config-2.6.31"/>
<node CREATED="1341824332473" ID="ID_440599712" MODIFIED="1342089833063" TEXT="$(LINUX_CONFIG) = target/linux/db12x-2.6.31/generic/config-2.6.31"/>
</node>
<node CREATED="1341824356648" ID="ID_729980768" MODIFIED="1341824366772" TEXT=".config"/>
<node CREATED="1354012292226" ID="ID_892741680" MODIFIED="1354012294322" TEXT="build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.quilt_checked"/>
</node>
<node CREATED="1341824502978" FOLDED="true" ID="ID_257306006" LINK="#ID_1141203946" MODIFIED="1361951101692">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.modules :
    </p>
    <p>
      build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.configured
    </p>
    <p>
      build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.config
    </p>
    <p>
      &#30446;&#26631;&#23545;&#24212;&#20102;&#21516;&#36335;&#24452;&#30340;&#26102;&#38388;&#25139;&#25991;&#20214;, &#25191;&#34892;&#30446;&#26631;&#30340;&#21629;&#20196;&#21518;&#20250;&#26356;&#26032;&#27492;&#25991;&#20214;&#30340;&#26102;&#38388;&#25139;
    </p>
    <p>
      (include/kernel-build.mk:103)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, Kernel/CompileModules &#21363; Kernel/CompileModules/Default
    </p>
  </body>
</html></richcontent>
<node CREATED="1341824562048" ID="ID_20564299" LINK="#ID_784224808" MODIFIED="1354011427791">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      $(STAMP_CONFIGURED) &#21363; build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.configured
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341824565344" ID="ID_1936406067" MODIFIED="1341824573355" TEXT=".config"/>
</node>
<node CREATED="1341824502978" ID="ID_1097550430" MODIFIED="1342089617587">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.image :
    </p>
    <p>
      build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.configured
    </p>
    <p>
      &#30446;&#26631;&#23545;&#24212;&#20102;&#21516;&#36335;&#24452;&#30340;&#26102;&#38388;&#25139;&#25991;&#20214;, &#25191;&#34892;&#30446;&#26631;&#30340;&#21629;&#20196;&#21518;&#20250;&#26356;&#26032;&#27492;&#25991;&#20214;&#30340;&#26102;&#38388;&#25139;
    </p>
    <p>
      (include/kernel-build.mk:107)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, Kernel/CompileImage &#21363; Kernel/CompileImage/Default
    </p>
    <p>
      1.1, &#21024;&#38500;&#30446;&#24405;TARGET_DIR = build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31
    </p>
    <p>
      1.2, &#22312;&#30446;&#24405;build_dir/linux-db12x-2.6.31_generic/linux-2.6.31&#19979;&#25191;&#34892;make&#21629;&#20196;
    </p>
    <p>
      1.3, &#29992;objcopy&#22788;&#29702;build_dir/linux-db12x-2.6.31_generic/vmlinux&#29983;&#25104;build_dir/linux-db12x-2.6.31_generic/vmlinux.elf
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341909461461" ID="ID_1554914827" MODIFIED="1341909467114" TEXT="&#x76ee;&#x6807; download"/>
<node CREATED="1341909474533" ID="ID_1220078617" MODIFIED="1341909477907" TEXT="&#x76ee;&#x6807; prepare"/>
<node CREATED="1341909486244" FOLDED="true" ID="ID_139852251" LINK="#ID_987516919" MODIFIED="1361951101693">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; compile :
    </p>
    <p>
      build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.modules
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, make -C image compile TARGET_BUILD=
    </p>
    <p>
      compile&#30001;target/linux/db12x-2.6.31/image/Makefile:108&#35843;&#29992;BuildImage&#29983;&#25104;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341909521043" ID="ID_869719020" LINK="#ID_257306006" MODIFIED="1341909528002" TEXT="build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.modules"/>
</node>
<node CREATED="1341909633854" ID="ID_484438781" MODIFIED="1341909698070">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; oldconfig
    </p>
    <p>
      &#30446;&#26631; menuconfig
    </p>
    <p>
      &#30446;&#26631; silentoldconfig
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341909676156" FOLDED="true" ID="ID_1060510585" LINK="#ID_392357199" MODIFIED="1342681948182">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; install
    </p>
    <p>
      (include/kernel-build.mk:144)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;
    </p>
    <p>
      1, make -C image compile install TARGET_BUILD=
    </p>
    <p>
      compile install&#30001;target/linux/db12x-2.6.31/image/Makefile:108&#35843;&#29992;BuildImage&#29983;&#25104;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341909720043" ID="ID_1960764043" LINK="#ID_1097550430" MODIFIED="1342090079063">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build_dir/linux-db12x-2.6.31_generic/linux-2.6.31/.image
    </p>
    <p>
      &#22797;&#21046;&#29983;&#25104;&#20869;&#26680;vmlinux
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1341909825942" ID="ID_1918373452" MODIFIED="1341909872319">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; image-prereq
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;
    </p>
    <p>
      1, make -s -C image prereq TARGET_BUILD=
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1341814089084" ID="ID_1582450001" MODIFIED="1341814099496" TEXT="&#x9700;&#x8981;&#x7528;&#x5230;&#x7684;&#x5b9a;&#x4e49;"/>
</node>
</node>
<node CREATED="1354012404835" FOLDED="true" ID="ID_938853943" MODIFIED="1361951101697" TEXT="include/kernel-defaults">
<node CREATED="1354012797605" FOLDED="true" ID="ID_689530214" MODIFIED="1354073565976" TEXT="Kernel/Configure/Default">
<node CREATED="1354012995046" FOLDED="true" ID="ID_803570688" MODIFIED="1361951101697" TEXT="1, &#x5c06;$(LINUX_KCONFIG_LIST)&#x4ee3;&#x8868;&#x7684;&#x5185;&#x6838;&#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x5217;&#x8868;&#x4e2d;&#x7684;&#x5185;&#x6838;&#x914d;&#x7f6e;&#x5408;&#x5e76;&#x5230;&#xa;build_dir/linux-ar71xx_generic/linux-3.3.8/.config.target,">
<node CREATED="1354013108407" ID="ID_635744861" MODIFIED="1354013114226">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      $(LINUX_KCONFIG_LIST)&#20195;&#34920;&#30340;&#20869;&#26680;&#37197;&#32622;&#25991;&#20214;&#21015;&#34920;&#21253;&#25324;:
    </p>
    <p>
      generic&#30340; : target/linux/generic/config-3.3
    </p>
    <p>
      platform&#30340; : target/linux/ar71xx/config-3.3
    </p>
    <p>
      subtarget&#30340; : target/linux/ar71xx/generic/config-default
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1354013207064" ID="ID_864894002" MODIFIED="1354013389384" TEXT="2, &#x5c06;.config&#x4e2d;&#x4ee5;CONFIG_KERNEL_&#x5f00;&#x5934;&#x7684;&#x914d;&#x7f6e;&#x9009;&#x9879;&#x5408;&#x5e76;&#x5230;&#xa;build_dir/linux-ar71xx_generic/linux-3.3.8/.config.target"/>
<node CREATED="1354013434633" ID="ID_1462636229" MODIFIED="1354013505025" TEXT="3, &#x5c06;&#x4ee5;&#x4e0b;&#x5185;&#x5bb9;&#x8ffd;&#x52a0;&#x5230;build_dir/linux-ar71xx_generic/linux-3.3.8/.config.target&#xa;# CONFIG_KALLSYMS_EXTRA_PASS is not set &#xa;# CONFIG_KALLSYMS_ALL is not set &#xa;# CONFIG_KPROBES is not set"/>
<node CREATED="1354013654682" ID="ID_1742284201" MODIFIED="1354013733442" TEXT="4, &#x5408;&#x5e76;tmp/.packageinfo&#x548c;.config&#x4e2d;&#x7684;&#x5185;&#x6838;&#x914d;&#x7f6e;&#x4fe1;&#x606f;&#x5230;&#xa;build_dir/linux-ar71xx_generic/linux-3.3.8/.config.override"/>
<node CREATED="1354013654682" ID="ID_107904561" MODIFIED="1354013815666" TEXT="5, &#x5408;&#x5e76;build_dir/linux-ar71xx_generic/linux-3.3.8/.config.target&#xa;&#x548c;build_dir/linux-ar71xx_generic/linux-3.3.8/.config.override&#x5230;&#xa;build_dir/linux-ar71xx_generic/linux-3.3.8/.config"/>
<node CREATED="1354013816827" ID="ID_483162693" MODIFIED="1354014606634">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      6 &#35843;&#29992;Kernel/SetInitramfs(include/kernel-defaults.mk:97)
    </p>
    <p>
      &#22312;.config&#20013;&#37325;&#26032;&#35774;&#32622;CONFIG_INITRAMFS_SOURCE&#20869;&#26680;&#36873;&#39033;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1354013894060" FOLDED="true" ID="ID_1207460609" MODIFIED="1354073201414">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      7 &#22312;&#30446;&#24405;build_dir/linux-ar71xx_generic/linux-3.3.8&#19979;&#25191;&#34892;make oldconfig prepare scripts
    </p>
  </body>
</html></richcontent>
<node CREATED="1354073088106" ID="ID_1867275531" MODIFIED="1354073197622">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27492;&#19968;&#27493;&#20250;&#26681;&#25454;&#20869;&#26680;&#30446;&#24405;&#26641;&#19979;&#30340;Kconfig&#25991;&#20214;&#26816;&#26597;.config&#20013;&#37197;&#32622;&#36873;&#39033;&#30340;&#21512;&#27861;&#24615;
    </p>
    <p>
      &#33509;&#19981;&#21512;&#27861;&#21017;&#20250;&#35201;&#27714;&#37325;&#26032;&#37197;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1354014006764" ID="ID_94726319" MODIFIED="1354014016290" TEXT="8, &#x5220;&#x9664;&#x76ee;&#x5f55;build_dir/linux-ar71xx_generic/modules"/>
<node CREATED="1354013894060" ID="ID_1190005051" MODIFIED="1354014107911">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      9, &#22312;&#30446;&#24405;build_dir/linux-ar71xx_generic/linux-3.3.8&#19979;&#25191;&#34892;make headers_install
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1354013894060" ID="ID_735378296" MODIFIED="1354014192839">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      10, &#29983;&#25104;&#26657;&#39564;&#21644;&#25991;&#20214;build_dir/linux-ar71xx_generic/linux-3.3.8/.vermagic
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1354073560448" FOLDED="true" ID="ID_1141203946" MODIFIED="1354073736952" TEXT="Kernel/CompileModules/Default">
<node CREATED="1354073580352" ID="ID_600965070" MODIFIED="1354073622494" TEXT="1, rm -f build_dir/linux-ar71xx_generic/linux-3.3.8/vmlinux"/>
<node CREATED="1354073624864" ID="ID_557680389" MODIFIED="1354073651941" TEXT="2, rm -f build_dir/linux-ar71xx_generic/linux-3.3.8/System.map"/>
<node CREATED="1354073684944" ID="ID_504867626" MODIFIED="1354073710655" TEXT="3, &#x5728;&#x76ee;&#x5f55;build_dir/linux-ar71xx_generic/linux-3.3.8&#x4e0b;&#x6267;&#x884c;make modules&#x547d;&#x4ee4;"/>
</node>
</node>
<node CREATED="1341915751966" FOLDED="true" ID="ID_846510386" MODIFIED="1342681948188" TEXT="include/image">
<node CREATED="1341974545941" ID="ID_930695121" MODIFIED="1341974547577" TEXT="JFFS2OPTS"/>
<node CREATED="1341974553125" ID="ID_922974620" MODIFIED="1341974554441" TEXT="SQUASHFS_OPTS"/>
<node CREATED="1341974830234" ID="ID_1020533281" MODIFIED="1341974881898">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      USE_SQUASHFS3
    </p>
    <p>
      &#30830;&#23450;&#20102;MKSQUASHFS_CMD
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341974845530" ID="ID_110125233" MODIFIED="1341974846910" TEXT="MKSQUASHFS_CMD"/>
<node CREATED="1341974869689" ID="ID_1199313950" MODIFIED="1341976265661" TEXT="JFFS2_BLOCKSIZE : 64k 128k-nand"/>
<node CREATED="1341974923942" ID="ID_663925483" MODIFIED="1341975097794" TEXT="&#x5b8f; add_jffs2_mark : &#x7528;&#x4e8e;&#x8f6c;&#x6362;squashfs&#x955c;&#x50cf;&#x7684;&#x683c;&#x5f0f;"/>
<node CREATED="1341974948646" ID="ID_1046165418" MODIFIED="1341975087132" TEXT="&#x5b8f; prepare_generic_squashfs : &#x7528;&#x4e8e;&#x8f6c;&#x6362;squashfs&#x955c;&#x50cf;&#x7684;&#x683c;&#x5f0f;"/>
<node CREATED="1341975141710" ID="ID_779548963" MODIFIED="1341976044228">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23439; Image/mkfs/jffs2/sub : &#29983;&#25104;jffs2-64k&#26684;&#24335;&#21644;jffs2-128k-nand&#26684;&#24335;&#30340;&#38236;&#20687;&#25991;&#20214;
    </p>
    <p>
      &#29983;&#25104;&#21518;&#20250;&#35843;&#29992;Image/Build&#36827;&#34892;&#21518;&#32493;&#22788;&#29702;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341975153357" ID="ID_1478815311" MODIFIED="1341975943818" TEXT="&#x5b8f; Image/mkfs/jffs2 : &#x751f;&#x6210;jffs2-64k&#x683c;&#x5f0f;&#x548c;jffs2-128k-nand&#x683c;&#x5f0f;&#x7684;&#x955c;&#x50cf;&#x6587;&#x4ef6;"/>
<node CREATED="1341976072121" ID="ID_1106906300" MODIFIED="1341976110058">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23439; Image/mkfs/squashfs &#29983;&#25104;squashfs&#26684;&#24335;&#30340;&#38236;&#20687;&#25991;&#20214;
    </p>
    <p>
      &#29983;&#25104;&#21518;&#20250;&#35843;&#29992;Image/Build&#36827;&#34892;&#21518;&#32493;&#22788;&#29702;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341976575893" ID="ID_1091025318" MODIFIED="1341976991879">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23439; Image/mkfs/prepare/default
    </p>
    <p>
      &#20934;&#22791;&#30446;&#24405;build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341977009508" ID="ID_403339843" MODIFIED="1341977055573">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23439; Image/mkfs/prepare
    </p>
    <p>
      &#35843;&#29992;Image/mkfs/prepare/default&#20934;&#22791;&#26681;&#25991;&#20214;&#31995;&#32479;&#30446;&#24405;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341977084498" ID="ID_894915574" MODIFIED="1341977098173" TEXT="&#x5b8f; Image/Checksum : &#x751f;&#x6210;&#x955c;&#x50cf;&#x6587;&#x4ef6;&#x7684;&#x6821;&#x9a8c;&#x548c;"/>
<node CREATED="1341977137680" FOLDED="true" ID="ID_234730606" MODIFIED="1342681948187" TEXT="&#x5b8f; BuildImage">
<node CREATED="1341977170222" ID="ID_1116327859" MODIFIED="1341977171538" TEXT="download"/>
<node CREATED="1341977177262" ID="ID_1175309364" MODIFIED="1341977178473" TEXT="prepare"/>
<node CREATED="1341977183517" FOLDED="true" ID="ID_987516919" MODIFIED="1342681948186" TEXT="compile">
<node CREATED="1341977471186" ID="ID_1167848852" MODIFIED="1341977472765" TEXT="call Build/Compile"/>
</node>
<node CREATED="1341977191517" FOLDED="true" ID="ID_392357199" MODIFIED="1342681948187" TEXT="install">
<node CREATED="1341977220300" ID="ID_880753465" MODIFIED="1341977241976" TEXT="call Image/Prepare"/>
<node CREATED="1341977297145" ID="ID_258476906" MODIFIED="1341977298413" TEXT="call Image/mkfs/prepare"/>
<node CREATED="1341977306969" ID="ID_1117261373" MODIFIED="1341977308277" TEXT="call Image/BuildKernel"/>
<node CREATED="1341977317065" ID="ID_1281866549" MODIFIED="1341977318573" TEXT="call Image/mkfs/cpiogz"/>
<node CREATED="1341977351079" ID="ID_1586051450" MODIFIED="1341977352371" TEXT="call Image/mkfs/targz"/>
<node CREATED="1341977360263" ID="ID_1863889612" MODIFIED="1341977361764" TEXT="call Image/mkfs/ext2"/>
<node CREATED="1341977369463" ID="ID_1387362924" MODIFIED="1341977370874" TEXT="call Image/mkfs/iso"/>
<node CREATED="1341977381334" ID="ID_1623774983" MODIFIED="1341977382617" TEXT="call Image/mkfs/jffs2"/>
<node CREATED="1341977390757" ID="ID_1545634180" MODIFIED="1341977392083" TEXT="call Image/mkfs/squashfs"/>
<node CREATED="1341977400533" ID="ID_1194681559" MODIFIED="1341977401833" TEXT="call Image/mkfs/ubifs"/>
<node CREATED="1341977410277" ID="ID_859888740" MODIFIED="1341977411681" TEXT="call Image/Checksum"/>
</node>
</node>
</node>
<node CREATED="1342002878539" FOLDED="true" ID="ID_537021126" MODIFIED="1342681948192" TEXT="include/package">
<node CREATED="1342003955248" ID="ID_1841829031" MODIFIED="1342004001467" TEXT="PKG_BUILD_DIR : build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx"/>
<node CREATED="1342004012206" ID="ID_497887884" MODIFIED="1342004054559" TEXT="PKG_INSTALL_DIR : build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/ipkg-install"/>
<node CREATED="1342004248005" ID="ID_819665240" MODIFIED="1342004249488" TEXT="STAMP_NO_AUTOREBUILD"/>
<node CREATED="1342004256964" ID="ID_1984245329" MODIFIED="1342004258385" TEXT="PREV_STAMP_PREPARED"/>
<node CREATED="1342004266180" ID="ID_1534141741" MODIFIED="1342004267767" TEXT="STAMP_PREPARED"/>
<node CREATED="1342004319026" ID="ID_1575897018" MODIFIED="1342004343726" TEXT="STAMP_CONFIGURED : build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.configured_"/>
<node CREATED="1342004372176" ID="ID_972476394" MODIFIED="1342004391210" TEXT="STAMP_BUILT : build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built"/>
<node CREATED="1342004399455" ID="ID_1583497205" MODIFIED="1342004430378" TEXT="STAMP_INSTALLED : staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.xxx_installed"/>
<node CREATED="1342004455517" ID="ID_145569153" MODIFIED="1342004461592" TEXT="STAGING_FILES_LIST : xxx.list"/>
<node CREATED="1342004533290" ID="ID_900539381" MODIFIED="1342004553716" TEXT="CONFIG_SITE : include/site/mips-openwrt-linux-uclibc"/>
<node CREATED="1342004586584" ID="ID_1696085374" MODIFIED="1342004589099" TEXT="CUR_MAKEFILE :"/>
<node CREATED="1342004604807" ID="ID_1164341004" MODIFIED="1342004607826" TEXT="SUBMAKE : make"/>
<node CREATED="1342004654565" ID="ID_1596892968" MODIFIED="1342004734678" TEXT="&#x5b8f; Build/Autoclean : &#x751f;&#x6210;&#x4f9d;&#x8d56;&#x5173;&#x7cfb;"/>
<node CREATED="1342004923707" ID="ID_1651714818" MODIFIED="1342004927477" TEXT="&#x5b8f; Download/default"/>
<node CREATED="1342004945098" ID="ID_601301589" MODIFIED="1342005013202" TEXT="Build/Exports/Default &#x7528;&#x4e8e;&#x5bfc;&#x51fa;&#x73af;&#x5883;&#x53d8;&#x91cf;"/>
<node CREATED="1342004984136" ID="ID_1576818863" MODIFIED="1342005010699" TEXT="Build/Exports : Build/Exports/Default &#x7528;&#x4e8e;&#x5bfc;&#x51fa;&#x73af;&#x5883;&#x53d8;&#x91cf;"/>
<node CREATED="1342005035574" FOLDED="true" ID="ID_273448954" MODIFIED="1342681948189" TEXT="&#x5b8f; Build/DefaultTargets">
<node CREATED="1342005182337" ID="ID_1016825981" MODIFIED="1342005501495">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.prepared
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, Build/Prepare, &#21363;Build/Prepare/Default, &#40664;&#35748;&#24773;&#20917;&#19979;&#35299;&#21387;&#28304;&#30721;&#21387;&#32553;&#21253;,&#24182;&#25171;patch
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#29992;&#25143;&#21487;&#20197;&#33258;&#23450;&#20041;&#27492;&#23439;,&#20197;&#25191;&#34892;&#38656;&#35201;&#30340;&#25805;&#20316;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342005605856" ID="ID_468336046" MODIFIED="1342005961749">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.configured_ :
    </p>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.prepared
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, Build/Configure, &#21363;Build/Configure/Default, &#40664;&#35748;&#24773;&#20917;&#19979;&#22312;&#28304;&#30721;&#30446;&#24405;&#20013;&#25191;&#34892;configure&#21629;&#20196;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#29992;&#25143;&#21487;&#20197;&#33258;&#23450;&#20041;Build/Configure&#23439;,&#20063;&#21487;&#20197;&#20165;&#25351;&#23450;CONFIGURE_ARGS&#21644;CONFIGURE_VARS&#21442;&#25968;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#20197;&#30830;&#23450;&#22914;&#20309;&#25191;&#34892;configure&#21629;&#20196;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342076459181" ID="ID_177169734" MODIFIED="1342077543349">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built_check
    </p>
    <p>
      (include/package.mk:54 &#35843;&#29992;rdep&#29983;&#25104;&#30340;.built_check, include/depends.mk:23)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#36882;&#24402;&#26816;&#26597;package/xxx&#30446;&#24405;&#19979;&#30340;&#25991;&#20214;&#26159;&#21542;&#27604;build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#26356;&#26032;,&#22914;&#26524;&#26356;&#26032;&#21017;&#26356;&#26032;build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built_check&#30340;&#26102;&#38388;&#25139;,&#36825;&#20250;
    </p>
    <p>
      &#160;&#160;&#23548;&#33268;&#37325;&#26032;&#25191;&#34892;&#30446;&#26631;build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built,&#21363;&#37325;&#26032;make, make install
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342061465034" ID="ID_1309720592" MODIFIED="1342076894904">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built :
    </p>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.configured_
    </p>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built_check
    </p>
    <p>
      (include/depends.mk:22, include/package.mk:113)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, Build/Compile, &#21363;Build/Compile/Default, &#40664;&#35748;&#24773;&#20917;&#19979;&#22312;&#28304;&#30721;&#30446;&#24405;&#20013;&#25191;&#34892;make&#21629;&#20196;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#29992;&#25143;&#21487;&#20197;&#33258;&#23450;&#20041;Build/Compile&#23439;,&#20063;&#21487;&#20197;&#20165;&#25351;&#23450;MAKE_FLAGS&#21644;MAKE_VARS&#21442;&#25968;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#20197;&#30830;&#23450;&#22914;&#20309;&#25191;&#34892;make&#21629;&#20196;
    </p>
    <p>
      2, Build/Install, &#21363;Build/Install/Default, &#40664;&#35748;&#24773;&#20917;&#19979;&#22312;&#28304;&#30721;&#30446;&#24405;&#20013;&#25191;&#34892;make install&#21629;&#20196;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#29992;&#25143;&#21487;&#20197;&#33258;&#23450;&#20041;Build/Install&#23439;,&#20063;&#21487;&#20197;&#20165;&#25351;&#23450;MAKE_FLAGS&#21644;MAKE_VARS&#21442;&#25968;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#20197;&#30830;&#23450;&#22914;&#20309;&#25191;&#34892;make install&#21629;&#20196;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342062237004" ID="ID_1193444474" MODIFIED="1342063633632">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.xxx_installed :
    </p>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#20934;&#22791;&#22909;&#20197;&#19979;&#30446;&#24405;: tmp/stage-xxx/host, staging_dir/host,
    </p>
    <p>
      &#160;&#160;&#160;&#160;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/packages
    </p>
    <p>
      2, Build/InstallDev, &#21363; Build/Bin/InstallDev, &#40664;&#35748;&#24773;&#20917;&#19979;&#23558;&#22797;&#21046;&#30446;&#24405;
    </p>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/db12x-2.6.31/xxx/Dev&#21040;tmp/stage-xxx/host
    </p>
    <p>
      3, &#22797;&#21046;tmp/stage-xxx/* &#21040;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/
    </p>
    <p>
      4, &#21024;&#38500;&#30446;&#24405;tmp/stage-xxx
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342084502080" ID="ID_1539027390" LINK="#ID_216652129" MODIFIED="1342084616077" TEXT="&#x76ee;&#x6807; bin/db12x-2.6.31/packages/xxx_db12x-2.6.31.ipk"/>
<node CREATED="1342063660164" ID="ID_1178339525" MODIFIED="1342064122148">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#30446;&#26631; compile :
    </p>
    <p>
      bin/db12x-2.6.31/packages/xxx_db12x-2.6.31.ipk
    </p>
    <p>
      staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/stamp/.xxx_installed
    </p>
    <p>
      staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/stamp/.xxx_installed
    </p>
    <p>
      (include/package.mk:141, include/package-ipkg.mk:60)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342064412903" ID="ID_1155527287" MODIFIED="1342064477420" TEXT="  prepare: build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.prepared  &#xa;configure: build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.configured_    &#xa;dist: build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.configured_    &#xa;distcheck: build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.configured_ "/>
</node>
<node CREATED="1342079814761" FOLDED="true" ID="ID_38461064" MODIFIED="1342681948191">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23439; BuildPackage
    </p>
    <p>
      (include/package.mk:159)
    </p>
  </body>
</html></richcontent>
<node CREATED="1342079857943" ID="ID_1476574643" MODIFIED="1342079878498" TEXT="&#x5b8f; Build/IncludeOverlay"/>
<node CREATED="1342079924837" ID="ID_1324036311" MODIFIED="1342080275153">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23439; Package/Default
    </p>
    <p>
      &#23450;&#20041;&#19968;&#20123;&#40664;&#35748;&#21464;&#37327;
    </p>
    <p>
      (include/package-defaults.mk:8)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342079946452" ID="ID_1602949545" MODIFIED="1342079952174" TEXT="Package/xxx"/>
<node CREATED="1342080029521" FOLDED="true" ID="ID_1546057446" MODIFIED="1342681948190">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23439; BuildTarget/ipkg
    </p>
    <p>
      (include/package-ipkg.mk:51)
    </p>
  </body>
</html></richcontent>
<node CREATED="1342080489375" ID="ID_471410244" MODIFIED="1342080933825" TEXT="IPKG_xxx = bin/db12x-2.6.31/packages/xxx_db12x-2.6.31.ipk"/>
<node CREATED="1342080592890" ID="ID_861120692" MODIFIED="1342080621993" TEXT="IDIR_xxx = build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/ipkg-db12x-2.6.31/xxx"/>
<node CREATED="1342080651016" ID="ID_1298556688" MODIFIED="1342080676086" TEXT="INFO_xxx = build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/usr/lib/opkg/info/xxx.list"/>
<node CREATED="1342080705814" ID="ID_742332336" MODIFIED="1342080710017" TEXT="KEEP_xxx"/>
<node CREATED="1342080733428" ID="ID_498668455" MODIFIED="1342080785397">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      compile :&#160;
    </p>
    <p>
      bin/db12x-2.6.31/packages/xxx_db12x-2.6.31.ipk
    </p>
    <p>
      staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/stamp/.xxx_installed
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342080800610" ID="ID_1881202412" LINK="#ID_1876141998" MODIFIED="1342087520554" TEXT="install : build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/usr/lib/opkg/info/xxx.list"/>
<node CREATED="1342080923293" ID="ID_1194690796" MODIFIED="1342080946106" TEXT="IDEPEND_xxx = kmod-qca-wlan-driver qca-libath"/>
<node CREATED="1342081014969" ID="ID_1124869563" MODIFIED="1342081029902" TEXT="&#x8c03;&#x7528;BuildIPKGVariable&#x751f;&#x6210;&#x53d8;&#x91cf;conffiles"/>
<node CREATED="1342081041977" ID="ID_1389119508" MODIFIED="1342081101715" TEXT="&#x8c03;&#x7528;BuildIPKGVariable&#x751f;&#x6210;&#x53d8;&#x91cf;preinst"/>
<node CREATED="1342081050440" ID="ID_895876377" MODIFIED="1342081107582" TEXT="&#x8c03;&#x7528;BuildIPKGVariable&#x751f;&#x6210;&#x53d8;&#x91cf;postinst"/>
<node CREATED="1342081060440" ID="ID_1834848899" MODIFIED="1342081116891" TEXT="&#x8c03;&#x7528;BuildIPKGVariable&#x751f;&#x6210;&#x53d8;&#x91cf;prerm"/>
<node CREATED="1342081070472" ID="ID_1659574841" MODIFIED="1342081123194" TEXT="&#x8c03;&#x7528;BuildIPKGVariable&#x751f;&#x6210;&#x53d8;&#x91cf;postrm"/>
<node CREATED="1342081170196" ID="ID_1874112513" MODIFIED="1342082738609">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/stamp/.xxx_installed :
    </p>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#20934;&#22791;&#22909;&#30446;&#24405;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/stamp&#21644;
    </p>
    <p>
      &#160;&#160;&#160; staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/temp-xxx
    </p>
    <p>
      2, &#35843;&#29992;Package/xxx/install&#21644;Package/xxx/install_lib&#23433;&#35013;&#25991;&#20214;&#21040;&#30446;&#24405;
    </p>
    <p>
      &#160;&#160;&#160; staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/temp-xxx
    </p>
    <p>
      3, &#23558;&#30446;&#24405;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/temp-xxx&#30340;&#20869;&#23481;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#22797;&#21046;&#21040;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31
    </p>
    <p>
      4, &#21024;&#38500;&#30446;&#24405;staging_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/temp-xxx
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342082844338" ID="ID_216652129" MODIFIED="1342086400114">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      bin/db12x-2.6.31/packages/xxx_db12x-2.6.31.ipk :
    </p>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/.built
    </p>
    <p>
      (include/package-ipkg.mk:90)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, &#23558;&#27492;ipkg&#21253;&#30340;&#30456;&#20851;&#20449;&#24687;&#20889;&#20837;&#25991;&#20214;
    </p>
    <p>
      &#160;&#160;&#160; build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/ipkg-db12x-2.6.31/xxx/CONTROL/control
    </p>
    <p>
      2, &#35843;&#29992;Package/xxx/install&#23433;&#35013;&#25991;&#20214;&#21040;&#30446;&#24405;
    </p>
    <p>
      &#160;&#160;&#160;&#160;build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/xxx/ipkg-db12x-2.6.31/xxx
    </p>
    <p>
      3, &#35843;&#29992;strip&#20248;&#21270;&#20108;&#36827;&#21046;&#21253;
    </p>
    <p>
      4, &#35843;&#29992;IPKG_BUILD&#29983;&#25104;ipkg&#21253;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1342086336632" ID="ID_1876141998" MODIFIED="1342086570083">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31/usr/lib/opkg/info/xxx.list :
    </p>
    <p>
      bin/db12x-2.6.31/packages/xxx_db12x-2.6.31.ipk
    </p>
    <p>
      (include/package-ipkg.mk:138)
    </p>
    <p>
      &#35201;&#25191;&#34892;&#30340;&#21629;&#20196;:
    </p>
    <p>
      1, $(OPKG) install bin/db12x-2.6.31/packages/xxx_db12x-2.6.31.ipk &#23558;ipkg&#21253;&#23433;&#35013;&#21040;&#30446;&#24405;
    </p>
    <p>
      &#160;&#160;&#160;&#160;build_dir/target-mips_r2_74kc_uClibc-0.9.30.1/root-db12x-2.6.31
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1342080068527" ID="ID_662721307" LINK="#ID_273448954" MODIFIED="1342080357900" TEXT="Build/DefaultTargets"/>
</node>
<node CREATED="1342080094958" ID="ID_938268940" MODIFIED="1342080100882" TEXT="&#x5b8f; pkg_install_files"/>
<node CREATED="1342080107870" ID="ID_681468238" MODIFIED="1342080111094" TEXT="&#x5b8f; pkg_install_bin"/>
</node>
</node>
<node CREATED="1341296826043" FOLDED="true" ID="ID_1776660281" MODIFIED="1354012423907" TEXT="make lib">
<node CREATED="1341297486970" FOLDED="true" ID="ID_1304025856" MODIFIED="1353914948495" TEXT="include/scan.mk">
<node CREATED="1341298281417" FOLDED="true" ID="ID_1056575384" MODIFIED="1353914947607" TEXT="tmp/info/packageinfo">
<node CREATED="1341298386524" FOLDED="true" ID="ID_234357607" MODIFIED="1341985642185" TEXT="tmp/info/.files-packageinfo.stamp">
<node CREATED="1341298427096" ID="ID_1437851516" MODIFIED="1341298823305" TEXT="&#x9012;&#x5f52;&#x626b;&#x63cf;package&#x76ee;&#x5f55;,&#x5c06;&#x6bcf;&#x4e2a;package&#x5199;&#x5165;tmp/info/.files-packageinfo-cookie"/>
<node CREATED="1341298730035" ID="ID_1463737953" MODIFIED="1341298763611" TEXT="&#x751f;&#x6210;tmp/info/.files-packageinfo.stamp, &#x8d77;&#x5230;&#x65f6;&#x95f4;&#x6233;&#x7684;&#x4f5c;&#x7528;"/>
<node CREATED="1341298771438" ID="ID_1689415756" MODIFIED="1341298864389">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#29983;&#25104;tmp/info/.files-packageinfo.stamp.md5sum,
    </p>
    <p>
      &#23545;tmp/info/.files-packageinfo-cookie&#20013;&#30340;package&#21015;&#34920;&#36827;&#34892;&#26657;&#39564;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1341299297470" ID="ID_1223780268" MODIFIED="1341299299951" TEXT="$(SCAN_STAMP)"/>
<node CREATED="1341299525186" FOLDED="true" ID="ID_1950228621" MODIFIED="1341985655864" TEXT="&#x751f;&#x6210;tmp/info/.files-packageinfo.mk">
<node CREATED="1341299558062" ID="ID_964203762" MODIFIED="1341299578734" TEXT="$(eval $(call PackageDir,feeds_qca_qca-gateway-daemon,feeds/qca/qca-gateway-daemon))"/>
</node>
<node CREATED="1341299742664" ID="ID_71219318" MODIFIED="1341299781838" TEXT="&#x8c03;&#x7528;PackageDir&#x751f;&#x6210;&#x6bcf;&#x4e2a;package&#x5bf9;&#x5e94;&#x7684;tmp/info/.packageinfo-xxx"/>
</node>
<node CREATED="1341298288153" ID="ID_569510385" MODIFIED="1341298302073" TEXT="tmp/targetinfo"/>
</node>
</node>
<node CREATED="1341223707188" FOLDED="true" ID="ID_1038168024" MODIFIED="1354012422307" TEXT="&#x5e38;&#x7528;&#x547d;&#x4ee4;">
<node CREATED="1341223720835" FOLDED="true" ID="ID_708237641" MODIFIED="1354001497389" TEXT="package">
<node CREATED="1341223749998" ID="ID_776113098" MODIFIED="1341223764207">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      make package/xxx/clean
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341223749998" ID="ID_585355808" MODIFIED="1341223795811">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      make package/xxx/prepare
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341223749998" ID="ID_375263257" MODIFIED="1341223811977">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      make package/xxx/configure
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341223749998" ID="ID_526946498" MODIFIED="1341223830863">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      make package/xxx/compile
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341223749998" ID="ID_1405478880" MODIFIED="1341223843677">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      make package/xxx/install
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1334213900090" FOLDED="true" ID="ID_1459278377" MODIFIED="1354001097652" POSITION="left" TEXT="&#x76ee;&#x5f55;&#x7ed3;&#x6784;">
<node CREATED="1341216444029" ID="ID_957249026" MODIFIED="1341216530582" TEXT="tools : &#x6b64;&#x76ee;&#x5f55;&#x5305;&#x542b;&#x7528;&#x4e8e;&#x6784;&#x5efa;image&#x7684;&#x5de5;&#x5177;&#x7684;&#x6e90;&#x4ee3;&#x7801;"/>
<node CREATED="1341216447336" ID="ID_445436939" MODIFIED="1341216544093" TEXT="toolchain : &#x6b64;&#x76ee;&#x5f55;&#x5305;&#x542b;&#x4ea4;&#x53c9;&#x7f16;&#x8bd1;&#x5de5;&#x5177;&#x7684;&#x6e90;&#x4ee3;&#x7801;"/>
<node CREATED="1334214509701" FOLDED="true" ID="ID_1888925557" MODIFIED="1353639795961" TEXT="build_dir">
<node CREATED="1334214515845" ID="ID_1625480162" MODIFIED="1341216727787" TEXT="host : &#x6b64;&#x76ee;&#x5f55;&#x7528;&#x4e8e;&#x7f16;&#x8bd1;&#x6784;&#x5efa;image&#x7684;&#x5de5;&#x5177;, &#x5373;&#x7f16;&#x8bd1;tools&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6e90;&#x4ee3;&#x7801;"/>
<node CREATED="1334214773959" ID="ID_169938469" MODIFIED="1341216732482" TEXT="toolchain-xxx : &#x6b64;&#x76ee;&#x5f55;&#x7528;&#x4e8e;&#x7f16;&#x8bd1;&#x4ea4;&#x53c9;&#x7f16;&#x8bd1;&#x5de5;&#x5177;, &#x5373;&#x7f16;&#x8bd1;toolchain&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6e90;&#x4ee3;&#x7801;"/>
<node CREATED="1353637520679" FOLDED="true" ID="ID_1061878875" MODIFIED="1353638899490" TEXT="target-xxx : &#x6b64;&#x76ee;&#x5f55;&#x7528;&#x4e8e;&#x7f16;&#x8bd1;&#x5e94;&#x7528;&#x7a0b;&#x5e8f;&#x548c;&#x6784;&#x5efa;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;">
<node CREATED="1353638726022" ID="ID_1286648958" MODIFIED="1353638757394" TEXT="busybox-xxx&#x7b49; : &#x7528;&#x4e8e;&#x7f16;&#x8bd1;&#x5e94;&#x7528;&#x7a0b;&#x5e8f;"/>
<node CREATED="1353638758150" ID="ID_136721594" MODIFIED="1353638781577" TEXT="root-xxx : &#x7528;&#x4e8e;&#x751f;&#x6210;&#x6839;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;"/>
</node>
<node CREATED="1353638901706" FOLDED="true" ID="ID_928976793" MODIFIED="1353639754440" TEXT="linux-xxx : &#x6b64;&#x76ee;&#x5f55;&#x7528;&#x4e8e;&#x7f16;&#x8bd1;linux&#x5185;&#x6838;&#x548c;linux&#x5185;&#x6838;&#x6a21;&#x5757;">
<node CREATED="1353639057150" FOLDED="true" ID="ID_1871768564" MODIFIED="1353639210394" TEXT="linux-2.6.31 : &#x6b64;&#x76ee;&#x5f55;&#x7528;&#x4e8e;&#x7f16;&#x8bd1;&#x7279;&#x5b9a;&#x7248;&#x672c;&#x7684;linux&#x5185;&#x6838;">
<node CREATED="1353639105119" ID="ID_560577691" MODIFIED="1353639124331" TEXT="patches : &#x6253;&#x5230;&#x6b64;&#x5185;&#x6838;&#x7248;&#x672c;&#x4e0a;&#x8865;&#x4e01;"/>
</node>
<node CREATED="1353639212866" FOLDED="true" ID="ID_384732708" MODIFIED="1353639577236" TEXT="packages : &#x6b64;&#x76ee;&#x5f55;&#x9488;&#x5bf9;&#x5404;&#x4e2a;board&#x7f16;&#x8bd1;&#x76f8;&#x5e94;&#x7684;&#x5185;&#x6838;&#x6a21;&#x5757;">
<node CREATED="1353639221650" ID="ID_522282017" MODIFIED="1353639570327" TEXT="ipkg-db12x-2.6.31 : &#x9488;&#x5bf9;&#x7279;&#x5b9a;board&#x7f16;&#x8bd1;&#x76f8;&#x5e94;&#x7684;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
</node>
<node CREATED="1353639679471" ID="ID_30880961" MODIFIED="1353639727212" TEXT="qca-wifi-10.0.63 : &#x6b64;&#x5185;&#x6838;&#x7248;&#x672c;&#x4e0b;&#x6240;&#x6709;board&#x90fd;&#x9002;&#x7528;&#x7684;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
</node>
</node>
<node CREATED="1334214893265" FOLDED="true" ID="ID_27029959" MODIFIED="1353640130610" TEXT="staging_dir">
<node CREATED="1334214515845" ID="ID_1871182684" MODIFIED="1334214954159" TEXT="host : &#x6b64;&#x76ee;&#x5f55;&#x5305;&#x542b;&#x7528;&#x4e8e;&#x6784;&#x5efa;image&#x7684;&#x5de5;&#x5177;, &#x5b83;&#x7531;build_dir/host&#x5185;&#x7684;&#x6e90;&#x4ee3;&#x7801;&#x7f16;&#x8bd1;&#x751f;&#x6210;&#x540e;&#x5b89;&#x88c5;&#x5230;&#x8fd9;&#x91cc;"/>
<node CREATED="1334214773959" ID="ID_612648430" MODIFIED="1334214995312" TEXT="toolchain-xxx : &#x6b64;&#x76ee;&#x5f55;&#x5305;&#x542b;&#x4ea4;&#x53c9;&#x7f16;&#x8bd1;&#x5de5;&#x5177;, &#x5b83;&#x7531;build_dir/toolchain-xxx&#x5185;&#x7684;&#x6e90;&#x4ee3;&#x7801;&#x7f16;&#x8bd1;&#x751f;&#x6210;&#x540e;&#x5b89;&#x88c5;&#x5230;&#x8fd9;&#x91cc;"/>
<node CREATED="1341220312993" FOLDED="true" ID="ID_1928814128" MODIFIED="1353640126762" TEXT="target-xxx : &#x6b64;&#x76ee;&#x5f55;&#x5305;&#x542b;&#x7f16;&#x8bd1;&#x65f6;&#x9700;&#x8981;&#x88ab;&#x5f15;&#x7528;&#x7684;&#x5934;&#x6587;&#x4ef6;,&#x5e93;&#x6587;&#x4ef6;,&#x5de5;&#x5177;&#x7b49;">
<node CREATED="1353640108794" ID="ID_521840017" MODIFIED="1353640111854" TEXT="root-db12x-2.6.31"/>
</node>
</node>
<node CREATED="1341220873470" FOLDED="true" ID="ID_1085342025" MODIFIED="1353660192897" TEXT="target">
<node CREATED="1341224152301" FOLDED="true" ID="ID_817925520" MODIFIED="1353660189200" TEXT="linux">
<node CREATED="1341474390737" FOLDED="true" ID="ID_155098114" MODIFIED="1353660188177" TEXT="xxx : cpu&#x578b;&#x53f7;">
<node CREATED="1341474637811" ID="ID_1761113300" MODIFIED="1341474644020" TEXT="base-files"/>
<node CREATED="1341474660288" FOLDED="true" ID="ID_613326749" MODIFIED="1353659972539" TEXT="generic">
<node CREATED="1341475723487" ID="ID_1658866871" MODIFIED="1341475726588" TEXT="config-2.6.31"/>
</node>
<node CREATED="1341474684013" FOLDED="true" ID="ID_1460612982" MODIFIED="1353659974069" TEXT="image">
<node CREATED="1341478094926" ID="ID_1579253123" MODIFIED="1341478100217" TEXT="Makefile"/>
</node>
<node CREATED="1341474405615" FOLDED="true" ID="ID_737470740" MODIFIED="1353660186057" TEXT="Makefile">
<node CREATED="1341474793200" ID="ID_1232543216" MODIFIED="1341474802770" TEXT="ARCH:=mips"/>
<node CREATED="1341474816221" ID="ID_622221869" MODIFIED="1341474817720" TEXT="BOARD:=db12x-2.6.31"/>
<node CREATED="1341474831483" ID="ID_1596123713" MODIFIED="1341474838567" TEXT="BOARDNAME:=DB12x-2.6.31"/>
<node CREATED="1341474857448" ID="ID_1598495716" MODIFIED="1341474858803" TEXT="FEATURES:=squashfs jffs2"/>
<node CREATED="1341474875878" ID="ID_1626759992" MODIFIED="1341474886828" TEXT="CFLAGS:=-Os -pipe -mips32r2 -mtune=74kc"/>
<node CREATED="1341474904898" ID="ID_1371432203" MODIFIED="1341474906926" TEXT="SUBTARGETS:=generic"/>
<node CREATED="1341474917537" ID="ID_1986584006" MODIFIED="1341474919236" TEXT="LINUX_VERSION:=2.6.31"/>
<node CREATED="1341474928496" ID="ID_1058919975" MODIFIED="1341474930315" TEXT="DEVICE_TYPE:=bridge"/>
<node CREATED="1341475208030" ID="ID_1214113652" MODIFIED="1341475229223" TEXT="DEFAULT_PACKAGES += hostapd-mini"/>
<node CREATED="1341474944782" ID="ID_1922321300" MODIFIED="1341474946289" TEXT="include $(INCLUDE_DIR)/target.mk"/>
<node CREATED="1341474960908" ID="ID_900846159" MODIFIED="1341474962368" TEXT="define Target/Description"/>
<node CREATED="1341474971706" FOLDED="true" ID="ID_1255070975" MODIFIED="1342681952202" TEXT="$(eval $(call BuildTarget))">
<node CREATED="1341475749420" ID="ID_606905099" LINK="#ID_1658866871" MODIFIED="1341475898410">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24212;&#22312;SUBTARGETS&#19979;&#25918;&#19968;&#20010;config-&lt;LINUX_VERSION&gt;&#30340;&#37197;&#32622;&#25991;&#20214;
    </p>
    <p>
      &#37324;&#38754;&#20026;&#25903;&#25345;&#27492;board&#24517;&#39035;&#30340;&#20869;&#26680;&#37197;&#32622;&#36873;&#39033;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341475965586" ID="ID_102460142" MODIFIED="1341476106730">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#38656;&#35201;&#23545;&#20869;&#26680;&#25171;&#34917;&#19969;&#21017;&#24212;&#22312;xxx-board&#30446;&#24405;&#19979;&#21019;&#24314;patches-&lt;LINUX_VERSION&gt;&#30446;&#24405;
    </p>
    <p>
      &#20854;&#20013;&#20026;&#38656;&#35201;&#25171;&#19978;&#30340;&#34917;&#19969;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341478127690" ID="ID_780098375" LINK="#ID_1579253123" MODIFIED="1341478171301" TEXT="&#x5fc5;&#x987b;&#x521b;&#x5efa;&#x6587;&#x4ef6;xxx-board/image/Makefile"/>
</node>
</node>
</node>
</node>
<node CREATED="1341224155725" ID="ID_884778136" MODIFIED="1341224159256" TEXT="toolchain"/>
</node>
<node CREATED="1334217002785" FOLDED="true" ID="ID_1300870235" MODIFIED="1341295180843" TEXT="bin : &#x6700;&#x540e;&#x751f;&#x6210;&#x7684;image&#x548c;package">
<node CREATED="1334217056276" FOLDED="true" ID="ID_34402185" MODIFIED="1341221003549" TEXT="db12x-2.6.31 : &#x5e73;&#x53f0;">
<node CREATED="1334217083478" ID="ID_1020557211" MODIFIED="1334217124085" TEXT="packages : &#x53ef;&#x4ee5;&#x5b89;&#x88c5;&#x5230;firmware&#x4e2d;&#x7684;ipk&#x5b89;&#x88c5;&#x5305;"/>
<node CREATED="1334217141819" ID="ID_350770007" MODIFIED="1334217170534" TEXT="qca-uboot : &#x751f;&#x6210;&#x7684;uboot&#x7684;image"/>
<node CREATED="1334217191326" ID="ID_1481216127" MODIFIED="1334217207659" TEXT="openwrt-db12x-2.6.31-generic-xxx : &#x5185;&#x6838;&#x548c;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;"/>
</node>
</node>
<node CREATED="1334219765184" FOLDED="true" ID="ID_1485346184" MODIFIED="1353914918997" TEXT="package">
<node CREATED="1334219863414" FOLDED="true" ID="ID_1034815552" MODIFIED="1354001097651" TEXT="xxx (&#x6bd4;&#x5982;ppp) : package&#x540d;&#x79f0;">
<node CREATED="1334219925436" ID="ID_684928900" MODIFIED="1334219997932" TEXT="files : &#x9700;&#x8981;&#x653e;&#x5165;ipkg&#x5b89;&#x88c5;&#x5305;&#x5185;&#x7684;&#x6587;&#x4ef6;,&#x6bd4;&#x5982;&#x542f;&#x52a8;&#x811a;&#x672c;"/>
<node CREATED="1334220012834" ID="ID_809257230" MODIFIED="1334220030670" TEXT="patches : &#x7f16;&#x8bd1;&#x4e4b;&#x524d;&#x9700;&#x8981;&#x6253;&#x7684;patch"/>
<node CREATED="1334220039171" FOLDED="true" ID="ID_452147011" MODIFIED="1354001097651" TEXT="Makefile">
<node CREATED="1341223100878" ID="ID_394651146" LINK="#ID_1707863462" MODIFIED="1341223181484" TEXT="&#x5982;&#x679c;&#x662f;&#x5185;&#x6838;&#x6a21;&#x5757;,&#x5219;&#x5e94;&#x53c2;&#x7167;KernelPackage/xxx"/>
<node CREATED="1334220124409" ID="ID_957503481" MODIFIED="1334220133557" TEXT="PKG_NAME : &#x5305;&#x540d;&#x79f0;"/>
<node CREATED="1334220142762" ID="ID_703873998" MODIFIED="1334220151118" TEXT="PKG_VERSION : &#x7248;&#x672c;"/>
<node CREATED="1334220168556" ID="ID_708873834" MODIFIED="1334220176664" TEXT="PKG_RELEASE : make&#x7684;&#x7248;&#x672c;"/>
<node CREATED="1334220192750" ID="ID_1211035135" MODIFIED="1334220223212" TEXT="PKG_SOURCE : &#x6e90;&#x7801;&#x538b;&#x7f29;&#x5305;&#x7684;&#x540d;&#x79f0;"/>
<node CREATED="1334220234081" ID="ID_742630242" MODIFIED="1334220248669" TEXT="PKG_SOURCE_URL : &#x53ef;&#x4ee5;&#x4ece;&#x54ea;&#x91cc;&#x4e0b;&#x8f7d;&#x6e90;&#x7801;&#x538b;&#x7f29;&#x5305;"/>
<node CREATED="1334220262211" ID="ID_1807332298" MODIFIED="1334220274431" TEXT="PKG_MD5SUM : &#x6e90;&#x7801;&#x538b;&#x7f29;&#x5305;&#x7684;&#x6821;&#x9a8c;&#x548c;"/>
<node CREATED="1334220304086" ID="ID_1117003399" MODIFIED="1334220335971" TEXT="PKG_CAT : &#x600e;&#x4e48;&#x89e3;&#x538b;&#x7f29;&#x6e90;&#x7801;&#x538b;&#x7f29;&#x5305;"/>
<node CREATED="1334220345400" ID="ID_464461881" MODIFIED="1334220377638" TEXT="PKG_BUILD_DIR : &#x5728;&#x54ea;&#x91cc;&#x7f16;&#x8bd1;&#x5305;"/>
<node CREATED="1334220463313" FOLDED="true" ID="ID_783622211" MODIFIED="1354001097651" TEXT="&#x5728;&#x8c03;&#x7528;BuildPackage&#x65f6;BuildPackage&#x5c06;&#x8981;&#x4f7f;&#x7528;&#x7684;&#x5b9a;&#x4e49;">
<node CREATED="1334220501875" FOLDED="true" ID="ID_904403023" MODIFIED="1353664721234" TEXT="package/xxx : &#x5728;menuconfig&#x4e2d;&#x5982;&#x4f55;&#x663e;&#x793a;&#x548c;ipkg&#x5982;&#x4f55;&#x751f;&#x6210;">
<node CREATED="1334220665262" ID="ID_1023328446" MODIFIED="1334220688700" TEXT="SECTION : &#x5305;&#x7684;&#x7c7b;&#x578b;"/>
<node CREATED="1334220689248" ID="ID_786044418" MODIFIED="1334220720606" TEXT="CATEGORY : menuconfig&#x4e2d;&#x7684;&#x76ee;&#x5f55;"/>
<node CREATED="1334220724290" ID="ID_1086517272" MODIFIED="1334220739951" TEXT="TITLE : &#x7b80;&#x8ff0;"/>
<node CREATED="1334220741571" ID="ID_1709229290" MODIFIED="1334220774449" TEXT="URL : &#x54ea;&#x91cc;&#x53ef;&#x4ee5;&#x627e;&#x5230;&#x6b64;&#x5305;"/>
<node CREATED="1334220780310" ID="ID_105756025" MODIFIED="1334220805860" TEXT="MAINTAINER : &#x4f5c;&#x8005;,&#x7ef4;&#x62a4;&#x8005;"/>
<node CREATED="1334220808680" ID="ID_1985237181" MODIFIED="1334220878201" TEXT="DEPENDS : &#x4f9d;&#x8d56;&#x4e8e;&#x54ea;&#x4e9b;&#x5176;&#x4ed6;&#x5305;"/>
<node CREATED="1334220933969" ID="ID_1438873243" MODIFIED="1334220976681" TEXT="BUILDONLY : &#x4ec5;&#x7f16;&#x8bd1;,&#x4e0d;&#x663e;&#x793a;&#x5728;menuconfig&#x4e2d;"/>
</node>
<node CREATED="1334221152592" ID="ID_1945526068" MODIFIED="1334221219866" TEXT="package/xxx/conffiles [&#x53ef;&#x9009;]: &#x6b64;&#x5305;&#x5b89;&#x88c5;&#x7684;config&#x6587;&#x4ef6;"/>
<node CREATED="1334221223141" ID="ID_1763044019" MODIFIED="1334221292181" TEXT="build/prepare [&#x53ef;&#x9009;] : &#x5982;&#x4f55;&#x89e3;&#x538b;&#x548c;patch&#x6e90;&#x4ee3;&#x7801;"/>
<node CREATED="1334221329196" FOLDED="true" ID="ID_982352289" MODIFIED="1353665128716">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build/configure [&#21487;&#36873;] : &#22914;&#20309;&#35843;&#29992;&#28304;&#20195;&#30721;&#19979;&#30340;configure, &#21487;&#20197;&#20351;&#29992;
    </p>
    <p>
      $(call build/configure/default, arg1.arg2). &#20351;&#29992;&#21040;&#30340;&#21464;&#37327;&#26377;:
    </p>
  </body>
</html></richcontent>
<node CREATED="1334221533306" ID="ID_1948699047" MODIFIED="1334221561448" TEXT="CONFIGURE_ARGS : &#x4f20;&#x9012;&#x7ed9;configure&#x7684;&#x53c2;&#x6570;"/>
<node CREATED="1334221533306" ID="ID_1370993571" MODIFIED="1334221598106" TEXT="CONFIGURE_VARS : &#x4f20;&#x9012;&#x7ed9;configure&#x7684;&#x53d8;&#x91cf;,&#x5982;NAME=&quot;value&quot;"/>
</node>
<node CREATED="1334221618928" FOLDED="true" ID="ID_410496136" MODIFIED="1354001097651" TEXT="build/compile [&#x53ef;&#x9009;] : &#x5982;&#x4f55;&#x7f16;&#x8bd1;&#x6e90;&#x4ee3;&#x7801;">
<node CREATED="1334221663683" ID="ID_1256848702" MODIFIED="1334221696097" TEXT="MAKE_FLAGS : &#x4f20;&#x9012;&#x7ed9;make&#x7684;&#x9009;&#x9879;"/>
<node CREATED="1334221663683" ID="ID_1441866368" MODIFIED="1334221721843" TEXT="MAKE_VARS : &#x4f20;&#x9012;&#x7ed9;make&#x7684;&#x5b8f;&#x5b9a;&#x4e49;"/>
</node>
<node CREATED="1334221741497" ID="ID_73468306" MODIFIED="1334222262152">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build/installDev [&#21487;&#36873;] : &#29992;&#20110;&#23433;&#35013;&#21035;&#30340;&#21253;&#32534;&#35793;&#26102;&#21487;&#33021;&#38656;&#35201;&#30340;&#25991;&#20214;,&#22914;&#22836;&#25991;&#20214;,&#24211;&#25991;&#20214;
    </p>
    <p>
      &#27492;&#23450;&#20041;&#20013;&#21487;&#20197;&#20351;&#29992;2&#20010;&#21442;&#25968;:$(1)&#25351;&#21521;staging_dir/target-xxx, $(2)&#25351;&#21521;staging_dir/host
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1334222270349" ID="ID_1683058006" MODIFIED="1334222511546">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      package/xxx/install : &#29992;&#20110;&#22797;&#21046;&#32534;&#35793;&#29983;&#25104;&#30340;&#25991;&#20214;&#21040;ipkg&#23433;&#35013;&#30446;&#24405;, ipkg&#23433;&#35013;&#30446;&#24405;&#30001;&#21442;&#25968;$(1)&#25351;&#23450;
    </p>
    <p>
      &#27492;&#23450;&#20041;&#20013;&#21487;&#20197;&#20351;&#29992;&#30340;&#23439;&#26377;:
    </p>
    <p>
      INSTALL_DIR : install -d -m0755
    </p>
    <p>
      INSTALL_BIN : install -m0755
    </p>
    <p>
      INSTALL_DATA : install -m0644
    </p>
    <p>
      INSTALL_CONF : install -m0600
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1334220050931" FOLDED="true" ID="ID_278985973" MODIFIED="1341223408792" TEXT="kernel">
<node CREATED="1334220078037" FOLDED="true" ID="ID_60113822" MODIFIED="1341223407456" TEXT="modules">
<node CREATED="1334222560561" FOLDED="true" ID="ID_1707863462" MODIFIED="1341223401369">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      xxx.mk
    </p>
    <p>
      &#27492;makefile&#25551;&#36848;&#20102;&#22914;&#20309;&#23558;&#29305;&#23450;&#30340;&#20869;&#26680;&#28304;&#30721;&#32534;&#35793;&#20026;&#20869;&#26680;&#27169;&#22359;
    </p>
  </body>
</html></richcontent>
<node CREATED="1341222021665" FOLDED="true" ID="ID_835146461" MODIFIED="1341223400529" TEXT="KernelPackage/xxx">
<node CREATED="1341222080250" ID="ID_1633952559" MODIFIED="1341222859191" TEXT="TITLE : &#x6a21;&#x5757;&#x540d;&#x79f0;"/>
<node CREATED="1341222088473" ID="ID_281218584" MODIFIED="1341222841513" TEXT="DESCRIPTION : &#x6a21;&#x5757;&#x63cf;&#x8ff0;"/>
<node CREATED="1341222095224" ID="ID_1672877463" MODIFIED="1341222805422" TEXT="SUBMENU : &#x663e;&#x793a;&#x5728;&#x5185;&#x6838;&#x914d;&#x7f6e;&#x6811;&#x7684;&#x54ea;&#x4e2a;&#x5b50;&#x76ee;&#x5f55;&#x4e0b;&#x9762;"/>
<node CREATED="1341222110166" ID="ID_1707156080" MODIFIED="1341222681213" TEXT="KCONFIG : &#x54ea;&#x4e9b;&#x5185;&#x6838;&#x9009;&#x9879;&#x7528;&#x4e8e;&#x6307;&#x5b9a;&#x7f16;&#x8bd1;&#x6b64;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
<node CREATED="1341222120741" ID="ID_1489576660" MODIFIED="1341222488116" TEXT="FILES : &#x5185;&#x6838;&#x6e90;&#x7801;&#x6811;&#x4e2d;&#x54ea;&#x4e9b;&#x6587;&#x4ef6;&#x7528;&#x4e8e;&#x7f16;&#x8bd1;&#x6b64;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
<node CREATED="1341222140850" ID="ID_249694808" MODIFIED="1341222417716">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      AUTOLOAD : &#33509;&#38656;&#35201;&#22312;&#31995;&#32479;&#21551;&#21160;&#21518;&#33258;&#21160;&#21152;&#36733;&#27492;&#20869;&#26680;&#27169;&#22359;&#21017;&#38656;&#35201;&#27492;&#39033;
    </p>
    <p>
      &#26684;&#24335; : AUTOLOAD:=$(call AutoLoad,41,xxx)
    </p>
    <p>
      &#20869;&#26680;&#27169;&#22359;&#30340;&#21152;&#36733;&#39034;&#24207;&#20301;&#20026;41
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1341222044926" ID="ID_1754061424" MODIFIED="1341222053121" TEXT="KernelPackage/xxx/description"/>
<node CREATED="1341222940593" ID="ID_1336767405" MODIFIED="1341222969240">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      $(eval $(call KernelPackage,xxx))
    </p>
    <p>
      &#32534;&#35793;&#20869;&#26680;&#27169;&#22359;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1341223410744" ID="ID_68992851" MODIFIED="1341223414819" TEXT="feeds"/>
</node>
<node CREATED="1341295188146" FOLDED="true" ID="ID_485758968" MODIFIED="1342681952206" TEXT="tmp">
<node CREATED="1341295979618" ID="ID_1814947313" MODIFIED="1341295982293" TEXT=".packageinfo"/>
<node CREATED="1341295995760" ID="ID_1990749322" MODIFIED="1341295998097" TEXT=".targetinfo"/>
<node CREATED="1341305322304" ID="ID_576674319" MODIFIED="1341305415103">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .prereq_packages
    </p>
    <p>
      &#26356;&#26032;&#27492;&#25991;&#20214;&#34920;&#31034;prereq&#21253;&#24050;&#22788;&#29702;&#23436;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1341295191682" FOLDED="true" ID="ID_621045242" MODIFIED="1341295294981" TEXT="info">
<node CREATED="1341295211935" ID="ID_1079871017" MODIFIED="1341295216561" TEXT=".packageinfo-xxx"/>
<node CREATED="1341295226365" ID="ID_972280607" MODIFIED="1341295237535" TEXT=".targetinfo-xxx"/>
<node CREATED="1341295268968" ID="ID_967576918" MODIFIED="1341295281033" TEXT=".files-packageinfo-xxx"/>
<node CREATED="1341295290342" ID="ID_66573671" MODIFIED="1341295293217" TEXT=".files-targetinfo-xxx"/>
</node>
</node>
<node CREATED="1353661031895" ID="ID_1293316256" MODIFIED="1353661245547" TEXT="files : &#x6b64;&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6587;&#x4ef6;&#x5c06;&#x88ab;&#x5b8c;&#x5168;&#x590d;&#x5236;&#x5230;&#x6700;&#x7ec8;&#x7684;&#x6839;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x4e2d;"/>
</node>
<node CREATED="1342681962140" FOLDED="true" ID="ID_648395837" MODIFIED="1362645427088" POSITION="right" TEXT="uci">
<node CREATED="1362116204033" FOLDED="true" ID="ID_1690554606" MODIFIED="1362389363634" TEXT="uci structure">
<node CREATED="1362116235313" ID="ID_495716429" MODIFIED="1362116283212">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#20010;&#37197;&#32622;&#25991;&#20214;&#25918;&#32622;&#22312;/etc/config&#30446;&#24405;&#19979;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362116294707" ID="ID_1998282720" MODIFIED="1362116534491">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#20010;&#37197;&#32622;&#25991;&#20214;&#30001;&#22810;&#20010;section&#32452;&#25104;,&#27599;&#20010;section&#21448;&#30001;&#22810;&#20010;option&#32452;&#25104;
    </p>
    <p>
      config &lt;section 1 type&gt; &lt;section 1 name&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option &lt;option 1 name&gt; &lt;option 1 value&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;. . .
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option &lt;option n name&gt; &lt;option n value&gt;
    </p>
    <p>
      . . .
    </p>
    <p>
      config &lt;section n type&gt; &lt;section n name&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option &lt;option 1 name&gt; &lt;option 1 value&gt;
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;. . .
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option &lt;option n name&gt; &lt;option n value&gt;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362116214737" FOLDED="true" ID="ID_1621246566" MODIFIED="1362389368323" TEXT="uci process library for shell script">
<node CREATED="1362379050800" FOLDED="true" ID="ID_168083188" MODIFIED="1362565806240" TEXT="&#x5178;&#x578b;&#x7528;&#x6cd5;">
<node CREATED="1362116604120" ID="ID_767621490" MODIFIED="1362116641620" TEXT="1, &#x5305;&#x542b;&#x5e93;&#x6587;&#x4ef6; &quot;. /etc/functions.sh&quot;"/>
<node CREATED="1362116644233" FOLDED="true" ID="ID_681423838" MODIFIED="1362117309772" TEXT="2, &#x5b9a;&#x4e49;&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1362116677162" FOLDED="true" ID="ID_257156621" MODIFIED="1362117308652">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      config_cb()
    </p>
    <p>
      {
    </p>
    <p>
      &#160;&#160;&#160;&#160;local type=&quot;$1&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;local name=&quot;$2&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;#other command to run for every section
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
<node CREATED="1362116792843" ID="ID_1280620766" MODIFIED="1362116995881">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      config_load &lt;name&gt;&#21152;&#36733;&#26576;&#20010;&#37197;&#32622;&#25991;&#20214;&#26102;,&#22312;&#22788;&#29702;section&#22836;&#37096;&#21518;(&#20294;&#22312;&#22788;&#29702;section&#30340;option&#21069;)
    </p>
    <p>
      &#20250;&#35843;&#29992;&#27492;&#22238;&#35843;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362117128146" ID="ID_1575268677" MODIFIED="1362117195981">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20351;&#29992;&#38480;&#21046;:
    </p>
    <p>
      &#22312;&#27492;&#20989;&#25968;&#20013;&#19981;&#35201;&#20351;&#29992;config_load, config_get, config_set&#31561;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362116677162" FOLDED="true" ID="ID_1775646385" MODIFIED="1362117307788">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      option_cb()
    </p>
    <p>
      {
    </p>
    <p>
      &#160;&#160;&#160;&#160;local name=&quot;$1&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;local value=&quot;$2&quot;
    </p>
    <p>
      &#160;&#160;&#160;&#160;#other command to run for every option in a section
    </p>
    <p>
      }
    </p>
  </body>
</html></richcontent>
<node CREATED="1362116792843" ID="ID_1654849574" MODIFIED="1362117302487">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      config_load &lt;name&gt;&#21152;&#36733;&#26576;&#20010;&#37197;&#32622;&#25991;&#20214;&#26102;,&#22312;&#22788;&#29702;&#27599;&#20010;section&#30340;&#27599;&#20010;option&#21518;
    </p>
    <p>
      &#20250;&#35843;&#29992;&#27492;&#22238;&#35843;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362117128146" ID="ID_1684799552" MODIFIED="1362117195981">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20351;&#29992;&#38480;&#21046;:
    </p>
    <p>
      &#22312;&#27492;&#20989;&#25968;&#20013;&#19981;&#35201;&#20351;&#29992;config_load, config_get, config_set&#31561;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362117316149" ID="ID_1589582353" MODIFIED="1362117459145">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3, config_load &lt;name&gt; : &#21152;&#36733;&#36335;&#24452;&#20026;/etc/config/&lt;name&gt;&#30340;&#37197;&#32622;&#25991;&#20214;.
    </p>
    <p>
      &#21152;&#36733;&#26399;&#38388;&#20250;&#35843;&#29992;&#22238;&#35843;&#20989;&#25968;config_cb&#21644;option_cb.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362117497704" FOLDED="true" ID="ID_581960368" MODIFIED="1362118420944" TEXT="4, &#x8bfb;&#x5199;&#x914d;&#x7f6e;">
<node CREATED="1362117541097" ID="ID_754667178" MODIFIED="1362117673181">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35835;&#21462;&#37197;&#32622; : config_get &lt;variable&gt; &lt;section&gt; &lt;option&gt;
    </p>
    <p>
      &#23558;&#24050;&#21152;&#36733;&#30340;&#37197;&#32622;&#25991;&#20214;&#20013;&lt;section&gt;&#19979;&lt;option&gt;&#30340;&#20540;&#35835;&#21462;&#21040;&#21464;&#37327;&lt;variable&gt;&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362117551561" ID="ID_399622414" MODIFIED="1362117759679">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20462;&#25913;&#37197;&#32622; : config_set &lt;section&gt; &lt;option&gt; &lt;variable&gt;
    </p>
    <p>
      &#35774;&#32622;&#24050;&#21152;&#36733;&#30340;&#37197;&#32622;&#25991;&#20214;&#20013;&lt;section&gt;&#19979;&lt;option&gt;&#30340;&#20540;&#20026;&#21464;&#37327;&lt;variable&gt;&#30340;&#20540;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362117900143" ID="ID_709412224" MODIFIED="1362118396563">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36941;&#21382;section : config_foreach &lt;callback function&gt; [section type] [arguments for callback]
    </p>
    <p>
      &#36941;&#21382;&#25152;&#26377;section(&#22914;&#26524;&#25351;&#23450;&#20102;section type&#21017;&#21482;&#36941;&#21382;&#29305;&#23450;&#31867;&#22411;&#30340;section)&#35843;&#29992;&#22238;&#35843;&#20989;&#25968;,&#27492;&#22238;&#35843;&#20989;&#25968;&#30340;
    </p>
    <p>
      &#31532;&#19968;&#21442;&#25968;&#20026;&lt;section name&gt;&#20854;&#20313;&#21442;&#25968;&#20026;&#21629;&#20196;&#20013;&#20256;&#20837;&#30340;&#21442;&#25968;(&#21363;[arguments for callback]).&#27880;&#24847;,&#22914;&#26524;
    </p>
    <p>
      section&#26159;&#26410;&#21629;&#21517;section&#21017;&lt;section name&gt;&#20026;cfg1234&#31867;&#20284;&#30340;&#20869;&#37096;&#21517;&#31216;,&#27492;&#21517;&#23383;&#21482;&#22312;&#19968;&#27425;config_load
    </p>
    <p>
      &#36807;&#31243;&#20013;&#26377;&#24847;&#20041;,&#19979;&#19968;&#27425;config_load&#21518;&#21516;&#19968;section&#30340;&#21517;&#23383;&#21487;&#33021;&#21464;&#25104;&#20854;&#20182;&#30340;&#21517;&#23383;&#20102;.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362379077897" FOLDED="true" ID="ID_611634802" MODIFIED="1362565806240" TEXT="&#x7279;&#x6b8a;&#x7528;&#x6cd5;">
<node CREATED="1362379087207" FOLDED="true" ID="ID_288016770" MODIFIED="1362380926127" TEXT="network">
<node CREATED="1362379118789" FOLDED="true" ID="ID_1231254431" MODIFIED="1362380339160">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      #&#39318;&#20808;&#21152;&#20837;&#20197;&#19979;&#20195;&#30721;
    </p>
    <p>
      . /etc/functions.sh
    </p>
    <p>
      include /lib/network
    </p>
    <p>
      scan_interfaces
    </p>
  </body>
</html></richcontent>
<node CREATED="1362379173026" FOLDED="true" ID="ID_14816254" MODIFIED="1362380338664">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      include /lib/network&#30340;&#30446;&#30340;&#26159;&#21253;&#21547;/lib/network/config.sh
    </p>
    <p>
      &#36825;&#20010;&#25991;&#20214;&#20869;&#30340;&#20989;&#25968;scan_interfaces&#23454;&#26102;&#26356;&#26032;&#20102;&#27599;&#20010;interface section
    </p>
    <p>
      &#30340;ifname&#21644;device&#20004;&#20010;option.&#26356;&#26032;&#21518;&#30340;ifname&#34920;&#31034;&#20102;&#30495;&#27491;&#30340;
    </p>
    <p>
      &#29992;&#20110;&#25215;&#36733;IP&#25968;&#25454;L3 interface.&#32780;device&#34920;&#31034;&#20102;L3 interface&#25152;&#22522;&#20110;&#30340;
    </p>
    <p>
      &#29289;&#29702;&#25509;&#21475;.&#26377;&#30340;&#26102;&#20505;(&#27604;&#22914;PPP)&#36825;2&#36825;&#20004;&#32773;&#21487;&#33021;&#19981;&#30456;&#21516;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362379608932" FOLDED="true" ID="ID_1784851728" MODIFIED="1362380336248">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#20309;&#23454;&#26102;&#26356;&#26032;:
    </p>
    <p>
      1, &#36941;&#21382;/etc/config/network&#20013;&#30340;&#27599;&#20010;interface section
    </p>
    <p>
      2, &#23545;&#27599;&#20010;interface&#35843;&#29992;ubus call network.interface.xxx status
    </p>
    <p>
      3, &#35299;&#26512;&#36820;&#22238;&#30340;json&#26684;&#24335;&#30340;&#25968;&#25454;,&#20174;&#20013;&#21462;&#20986;l3_device&#20316;&#20026;ifname
    </p>
  </body>
</html></richcontent>
<node CREATED="1362379895791" FOLDED="true" ID="ID_262276129" MODIFIED="1362380335697" TEXT="shell&#x4e2d;&#x4f7f;&#x7528;json">
<node CREATED="1362379919293" ID="ID_231862067" MODIFIED="1362380188967" TEXT="json_init : &#x521d;&#x59cb;&#x5316;json"/>
<node CREATED="1362379929341" ID="ID_266499203" MODIFIED="1362380201270" TEXT="local data=&quot;json data&quot; : &#x83b7;&#x53d6;json&#x683c;&#x5f0f;&#x7684;&#x6570;&#x636e;"/>
<node CREATED="1362379952075" ID="ID_561072415" MODIFIED="1362380212821" TEXT="json_load data : &#x8c03;&#x7528;json_load&#x89e3;&#x6790;json&#x683c;&#x5f0f;&#x7684;&#x6570;&#x636e;"/>
<node CREATED="1362379965706" ID="ID_766214106" MODIFIED="1362380332096" TEXT="json_get_var var varname : &#x4ece;json&#x6570;&#x636e;&#x4e2d;&#x8bfb;&#x53d6;&#x53d8;&#x91cf;varname&#x7684;&#x503c;&#x5230;var"/>
<node CREATED="1362379984617" ID="ID_916425268" MODIFIED="1362380235459" TEXT="json_init : &#x91cd;&#x65b0;&#x521d;&#x59cb;&#x5316;json,&#x76f8;&#x5f53;&#x4e8e;&#x6e05;&#x7a7a;&#x4e4b;&#x524d;&#x52a0;&#x8f7d;&#x7684;json&#x6570;&#x636e;"/>
</node>
</node>
</node>
</node>
<node CREATED="1362380442089" ID="ID_1232734132" MODIFIED="1362380608616">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      find_config &lt;interface&gt;
    </p>
    <p>
      &#26681;&#25454;interface&#30340;&#23454;&#26102;&#21517;&#31216;&#26597;&#25214;/etc/config/network&#20013;&#23545;&#24212;&#30340;
    </p>
    <p>
      interface section.&#27604;&#22914;&#26681;&#25454;ppp0&#25214;&#21040;wan.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362380705095" FOLDED="true" ID="ID_1411498641" MODIFIED="1362380922727">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      setup_interface &lt;interface&gt; &lt;config&gt;
    </p>
    <p>
      &#35774;&#32622;/etc/config/network&#20013;&#26576;&#20010;interface&#30340;&#23454;&#26102;&#21517;&#31216;,
    </p>
    <p>
      &#27604;&#22914;ppp0&#24314;&#31435;&#36830;&#25509;&#26102;,&#35774;&#32622;wan&#30340;ifname&#20026;ppp0.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362380871563" ID="ID_1915266401" MODIFIED="1362380918211" TEXT="&#x6ce8;&#x610f;&#x8fd9;&#x91cc;&#x8bbe;&#x7f6e;&#x5148;&#x662f;&#x8bbe;&#x7f6e;&#x5230;netifd,&#x518d;&#x7531;netifd&#x53cd;&#x9988;&#x5230;uci(scan_interfaces)"/>
</node>
</node>
</node>
</node>
<node CREATED="1362106431173" FOLDED="true" ID="ID_425943264" MODIFIED="1362645425663" TEXT="topology configure">
<node CREATED="1362107172481" FOLDED="true" ID="ID_1371737691" MODIFIED="1362645424936" TEXT="L3 interface">
<node CREATED="1362107189633" FOLDED="true" ID="ID_828376888" MODIFIED="1362645423680">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;L3 interface&#37117;&#30001;/etc/config/network&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;interface&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config interface 'lan'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option ifname 'eth0.1'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option type 'bridge'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option proto 'static'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option ipaddr '192.168.1.1'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option netmask '255.255.255.0'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362471294295" ID="ID_1829443112" MODIFIED="1362471298721" TEXT="ifname"/>
<node CREATED="1362471329955" ID="ID_750785938" MODIFIED="1362471332063" TEXT="type"/>
<node CREATED="1362471345522" ID="ID_1575373080" MODIFIED="1362471346222" TEXT="proto"/>
<node CREATED="1362471402974" ID="ID_573326200" MODIFIED="1362471404538" TEXT="auto"/>
<node CREATED="1362471415501" ID="ID_71845188" MODIFIED="1362471416313" TEXT="defaultroute"/>
<node CREATED="1362471423757" ID="ID_636523331" MODIFIED="1362471424792" TEXT="peerdns"/>
<node CREATED="1362471431676" ID="ID_791211289" MODIFIED="1362471432312" TEXT="metric"/>
<node CREATED="1362471445003" ID="ID_909203332" MODIFIED="1362471446311" TEXT="dns"/>
<node CREATED="1362471446747" ID="ID_1893705865" MODIFIED="1362471447553" TEXT="dns_search"/>
<node CREATED="1362471448219" ID="ID_461437860" MODIFIED="1362471450710" TEXT="interface"/>
<node CREATED="1362471461674" ID="ID_246847723" MODIFIED="1362471489172" TEXT="&#x5f53;proto = static&#x65f6;&#x989d;&#x5916;&#x652f;&#x6301;&#x7684;&#x53c2;&#x6570;"/>
<node CREATED="1362471461674" ID="ID_1798914766" MODIFIED="1362471500371" TEXT="&#x5f53;proto = dhcp&#x65f6;&#x989d;&#x5916;&#x652f;&#x6301;&#x7684;&#x53c2;&#x6570;"/>
<node CREATED="1362471461674" ID="ID_876232012" MODIFIED="1362471514756" TEXT="&#x5f53;proto = ppp&#x65f6;&#x989d;&#x5916;&#x652f;&#x6301;&#x7684;&#x53c2;&#x6570;"/>
</node>
<node CREATED="1362107327380" FOLDED="true" ID="ID_1445747356" MODIFIED="1362565806244" TEXT="L2 interface">
<node CREATED="1362107341540" FOLDED="true" ID="ID_336224763" MODIFIED="1362565806242" TEXT="Bridge">
<node CREATED="1362109055474" FOLDED="true" ID="ID_767346359" MODIFIED="1362467206756">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;bridge&#37117;&#30001;/etc/config/network&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;device&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config device 'br-lan'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option type 'bridge'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option name 'br-lan'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option ifname 'eth0.1 athwifi0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option stp '1'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option forward_delay '10'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option ageing_time '180'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option hello_time '300'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option max_age '600'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option igmp_snooping '1'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362109181252" ID="ID_382268520" MODIFIED="1362389610949" TEXT="type : &#x8bbe;&#x5907;&#x7c7b;&#x578b; : (bridge | tunnel)"/>
<node CREATED="1362109236837" ID="ID_1073943201" MODIFIED="1362389628436" TEXT="name : &#x8bbe;&#x5907;&#x540d;&#x79f0;"/>
<node CREATED="1362463175772" ID="ID_1744826000" MODIFIED="1362467192064" TEXT="ifname : bridge&#x7684;&#x6210;&#x5458;,&#x4ee5;&#x7a7a;&#x683c;&#x5206;&#x9694;&#x591a;&#x4e2a;&#x6210;&#x5458;"/>
<node CREATED="1362463182956" ID="ID_1472378592" MODIFIED="1362463184503" TEXT="mtu"/>
<node CREATED="1362463188955" ID="ID_572935714" MODIFIED="1362463191975" TEXT="macaddr"/>
<node CREATED="1362463192859" ID="ID_1022052873" MODIFIED="1362463198534" TEXT="txqueuelen"/>
<node CREATED="1362463205162" ID="ID_1851046619" MODIFIED="1362463207750" TEXT="enabled"/>
<node CREATED="1362463152078" ID="ID_1400894836" MODIFIED="1362463505649" TEXT="stp"/>
<node CREATED="1362463182956" ID="ID_1486995470" MODIFIED="1362463517383" TEXT="forward_delay"/>
<node CREATED="1362463188955" ID="ID_1521996691" MODIFIED="1362463525139" TEXT="ageing_time"/>
<node CREATED="1362463192859" ID="ID_1245683386" MODIFIED="1362463535994" TEXT="hello_time"/>
<node CREATED="1362463205162" ID="ID_147918701" MODIFIED="1362463544620" TEXT="max_age"/>
<node CREATED="1362463551010" ID="ID_62385787" MODIFIED="1362463551998" TEXT="igmp_snooping"/>
</node>
</node>
<node CREATED="1362107350772" ID="ID_889524609" MODIFIED="1362107358016" TEXT="VLAN"/>
<node CREATED="1362107364900" ID="ID_1148873591" MODIFIED="1362107367712" TEXT="PPP"/>
<node CREATED="1362389462548" FOLDED="true" ID="ID_1315251761" MODIFIED="1362389678196" TEXT="tunnel">
<node CREATED="1362109055474" FOLDED="true" ID="ID_369879751" MODIFIED="1362389676861">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;tunnel&#37117;&#30001;/etc/config/network&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;device&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config device 'tunnel0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option type 'tunnel'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option name 'tunnel0'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362109181252" ID="ID_32108049" MODIFIED="1362389610949" TEXT="type : &#x8bbe;&#x5907;&#x7c7b;&#x578b; : (bridge | tunnel)"/>
<node CREATED="1362109236837" ID="ID_1638691089" MODIFIED="1362389628436" TEXT="name : &#x8bbe;&#x5907;&#x540d;&#x79f0;"/>
</node>
</node>
<node CREATED="1362107444245" FOLDED="true" ID="ID_1798059260" MODIFIED="1362565806243" TEXT="ethernet">
<node CREATED="1362107723322" FOLDED="true" ID="ID_1711997276" MODIFIED="1362389472331" TEXT="switch">
<node CREATED="1362107757211" FOLDED="true" ID="ID_1124738158" MODIFIED="1362133378938">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;switch&#37117;&#30001;/etc/config/network&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;switch&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config switch
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option name 'switch0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option enable_vlan '1'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362120775491" ID="ID_114745566" MODIFIED="1362120778862" TEXT="name"/>
<node CREATED="1362120779506" ID="ID_1299760291" MODIFIED="1362120781790" TEXT="reset"/>
<node CREATED="1362120782514" ID="ID_1955417997" MODIFIED="1362120788494" TEXT="enable_vlan"/>
</node>
<node CREATED="1362108453640" ID="ID_1195430682" MODIFIED="1362108551836">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#20010;switch&#22312;&#25805;&#20316;&#31995;&#32479;&#20869;&#34920;&#29616;&#20026;&#19968;&#20010;ethernet L2 interface,
    </p>
    <p>
      &#21487;&#20197;&#29992;ethx&#26469;&#24341;&#29992;&#23427;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362107731947" FOLDED="true" ID="ID_692790810" MODIFIED="1362133353193" TEXT="switch vlan">
<node CREATED="1362107829724" FOLDED="true" ID="ID_921505595" MODIFIED="1362125639264">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;switch vlan&#37117;&#30001;/etc/config/network&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;switch_vlan&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config switch_vlan
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option device 'switch0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option vlan '1'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option ports '0t 1 2 3 4'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362107901374" ID="ID_1344586747" MODIFIED="1362107921178" TEXT="device : &#x6b64;vlan&#x6240;&#x5c5e;&#x7684;switch"/>
<node CREATED="1362107922990" ID="ID_464890599" MODIFIED="1362107947098" TEXT="vlan : vlan id, 1-4095"/>
<node CREATED="1362107948302" ID="ID_298698263" MODIFIED="1362125606668">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ports : &#27492;vlan&#20869;&#30340;&#31471;&#21475;, &#33509;&#20026;tagged&#25104;&#21592;&#21017;&#24212;&#22312;&#31471;&#21475;&#21495;&#21518;&#38754;&#36319;t&#34920;&#31034;.
    </p>
    <p>
      &#22312;qualcomm&#30340;switch&#20013;,0&#20026;CPU&#21475;,1-4&#20026;LAN&#21475;,5&#20026;WAN&#21475;.
    </p>
    <p>
      &#19968;&#20010;switch vlan&#30340;&#37197;&#32622;&#20013;,CPU&#21475;&#24517;&#39035;&#23646;&#20110;&#27492;vlan&#30340;tagged&#25104;&#21592;.
    </p>
    <p>
      &#19968;&#20010;&#31471;&#21475;&#33509;&#22312;&#26576;&#20010;vlan&#20026;untagged&#25104;&#21592;,&#21017;&#27492;&#31471;&#21475;&#30340;pvid&#21363;&#20026;&#27492;vlan.
    </p>
    <p>
      &#19968;&#20010;&#31471;&#21475;&#21482;&#33021;&#22312;&#19968;&#20010;vlan&#20026;untagged&#25104;&#21592;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362108319574" ID="ID_553848569" MODIFIED="1362108421009">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#20010;switch vlan&#22312;&#25805;&#20316;&#31995;&#32479;&#20869;&#34920;&#29616;&#20026;&#19968;&#20010;&#24102;vlan&#30340;ethernet L2 interface,
    </p>
    <p>
      &#21487;&#20197;&#29992;ethx.vlan&#26469;&#24341;&#29992;&#23427;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362108594266" FOLDED="true" ID="ID_1527772059" MODIFIED="1362133344161" TEXT="&#x95ee;&#x9898;">
<node CREATED="1362108606266" ID="ID_448608874" MODIFIED="1362125634619">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#20309;&#35774;&#32622;&#26576;&#20010;switch&#31471;&#21475;&#30340;PVID
    </p>
    <p>
      &#31572; : &#19968;&#20010;&#31471;&#21475;&#33509;&#22312;&#26576;&#20010;vlan&#20026;untagged&#25104;&#21592;,&#21017;&#27492;&#31471;&#21475;&#30340;pvid&#21363;&#20026;&#27492;vlan
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362107731947" FOLDED="true" ID="ID_1041999315" MODIFIED="1362377972461" TEXT="switch port">
<node CREATED="1362107829724" FOLDED="true" ID="ID_1289667615" MODIFIED="1362126219347">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;switch port&#37117;&#30001;/etc/config/network&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;switch_port&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config switch_port
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option device 'switch0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option port '1'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option pvid '1'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362107901374" ID="ID_1417535291" MODIFIED="1362107921178" TEXT="device : &#x6b64;vlan&#x6240;&#x5c5e;&#x7684;switch"/>
<node CREATED="1362107922990" ID="ID_702617443" MODIFIED="1362121058947" TEXT="port : &#x7aef;&#x53e3;&#x53f7;, 0-8"/>
<node CREATED="1362126193890" ID="ID_981563536" MODIFIED="1362126206926" TEXT="pvid : &#x7aef;&#x53e3;&#x7684;pvid"/>
</node>
<node CREATED="1362108594266" FOLDED="true" ID="ID_1385745826" MODIFIED="1362133343233" TEXT="&#x95ee;&#x9898;">
<node CREATED="1362108606266" ID="ID_1972262398" MODIFIED="1362125634619">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#20309;&#35774;&#32622;&#26576;&#20010;switch&#31471;&#21475;&#30340;PVID
    </p>
    <p>
      &#31572; : &#19968;&#20010;&#31471;&#21475;&#33509;&#22312;&#26576;&#20010;vlan&#20026;untagged&#25104;&#21592;,&#21017;&#27492;&#31471;&#21475;&#30340;pvid&#21363;&#20026;&#27492;vlan
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362121639345" FOLDED="true" ID="ID_173465630" MODIFIED="1362378005179" TEXT="&#x5b9e;&#x73b0;">
<node CREATED="1362121658226" FOLDED="true" ID="ID_1315825008" MODIFIED="1362133131253">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#29992;&#25143;&#31354;&#38388; : swconfig(openwrt/package/swconfig)
    </p>
    <p>
      swconfig&#30340;&#20316;&#29992;&#23601;&#26159;get/set&#23646;&#24615;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362121704499" ID="ID_609358269" MODIFIED="1362122023764" TEXT="global&#x5c5e;&#x6027; : &#x5bf9;&#x5e94;&#x4e86;/etc/config/network&#x4e2d;switch section&#x4e2d;&#x7684;option"/>
<node CREATED="1362121711699" ID="ID_1359159200" MODIFIED="1362122047365" TEXT="per port&#x5c5e;&#x6027; : &#x5bf9;&#x5e94;&#x4e86;/etc/config/network&#x4e2d;switch_port section&#x4e2d;&#x7684;option"/>
<node CREATED="1362121730627" ID="ID_1661549720" MODIFIED="1362122055444" TEXT="per vlan&#x5c5e;&#x6027; : &#x5bf9;&#x5e94;&#x4e86;/etc/config/network&#x4e2d;switch_vlan section&#x4e2d;&#x7684;option"/>
</node>
<node CREATED="1362123760855" FOLDED="true" ID="ID_1886928402" MODIFIED="1362378003811">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20869;&#26680;&#31354;&#38388; : swconfig(kernel_source/drivers/net/phy/swconfig)
    </p>
    <p>
      switch&#30495;&#27491;&#30340;&#39537;&#21160;&#31243;&#24207;&#39318;&#20808;&#21021;&#22987;&#21270;&#19968;&#20010;struct switch_dev,&#28982;&#21518;&#35843;&#29992;
    </p>
    <p>
      register_switch(struct switch_dev *dev, struct net_device *netdev)
    </p>
    <p>
      &#27880;&#20876;&#27492;switch.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362124041964" FOLDED="true" ID="ID_684177779" MODIFIED="1362377996525" TEXT="struct switch_dev">
<node CREATED="1362124443398" FOLDED="true" ID="ID_1314059403" MODIFIED="1362377995159" TEXT=" const struct switch_dev_ops *ops">
<node CREATED="1362124443398" FOLDED="true" ID="ID_22486731" MODIFIED="1362131830246" TEXT=" struct switch_attrlist attr_global, attr_port, attr_vlan">
<node CREATED="1362124443398" FOLDED="true" ID="ID_1565060169" MODIFIED="1362131829423" TEXT="struct switch_attr">
<node CREATED="1362124443398" MODIFIED="1362124443398" TEXT=" int disabled"/>
<node CREATED="1362124443398" FOLDED="true" ID="ID_1547354985" MODIFIED="1362125788851" TEXT=" int type : &#x5c5e;&#x6027;&#x503c;&#x7684;&#x7c7b;&#x578b;">
<node CREATED="1362125765627" ID="ID_904802825" MODIFIED="1362125766567" TEXT="SWITCH_TYPE_INT"/>
<node CREATED="1362125772939" ID="ID_1784412179" MODIFIED="1362125773911" TEXT="SWITCH_TYPE_STRING"/>
<node CREATED="1362125779547" ID="ID_1919512990" MODIFIED="1362125780391" TEXT="SWITCH_TYPE_PORTS"/>
<node CREATED="1362125786172" ID="ID_94606957" MODIFIED="1362125786919" TEXT="SWITCH_TYPE_NOVAL"/>
</node>
<node CREATED="1362124443398" ID="ID_1627385035" MODIFIED="1362125837608" TEXT=" const char *name : &#x5c5e;&#x6027;&#x540d;&#x79f0;, &#x5bf9;&#x5e94;&#x4e86;config&#x6587;&#x4ef6;&#x4e2d;section&#x5185;option&#x7684;&#x540d;&#x79f0;"/>
<node CREATED="1362124443398" ID="ID_636833284" MODIFIED="1362125855512" TEXT=" const char *description : &#x5c5e;&#x6027;&#x63cf;&#x8ff0;"/>
<node CREATED="1362124443398" ID="ID_343870205" MODIFIED="1362125909056">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*set)(struct switch_dev *dev, const struct switch_attr *attr, struct switch_val *val)
    </p>
    <p>
      &#35774;&#32622;&#23646;&#24615;&#30340;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" ID="ID_1426750071" MODIFIED="1362125921552">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*get)(struct switch_dev *dev, const struct switch_attr *attr, struct switch_val *val)
    </p>
    <p>
      &#33719;&#21462;&#23646;&#24615;&#30340;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" MODIFIED="1362124443399" TEXT=" int id"/>
<node CREATED="1362124443399" MODIFIED="1362124443399" TEXT=" int ofs"/>
<node CREATED="1362124443399" ID="ID_1104424091" MODIFIED="1362125936042" TEXT=" int max : &#x5c5e;&#x6027;&#x7684;&#x6700;&#x5927;&#x503c;"/>
</node>
</node>
<node CREATED="1362124443399" ID="ID_369878482" MODIFIED="1362125472280">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*get_vlan_ports)(struct switch_dev *dev, struct switch_val *val)
    </p>
    <p>
      &#33719;&#21462;vlan&#30340;&#25104;&#21592;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" ID="ID_1344014519" MODIFIED="1362125460672">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*set_vlan_ports)(struct switch_dev *dev, struct switch_val *val)
    </p>
    <p>
      &#35774;&#32622;vlan&#30340;&#25104;&#21592;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" ID="ID_1849685483" MODIFIED="1362125120643">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*get_port_pvid)(struct switch_dev *dev, int port, int *val)
    </p>
    <p>
      &#33719;&#21462;&#31471;&#21475;&#30340;PVID
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" ID="ID_391517158" MODIFIED="1362125106482">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*set_port_pvid)(struct switch_dev *dev, int port, int val)
    </p>
    <p>
      &#35774;&#32622;&#31471;&#21475;&#30340;PVID
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" ID="ID_267651100" MODIFIED="1362125087337">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*apply_config)(struct switch_dev *dev)
    </p>
    <p>
      &#24212;&#29992;&#25913;&#21464;&#20102;&#30340;&#37197;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" ID="ID_1658751786" MODIFIED="1362125065529">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*reset_switch)(struct switch_dev *dev)
    </p>
    <p>
      &#23558;switch&#24674;&#22797;&#20026;&#40664;&#35748;&#37197;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443399" FOLDED="true" ID="ID_1971808199" MODIFIED="1362124936964">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*get_port_link)(struct switch_dev *dev, int port, struct switch_port_link *link)
    </p>
    <p>
      &#33719;&#21462;switch&#26576;&#20010;port&#30340;&#38142;&#36335;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362124682729" FOLDED="true" ID="ID_1693483954" MODIFIED="1362124933916" TEXT="struct switch_port_link">
<node CREATED="1362124809806" ID="ID_540089582" MODIFIED="1362124922872" TEXT=" bool link : &#x94fe;&#x8def;&#x72b6;&#x6001;"/>
<node CREATED="1362124809806" ID="ID_345483014" MODIFIED="1362124904944" TEXT=" bool duplex : &#x53cc;&#x5de5;"/>
<node CREATED="1362124809806" ID="ID_1951704934" MODIFIED="1362124893623" TEXT=" bool aneg : &#x81ea;&#x534f;&#x5546;"/>
<node CREATED="1362124809806" ID="ID_2960285" MODIFIED="1362124865708" TEXT=" bool tx_flow : &#x53d1;&#x9001;&#x6d41;&#x63a7;"/>
<node CREATED="1362124809806" ID="ID_491476683" MODIFIED="1362124878871" TEXT=" bool rx_flow : &#x63a5;&#x6536;&#x6d41;&#x63a7;"/>
<node CREATED="1362124809806" FOLDED="true" ID="ID_1971767900" MODIFIED="1362124932184" TEXT=" enum switch_port_speed speed : &#x901f;&#x7387;">
<node CREATED="1362124826735" ID="ID_28356242" MODIFIED="1362124827734" TEXT="SWITCH_PORT_SPEED_10"/>
<node CREATED="1362124834282" ID="ID_29682104" MODIFIED="1362124835174" TEXT="SWITCH_PORT_SPEED_100"/>
<node CREATED="1362124841450" ID="ID_1479963182" MODIFIED="1362124842326" TEXT="SWITCH_PORT_SPEED_1000"/>
</node>
</node>
</node>
<node CREATED="1362124443399" ID="ID_450116189" MODIFIED="1362124443399" TEXT=" int (*get_port_stats)(struct switch_dev *dev, int port, struct switch_port_stats *stats)"/>
</node>
<node CREATED="1362124443399" ID="ID_99202660" MODIFIED="1362131965237" TEXT=" char devname[IFNAMSIZ] : &#x7531;swconfig&#x6a21;&#x5757;&#x81ea;&#x52a8;&#x5206;&#x914d;&#x7684;&#x540d;&#x79f0;,&#x683c;&#x5f0f;&#x4e3a;switchx, x&#x4e3a;&#x4e00;&#x4e2a;&#x6570;&#x5b57;, &#x4ece;0&#x5f00;&#x59cb;"/>
<node CREATED="1362124443399" ID="ID_1781010481" MODIFIED="1362132081457" TEXT=" const char *name : switch&#x9a71;&#x52a8;&#x8bbe;&#x7f6e;&#x7684;&#x540d;&#x79f0;,&#x6bd4;&#x5982;&quot;Atheros AR8327&quot;"/>
<node CREATED="1362124443399" ID="ID_1312455669" MODIFIED="1362132106775" TEXT=" const char *alias : &#x522b;&#x540d;"/>
<node CREATED="1362124443399" ID="ID_1030291164" MODIFIED="1362132189091" TEXT=" struct net_device *netdev : &#x6240;&#x5173;&#x8054;&#x7684;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x7684;interface"/>
<node CREATED="1362124443399" ID="ID_1080755704" MODIFIED="1362132225929" TEXT=" int ports : &#x6b64;switch&#x6709;&#x51e0;&#x4e2a;&#x7aef;&#x53e3;"/>
<node CREATED="1362124443399" ID="ID_1455719125" MODIFIED="1362132246377" TEXT=" int vlans : &#x6b64;switch&#x6700;&#x591a;&#x652f;&#x6301;&#x591a;&#x5c11;&#x4e2a;vlan"/>
<node CREATED="1362124443399" ID="ID_1529402789" MODIFIED="1362132290906" TEXT=" int cpu_port : CPU&#x53e3;&#x662f;&#x54ea;&#x4e2a;&#x53e3;"/>
<node CREATED="1362124443400" ID="ID_619287052" MODIFIED="1362126421170" TEXT=" int id : &#x7cfb;&#x7edf;&#x5206;&#x914d;&#x7ed9;&#x6b64;switch&#x7684;&#x7f16;&#x53f7;"/>
<node CREATED="1362124443400" ID="ID_828485348" MODIFIED="1362132434237" TEXT=" struct list_head dev_list : &#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x5168;&#x5c40;&#x94fe;&#x8868;swdevs&#x4e2d;(&#x4fdd;&#x5b58;&#x6240;&#x6709;switch)"/>
<node CREATED="1362124443400" ID="ID_1849041450" MODIFIED="1362133044744">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;unsigned long def_global, def_port, def_vlan
    </p>
    <p>
      def_global : &#25903;&#25345;&#21738;&#20123;global&#30340;&#23646;&#24615;
    </p>
    <p>
      def_port : &#25903;&#25345;&#21738;&#20123;per port&#30340;&#23646;&#24615;
    </p>
    <p>
      def_vlan : &#25903;&#25345;&#21738;&#20123;per vlan&#30340;&#23646;&#24615;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362124443400" ID="ID_226452580" MODIFIED="1362132452093" TEXT=" struct mutex sw_mutex : &#x4e92;&#x65a5;&#x9501;"/>
<node CREATED="1362124443400" ID="ID_1272981328" MODIFIED="1362124443400" TEXT=" struct switch_port *portbuf"/>
<node CREATED="1362124443400" MODIFIED="1362124443400" TEXT=" char buf[128]"/>
<node CREATED="1362124443400" ID="ID_753535988" MODIFIED="1362133101865" TEXT=" struct switch_led_trigger *led_trigger : LED&#x76f8;&#x5173;&#x53c2;&#x6570;"/>
</node>
</node>
</node>
<node CREATED="1362108722381" FOLDED="true" ID="ID_542527163" MODIFIED="1362133518596" TEXT="&#x95ee;&#x9898;">
<node CREATED="1362108726924" ID="ID_1554350202" MODIFIED="1362133517048">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#20309;&#23558;&#19968;&#20010;switch&#19982;&#25805;&#20316;&#31995;&#32479;&#20869;&#19968;&#20010;ethernet L2 interface&#20851;&#32852;&#36215;&#26469;,
    </p>
    <p>
      &#21363;&#24341;&#29992;switch&#20851;&#32852;&#30340;ethx&#26102;&#22914;&#20309;&#30830;&#23450;&#36825;&#20010;x.
    </p>
    <p>
      &#31572; : &#30446;&#21069;&#27809;&#26377;&#22266;&#23450;&#26426;&#21046;. switch0&#34920;&#31034;&#31532;&#19968;&#20010;&#27880;&#20876;&#30340;switch.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1362108859471" FOLDED="true" ID="ID_1336377179" MODIFIED="1362565806243" TEXT="wireless">
<node CREATED="1362109018305" FOLDED="true" ID="ID_379245675" MODIFIED="1362389479107" TEXT="radio">
<node CREATED="1362109055474" FOLDED="true" ID="ID_310695309" MODIFIED="1362109481530">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;wireless radio&#37117;&#30001;/etc/config/wireless&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;wifi-device&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config wifi-device 'wifi0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option type 'atheros'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option macaddr '00:03:7f:48:8b:91'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option disabled '0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option hwmode '11g'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option htmode 'none'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option country '156'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option channel '6'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362109181252" ID="ID_1741048703" MODIFIED="1362109226673" TEXT="type : &#x9a71;&#x52a8;&#x7c7b;&#x578b; : (broadcom | atheros | mac80211)"/>
<node CREATED="1362109236837" ID="ID_231977675" MODIFIED="1362109312370" TEXT="macaddr : MAC&#x5730;&#x5740; : (xx:xx:xx:xx:xx:xx)"/>
<node CREATED="1362109260870" ID="ID_1959994125" MODIFIED="1362109294434" TEXT="disable : &#x662f;&#x5426;&#x5173;&#x95ed;&#x6b64;radio : (0 | 1)"/>
<node CREATED="1362109320775" ID="ID_1039842924" MODIFIED="1362109409764" TEXT="hwmode : &#x5728;&#x54ea;&#x79cd;&#x7c7b;&#x578b;&#x7684;wifi&#x4e0a;&#x5de5;&#x4f5c; : (11a | 11b | 11g | 11n | 11bg)"/>
<node CREATED="1362109438425" ID="ID_70833176" MODIFIED="1362109453413" TEXT="country : "/>
<node CREATED="1362109456681" ID="ID_950784747" MODIFIED="1362109460981" TEXT="channel :"/>
</node>
<node CREATED="1362108453640" ID="ID_1302411712" MODIFIED="1362109942740">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#20010;radio&#22312;&#25805;&#20316;&#31995;&#32479;&#20869;&#34920;&#29616;&#20026;&#19968;&#20010;ethernet L2 interface,
    </p>
    <p>
      &#19968;&#33324;&#19981;&#20351;&#29992;&#23427;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362109023921" FOLDED="true" ID="ID_1472234882" MODIFIED="1362110168670" TEXT="vap">
<node CREATED="1362109055474" FOLDED="true" ID="ID_1972209848" MODIFIED="1362109888993">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#20010;wireless vap&#37117;&#30001;/etc/config/wireless&#20013;
    </p>
    <p>
      &#19968;&#20010;&#31867;&#22411;&#20026;wifi-iface&#30340;section&#20195;&#34920;:
    </p>
    <p>
      config wifi-iface
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option device 'wifi0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option network 'lan'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option mode 'ap'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option encryption 'none'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option disabled '0'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option ssid 'Atheros XSpan Network'
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;option hidden '0'
    </p>
  </body>
</html></richcontent>
<node CREATED="1362109486154" ID="ID_1236562799" MODIFIED="1362109496694" TEXT="device : &#x6240;&#x5c5e;&#x7684;radio"/>
<node CREATED="1362109497306" ID="ID_265106356" MODIFIED="1362109645400" TEXT="network : &#x5c06;&#x6b64;vap&#x6865;&#x63a5;(bridge)&#x5230;&#x54ea;&#x4e2a;L3 interface&#x4e0b;"/>
<node CREATED="1362109655005" ID="ID_1656507475" MODIFIED="1362109673001" TEXT="mode : &#x6a21;&#x5f0f; : (ap | sta)"/>
<node CREATED="1362109686029" ID="ID_914054658" MODIFIED="1362109714601" TEXT="ssid : &#x7f51;&#x7edc;&#x540d;&#x79f0; : string"/>
<node CREATED="1362109715710" ID="ID_1439434310" MODIFIED="1362109778187" TEXT="encryption : &#x8ba4;&#x8bc1;&#x6a21;&#x5f0f; : (none | wep | psk | psk2 | wpa | wpa2)"/>
<node CREATED="1362109786127" ID="ID_1074630929" MODIFIED="1362109885997" TEXT="hidden : &#x4e0d;&#x53d1;&#x9001;beacon : (0 | 1)"/>
<node CREATED="1362109827104" ID="ID_70293021" MODIFIED="1362109875020" TEXT="disabled : &#x5173;&#x95ed;&#x6b64;vap : (0 | 1)"/>
</node>
<node CREATED="1362108453640" ID="ID_1159626683" MODIFIED="1362110063534">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#20010;vap&#22312;&#25805;&#20316;&#31995;&#32479;&#20869;&#34920;&#29616;&#20026;&#19968;&#20010;ethernet L2 interface,
    </p>
    <p>
      &#21487;&#20197;&#29992;athwifix&#26469;&#24341;&#29992;&#23427;, &#23427;&#21487;&#20197;&#21333;&#29420;&#20316;&#20026;&#19968;&#20010;L3 interface,
    </p>
    <p>
      &#20063;&#21487;&#20197;&#34987;bridge&#21040;lan&#25152;&#22312;&#30340;L3 interface.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362109987763" FOLDED="true" ID="ID_766704" MODIFIED="1362110166758" TEXT="&#x95ee;&#x9898;">
<node CREATED="1362110072788" ID="ID_1843024813" MODIFIED="1362110164592">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      vap&#22312;&#25805;&#20316;&#31995;&#32479;&#20869;&#34920;&#29616;&#30340;ethernet L2 interface&#30340;&#21517;&#31216;
    </p>
    <p>
      &#26159;&#22914;&#20309;&#30830;&#23450;&#30340;,&#24590;&#26679;&#25442;&#19968;&#31181;&#21629;&#21517;&#39118;&#26684;.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1362106697592" FOLDED="true" ID="ID_1018400195" MODIFIED="1362645384194" TEXT="L3 configure">
<node CREATED="1362106716136" FOLDED="true" ID="ID_54784802" MODIFIED="1362565806244" TEXT="static route">
<node CREATED="1362106729913" FOLDED="true" ID="ID_1961514387" MODIFIED="1362556168692">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#19968;&#26465;&#38745;&#24577;&#36335;&#30001;&#37117;&#22312;/etc/config/network&#21344;&#29992;&#19968;&#20010;&#31867;&#22411;&#20026;route&#30340;section:
    </p>
    <p>
      config route
    </p>
    <p>
      &#160;&#160;&#160;&#160;option interface wan
    </p>
    <p>
      &#160;&#160;&#160;&#160;option target 10.21.10.0
    </p>
    <p>
      &#160;&#160;&#160;&#160;option netmask 255.255.255.0
    </p>
    <p>
      &#160;&#160;&#160;&#160;option gateway 192.168.10.1
    </p>
  </body>
</html></richcontent>
<node CREATED="1362555735890" ID="ID_272251267" MODIFIED="1362555738555" TEXT="interface"/>
<node CREATED="1362555743761" ID="ID_476103880" MODIFIED="1362555744621" TEXT="target"/>
<node CREATED="1362555751313" ID="ID_502686657" MODIFIED="1362555752109" TEXT="netmask"/>
<node CREATED="1362555758337" ID="ID_379279380" MODIFIED="1362555759132" TEXT="gateway"/>
<node CREATED="1362555767232" ID="ID_796889386" MODIFIED="1362555767995" TEXT="metric"/>
<node CREATED="1362555774512" ID="ID_311232567" MODIFIED="1362555776113" TEXT="mtu"/>
</node>
</node>
</node>
</node>
<node CREATED="1362383241622" FOLDED="true" ID="ID_1726329627" MODIFIED="1369234357106" POSITION="right" TEXT="netifd">
<node CREATED="1362384089722" FOLDED="true" ID="ID_1016871601" MODIFIED="1362645379643" TEXT="usage">
<node CREATED="1362384119560" FOLDED="true" ID="ID_1775616619" MODIFIED="1362577653402" TEXT="&#x547d;&#x4ee4;&#x884c;">
<node CREATED="1362384131816" ID="ID_369066126" MODIFIED="1362384140612">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Usage: netifd [options]
    </p>
    <p>
      Options:
    </p>
    <p>
      &#160;-d &lt;mask&gt;:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Mask for debug messages
    </p>
    <p>
      &#160;-s &lt;path&gt;:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Path to the ubus socket
    </p>
    <p>
      &#160;-p &lt;path&gt;:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Path to netifd addons (default: /lib/netifd)
    </p>
    <p>
      &#160;-h &lt;path&gt;:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Path to the hotplug script
    </p>
    <p>
      &#160;-r &lt;path&gt;:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Path to resolv.conf
    </p>
    <p>
      &#160;-l &lt;level&gt;:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Log output level (default: 2)
    </p>
    <p>
      &#160;-S:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Use stderr instead of syslog for log messages
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362384146359" ID="ID_411204747" MODIFIED="1362384148882" TEXT="ubus"/>
</node>
<node CREATED="1362384263502" ID="ID_989660566" MODIFIED="1362577660634" TEXT="implement">
<node CREATED="1362384596583" ID="ID_937314721" MODIFIED="1362581556559" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1362388497399" FOLDED="true" ID="ID_1541974137" MODIFIED="1362817744604">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct device
    </p>
    <p>
      device&#26159;&#19968;&#20010;&#22522;&#31867;,&#20174;&#23427;&#21487;&#20197;&#27966;&#29983;&#20986;&#20960;&#31181;&#23376;&#31867;,&#27604;&#22914;bridge,tunnel,simple.
    </p>
    <p>
      &#21516;&#26679;&#30340;,uci&#20013;&#20851;&#20110;&#27492;&#35774;&#22791;&#30340;&#37197;&#32622;&#26377;&#20123;&#26159;&#38024;&#23545;&#22522;&#31867;&#30340;,&#26377;&#20123;&#26159;&#38024;&#23545;&#23376;&#31867;&#30340;,&#22240;&#27492;
    </p>
    <p>
      &#38024;&#23545;&#22522;&#31867;device&#30340;&#37197;&#32622;&#25918;&#21040;dev-&gt;config(&#21407;&#22987;&#37197;&#32622;)&#21644;dev-&gt;settings(&#35299;&#26512;&#21518;&#25903;&#25345;&#30340;&#37197;&#32622;)&#20013;.
    </p>
    <p>
      &#32780;&#38024;&#23545;&#23376;&#31867;&#30340;&#37197;&#32622;&#21017;&#30001;&#20989;&#25968;dev-&gt;type-&gt;config_init&#21644;dev-&gt;type-&gt;reload&#20445;&#23384;&#21040;&#23376;&#31867;&#33258;&#24049;
    </p>
    <p>
      &#32467;&#26500;&#20013;&#21435;,&#27604;&#22914;struct bridge_state *bst -&gt; config.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362388975170" FOLDED="true" ID="ID_386734901" MODIFIED="1362451968259" TEXT=" const struct device_type *type">
<node CREATED="1362388975170" MODIFIED="1362388975170" TEXT=" struct list_head list"/>
<node CREATED="1362388975170" ID="ID_967320221" MODIFIED="1362391053233" TEXT=" const char *name : &#x8bbe;&#x5907;&#x7c7b;&#x578b;"/>
<node CREATED="1362388975170" ID="ID_1691201431" MODIFIED="1362391156938" TEXT=" const struct config_param_list *config_params : &#x6b64;&#x79cd;&#x7c7b;&#x578b;&#x7684;&#x8bbe;&#x5907;&#x652f;&#x6301;&#x54ea;&#x4e9b;&#x53c2;&#x6570;"/>
<node CREATED="1362388975170" ID="ID_420559137" MODIFIED="1362391217900">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device *(*create)(const char *name, struct blob_attr *attr)
    </p>
    <p>
      &#29992;&#20110;&#21019;&#24314;&#27492;&#31181;&#35774;&#22791;&#30340;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362388975170" ID="ID_197922679" MODIFIED="1362391665477">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*config_init)(struct device *)
    </p>
    <p>
      &#29992;&#20110;&#20174;/etc/config/network&#30456;&#23545;&#24212;&#30340;section&#20013;
    </p>
    <p>
      &#25552;&#21462;&#27492;&#35774;&#22791;&#30456;&#20851;&#30340;&#37197;&#32622;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362388975170" ID="ID_1300230448" MODIFIED="1362391761174">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;enum dev_change_type (*reload)(struct device *, struct blob_attr *)
    </p>
    <p>
      &#29992;&#20110;&#23558;&#27492;&#35774;&#22791;&#30340;&#37197;&#32622;&#24674;&#22797;&#21040;&#40664;&#35748;&#20540;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362388975170" ID="ID_1759184092" MODIFIED="1362388975170" TEXT=" void (*dump_info)(struct device *, struct blob_buf *buf)"/>
<node CREATED="1362388975170" ID="ID_1450454097" MODIFIED="1362388975170" TEXT=" void (*dump_stats)(struct device *, struct blob_buf *buf)"/>
<node CREATED="1362388975170" ID="ID_1409035537" MODIFIED="1362388975170" TEXT=" int (*check_state)(struct device *)"/>
<node CREATED="1362388975170" ID="ID_1108707587" MODIFIED="1362391784428">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*free)(struct device *)
    </p>
    <p>
      &#29992;&#20110;&#37322;&#25918;&#28165;&#38500;&#35774;&#22791;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362388975170" ID="ID_992769961" MODIFIED="1362392443647" TEXT=" struct avl_node avl : &#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x5168;&#x5c40;&#x53d8;&#x91cf;devices"/>
<node CREATED="1362388975170" FOLDED="true" ID="ID_1590552938" MODIFIED="1362652445782" TEXT=" struct list_head users">
<node CREATED="1362388975172" FOLDED="true" ID="ID_179836622" MODIFIED="1362652444518" TEXT=" struct device_user : &#x5f15;&#x7528;&#x4e86;&#x6b64;&#x8bbe;&#x5907;&#x7684;&#x7528;&#x6237;&#xa;device_user&#x7684;&#x6982;&#x5ff5; : &#x4efb;&#x4f55;&#x5730;&#x65b9;&#x5f53;&#x4f60;&#x9700;&#x8981;&#x5f15;&#x7528;&#x4e00;&#x4e2a;device&#x65f6;,&#x5728;&#x6b64;&#x8bbe;&#x5907;&#x7684;dev-&gt;users&#x4e2d;&#xa;&#x6ce8;&#x518c;&#x4e00;&#x4e2a; struct device_user&#x7ed3;&#x6784;,&#x5219;&#x6b64;&#x8bbe;&#x5907;&#x7684;&#x72b6;&#x6001;&#x53d1;&#x751f;&#x53d8;&#x5316;&#x65f6;,&#x4f1a;&#x901a;&#x8fc7;&#x8c03;&#x7528;&#xa;struct device_user -&gt; cb&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;&#x5f62;&#x5f0f;&#x901a;&#x77e5;&#x4f60;">
<node CREATED="1362388975172" ID="ID_596869286" MODIFIED="1362493606780" TEXT=" struct list_head list : &#x7528;&#x4e8e;&#x94fe;&#x5165; dev-&gt;users"/>
<node CREATED="1362388975172" ID="ID_1354086285" MODIFIED="1362649714929" TEXT=" bool claimed : &#x58f0;&#x660e;&#x5f00;&#x59cb;&#x771f;&#x6b63;&#x9700;&#x8981;&#x88ab;&#x5f15;&#x7528;&#x7684;&#x8bbe;&#x5907;&#x4e86;,&#x8fd9;&#x4f1a;&#x5bfc;&#x81f4;&#x88ab;&#x5f15;&#x7528;&#x7684;&#x8bbe;&#x5907;&#x88ab;&#x771f;&#x6b63;&#x7684;&#x521b;&#x5efa;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x91cc;&#x9762;&#x53bb;"/>
<node CREATED="1362388975172" MODIFIED="1362388975172" TEXT=" bool hotplug"/>
<node CREATED="1362388975172" MODIFIED="1362388975172" TEXT=" bool alias"/>
<node CREATED="1362388975172" ID="ID_1220836066" MODIFIED="1362493581516" TEXT=" struct device *dev : &#x5f15;&#x7528;&#x7684;&#x8bbe;&#x5907;"/>
<node CREATED="1362388975172" ID="ID_1566762288" MODIFIED="1362493559986" TEXT=" void (*cb)(struct device_user *, enum device_event)&#xa;&#x5f53;&#x6240;&#x5f15;&#x7528;&#x7684;&#x8bbe;&#x5907;&#x72b6;&#x6001;&#x53d1;&#x751f;&#x53d8;&#x5316;&#x65f6;&#x8c03;&#x7528;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
</node>
<node CREATED="1362388975170" ID="ID_266515721" MODIFIED="1362388975170" TEXT=" struct list_head aliases"/>
<node CREATED="1362388975171" ID="ID_62079057" MODIFIED="1362388975171" TEXT=" char ifname[IFNAMSIZ + 1]"/>
<node CREATED="1362388975171" ID="ID_1127231326" MODIFIED="1362652429891" TEXT=" int ifindex : &#x6b64;&#x8bbe;&#x5907;&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;&#x7d22;&#x5f15;&#x53f7;"/>
<node CREATED="1362388975171" ID="ID_772003029" MODIFIED="1362466342932" TEXT=" struct blob_attr *config : &#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x4e2d;&#x5173;&#x4e8e;&#x6b64;device&#x7684;&#x6240;&#x6709;&#x539f;&#x59cb;&#x914d;&#x7f6e;&#x53c2;&#x6570;,&#x5305;&#x62ec;&#x652f;&#x6301;&#x7684;&#x548c;&#x4e0d;&#x652f;&#x6301;&#x7684;"/>
<node CREATED="1362388975171" ID="ID_1427998502" MODIFIED="1362560175064" TEXT=" bool config_pending : &#x5ef6;&#x8fdf;&#x52a0;&#x8f7d;&#x5c5e;&#x4e8e;&#x5b50;&#x7c7b;&#x7684;&#x914d;&#x7f6e;,&#x5373;&#x5728;&#x540e;&#x7eed;&#x9636;&#x6bb5;&#x518d;&#x52a0;&#x8f7d;&#x5c5e;&#x4e8e;&#x5b50;&#x7c7b;&#x7684;&#x914d;&#x7f6e;, &#x4ec5;bridge&#x8bbe;&#x7f6e;&#x6b64;&#x503c;"/>
<node CREATED="1362388975171" ID="ID_1766792827" MODIFIED="1362452368309" TEXT=" bool sys_present : &#x6b64;&#x8bbe;&#x5907;&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x662f;&#x5426;&#x5b58;&#x5728;&#x5bf9;&#x5e94;&#x7684;&#x771f;&#x5b9e;&#x7684;&#x8bbe;&#x5907;"/>
<node CREATED="1362388975171" FOLDED="true" ID="ID_647328000" MODIFIED="1362738165574" TEXT=" bool present : &#x5728;netifd&#x4e2d;&#x6807;&#x8bb0;&#x6b64;&#x8bbe;&#x5907;&#x5df2;&#x5b58;&#x5728;">
<node CREATED="1362452587456" ID="ID_1665176341" MODIFIED="1362452655341">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;&#35774;&#22791;&#34987;&#26631;&#35760;&#20026;&#23384;&#22312;&#25110;&#19981;&#23384;&#22312;&#26102;&#20250;&#36890;&#36807;device_broadcast_event&#24191;&#25773;
    </p>
    <p>
      &#35774;&#22791;&#28155;&#21152;&#25110;&#21024;&#38500;&#30340;&#28040;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362388975171" MODIFIED="1362388975171" TEXT=" int active"/>
<node CREATED="1362388975171" ID="ID_1588768972" MODIFIED="1362817742559" TEXT=" bool external : &#x6b64;device&#x662f;&#x901a;&#x8fc7; &quot;ubus call network.interface.xxx add_device xxx&quot; &#x5916;&#x90e8;&#x521b;&#x5efa;&#x7684;"/>
<node CREATED="1362388975171" ID="ID_1005513357" MODIFIED="1362452249219" TEXT=" bool disabled : &#x8bbe;&#x5907;&#x5df2;&#x88ab;disable"/>
<node CREATED="1362388975171" ID="ID_896485392" MODIFIED="1362452291440" TEXT=" bool deferred : &#x8bbe;&#x5907;&#x5df2;&#x88ab;&#x505c;&#x6b62;&#x4f7f;&#x7528;"/>
<node CREATED="1362388975171" MODIFIED="1362388975171" TEXT=" bool hidden"/>
<node CREATED="1362388975171" ID="ID_1523133713" MODIFIED="1362557079552" TEXT=" bool current_config : &#x6b64;&#x8bbe;&#x5907;&#x662f;&#x6839;&#x636e;uci&#x914d;&#x7f6e;&#x521b;&#x5efa;&#x7684;"/>
<node CREATED="1362388975171" ID="ID_1496449798" MODIFIED="1362556819634" TEXT=" bool default_config : &#x6b64;&#x8bbe;&#x5907;&#x662f;&#x6839;&#x636e;&#x9ed8;&#x8ba4;&#x914d;&#x7f6e;&#x521b;&#x5efa;&#x7684;,&#x5373;&#x4e0d;&#x662f;&#x6839;&#x636e;uci&#x914d;&#x7f6e;&#x521b;&#x5efa;&#x7684;"/>
<node CREATED="1362388975171" ID="ID_600826522" MODIFIED="1362648549344">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;device_state_cb set_state : &#29992;&#20110;&#25913;&#21464;&#35774;&#22791;&#29366;&#24577;&#30340;&#20989;&#25968;,&#25152;&#35859;&#25913;&#21464;&#35774;&#22791;&#29366;&#24577;&#23601;&#26159;&#25351;up/down&#35774;&#22791;
    </p>
    <p>
      &#25913;&#21464;&#35774;&#22791;&#29366;&#24577;&#20250;&#23548;&#33268;&#20855;&#20307;&#30340;&#37197;&#32622;&#24212;&#29992;&#21040;&#25805;&#20316;&#31995;&#32479;&#23618;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362388975171" FOLDED="true" ID="ID_1044537932" MODIFIED="1362455203888">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const struct device_hotplug_ops *hotplug_ops
    </p>
    <p>
      &#24403;&#25191;&#34892;&#21629;&#20196;&quot;ubus call network.interface.lan add_device eth0.1&quot;&#26102;,
    </p>
    <p>
      &#34920;&#31034;&#23558;eth0.1&#21152;&#20837;&#21040;lan&#20195;&#34920;&#30340;bridge&#20013;,&#27492;&#26102;&#35843;&#29992;&#36825;&#37324;&#30340;
    </p>
    <p>
      hotplug_ops-&gt;add&#23558;member&#21152;&#20837;&#21040;bridge&#20013;.
    </p>
    <p>
      &#27880;&#24847; : &#20165;&#26377;&#31867;&#22411;&#20026;bridge&#30340;&#35774;&#22791;&#26377;&#27492;&#32467;&#26500;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362388975171" MODIFIED="1362388975171" TEXT=" int (*prepare)(struct device *dev)"/>
<node CREATED="1362388975172" ID="ID_579055910" MODIFIED="1362455016960">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*add)(struct device *main, struct device *member)
    </p>
    <p>
      &#28155;&#21152;bridge&#25104;&#21592;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362388975172" ID="ID_511713498" MODIFIED="1362455026143">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*del)(struct device *main, struct device *member)
    </p>
    <p>
      &#21024;&#38500;bridge&#25104;&#21592;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362388975172" ID="ID_778949294" LINK="#ID_179836622" MODIFIED="1362493626085" TEXT=" struct device_user parent : &#x7528;&#x4e8e;&#x5f15;&#x7528;&#x7236;&#x8bbe;&#x5907;"/>
<node CREATED="1362388975172" FOLDED="true" ID="ID_1019338860" MODIFIED="1362652781729">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device_settings orig_settings
    </p>
    <p>
      &#22312;&#24212;&#29992;dev-&gt;settings&#20013;&#30340;&#37197;&#32622;&#21069;, &#20808;&#23558;&#25805;&#20316;&#31995;&#32479;&#20013;&#20851;&#20110;&#27492;device&#30340;
    </p>
    <p>
      &#37197;&#32622;(mtu,txqueuelen,mac address)&#20445;&#23384;&#21040;&#36825;&#37324;,&#29992;&#20110;down&#25481;device&#21518;&#24674;&#22797;&#37197;&#32622;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362388975172" ID="ID_578042329" MODIFIED="1362388975172" TEXT=" unsigned int flags"/>
<node CREATED="1362388975172" ID="ID_1384736908" MODIFIED="1362388975172" TEXT=" unsigned int mtu"/>
<node CREATED="1362388975172" ID="ID_850330506" MODIFIED="1362388975172" TEXT=" unsigned int txqueuelen"/>
<node CREATED="1362388975172" ID="ID_972689433" MODIFIED="1362388975172" TEXT=" uint8_t macaddr[6]"/>
</node>
<node CREATED="1362388975172" FOLDED="true" ID="ID_811881357" MODIFIED="1362465188616">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device_settings settings : device&#24120;&#35268;&#37197;&#32622;&#39033;,
    </p>
    <p>
      &#23427;&#23545;&#24212;&#20102;&#20840;&#23616;&#21464;&#37327;struct config_param_list device_attr_list&#23450;&#20041;&#30340;&#21442;&#25968;&#39033;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362388975172" FOLDED="true" ID="ID_1819855694" MODIFIED="1362464251099">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;unsigned int flags
    </p>
    <p>
      &#35774;&#32622;&#20102;&#21738;&#20123;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362464172791" ID="ID_1117050915" MODIFIED="1362464173891" TEXT="DEV_OPT_MTU"/>
<node CREATED="1362464180151" ID="ID_1203377001" MODIFIED="1362464181058" TEXT="DEV_OPT_TXQUEUELEN"/>
<node CREATED="1362464188214" ID="ID_382100232" MODIFIED="1362464189218" TEXT="DEV_OPT_MACADDR"/>
</node>
<node CREATED="1362388975172" ID="ID_1375855550" MODIFIED="1362388975172" TEXT=" unsigned int mtu"/>
<node CREATED="1362388975172" ID="ID_1673525556" MODIFIED="1362388975172" TEXT=" unsigned int txqueuelen"/>
<node CREATED="1362388975172" ID="ID_320685789" MODIFIED="1362388975172" TEXT=" uint8_t macaddr[6]"/>
</node>
</node>
<node CREATED="1362393893391" FOLDED="true" ID="ID_1037092033" MODIFIED="1362723350619" TEXT="struct bridge_state">
<node CREATED="1362394054332" ID="ID_946628873" LINK="#ID_1541974137" MODIFIED="1362394133344" TEXT=" struct device dev"/>
<node CREATED="1362394054332" ID="ID_498643263" MODIFIED="1362394054332" TEXT=" device_state_cb set_state"/>
<node CREATED="1362394054332" ID="ID_1692927044" LINK="#ID_772003029" MODIFIED="1362466357695" TEXT=" struct blob_attr *config_data : &#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x4e2d;&#x5173;&#x4e8e;&#x6b64;bridge&#x7684;&#x6240;&#x6709;&#x539f;&#x59cb;&#x914d;&#x7f6e;&#x53c2;&#x6570;,&#x5305;&#x62ec;&#x652f;&#x6301;&#x7684;&#x548c;&#x4e0d;&#x652f;&#x6301;&#x7684;"/>
<node CREATED="1362394054332" FOLDED="true" ID="ID_521302825" MODIFIED="1362467038087">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct bridge_config config&#160;: bridge&#30456;&#20851;&#37197;&#32622;&#39033;,
    </p>
    <p>
      &#23427;&#23545;&#24212;&#20102;&#20840;&#23616;&#21464;&#37327;struct config_param_list bridge_attr_list&#23450;&#20041;&#30340;&#21442;&#25968;&#39033;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362465051578" FOLDED="true" ID="ID_262889495" MODIFIED="1362465125077">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;enum bridge_opt flags
    </p>
    <p>
      &#35774;&#32622;&#20102;&#21738;&#20123;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362465098759" ID="ID_516434507" MODIFIED="1362465099778" TEXT="stp and forward delay always set"/>
<node CREATED="1362465107574" ID="ID_325513994" MODIFIED="1362465108353" TEXT="BRIDGE_OPT_AGEING_TIME"/>
<node CREATED="1362465115253" ID="ID_1059844892" MODIFIED="1362465115969" TEXT="BRIDGE_OPT_HELLO_TIME"/>
<node CREATED="1362465122261" ID="ID_1521860621" MODIFIED="1362465123120" TEXT="BRIDGE_OPT_MAX_AGE"/>
</node>
<node CREATED="1362465051578" MODIFIED="1362465051578" TEXT=" bool stp"/>
<node CREATED="1362465051578" MODIFIED="1362465051578" TEXT=" bool igmp_snoop"/>
<node CREATED="1362465051578" MODIFIED="1362465051578" TEXT=" int forward_delay"/>
<node CREATED="1362465051578" MODIFIED="1362465051578" TEXT=" int ageing_time"/>
<node CREATED="1362465051578" MODIFIED="1362465051578" TEXT=" int hello_time"/>
<node CREATED="1362465051578" MODIFIED="1362465051578" TEXT=" int max_age"/>
</node>
<node CREATED="1362394054332" ID="ID_1213309967" MODIFIED="1362467094231" TEXT=" struct blob_attr *ifnames : bridge&#x7684;&#x6210;&#x5458;&#x540d;&#x79f0;,&#x7531;&#x914d;&#x7f6e;&#x53c2;&#x6570;ifname&#x5f97;&#x6765;"/>
<node CREATED="1362394054332" ID="ID_1487815539" MODIFIED="1362394054332" TEXT=" bool active"/>
<node CREATED="1362394054332" ID="ID_1137703421" MODIFIED="1362394054332" TEXT=" bool force_active"/>
<node CREATED="1362394054332" ID="ID_719344438" LINK="#ID_1653989119" MODIFIED="1362670646840" TEXT=" struct bridge_member *primary_port&#xa;primary_port&#x4e3b;&#x8981;&#x7528;&#x4e8e;&#x786e;&#x5b9a;bridge&#x7684;mac&#x5730;&#x5740;, &#x5982;&#x679c;&#x5728;uci&#x914d;&#x7f6e;&#x53c2;&#x6570;&#x4e2d;&#x7ed9;&#x8fd9;&#x4e2a;bridge&#x6307;&#x5b9a;&#x4e86;&#xa;mac&#x5730;&#x5740;&#x5219;&#x4e0d;&#x9700;&#x8981;primary_port&#x4e86;,&#x5426;&#x5219;&#x9009;&#x62e9;&#x7b2c;&#x4e00;&#x4e2a;&#x6210;&#x5458;&#x4f5c;&#x4e3a;primary_port,&#x8fd9;&#x4e2a;&#x6210;&#x5458;&#x7684;mac&#xa;&#x5730;&#x5740;&#x5c31;&#x6210;&#x4e86;bridge&#x7684;mac&#x5730;&#x5740;."/>
<node CREATED="1362394054332" FOLDED="true" ID="ID_1155815919" MODIFIED="1362670365114">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct vlist_tree members : avl&#26641;,&#29992;&#20110;&#23384;&#25918;bridge&#30340;&#25104;&#21592;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362394083698" FOLDED="true" ID="ID_1653989119" MODIFIED="1362469282787" TEXT="struct bridge_member">
<node CREATED="1362394054332" ID="ID_354829839" MODIFIED="1362394054332" TEXT=" struct vlist_node node"/>
<node CREATED="1362394054332" ID="ID_1279684593" MODIFIED="1362469248720" TEXT=" struct bridge_state *bst :&#x6240;&#x5728;&#x7684;bridge"/>
<node CREATED="1362394054332" ID="ID_209709660" MODIFIED="1362469261135" TEXT=" struct device_user dev : &#x6240;&#x5f15;&#x7528;&#x7684;device"/>
<node CREATED="1362394054332" ID="ID_458745184" MODIFIED="1362394054332" TEXT=" bool present"/>
<node CREATED="1362394054332" ID="ID_1638865558" MODIFIED="1362469278766" TEXT=" char name[] : device&#x7684;&#x540d;&#x79f0;"/>
</node>
</node>
<node CREATED="1362394054332" ID="ID_1411855075" MODIFIED="1362670716302" TEXT=" int n_present : &#x6709;&#x591a;&#x5c11;&#x4e2a;&#x6210;&#x5458;"/>
</node>
<node CREATED="1362471702649" ID="ID_455644039" MODIFIED="1375169623226" TEXT="struct interface">
<node CREATED="1362472057554" ID="ID_282670211" MODIFIED="1362472057554" TEXT=" struct vlist_node node"/>
<node CREATED="1362472057554" ID="ID_984514144" MODIFIED="1362472057554" TEXT=" struct list_head hotplug_list"/>
<node CREATED="1362472057554" ID="ID_1667476241" MODIFIED="1362472057554" TEXT=" enum interface_event hotplug_ev"/>
<node CREATED="1362472057554" ID="ID_554911663" MODIFIED="1362643118637" TEXT=" char name[IFNAMSIZ] : &#x6b64;interface&#x5bf9;&#x5e94;&#x7684;uci section&#x7684;&#x540d;&#x79f0;"/>
<node CREATED="1362472057554" FOLDED="true" ID="ID_586551802" MODIFIED="1362728413343">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const char *ifname : &#27492;interface&#23545;&#24212;&#30340;uci section&#20013;ifname&#23383;&#27573;&#30340;&#20540;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362643701512" FOLDED="true" ID="ID_22662332" MODIFIED="1362644304862">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      interface&#23545;&#24212;&#30340;uci section&#20013;&#30340;type&#23383;&#27573;&#26159;bridge&#26102;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362643779810" FOLDED="true" ID="ID_1246255644" LINK="#ID_1213309967" MODIFIED="1362644120650" TEXT="&#x9996;&#x5148;,&#x539f;&#x59cb;&#x7684;ifname&#x914d;&#x7f6e;&#x53c2;&#x6570;&#x4f1a;&#x88ab;&#x5f53;&#x505a;bridge device&#x7684;ifname&#x914d;&#x7f6e;&#x53c2;&#x6570;,&#x8fd9;&#x65f6;&#x5b83;&#x8868;&#x793a;&#x662f;bridge&#x7684;&#x6210;&#x5458;&#x5217;&#x8868;">
<node CREATED="1362644093932" ID="ID_1015114223" LINK="#ID_1253829405" MODIFIED="1362644107460" TEXT="device_create"/>
</node>
<node CREATED="1362643777363" ID="ID_1133754876" LINK="#ID_169840446" MODIFIED="1362644154232" TEXT="&#x7136;&#x540e;, &#x5728;&#x521b;&#x5efa;interface&#x8fc7;&#x7a0b;&#x4e2d;&#x6b64;ifname&#x914d;&#x7f6e;&#x53c2;&#x6570;&#x4f1a;&#x88ab;&#x4fee;&#x6539;&#x4e3a;br-xxx,&#x5176;&#x4e2d;xxx&#x4e3a;section&#x540d;&#x79f0;"/>
</node>
</node>
<node CREATED="1362472057554" ID="ID_241256304" MODIFIED="1362731392732" TEXT=" bool available : &#x5f53;interface&#x7ed1;&#x5b9a;&#x7684;main device&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x88ab;&#x521b;&#x5efa;&#x65f6;,&#x6b64;interface&#x53d8;&#x4e3a;available"/>
<node CREATED="1362472057554" ID="ID_1718725503" MODIFIED="1362538932383">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool autostart : &#24403;interface&#20174;inactive&#29366;&#24577;&#21464;&#20026;active&#29366;&#24577;&#26102;&#31435;&#21363;bring up&#23427;
    </p>
    <p>
      &#36825;&#37324;&#30340;autostart&#34920;&#31034;&#20102;interface&#30340;&#19968;&#20010;&#29366;&#24577;&#21442;&#25968;,&#23427;&#30340;&#20540;&#21487;&#33021;&#22312;&#36816;&#34892;&#36807;&#31243;&#20013;&#21457;&#29983;&#25913;&#21464;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057554" ID="ID_913003938" MODIFIED="1362538853835" TEXT=" bool config_autostart : &#x542b;&#x4e49;&#x7b49;&#x540c;&#x4e8e;&#x4e0a;&#x9762;&#x7684;autostart, &#xa;&#x4f46;&#x8fd9;&#x91cc;&#x4fdd;&#x5b58;&#x7684;&#x662f;uci&#x914d;&#x7f6e;&#x53c2;&#x6570;auto&#x7684;&#x539f;&#x59cb;&#x503c;, &#x9664;&#x975e;uci&#x914d;&#x7f6e;&#x53d1;&#x751f;&#x53d8;&#x5316;,&#x5426;&#x5219;&#x8fd9;&#x91cc;&#x7684;&#x503c;&#x4e0d;&#x4f1a;&#x53d8;"/>
<node CREATED="1362472057554" ID="ID_725378675" MODIFIED="1375169928799" TEXT=" bool device_config : config&#x4e2d;&#x662f;&#x5426;&#x5305;&#x542b;&#x4e86;device&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;"/>
<node CREATED="1362472057554" ID="ID_1736756775" MODIFIED="1362728451913" TEXT=" time_t start_time : &#x4e0a;&#x4e00;&#x6b21;&#x53d8;&#x4e3a;UP&#x7684;&#x65f6;&#x95f4;"/>
<node CREATED="1362472057554" FOLDED="true" ID="ID_615765335" MODIFIED="1375169753567" TEXT=" enum interface_state state">
<node CREATED="1362727433696" ID="ID_1684172239" MODIFIED="1362727478485" TEXT="IFS_SETUP : &#x6b63;&#x5728;UP&#x8fc7;&#x7a0b;&#x4e2d;"/>
<node CREATED="1362727443445" ID="ID_528887007" MODIFIED="1362727486908" TEXT="IFS_UP : &#x5df2;&#x7ecf;UP&#x4e86;"/>
<node CREATED="1362727451670" ID="ID_758641996" MODIFIED="1362727499458" TEXT="IFS_TEARDOWN : &#x6b63;&#x5728;DOWN&#x8fc7;&#x7a0b;&#x4e2d;"/>
<node CREATED="1362727460021" ID="ID_855871155" MODIFIED="1362727508246" TEXT="IFS_DOWN : &#x5df2;&#x7ecf;DOWN&#x4e86;"/>
</node>
<node CREATED="1362472057554" ID="ID_1075042933" MODIFIED="1362472057554" TEXT=" enum interface_config_state config_state"/>
<node CREATED="1362472057554" FOLDED="true" ID="ID_611288111" MODIFIED="1375169841009" TEXT=" struct list_head users : &#x5f15;&#x7528;&#x4e86;&#x6b64;interface&#x7684;&#x7528;&#x6237;">
<node CREATED="1362584200589" FOLDED="true" ID="ID_894787982" MODIFIED="1362584436108" TEXT="struct interface_user : &#x5f15;&#x7528;&#x4e86;&#x6b64;interface&#x7684;&#x7528;&#x6237;, &#x7c7b;&#x4f3c;&#x4e8e;struct device_user &#xa;interface_user&#x7684;&#x6982;&#x5ff5; : &#x4efb;&#x4f55;&#x5730;&#x65b9;&#x5f53;&#x4f60;&#x9700;&#x8981;&#x5f15;&#x7528;&#x4e00;&#x4e2a;interface&#x65f6;,&#x5728;&#x6b64;interface&#x7684;iface-&gt;users&#x4e2d;&#xa;&#x6ce8;&#x518c;&#x4e00;&#x4e2a; struct interface_user&#x7ed3;&#x6784;,&#x5219;&#x6b64;interface&#x7684;&#x72b6;&#x6001;&#x53d1;&#x751f;&#x53d8;&#x5316;&#x65f6;,&#x4f1a;&#x901a;&#x8fc7;&#x8c03;&#x7528;&#xa;struct interface_user -&gt; cb&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;&#x5f62;&#x5f0f;&#x901a;&#x77e5;&#x4f60;">
<node CREATED="1362584378822" ID="ID_485092199" MODIFIED="1362584380422" TEXT="struct list_head list"/>
<node CREATED="1362584392021" ID="ID_47148751" MODIFIED="1362584393108" TEXT="struct interface *iface"/>
<node CREATED="1362584404667" ID="ID_952839198" MODIFIED="1362584405819" TEXT="void (*cb)(struct interface_user *dep, struct interface *iface, enum interface_event ev)"/>
</node>
</node>
<node CREATED="1362472057554" ID="ID_333828813" MODIFIED="1362627184179">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const char *parent_ifname
    </p>
    <p>
      parent interface&#30340;&#21517;&#23383;, &#22914;&#26524;interface B &#26159;interface A&#30340;&#21035;&#21517;(alias),
    </p>
    <p>
      &#21017;&#31216;interface A&#26159;interface B&#30340;parent interface.&#22312;uci&#30340;alias section&#20013;
    </p>
    <p>
      &#29992;interface&#36825;&#20010;&#23383;&#27573;&#34920;&#26126;&#21035;&#21517;&#30340;parent interface.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057554" ID="ID_1988618149" MODIFIED="1362648422699" TEXT=" struct interface_user parent_iface : &#x7528;&#x4e8e;&#x5f15;&#x7528;parent interface, &#x5f53;&#x6b64;interface&#x4e3a;alias&#x65f6;&#x7528;&#x5230;"/>
<node CREATED="1362472057554" FOLDED="true" ID="ID_1264462626" MODIFIED="1362817880816">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device_user main_dev : &#29992;&#20110;&#24341;&#29992;main device
    </p>
    <p>
      main device : &#27492;interface&#25152;&#21152;&#36733;&#30340;&#21327;&#35758;&#25152;&#22522;&#20110;&#30340;L2 device.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362635023989" FOLDED="true" ID="ID_819162399" MODIFIED="1362635107967" TEXT="main device&#x4e0e;L3 device&#x7684;&#x8054;&#x7cfb;&#x4e0e;&#x533a;&#x522b;">
<node CREATED="1362635030309" ID="ID_528891975" MODIFIED="1362635058903">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      main device&#26159;uci&#37197;&#32622;&#25991;&#20214;&#20013;interface section&#20869;ifname&#36873;&#39033;&#25152;&#25351;&#23450;&#30340;device,&#23427;&#26159;L2 device.
    </p>
    <p>
      interface&#25152;&#21152;&#36733;&#30340;&#21327;&#35758;&#26159;&#22522;&#20110;main device&#30340;.L3 device&#26159;&#25351;interface&#19978;&#37197;&#32622;&#30340;&#25110;&#33719;&#21462;&#30340;IP&#22320;&#22336;
    </p>
    <p>
      &#25152;&#30495;&#27491;&#24212;&#29992;&#30340;device, &#23427;&#26159;&#37197;&#32622;&#20102;IP&#22320;&#22336;&#30340;device,&#26159;&#26368;&#32456;&#29992;&#20110;&#25910;&#21457;L3&#25968;&#25454;&#21253;&#30340;device.&#36890;&#24120;&#24773;&#20917;&#19979;
    </p>
    <p>
      &#22914;&#26524;interface&#25152;&#21152;&#36733;&#30340;&#21327;&#35758;&#19981;&#22312;main device&#19978;&#20877;&#21019;&#24314;device&#30340;&#35805;,&#21017;L3 device&#23601;&#26159;main device.
    </p>
    <p>
      &#27604;&#22914;static&#21644;dhcp&#21327;&#35758;.&#20294;&#26159;&#20687;ppp&#21644;tunnel&#31561;&#21327;&#35758;,&#23427;&#20204;&#20250;&#22312;main device&#19978;&#20877;&#21019;&#24314;&#19968;&#20010;&#34394;&#25311;device,
    </p>
    <p>
      &#36825;&#26102;L3 device&#23601;&#26159;&#25351;&#26368;&#21518;&#24212;&#29992;&#20102;IP&#22320;&#22336;&#30340;&#34394;&#25311;device,&#36825;&#26102;L3 device&#20250;&#19981;&#21516;&#20110;main device.
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362472057555" ID="ID_583146377" LINK="#ID_819162399" MODIFIED="1362635123207">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device_user l3_dev&#160;: &#29992;&#20110;&#24341;&#29992;L3 device
    </p>
    <p>
      L3 device : &#30495;&#27491;&#25910;&#21457;L3 &#25968;&#25454;&#21253;&#30340;device,&#27492;device&#23601;&#26159;&#37197;&#32622;&#20102;IP&#22320;&#22336;&#30340;L3device.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057555" ID="ID_1479450264" MODIFIED="1362642327748" TEXT=" struct blob_attr *config : &#x4ece;uci&#x914d;&#x7f6e;&#x4e2d;&#x63d0;&#x53d6;&#x51fa;&#x6765;&#x7684;&#x539f;&#x59cb;&#x914d;&#x7f6e;&#x53c2;&#x6570;"/>
<node CREATED="1362472057555" FOLDED="true" ID="ID_1986626621" MODIFIED="1362726730503" TEXT=" const struct proto_handler *proto_handler&#xa;&#x6240;&#x52a0;&#x8f7d;&#x7684;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;,&#x6bd4;&#x5982;static/dhcp/ppp&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362472057555" ID="ID_448242853" MODIFIED="1362496766164" TEXT=" struct avl_node avl : &#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct avl_tree handlers"/>
<node CREATED="1362472057555" ID="ID_1267645720" MODIFIED="1362472057555" TEXT=" unsigned int flags"/>
<node CREATED="1362472057555" ID="ID_797514098" MODIFIED="1362496784428" TEXT=" const char *name : &#x534f;&#x8bae;&#x540d;&#x79f0;, static/dhcp/ppp"/>
<node CREATED="1362472057555" FOLDED="true" ID="ID_522938941" MODIFIED="1362726729598" TEXT=" const struct config_param_list *config_params&#xa;&#x8be5;&#x534f;&#x8bae;&#x652f;&#x6301;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;">
<node CREATED="1362496828338" FOLDED="true" ID="ID_1434684169" MODIFIED="1362538140310" TEXT="static">
<node CREATED="1362496856340" ID="ID_185721743" MODIFIED="1362496857821" TEXT="ipaddr"/>
<node CREATED="1362496869214" ID="ID_1596585000" MODIFIED="1362496870124" TEXT="ip6addr"/>
<node CREATED="1362496878054" ID="ID_858633527" MODIFIED="1362496878803" TEXT="netmask"/>
<node CREATED="1362496885969" ID="ID_987982296" MODIFIED="1362496886817" TEXT="broadcast"/>
<node CREATED="1362496893678" ID="ID_1070173532" MODIFIED="1362496894494" TEXT="gateway"/>
<node CREATED="1362496901450" ID="ID_1456263869" MODIFIED="1362496902282" TEXT="ip6gw"/>
</node>
<node CREATED="1362496832830" FOLDED="true" ID="ID_1216186821" MODIFIED="1362538143893" TEXT="dhcp">
<node CREATED="1362496975025" ID="ID_1228419373" MODIFIED="1362496976513" TEXT="ipaddr"/>
<node CREATED="1362496984433" ID="ID_1277938313" MODIFIED="1362496985313" TEXT="netmask"/>
<node CREATED="1362496993690" ID="ID_1665858571" MODIFIED="1362496994521" TEXT="hostname"/>
<node CREATED="1362497002027" ID="ID_1243769562" MODIFIED="1362497002896" TEXT="clientid"/>
<node CREATED="1362497010270" ID="ID_656910718" MODIFIED="1362497010805" TEXT="vendorid"/>
<node CREATED="1362497018084" ID="ID_1942063141" MODIFIED="1362497019121" TEXT="broadcast"/>
<node CREATED="1362497025416" ID="ID_431601036" MODIFIED="1362497026303" TEXT="reqopts"/>
</node>
<node CREATED="1362496835255" FOLDED="true" ID="ID_62264472" MODIFIED="1362538146406" TEXT="ppp">
<node CREATED="1362536635347" ID="ID_1119633971" MODIFIED="1362536637752" TEXT="username"/>
<node CREATED="1362536642262" ID="ID_1248862529" MODIFIED="1362536642994" TEXT="password"/>
<node CREATED="1362536648998" ID="ID_1121681385" MODIFIED="1362536651028" TEXT="keepalive"/>
<node CREATED="1362536656533" ID="ID_557100644" MODIFIED="1362536657265" TEXT="demand"/>
<node CREATED="1362536664581" ID="ID_1805624716" MODIFIED="1362536665344" TEXT="pppd_options"/>
<node CREATED="1362536671268" ID="ID_1909245628" MODIFIED="1362536672176" TEXT="connect"/>
<node CREATED="1362536677540" ID="ID_549379593" MODIFIED="1362536678064" TEXT="disconnect"/>
<node CREATED="1362536683651" ID="ID_906742807" MODIFIED="1362536684591" TEXT="defaultroute"/>
<node CREATED="1362536690899" ID="ID_842078635" MODIFIED="1362536691614" TEXT="peerdns"/>
<node CREATED="1362536697714" ID="ID_236659949" MODIFIED="1362536698638" TEXT="ipv6"/>
<node CREATED="1362536704146" ID="ID_151844334" MODIFIED="1362536704861" TEXT="mtu"/>
</node>
</node>
<node CREATED="1362472057555" ID="ID_842363927" MODIFIED="1362472057555" TEXT=" struct interface_proto_state *(*attach)(const struct proto_handler *h, struct interface *iface, struct blob_attr *attr)"/>
</node>
<node CREATED="1362561746254" FOLDED="true" ID="ID_570742975" MODIFIED="1371194905819">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct interface_proto_state *proto
    </p>
    <p>
      interface&#19982;&#23427;&#21152;&#36733;&#30340;&#21327;&#35758;&#22788;&#29702;&#22120;&#30340;&#36890;&#20449;&#25509;&#21475;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362472057555" ID="ID_844758706" LINK="#ID_920411549" MODIFIED="1371193239696">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct interface_proto_state
    </p>
    <p>
      interface&#19982;&#23427;&#21152;&#36733;&#30340;&#21327;&#35758;&#22788;&#29702;&#22120;&#30340;&#36890;&#20449;&#25509;&#21475;
    </p>
    <p>
      &#27492;&#32467;&#26500;&#30001;&#21327;&#35758;&#22788;&#29702;&#22120;&#30340;attach()&#20989;&#25968;&#21019;&#24314;,&#24182;&#22312;
    </p>
    <p>
      &#20989;&#25968;proto_init_interface()&#20013;&#34987;&#36171;&#20540;&#21040;iface -&gt; proto
    </p>
  </body>
</html></richcontent>
<node CREATED="1362472057555" ID="ID_980548595" MODIFIED="1362625594634">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const struct proto_handler *handler : &#38656;&#35201;&#36890;&#20449;&#30340;&#21327;&#35758;&#22788;&#29702;&#22120;
    </p>
    <p>
      &#36890;&#29992;&#35774;&#32622;, &#30001;&#20989;&#25968;proto_init_interface()&#35774;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057555" ID="ID_1750609394" MODIFIED="1362625667461">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct interface *iface : &#38656;&#35201;&#19982;&#21327;&#35758;&#22788;&#29702;&#22120;&#36890;&#20449;&#30340;interface
    </p>
    <p>
      &#36890;&#29992;&#35774;&#32622;, &#30001;&#20989;&#25968;interface_set_proto_state()&#35774;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057555" FOLDED="true" ID="ID_925077861" MODIFIED="1362727164484">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*proto_event)(struct interface_proto_state *, enum interface_proto_event ev)
    </p>
    <p>
      interface&#21521;&#21327;&#35758;&#22788;&#29702;&#22120;&#21457;&#36865;&#19968;&#20010;&#20107;&#20214;
    </p>
    <p>
      &#36890;&#29992;&#35774;&#32622;, &#30001;&#20989;&#25968;interface_set_proto_state()&#35774;&#32622;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362623785454" ID="ID_1885559783" LINK="#ID_429210477" MODIFIED="1362727156491" TEXT="interface_proto_cb"/>
</node>
<node CREATED="1362472057555" ID="ID_1902947501" MODIFIED="1362625837033">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*notify)(struct interface_proto_state *, struct blob_attr *data)
    </p>
    <p>
      &#21327;&#35758;&#29305;&#23450;&#35774;&#32622;,&#30001;&#21327;&#35758;&#22788;&#29702;&#22120;&#23376;&#31867;&#30340;attach()&#20989;&#25968;&#35774;&#32622;,&#21508;&#21327;&#35758;&#22788;&#29702;&#22120;&#23376;&#31867;&#21487;&#33021;&#19981;&#21516;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057555" ID="ID_1395602876" MODIFIED="1362625847833">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*cb)(struct interface_proto_state *, enum interface_proto_cmd cmd, bool force)
    </p>
    <p>
      interface&#27599;&#27425;&#19982;&#21327;&#35758;&#22788;&#29702;&#22120;&#36890;&#20449;&#26102;&#35843;&#29992;&#30340;&#22238;&#35843;&#20989;&#25968;,&#30456;&#24403;&#20110;&#19968;&#20010;&#30417;&#25511;&#28857;.
    </p>
    <p>
      &#21327;&#35758;&#29305;&#23450;&#35774;&#32622;,&#30001;&#21327;&#35758;&#22788;&#29702;&#22120;&#23376;&#31867;&#30340;attach()&#20989;&#25968;&#35774;&#32622;,&#21508;&#21327;&#35758;&#22788;&#29702;&#22120;&#23376;&#31867;&#21487;&#33021;&#19981;&#21516;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057555" ID="ID_641699041" MODIFIED="1362625861391">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*free)(struct interface_proto_state *)
    </p>
    <p>
      &#21327;&#35758;&#29305;&#23450;&#35774;&#32622;,&#30001;&#21327;&#35758;&#22788;&#29702;&#22120;&#23376;&#31867;&#30340;attach()&#20989;&#25968;&#35774;&#32622;,&#21508;&#21327;&#35758;&#22788;&#29702;&#22120;&#23376;&#31867;&#21487;&#33021;&#19981;&#21516;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362472057556" FOLDED="true" ID="ID_120041669" MODIFIED="1362726195244" TEXT=" struct interface_ip_settings proto_ip : &#x52a8;&#x6001;&#x83b7;&#x53d6;&#x7684;ip&#x76f8;&#x5173;&#x53c2;&#x6570;&#xa;">
<node CREATED="1362539226722" FOLDED="true" ID="ID_564049293" MODIFIED="1362726135735" TEXT=" struct interface_ip_settings&#xa;ip&#x76f8;&#x5173;&#x53c2;&#x6570; : dns server, dns domain, route, ip address">
<node CREATED="1362472057556" ID="ID_1713028579" MODIFIED="1362473402606" TEXT=" struct interface *iface : &#x5173;&#x8054;&#x7684;interface"/>
<node CREATED="1362472057556" ID="ID_756176403" MODIFIED="1362472057556" TEXT=" bool enabled"/>
<node CREATED="1362472057556" ID="ID_295753296" MODIFIED="1362472057556" TEXT=" bool no_defaultroute"/>
<node CREATED="1362472057556" ID="ID_873335934" MODIFIED="1362472057556" TEXT=" bool no_dns"/>
<node CREATED="1362472057556" ID="ID_888383504" MODIFIED="1362473427197" TEXT=" struct vlist_tree addr : interface&#x914d;&#x7f6e;&#x7684;IP&#x5730;&#x5740;&#x5217;&#x8868;"/>
<node CREATED="1362472057556" FOLDED="true" ID="ID_1418452956" MODIFIED="1362557688394" TEXT=" struct vlist_tree route : interface&#x914d;&#x7f6e;&#x7684;&#x8def;&#x7531;&#x6761;&#x76ee;&#x5217;&#x8868;">
<node CREATED="1362555916422" FOLDED="true" ID="ID_240997651" MODIFIED="1362557687786" TEXT="struct device_route">
<node CREATED="1362557466816" ID="ID_1612259640" MODIFIED="1362557681958" TEXT=" struct vlist_node node : &#x94fe;&#x63a5;&#x94fe;&#x8868;"/>
<node CREATED="1362557466816" ID="ID_1357776562" MODIFIED="1362557662055" TEXT=" struct interface *iface : &#x6b64;&#x8def;&#x7531;&#x6240;&#x5728;&#x7684;interface"/>
<node CREATED="1362557466816" ID="ID_11391047" MODIFIED="1362557466816" TEXT=" bool enabled"/>
<node CREATED="1362557466816" ID="ID_116697714" MODIFIED="1362557466816" TEXT=" bool keep"/>
<node CREATED="1362557466816" MODIFIED="1362557466816" TEXT=" union if_addr nexthop"/>
<node CREATED="1362557466816" ID="ID_134673214" MODIFIED="1362557466816" TEXT=" int metric"/>
<node CREATED="1362557466816" MODIFIED="1362557466816" TEXT=" int mtu"/>
<node CREATED="1362557466816" FOLDED="true" ID="ID_861994734" MODIFIED="1362557629111" TEXT=" enum device_addr_flags flags">
<node CREATED="1362557528538" ID="ID_783077351" MODIFIED="1362557530674" TEXT="DEVADDR_INET4"/>
<node CREATED="1362557535236" ID="ID_1005880380" MODIFIED="1362557535840" TEXT="DEVADDR_INET6"/>
<node CREATED="1362557542596" ID="ID_114510500" MODIFIED="1362557543103" TEXT="DEVADDR_EXTERNAL"/>
<node CREATED="1362557549156" ID="ID_823992351" MODIFIED="1362557600891" TEXT="DEVROUTE_METRIC : route&#x4e2d;&#x7684;metric&#x8986;&#x76d6;interface&#x4e2d;&#x7684;metric"/>
<node CREATED="1362557558563" ID="ID_788120779" MODIFIED="1362557623370" TEXT="DEVROUTE_MTU : route&#x4e2d;&#x7684;mtu&#x8986;&#x76d6;interface&#x4e2d;&#x7684;mtu"/>
<node CREATED="1362557565458" ID="ID_1355648261" MODIFIED="1362557565934" TEXT="DEVADDR_KERNEL"/>
</node>
<node CREATED="1362557466816" MODIFIED="1362557466816" TEXT=" unsigned int mask"/>
<node CREATED="1362557466816" MODIFIED="1362557466816" TEXT=" union if_addr addr"/>
</node>
</node>
<node CREATED="1362472057556" ID="ID_1328073573" MODIFIED="1362473484601" TEXT=" struct vlist_simple_tree dns_servers : dns servers"/>
<node CREATED="1362472057556" ID="ID_101871452" MODIFIED="1362473491752" TEXT=" struct vlist_simple_tree dns_search : dns domain"/>
</node>
<node CREATED="1362725976246" FOLDED="true" ID="ID_771716349" MODIFIED="1362726193507" TEXT="proto_ip&#x4e0e;config_ip&#x7684;&#x5173;&#x7cfb;">
<node CREATED="1362726007579" ID="ID_924168560" MODIFIED="1362726191332" TEXT="proto_ip&#x4fdd;&#x5b58;&#x7684;&#x53c2;&#x6570;&#x7684;&#x5185;&#x5bb9;&#x4e0e;config_ip&#x76f8;&#x540c;,&#x4f46;&#x662f;&#x8fd9;&#x4e9b;&#x53c2;&#x6570;&#x7684;&#x6765;&#x6e90;&#x4e0e;config_ip&#x4e0d;&#x540c;.&#xa;config_ip&#x4e2d;&#x7684;&#x53c2;&#x6570;&#x6765;&#x81ea;&#x4e8e;uci&#x914d;&#x7f6e;,&#x800c;proto_ip&#x4e2d;&#x7684;&#x53c2;&#x6570;&#x6839;&#x636e;&#x6240;&#x52a0;&#x8f7d;&#x7684;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#xa;&#x4e0d;&#x540c;&#x6709;&#x4e0d;&#x540c;&#x7684;&#x6765;&#x6e90;.&#x5982;&#x679c;&#x662f;static&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x5219;proto_ip&#x4e2d;&#x7684;&#x53c2;&#x6570;&#x76f4;&#x63a5;&#x6765;&#x6e90;&#x4e8e;config_ip,&#xa;&#x4f46;&#x5982;&#x679c;&#x662f;&#x5176;&#x4ed6;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x6bd4;&#x5982;dhcp,ppp&#x5219;proto_ip&#x4e2d;&#x7684;&#x53c2;&#x6570;&#x662f;&#x52a8;&#x6001;&#x83b7;&#x5f97;&#x7684;."/>
</node>
</node>
<node CREATED="1362472057556" ID="ID_924965603" LINK="#ID_564049293" MODIFIED="1362726123329">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct interface_ip_settings config_ip : &#20445;&#23384;&#20102;&#20174;uci&#37197;&#32622;&#36716;&#21270;&#32780;&#26469;&#30340;ip&#30456;&#20851;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472057556" MODIFIED="1362472057556" TEXT=" struct vlist_tree host_routes"/>
<node CREATED="1362472057556" ID="ID_1573975038" MODIFIED="1362539122773" TEXT=" int metric : &#x94fe;&#x8def;&#x5ea6;&#x91cf;&#x503c;, &#x5728;&#x9009;&#x62e9;&#x8def;&#x7531;&#x65f6;&#x7528;&#x4e8e;&#x8861;&#x91cf;&#x54ea;&#x6761;&#x94fe;&#x8def;&#x66f4;&#x597d;"/>
<node CREATED="1362472057556" MODIFIED="1362472057556" TEXT=" struct list_head errors"/>
<node CREATED="1362472057556" MODIFIED="1362472057556" TEXT=" struct avl_tree data"/>
<node CREATED="1362472057556" ID="ID_1980649138" MODIFIED="1362472057556" TEXT=" struct uloop_timeout remove_timer"/>
<node CREATED="1362472057556" ID="ID_1663222582" MODIFIED="1362728476180" TEXT=" struct ubus_object ubus : &#x5bf9;&#x5e94;&#x7684;ubus object"/>
</node>
</node>
<node CREATED="1362384588280" ID="ID_5545906" MODIFIED="1362578104297" TEXT="&#x5168;&#x5c40;&#x53d8;&#x91cf;">
<node CREATED="1362384615622" FOLDED="true" ID="ID_490996520" MODIFIED="1362384935439">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct ubus_context *ctx (ubus.c)
    </p>
    <p>
      &#20351;&#29992;ubus&#30340;&#19978;&#19979;&#25991;&#29615;&#22659;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362384693153" ID="ID_913888929" MODIFIED="1362384735232">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      connection_lost = netifd_ubus_connection_lost
    </p>
    <p>
      &#22914;&#20309;&#22788;&#29702;&#36830;&#25509;&#20002;&#22833;&#30340;&#22238;&#35843;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362388308404" ID="ID_1552496148" MODIFIED="1362388355107">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct uci_package *uci_network
    </p>
    <p>
      &#21152;&#36733;&#30340;uci&#37197;&#32622;&#25991;&#20214;/etc/config/network
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362385029657" FOLDED="true" ID="ID_1431115909" MODIFIED="1362565806248" TEXT="ubus object">
<node CREATED="1362385036456" FOLDED="true" ID="ID_588785986" MODIFIED="1362453940529" TEXT="network">
<node CREATED="1362385054535" FOLDED="true" ID="ID_1757866194" MODIFIED="1362385351234" TEXT="restart : netifd_handle_restart">
<node CREATED="1362385153920" FOLDED="true" ID="ID_834092306" MODIFIED="1362385350419" TEXT="netifd_restart">
<node CREATED="1362385257817" ID="ID_768895088" MODIFIED="1362385291233">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      interface_set_down
    </p>
    <p>
      &#23558;&#27599;&#20010;&#31471;&#21475;down&#35843;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362385300102" ID="ID_1803029907" MODIFIED="1362385340623" TEXT="&#x542f;&#x7528;&#x4e00;&#x4e2a;&#x5b9a;&#x65f6;&#x5668;&#x5728;1&#x79d2;&#x540e;&#x91cd;&#x65b0;&#x542f;&#x52a8;netifd"/>
</node>
</node>
<node CREATED="1362385076006" FOLDED="true" ID="ID_355127379" MODIFIED="1362388189820" TEXT="reload : netifd_handle_reload">
<node CREATED="1362385383136" FOLDED="true" ID="ID_781008445" MODIFIED="1362388189100" TEXT="netifd_reload">
<node CREATED="1362385429917" ID="ID_1935774118" LINK="#ID_1679068469" MODIFIED="1362388186549">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21551;&#29992;&#19968;&#20010;&#23450;&#26102;&#22120;&#22312;1&#31186;&#21518;&#35843;&#29992;config_init_all
    </p>
    <p>
      &#20197;&#37325;&#26032;&#21021;&#21152;&#36733;&#37197;&#32622;/etc/config/network
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362385096404" FOLDED="true" ID="ID_533388816" MODIFIED="1362385649989" TEXT="add_host_route : netifd_add_host_route">
<node CREATED="1362385627103" ID="ID_1000137270" MODIFIED="1362385628443" TEXT="interface_ip_add_target_route"/>
</node>
<node CREATED="1362385112931" FOLDED="true" ID="ID_1524771175" MODIFIED="1362385961778">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      get_proto_handlers : netifd_get_proto_handlers
    </p>
    <p>
      &#26174;&#31034;&#21327;&#35758;&#22788;&#29702;&#25554;&#20214;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362385909004" ID="ID_1170806727" MODIFIED="1362385910135" TEXT="proto_dump_handlers"/>
</node>
</node>
<node CREATED="1362385988343" FOLDED="true" ID="ID_427662719" MODIFIED="1362454658463" TEXT="network.device">
<node CREATED="1362386030052" FOLDED="true" ID="ID_237622354" MODIFIED="1362386401617">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      status : netifd_dev_status
    </p>
    <p>
      &#26597;&#30475;&#26576;&#20010;interface&#30340;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362386327519" ID="ID_903277047" MODIFIED="1362386397630">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &quot;external&quot;: false,
    </p>
    <p>
      &quot;present&quot;: true,
    </p>
    <p>
      &quot;type&quot;: &quot;Bridge&quot;,
    </p>
    <p>
      &quot;up&quot;: true,
    </p>
    <p>
      &quot;link&quot;: true,
    </p>
    <p>
      &quot;bridge-members&quot;: [&quot;athwifi0&quot;,&quot;eth0.1&quot;],
    </p>
    <p>
      &quot;mtu&quot;: 1500,
    </p>
    <p>
      &quot;macaddr&quot;: &quot;0:3:7f:11:2b:91&quot;,
    </p>
    <p>
      &quot;txqueuelen&quot;: 0,
    </p>
    <p>
      &quot;statistics&quot;: {}
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362386058594" ID="ID_1478031973" MODIFIED="1362386064253" TEXT="set_alias : netifd_handle_alias"/>
<node CREATED="1362386073233" ID="ID_1493449268" MODIFIED="1362386079420" TEXT="set_state : netifd_handle_set_state"/>
</node>
</node>
<node CREATED="1362385864463" FOLDED="true" ID="ID_162469013" MODIFIED="1362565806248" TEXT="struct avl_tree handlers">
<node CREATED="1362385879054" FOLDED="true" ID="ID_1358140547" LINK="#ID_1986626621" MODIFIED="1362537027451" TEXT="struct proto_handler : &#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#xa;&#x6bcf;&#x4e00;&#x4e2a;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x901a;&#x8fc7;&#x51fd;&#x6570;add_proto_handler()&#x6ce8;&#x518c;&#x5230;&#xa;&#x8fd9;&#x91cc;&#x7684;&#x5168;&#x5c40;&#x53d8;&#x91cf;handlers.&#x76ee;&#x524d;&#x5df2;&#x6709;3&#x79cd;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668; : static,dhcp,ppp&#xa;&#x5176;&#x4e2d;static&#x662f;&#x7531;netifd&#x672c;&#x8eab;&#x5b9e;&#x73b0;&#x7684;,&#x800c;dhcp&#x548c;ppp&#x662f;&#x901a;&#x8fc7;shell&#x811a;&#x672c;&#x5b9e;&#x73b0;&#x7684;.">
<node CREATED="1362536744415" FOLDED="true" ID="ID_1266321766" MODIFIED="1362565806248" TEXT="&#x5982;&#x4f55;&#x901a;&#x8fc7;shell&#x811a;&#x672c;&#x4e3a;netifd&#x5b9e;&#x73b0;&#x4e00;&#x4e2a;protocol handler">
<node CREATED="1362536799547" ID="ID_168856920" MODIFIED="1362537020776" TEXT="1, &#x5b9e;&#x73b0;protocol handler&#x7684;shell&#x811a;&#x672c;&#x5e94;&#x653e;&#x5728;/lib/netifd/proto&#x76ee;&#x5f55;&#x4e0b;,&#x4e14;&#x4ee5;xxx.sh&#x5f62;&#x5f0f;&#x547d;&#x540d;,&#x5176;&#x4e2d;xxx&#x4e3a;&#x534f;&#x8bae;&#x540d;&#x79f0;"/>
</node>
</node>
</node>
<node CREATED="1362388484104" FOLDED="true" ID="ID_551038879" MODIFIED="1362565806249" TEXT="struct avl_tree devices">
<node CREATED="1362389018611" ID="ID_59107340" LINK="#ID_1541974137" MODIFIED="1362389023355" TEXT="struct device"/>
</node>
<node CREATED="1362393723867" ID="ID_384117072" MODIFIED="1362578104298" TEXT="&#x8bbe;&#x5907;&#x7c7b;&#x578b;">
<node CREATED="1362393777431" FOLDED="true" ID="ID_538837956" MODIFIED="1362739195759" TEXT="bridge">
<node CREATED="1362390920510" ID="ID_764111726" MODIFIED="1362738907631" TEXT="struct device_type bridge_device_type">
<node CREATED="1362390938157" ID="ID_1917767313" MODIFIED="1362390939032" TEXT=".name = &quot;Bridge&quot;"/>
<node CREATED="1362390952748" FOLDED="true" ID="ID_1266451430" MODIFIED="1362471100316">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .config_params = &amp;bridge_attr_list
    </p>
    <p>
      &#25152;&#25903;&#25345;&#30340;&#37197;&#32622;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362391259783" ID="ID_256773059" MODIFIED="1362391260466" TEXT="ifname"/>
<node CREATED="1362391269222" ID="ID_464375073" MODIFIED="1362391278129" TEXT="stp : &#x662f;&#x5426;&#x5f00;&#x542f;stp"/>
<node CREATED="1362391287124" ID="ID_753853695" MODIFIED="1362391298271" TEXT="forward_delay : stp&#x53c2;&#x6570;"/>
<node CREATED="1362391304980" ID="ID_1906903467" MODIFIED="1362391332749" TEXT="ageing_time : FDB&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;"/>
<node CREATED="1362391340673" ID="ID_385565500" MODIFIED="1362391347516" TEXT="hello_time : stp&#x53c2;&#x6570;"/>
<node CREATED="1362391354384" ID="ID_1777554306" MODIFIED="1362391363787" TEXT="max_age : stp&#x53c2;&#x6570;"/>
<node CREATED="1362391370175" ID="ID_858592682" MODIFIED="1362391382041" TEXT="igmp_snooping : &#x662f;&#x5426;&#x5f00;&#x542f;igmp snooping"/>
</node>
<node CREATED="1362390965691" FOLDED="true" ID="ID_1857137641" MODIFIED="1362738891225" TEXT=".create = bridge_create">
<node CREATED="1362450917044" ID="ID_1957920535" MODIFIED="1362450928367" TEXT="&#x5206;&#x914d;&#x4e00;&#x4e2a;struct bridge_state&#x7ed3;&#x6784;"/>
<node CREATED="1362450999518" ID="ID_465690949" LINK="#ID_1774589793" MODIFIED="1362733352343">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;device_init&#21021;&#22987;&#21270;bridge&#23545;&#24212;&#30340;device
    </p>
    <p>
      &#21363;struct bridge_state -&gt; dev
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362452916265" ID="ID_677706861" MODIFIED="1362452918310" TEXT="dev-&gt;config_pending = true"/>
<node CREATED="1362453217220" ID="ID_271803273" MODIFIED="1362453393202">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;bridge&#35774;&#22791;&#32780;&#35328;dev-&gt;set_state = bridge_set_state
    </p>
    <p>
      &#23545;&#20110;&#19968;&#33324;&#35774;&#22791;&#32780;&#35328;dev-&gt;set_state = set_device_state
    </p>
    <p>
      &#20182;&#20204;&#37117;&#29992;&#20110;up/down&#35774;&#22791;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362455058835" ID="ID_334632378" MODIFIED="1362455216251">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;dev-&gt;hotplug_ops &#20026; bridge_ops
    </p>
    <p>
      &#25191;&#34892;&#21629;&#20196;&quot;ubus call network.interface.lan add_device eth0.1&quot;&#26102;
    </p>
    <p>
      &#35843;&#29992;&#27492;&#32467;&#26500;&#30340;add/del&#28155;&#21152;/&#21024;&#38500;bridge&#30340;&#25104;&#21592;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362455247493" ID="ID_1655506167" MODIFIED="1362455483864">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21021;&#22987;&#21270; avl &#26641;struct bridge_state -&gt;members
    </p>
    <p>
      &#24182;&#35774;&#32622; avl &#26641;&#30340;&#26356;&#26032;&#20989;&#25968;&#20026; bridge_member_update
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362455534610" ID="ID_47462070" LINK="#ID_506461118" MODIFIED="1362463018680" TEXT="bridge_reload"/>
</node>
<node CREATED="1362390975290" FOLDED="true" ID="ID_753274387" MODIFIED="1362739193841" TEXT=".config_init = bridge_config_init">
<node CREATED="1362467259664" ID="ID_1543345536" MODIFIED="1362467260315" TEXT="vlist_update"/>
<node CREATED="1362467289006" FOLDED="true" ID="ID_403845745" MODIFIED="1362739189922">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26681;&#25454;bridge&#30340;&#25104;&#21592;&#21015;&#34920;struct bridge_state *bst -&gt; ifnames
    </p>
    <p>
      &#35843;&#29992;bridge_add_member&#23558;&#27599;&#20010;&#25104;&#21592;device&#28155;&#21152;&#21040;bridge-&gt;members&#20013;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362735359814" ID="ID_366176955" MODIFIED="1362735361848" TEXT="bridge_add_member">
<node CREATED="1362467549196" ID="ID_1802995106" LINK="#ID_375831146" MODIFIED="1362671630264" TEXT="&#x627e;&#x5230;member device, &#x5982;&#x679c;&#x6ca1;&#x6709;&#x5219;&#x521b;&#x5efa;&#x5b83;&#xa;device_get"/>
<node CREATED="1362467577449" ID="ID_580368842" MODIFIED="1362738941977" TEXT="bridge_create_member">
<node CREATED="1362468190303" ID="ID_1034734937" MODIFIED="1362468205673" TEXT="&#x5206;&#x914d;&#x7ed3;&#x6784;struct bridge_member"/>
<node CREATED="1362468235644" ID="ID_1028203425" MODIFIED="1362468987395" TEXT="&#x521d;&#x59cb;&#x5316;struct bridge_member *bm -&gt; bst&#x6307;&#x5411;bridge&#x4ee3;&#x8868;&#x7684;struct bridge_state&#x7ed3;&#x6784;"/>
<node CREATED="1362469054931" FOLDED="true" ID="ID_1220289190" MODIFIED="1362739180431" TEXT="&#x521d;&#x59cb;&#x5316;struct bridge_member *bm -&gt; dev : &#x6b64;&#x7ed3;&#x6784;&#x8868;&#x793a;&#x5bf9;member&#x6240;&#x4f7f;&#x7528;&#x7684;device&#x7684;&#x5f15;&#x7528;&#xa;bm-&gt;dev.cb = bridge_member_cb&#x5f53;&#x6210;&#x5458;device&#x53d8;&#x4e3a;present&#x65f6;&#x5c06;&#x8c03;&#x7528;&#x6b64;&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1362739062763" FOLDED="true" ID="ID_202187546" MODIFIED="1362739178911" TEXT="bridge_member_cb">
<node CREATED="1362739088075" ID="ID_1736525705" MODIFIED="1362739127393" TEXT="&#x5f53;&#x7b2c;&#x4e00;&#x4e2a;&#x6210;&#x5458;device&#x53d8;&#x4e3a;present&#x65f6;&#x5c06;bridge device&#x8bbe;&#x4e3a;present"/>
</node>
</node>
<node CREATED="1362469160603" ID="ID_95251229" MODIFIED="1362469175445" TEXT="&#x521d;&#x59cb;&#x5316;struct bridge_member *bm -&gt; name"/>
<node CREATED="1362469197784" ID="ID_891349678" LINK="#ID_1574013650" MODIFIED="1362672352964" TEXT="&#x5c06;member&#x52a0;&#x5165;avl&#x6811; : struct bridge_state *bst -&gt; members&#xa;&#x6ce8;&#x610f; : &#x6210;&#x5458;&#x6dfb;&#x52a0;&#x5230;bst -&gt; members&#x4e2d;&#x65f6;&#x5c06;&#x89e6;&#x53d1; bridge_member_update"/>
</node>
</node>
</node>
<node CREATED="1362467267295" ID="ID_1061492284" MODIFIED="1362467268043" TEXT="vlist_flush"/>
</node>
<node CREATED="1362390984601" FOLDED="true" ID="ID_506461118" MODIFIED="1362578256550">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .reload = bridge_reload
    </p>
    <p>
      &#37325;&#26032;&#21152;&#36733;&#37197;&#32622;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362463090611" FOLDED="true" ID="ID_1252637925" MODIFIED="1362578232401">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20174;&#37197;&#32622;&#25991;&#20214;&#20013;&#25552;&#21462;device&#24120;&#35268;&#37197;&#32622;
    </p>
    <p>
      (&#20840;&#23616;&#21464;&#37327;struct config_param_list device_attr_list&#23450;&#20041;&#30340;&#21442;&#25968;&#39033;)
    </p>
  </body>
</html></richcontent>
<node CREATED="1362463152078" ID="ID_436530054" MODIFIED="1362463175016" TEXT="type"/>
<node CREATED="1362463175772" ID="ID_615667895" MODIFIED="1362463178856" TEXT="ifname"/>
<node CREATED="1362463182956" ID="ID_1536504486" MODIFIED="1362463184503" TEXT="mtu"/>
<node CREATED="1362463188955" ID="ID_306283179" MODIFIED="1362463191975" TEXT="macaddr"/>
<node CREATED="1362463192859" ID="ID_407520453" MODIFIED="1362463198534" TEXT="txqueuelen"/>
<node CREATED="1362463205162" ID="ID_1009458639" MODIFIED="1362463207750" TEXT="enabled"/>
</node>
<node CREATED="1362463090611" FOLDED="true" ID="ID_1026456128" MODIFIED="1362578235724">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20174;&#37197;&#32622;&#25991;&#20214;&#20013;&#25552;&#21462;bridge&#30456;&#20851;&#37197;&#32622;
    </p>
    <p>
      (&#20840;&#23616;&#21464;&#37327;struct config_param_list bridge_attr_list&#23450;&#20041;&#30340;&#21442;&#25968;&#39033;)
    </p>
  </body>
</html></richcontent>
<node CREATED="1362463175772" ID="ID_1728621238" MODIFIED="1362463178856" TEXT="ifname"/>
<node CREATED="1362463152078" ID="ID_1820446669" MODIFIED="1362463505649" TEXT="stp"/>
<node CREATED="1362463182956" ID="ID_581355882" MODIFIED="1362463517383" TEXT="forward_delay"/>
<node CREATED="1362463188955" ID="ID_1495227704" MODIFIED="1362463525139" TEXT="ageing_time"/>
<node CREATED="1362463192859" ID="ID_1576691701" MODIFIED="1362463535994" TEXT="hello_time"/>
<node CREATED="1362463205162" ID="ID_234922920" MODIFIED="1362463544620" TEXT="max_age"/>
<node CREATED="1362463551010" ID="ID_1998087626" MODIFIED="1362463551998" TEXT="igmp_snooping"/>
</node>
<node CREATED="1362463719510" ID="ID_587071368" MODIFIED="1362463797213" TEXT="&#x8bbe;&#x7f6e;struct bridge_state *bst -&gt; ifnames, &#x5373;&#x4e0a;&#x9762;&#x4ece;&#x914d;&#x7f6e;&#x4e2d;&#x63d0;&#x53d6;&#x7684;ifname&#x914d;&#x7f6e;&#x53c2;&#x6570;"/>
<node CREATED="1362463929864" FOLDED="true" ID="ID_1320396518" LINK="#ID_811881357" MODIFIED="1362466938942" TEXT="&#x8c03;&#x7528;device_init_settings&#x5c06;device&#x5e38;&#x89c4;&#x914d;&#x7f6e;&#x6620;&#x5c04;&#x5230;dev-&gt;settings">
<node CREATED="1362464338828" ID="ID_382277413" MODIFIED="1362464624930">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      mtu &#26144;&#23556;&#21040; dev-&gt;settings-&gt;mtu
    </p>
    <p>
      txqueuelen&#160;&#26144;&#23556;&#21040; dev-&gt;settings-&gt;txqueuelen
    </p>
    <p>
      macaddr &#26144;&#23556;&#21040; dev-&gt;settings-&gt;macaddr
    </p>
    <p>
      enable &#26144;&#23556;&#21040; dev-&gt;disabled
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362464713473" FOLDED="true" ID="ID_1070755486" LINK="#ID_521302825" MODIFIED="1362466945925" TEXT="&#x8c03;&#x7528;bridge_apply_settings&#x5c06;bridge&#x76f8;&#x5173;&#x914d;&#x7f6e;&#x6620;&#x5c04;&#x5230;struct bridge_state *bst -&gt; config">
<node CREATED="1362464338828" ID="ID_313452760" MODIFIED="1362465437083">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      stp &#26144;&#23556;&#21040; struct bridge_state *bst -&gt; config -&gt; stp
    </p>
    <p>
      igmp_snoop&#160;&#26144;&#23556;&#21040; struct bridge_state *bst -&gt; config -&gt; igmp_snoop
    </p>
    <p>
      forward_delay&#160;&#26144;&#23556;&#21040; struct bridge_state *bst -&gt; config -&gt; forward_delay
    </p>
    <p>
      ageing_time &#26144;&#23556;&#21040; struct bridge_state *bst -&gt; config -&gt; ageing_time
    </p>
    <p>
      hello_time &#26144;&#23556;&#21040; struct bridge_state *bst -&gt; config -&gt; hello_time
    </p>
    <p>
      max_age &#26144;&#23556;&#21040; struct bridge_state *bst -&gt; config -&gt; max_age
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362465719835" ID="ID_1052083489" LINK="#ID_1692927044" MODIFIED="1362466413035" TEXT="&#x5c06;&#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x4e2d;&#x63d0;&#x53d6;&#x7684;&#x5173;&#x4e8e;&#x6b64;bridge&#x7684;&#x6240;&#x6709;&#x539f;&#x59cb;&#x914d;&#x7f6e;&#x53c2;&#x6570;&#x653e;&#x5230;struct bridge_state *bst -&gt; config_data"/>
</node>
<node CREATED="1362390993625" ID="ID_280739838" MODIFIED="1362390994132" TEXT=".free = bridge_free"/>
<node CREATED="1362391003112" ID="ID_1381395536" MODIFIED="1362391004739" TEXT=".dump_info = bridge_dump_info"/>
</node>
</node>
<node CREATED="1362393790422" FOLDED="true" ID="ID_1829117202" MODIFIED="1362565806249" TEXT="tunnel">
<node CREATED="1362391829295" FOLDED="true" ID="ID_424961441" MODIFIED="1362451985609" TEXT="struct device_type tunnel_device_type">
<node CREATED="1362391838878" ID="ID_1749445598" MODIFIED="1362391840659" TEXT=".name = &quot;IP tunnel&quot;"/>
<node CREATED="1362391848830" FOLDED="true" ID="ID_657611699" MODIFIED="1362391944863">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .config_params = &amp;tunnel_attr_list
    </p>
    <p>
      &#25152;&#25903;&#25345;&#30340;&#37197;&#32622;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362391905514" ID="ID_1032779075" MODIFIED="1362391906517" TEXT="mode"/>
<node CREATED="1362391912681" ID="ID_770541214" MODIFIED="1362391913333" TEXT="local"/>
<node CREATED="1362391919369" ID="ID_387538772" MODIFIED="1362391919916" TEXT="remote"/>
<node CREATED="1362391925688" ID="ID_1307593165" MODIFIED="1362391926404" TEXT="ttl"/>
<node CREATED="1362391935208" ID="ID_108000629" MODIFIED="1362391935827" TEXT="6rd-prefix"/>
<node CREATED="1362391942616" ID="ID_1517147130" MODIFIED="1362391943154" TEXT="6rd-relay-prefix"/>
</node>
<node CREATED="1362391858669" ID="ID_66686682" MODIFIED="1362391859656" TEXT=".create = tunnel_create"/>
<node CREATED="1362391867436" ID="ID_1011334626" MODIFIED="1362391868408" TEXT=".free = tunnel_free"/>
</node>
</node>
<node CREATED="1362393799381" FOLDED="true" ID="ID_1797478300" MODIFIED="1362734559697" TEXT="simple">
<node CREATED="1362391980373" FOLDED="true" ID="ID_1420051615" MODIFIED="1362734558168" TEXT="struct device_type simple_device_type">
<node CREATED="1362391992308" ID="ID_1577158438" MODIFIED="1362391993407" TEXT=".name = &quot;Network device&quot;"/>
<node CREATED="1362392003507" FOLDED="true" ID="ID_423124459" MODIFIED="1362392101276">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      .config_params = &amp;device_attr_list
    </p>
    <p>
      &#25152;&#25903;&#25345;&#30340;&#37197;&#32622;&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362392062111" ID="ID_370866680" MODIFIED="1362392063130" TEXT="type"/>
<node CREATED="1362392069150" ID="ID_1580758268" MODIFIED="1362392069706" TEXT="ifname"/>
<node CREATED="1362392075518" ID="ID_1916013273" MODIFIED="1362392076010" TEXT="mtu"/>
<node CREATED="1362392081677" ID="ID_489029144" MODIFIED="1362392082345" TEXT="macaddr"/>
<node CREATED="1362392088781" ID="ID_192952280" MODIFIED="1362392089592" TEXT="txqueuelen"/>
<node CREATED="1362392095932" ID="ID_307199328" MODIFIED="1362392096776" TEXT="enabled"/>
</node>
<node CREATED="1362392016018" ID="ID_894715508" MODIFIED="1362392016925" TEXT=".create = simple_device_create"/>
<node CREATED="1362392025729" FOLDED="true" ID="ID_1886630449" MODIFIED="1362734375130" TEXT=".check_state = system_if_check">
<node CREATED="1362734324166" ID="ID_1382976369" MODIFIED="1362734370057" TEXT="&#x6839;&#x636e;device&#x662f;&#x5426;&#x5df2;&#x7ecf;&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x5b58;&#x5728;&#x8c03;&#x7528;device_set_present(dev, (true|false))"/>
</node>
<node CREATED="1362392034225" ID="ID_1598493753" MODIFIED="1362392035068" TEXT=".free = simple_device_free"/>
</node>
</node>
</node>
<node CREATED="1362584853232" ID="ID_334396157" MODIFIED="1362653790171" TEXT="&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362624445464" ID="ID_312653993" MODIFIED="1362624453699" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1362624463431" ID="ID_511900674" MODIFIED="1362624619998">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27599;&#20010;&#21327;&#35758;&#22788;&#29702;&#22120;&#37117;&#20250;&#20445;&#23384;&#19968;&#20010;&#33258;&#24049;&#31169;&#26377;&#30340;&#21327;&#35758;&#29366;&#24577;,&#21363;struct xxx_proto_state.
    </p>
    <p>
      &#23427;&#26159;&#20174;&#22522;&#31867;struct interface_proto_state&#27966;&#29983;&#20986;&#30340;&#23376;&#31867;.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362472057555" ID="ID_883094474" MODIFIED="1371191461435" TEXT="static&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362472057555" FOLDED="true" ID="ID_1133311656" MODIFIED="1362756058565">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct proto_handler static_proto
    </p>
    <p>
      &#27492;&#32467;&#26500;&#22312;&#21021;&#22987;&#21270;&#20989;&#25968;static_proto_init()&#20013;&#34987;&#28155;&#21152;&#21040;
    </p>
    <p>
      &#20840;&#23616;&#21464;&#37327;handlers&#20013;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362472057555" ID="ID_1425942050" MODIFIED="1362496766164" TEXT=" struct avl_node avl : &#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct avl_tree handlers"/>
<node CREATED="1362472057555" ID="ID_1625118799" MODIFIED="1362472057555" TEXT=" unsigned int flags"/>
<node CREATED="1362472057555" ID="ID_1634212258" MODIFIED="1362584982302" TEXT=" const char *name : &#x534f;&#x8bae;&#x540d;&#x79f0;, static"/>
<node CREATED="1362472057555" FOLDED="true" ID="ID_1251488937" MODIFIED="1362625468176" TEXT=" const struct config_param_list *config_params&#xa;&#x8be5;&#x534f;&#x8bae;&#x652f;&#x6301;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;">
<node CREATED="1362496828338" FOLDED="true" ID="ID_1217972308" MODIFIED="1362624259077" TEXT="static">
<node CREATED="1362496856340" ID="ID_1920365706" MODIFIED="1362496857821" TEXT="ipaddr"/>
<node CREATED="1362496869214" ID="ID_1613743448" MODIFIED="1362496870124" TEXT="ip6addr"/>
<node CREATED="1362496878054" ID="ID_25668264" MODIFIED="1362496878803" TEXT="netmask"/>
<node CREATED="1362496885969" ID="ID_1501696947" MODIFIED="1362496886817" TEXT="broadcast"/>
<node CREATED="1362496893678" ID="ID_985473427" MODIFIED="1362496894494" TEXT="gateway"/>
<node CREATED="1362496901450" ID="ID_1043236402" MODIFIED="1362496902282" TEXT="ip6gw"/>
</node>
</node>
<node CREATED="1362472057555" ID="ID_1862994664" MODIFIED="1362755968125" TEXT=" struct interface_proto_state *(*attach)(const struct proto_handler *h, struct interface *iface, struct blob_attr *attr)">
<node CREATED="1362585010530" FOLDED="true" ID="ID_1938383385" MODIFIED="1362756017620" TEXT="static_attach">
<node CREATED="1362624788817" ID="ID_117608417" MODIFIED="1362624802475" TEXT="&#x5206;&#x914d;&#x7ed3;&#x6784;struct static_proto_state *state"/>
<node CREATED="1362624816942" ID="ID_757579254" MODIFIED="1362624844673" TEXT="&#x5c06;static&#x534f;&#x8bae;&#x7279;&#x5b9a;&#x7684;&#x914d;&#x7f6e;&#x4fdd;&#x5b58;&#x5230;struct static_proto_state *state -&gt; config"/>
<node CREATED="1362624863754" ID="ID_1521239484" LINK="#ID_75643758" MODIFIED="1362624912751" TEXT="&#x521d;&#x59cb;&#x5316;&#x57fa;&#x7c7b;struct interface_proto_state"/>
<node CREATED="1362624918263" ID="ID_108074569" MODIFIED="1362625180551">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#22522;&#31867; : struct static_proto_state *state -&gt; proto
    </p>
    <p>
      &#36825;&#37324;&#36816;&#29992;&#20102;&#38754;&#21521;&#23545;&#35937;&#30340;&#22810;&#24577;&#26426;&#21046; : &#32487;&#25215;&#33258;&#30456;&#21516;&#29238;&#31867;&#30340;&#21508;&#23376;&#31867;&#21487;&#20197;&#34987;&#32479;&#19968;&#30475;&#20316;&#26159;&#29238;&#31867;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1362624399611" ID="ID_1589589161" MODIFIED="1371179541521">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct static_proto_state
    </p>
    <p>
      static&#21327;&#35758;&#22788;&#29702;&#22120;&#30340;&#21327;&#35758;&#29366;&#24577;
    </p>
    <p>
      &#23427;&#26159;struct interface_proto_state&#30340;&#23376;&#31867;
    </p>
    <p>
      &#27492;&#32467;&#26500;&#22312;interface_update&#26102;&#30001;&#20989;&#25968;proto_init_interface
    </p>
    <p>
      &#35843;&#29992;static&#21327;&#35758;&#22788;&#29702;&#22120;&#30340;attach()&#20989;&#25968;&#29983;&#25104;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362624418169" ID="ID_75643758" MODIFIED="1362814228445" TEXT="struct interface_proto_state proto : &#x57fa;&#x7c7b;">
<node CREATED="1362623785454" ID="ID_1591453116" LINK="#ID_429210477" MODIFIED="1362724191400" TEXT=".proto_event = interface_proto_cb"/>
<node CREATED="1362625421204" ID="ID_1406311516" MODIFIED="1362625427889" TEXT=".free = static_free"/>
<node CREATED="1362625437059" FOLDED="true" ID="ID_1516514775" MODIFIED="1371179610240" TEXT=".cb = static_handler">
<node CREATED="1362723636784" ID="ID_209325039" MODIFIED="1362814234353" TEXT="static_proto_setup">
<node CREATED="1362723648377" ID="ID_241418399" LINK="#ID_1591198048" MODIFIED="1362814281431" TEXT="proto_apply_static_ip_settings&#xa;&#x5c06;static&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x7279;&#x5b9a;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;ipaddr,ip6addr,netmask,broadcast,gateway,ip6gw&#xa;&#x4ece;struct static_proto_state *state-&gt;config&#x590d;&#x5236;&#x5230;iface-&gt;proto_ip&#x4e2d;&#x53bb;&#xa;&#x6ce8;&#x610f;&#x8fd9;&#x5bfc;&#x81f4;iface-&gt;proto_ip-&gt;addr&#x7684;&#x53d8;&#x52a8;,&#x4ece;&#x800c;&#x89e6;&#x53d1;&#x51fd;&#x6570;interface_update_proto_addr"/>
</node>
</node>
</node>
<node CREATED="1362624429353" ID="ID_1462473048" MODIFIED="1362624674932" TEXT="struct blob_attr *config : &#x4ece;uci&#x914d;&#x7f6e;&#x4e2d;&#x63d0;&#x53d6;&#x7684;&#x534f;&#x8bae;&#x7279;&#x5b9a;&#x7684;&#x914d;&#x7f6e;"/>
</node>
</node>
<node CREATED="1362653807884" FOLDED="true" ID="ID_1731437745" MODIFIED="1362814761944" TEXT="dhcp&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362752909381" FOLDED="true" ID="ID_1965731549" MODIFIED="1362793978571" TEXT="struct proto_shell_handler&#xa;&#x6b64;&#x7ed3;&#x6784;&#x5728;&#x521d;&#x59cb;&#x5316;&#x51fd;&#x6570;proto_shell_init()&#x4e2d;&#x88ab;&#x6dfb;&#x52a0;&#x5230;&#xa;&#x5168;&#x5c40;&#x53d8;&#x91cf;handlers&#x4e2d;.">
<node CREATED="1362752925586" ID="ID_24937969" MODIFIED="1362752927203" TEXT="struct list_head list"/>
<node CREATED="1362752938094" FOLDED="true" ID="ID_1586279658" MODIFIED="1362793976628" TEXT="struct proto_handler proto : &#x57fa;&#x7c7b;">
<node CREATED="1362472057555" ID="ID_1634430384" MODIFIED="1362496766164" TEXT=" struct avl_node avl : &#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct avl_tree handlers"/>
<node CREATED="1362472057555" FOLDED="true" ID="ID_1857193219" MODIFIED="1362792944699" TEXT=" unsigned int flags">
<node CREATED="1362792925595" ID="ID_390085792" MODIFIED="1362792929161" TEXT="PROTO_FLAG_NODEV"/>
<node CREATED="1362792940624" ID="ID_1030511027" MODIFIED="1362792942305" TEXT="PROTO_FLAG_INIT_AVAILABLE"/>
</node>
<node CREATED="1362472057555" ID="ID_1748894878" MODIFIED="1362653855917" TEXT=" const char *name : &#x534f;&#x8bae;&#x540d;&#x79f0;, dhcp"/>
<node CREATED="1362472057555" FOLDED="true" ID="ID_1510854791" MODIFIED="1362755397132" TEXT=" const struct config_param_list *config_params&#xa;&#x8be5;&#x534f;&#x8bae;&#x652f;&#x6301;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;">
<node CREATED="1362496832830" FOLDED="true" ID="ID_1708288059" MODIFIED="1362753889304" TEXT="dhcp">
<node CREATED="1362496975025" ID="ID_229640776" MODIFIED="1362496976513" TEXT="ipaddr"/>
<node CREATED="1362496984433" ID="ID_1066182201" MODIFIED="1362496985313" TEXT="netmask"/>
<node CREATED="1362496993690" ID="ID_525678762" MODIFIED="1362496994521" TEXT="hostname"/>
<node CREATED="1362497002027" ID="ID_707074406" MODIFIED="1362497002896" TEXT="clientid"/>
<node CREATED="1362497010270" ID="ID_223892986" MODIFIED="1362497010805" TEXT="vendorid"/>
<node CREATED="1362497018084" ID="ID_988168596" MODIFIED="1362497019121" TEXT="broadcast"/>
<node CREATED="1362497025416" ID="ID_2000082" MODIFIED="1362497026303" TEXT="reqopts"/>
</node>
</node>
<node CREATED="1362472057555" FOLDED="true" ID="ID_1176440481" MODIFIED="1362792973254" TEXT=" struct interface_proto_state *(*attach)(const struct proto_handler *h, struct interface *iface, struct blob_attr *attr)">
<node CREATED="1362754007116" ID="ID_997486007" MODIFIED="1362754008162" TEXT="proto_shell_attach">
<node CREATED="1362755419726" ID="ID_242708710" MODIFIED="1362755429331" TEXT="&#x5206;&#x914d;struct proto_shell_state *state&#x7ed3;&#x6784;"/>
<node CREATED="1362755533822" ID="ID_47646720" MODIFIED="1362755574486" TEXT="&#x5c06;uci&#x914d;&#x7f6e;&#x4e2d;&#x5173;&#x4e8e;&#x6b64;&#x534f;&#x8bae;&#x7684;&#x914d;&#x7f6e;&#x4fdd;&#x5b58;&#x5230;state-&gt;config"/>
<node CREATED="1362755800564" ID="ID_1431338980" MODIFIED="1362755807885" TEXT="&#x521d;&#x59cb;&#x5316;&#x57fa;&#x7c7b;state-&gt;proto"/>
<node CREATED="1362755825090" ID="ID_1008640120" MODIFIED="1362755829838" TEXT="&#x521d;&#x59cb;&#x5316;&#x5b9a;&#x65f6;&#x5668;state-&gt;teardown_timeout"/>
<node CREATED="1362755846166" ID="ID_96667055" MODIFIED="1362755849527" TEXT="&#x521d;&#x59cb;&#x5316;state-&gt;script_task"/>
<node CREATED="1362755908555" ID="ID_1873891331" MODIFIED="1362755913599" TEXT="&#x521d;&#x59cb;&#x5316;state-&gt;proto_task"/>
<node CREATED="1362624918263" ID="ID_1186678561" MODIFIED="1362756004315">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#22522;&#31867; : struct proto_shell_state *state -&gt; proto
    </p>
    <p>
      &#36825;&#37324;&#36816;&#29992;&#20102;&#38754;&#21521;&#23545;&#35937;&#30340;&#22810;&#24577;&#26426;&#21046; : &#32487;&#25215;&#33258;&#30456;&#21516;&#29238;&#31867;&#30340;&#21508;&#23376;&#31867;&#21487;&#20197;&#34987;&#32479;&#19968;&#30475;&#20316;&#26159;&#29238;&#31867;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1362752951845" ID="ID_1982183946" LINK="#ID_1510854791" MODIFIED="1362754050158" TEXT="struct config_param_list config : &#x8be5;&#x534f;&#x8bae;&#x652f;&#x6301;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;"/>
<node CREATED="1362752966286" ID="ID_703005529" MODIFIED="1362752967366" TEXT="char *config_buf"/>
<node CREATED="1362752978221" ID="ID_185128473" MODIFIED="1362752979169" TEXT="bool init_available"/>
<node CREATED="1362752990711" ID="ID_1051564686" MODIFIED="1362753919983" TEXT="char script_name[] : &#x811a;&#x672c;&#x540d;&#x79f0;dhcp"/>
</node>
<node CREATED="1362754997387" FOLDED="true" ID="ID_766838805" MODIFIED="1362814618015" TEXT="struct proto_shell_state&#xa;dhcp&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x7684;&#x534f;&#x8bae;&#x72b6;&#x6001;&#xa;&#x5b83;&#x662f;struct interface_proto_state&#x7684;&#x5b50;&#x7c7b;&#xa;&#x6b64;&#x7ed3;&#x6784;&#x5728;interface_update&#x65f6;&#x7531;&#x51fd;&#x6570;proto_init_interface&#xa;&#x8c03;&#x7528;dhcp&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x7684;attach()&#x51fd;&#x6570;&#x751f;&#x6210;.">
<node CREATED="1362624418169" ID="ID_914191760" MODIFIED="1362755351196" TEXT="struct interface_proto_state proto : &#x57fa;&#x7c7b;">
<node CREATED="1362623785454" ID="ID_1937272995" LINK="#ID_429210477" MODIFIED="1362724191400" TEXT=".proto_event = interface_proto_cb"/>
<node CREATED="1362625421204" ID="ID_74062932" MODIFIED="1362755610895" TEXT=".free = proto_shell_free"/>
<node CREATED="1362755623392" ID="ID_637977981" LINK="#ID_1153052532" MODIFIED="1362802931625" TEXT=".notify = proto_shell_notify"/>
<node CREATED="1362625437059" FOLDED="true" ID="ID_337931417" MODIFIED="1362804534034" TEXT=".cb = proto_shell_handler&#xa;&#x5728;interface&#x7684;setup&#x8fc7;&#x7a0b;&#x4e2d;,&#x7531;interface&#x5411;&#x5b83;&#x7684;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x53d1;&#x9001;PROTO_CMD_SETUP&#x6d88;&#x606f;&#xa;&#x4ece;&#x800c;&#x5f15;&#x53d1;&#x4e86;&#x8fd9;&#x4e2a;&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;&#x8c03;&#x7528;">
<node CREATED="1362793710560" ID="ID_1819428153" MODIFIED="1362793725331" TEXT="proto_shell_handler">
<node CREATED="1362723636784" ID="ID_218089134" MODIFIED="1362793701635" TEXT="PROTO_CMD_SETUP">
<node CREATED="1362794004857" ID="ID_506152864" MODIFIED="1362794332316" TEXT="&#x542f;&#x7528;&#x4e00;&#x4e2a;&#x5b50;&#x8fdb;&#x7a0b;&#x6267;&#x884c;&#x4ee5;&#x4e0b;&#x811a;&#x672c;:&#xa;script_name &lt;protocol name&gt; setup &lt;interface name&gt; &lt;config&gt; &lt;main device name&gt;&#xa;&#x5177;&#x4f53;&#x800c;&#x8a00;&#x5c31;&#x662f;&#x4ee5;&#x4e0b;&#x547d;&#x4ee4;:&#xa;/lib/netifd/proto/dhcp.sh dhcp setup network.interface.lan &quot;config&quot; eth0.2"/>
</node>
<node CREATED="1362793744514" ID="ID_1187200103" MODIFIED="1362793745481" TEXT="PROTO_CMD_TEARDOWN"/>
</node>
</node>
</node>
<node CREATED="1362755029766" ID="ID_1229232337" MODIFIED="1362755211608" TEXT="struct proto_shell_handler *handler : &#x6240;&#x5173;&#x8054;&#x7684;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;"/>
<node CREATED="1362755039533" ID="ID_1821231791" MODIFIED="1362755522715" TEXT="struct blob_attr *config : &#x4ece;uci&#x914d;&#x7f6e;&#x4e2d;&#x63d0;&#x53d6;&#x7684;&#x534f;&#x8bae;&#x7279;&#x5b9a;&#x7684;&#x914d;&#x7f6e;"/>
<node CREATED="1362755049485" ID="ID_1218087319" MODIFIED="1362755050045" TEXT="struct uloop_timeout teardown_timeout">
<node CREATED="1362755726961" ID="ID_55236740" MODIFIED="1362755729414" TEXT=".cb = proto_shell_teardown_timeout_cb"/>
</node>
<node CREATED="1362755061076" ID="ID_1199774796" MODIFIED="1362802189215" TEXT="struct netifd_process script_task&#xa;&#x6267;&#x884c;&#x811a;&#x672c;/lib/netifd/proto/dhcp.sh&#x7684;&#x4e0a;&#x4e0b;&#x6587;">
<node CREATED="1362756431521" FOLDED="true" ID="ID_1394593264" MODIFIED="1362756509368" TEXT="struct netifd_process">
<node CREATED="1362756431521" MODIFIED="1362756431521" TEXT=" struct list_head list"/>
<node CREATED="1362756431521" MODIFIED="1362756431521" TEXT=" struct uloop_process uloop"/>
<node CREATED="1362756431521" MODIFIED="1362756431521" TEXT=" void (*cb)(struct netifd_process *, int ret)"/>
<node CREATED="1362756431521" MODIFIED="1362756431521" TEXT=" int dir_fd"/>
<node CREATED="1362756431521" MODIFIED="1362756431521" TEXT=" struct netifd_fd log_fd"/>
<node CREATED="1362756431522" MODIFIED="1362756431522" TEXT=" struct uloop_fd log_uloop"/>
<node CREATED="1362756431522" MODIFIED="1362756431522" TEXT=" const char *log_prefix"/>
<node CREATED="1362756431522" MODIFIED="1362756431522" TEXT=" char *log_buf"/>
<node CREATED="1362756431522" MODIFIED="1362756431522" TEXT=" int log_buf_ofs"/>
<node CREATED="1362756431522" MODIFIED="1362756431522" TEXT=" bool log_overflow"/>
</node>
<node CREATED="1362756511867" ID="ID_471474842" MODIFIED="1362803912897" TEXT=".cb = proto_shell_script_cb&#xa;&#x811a;&#x672c;/lib/netifd/proto/xxx.sh&#x6267;&#x884c;&#x5b8c;&#x6bd5;&#x540e;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;,&#x4e0d;&#x505a;&#x4ec0;&#x4e48;&#x4e8b;&#x60c5;"/>
</node>
<node CREATED="1362755071745" ID="ID_1026798796" LINK="#ID_1394593264" MODIFIED="1362802219772" TEXT="struct netifd_process proto_task&#xa;&#x6267;&#x884c;&#x5e94;&#x7528;&#x7a0b;&#x5e8f;udhcpc&#x7684;&#x4e0a;&#x4e0b;&#x6587;">
<node CREATED="1362756555459" ID="ID_811804819" LINK="#ID_1187200103" MODIFIED="1362804081876" TEXT=".cb = proto_shell_task_cb&#xa;&#x534f;&#x8bae;&#x76f8;&#x5173;daemon&#x8fdb;&#x7a0b;&#x9000;&#x51fa;&#x540e;&#x6267;&#x884c;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;&#xa;&#x7531;&#x4e8e;&#x534f;&#x8bae;&#x76f8;&#x5173;daemon&#x8fdb;&#x7a0b;&#x5df2;&#x7ecf;&#x9000;&#x51fa;,&#x56e0;&#x6b64;&#x9700;&#x8981;down&#x8c03;&#x5bf9;&#x5e94;&#x7684;interface :&#xa;proto_shell_handler(&amp;state-&gt;proto, PROTO_CMD_TEARDOWN, false)"/>
</node>
<node CREATED="1362755082203" ID="ID_25318381" MODIFIED="1362755082818" TEXT="enum proto_shell_sm sm"/>
<node CREATED="1362755093726" ID="ID_1689680966" MODIFIED="1362755094325" TEXT="bool proto_task_killed"/>
<node CREATED="1362755103637" ID="ID_317611458" MODIFIED="1362755104212" TEXT="int last_error"/>
<node CREATED="1362755114231" ID="ID_1109253343" MODIFIED="1362755115271" TEXT="struct list_head deps"/>
</node>
<node CREATED="1362795498560" ID="ID_36476953" MODIFIED="1362795506351" TEXT="shell script">
<node CREATED="1362795508638" FOLDED="true" ID="ID_1840453356" MODIFIED="1362813037643" TEXT="protocol handler&#xa;&#x88ab;&#x653e;&#x5728;/lib/netifd/proto&#x76ee;&#x5f55;&#x4e0b;&#x5145;&#x5f53;netifd&#x4e2d;&#x7684;protocol handler&#xa;&#x8fd9;&#x4e2a;&#x811a;&#x672c;&#x6709;&#x56fa;&#x5b9a;&#x7684;&#x683c;&#x5f0f;">
<node CREATED="1362800220508" ID="ID_888328719" MODIFIED="1362802247658" TEXT="#!/bin/sh&#xa;&#xa;. /lib/functions.sh&#xa;. ../netifd-proto.sh&#xa;init_proto &quot;$@&quot;&#xa;&#xa;proto_dhcp_init_config() {&#xa;&#x9;proto_config_add_string &quot;xxx&quot;&#xa;&#x9;proto_config_add_boolean &quot;xxx&quot;&#xa;&#x9;proto_config_add_int &quot;xxx&quot;&#xa;}&#xa;&#xa;proto_dhcp_setup() {&#xa;&#x9;local config=&quot;$1&quot;&#xa;&#x9;local iface=&quot;$2&quot;&#xa;&#x9;#other command&#xa;}&#xa;&#xa;proto_dhcp_teardown() {&#xa;&#x9;local interface=&quot;$1&quot;&#xa;&#x9;proto_kill_command &quot;$interface&quot;&#xa;}&#xa;&#xa;add_protocol dhcp">
<node CREATED="1362800291918" ID="ID_1141907411" LINK="#ID_1408264973" MODIFIED="1362800489293" TEXT="proto_xxx_init_config : &#x6b64;&#x51fd;&#x6570;&#x5728;&#x6267;&#x884c;&#x547d;&#x4ee4;&#x6267;&#x884c;&quot;xxx.sh &apos;&apos; dump&quot;&#x65f6;&#x4f1a;&#x88ab;&#x8c03;&#x5230;&#xa;&#x5b83;&#x4e3b;&#x8981;&#x901a;&#x8fc7;json&#x6570;&#x636e;&#x6765;&#x8868;&#x660e;&#x672c;&#x534f;&#x8bae;&#x652f;&#x6301;&#x54ea;&#x4e9b;&#x914d;&#x7f6e;&#x53c2;&#x6570;"/>
<node CREATED="1362800313727" FOLDED="true" ID="ID_1922756900" LINK="#ID_1763631519" MODIFIED="1362813034082" TEXT="proto_xxx_setup : &#x6b64;&#x51fd;&#x6570;&#x5728;interface&#x7684;setup&#x8fc7;&#x7a0b;&#x4e2d;&#x4f1a;&#x88ab;&#x8c03;&#x5230;,&#x89c1;interface_set_up&#xa;&#x5b83;&#x4e3b;&#x8981;&#x662f;&#x751f;&#x6210;&#x5982;&#x4f55;&#x542f;&#x52a8;&#x534f;&#x8bae;&#x76f8;&#x5173;&#x7684;daemon(&#x5982;udhcpc,pppd)&#x7684;&#x547d;&#x4ee4;&#x884c;.&#x7136;&#x540e;&#x5c06;&#x8fd9;&#x4e2a;&#x547d;&#x4ee4;&#x884c;&#xa;&#x7528;ubus&#x544a;&#x8bc9;netifd,&#x8ba9;netifd&#x53bb;&#x6267;&#x884c;&#x8fd9;&#x4e2a;&#x547d;&#x4ee4;.">
<node CREATED="1362800313727" ID="ID_1400568712" MODIFIED="1362800934930" TEXT="&#x5728;&#x8fd9;&#x4e2a;&#x51fd;&#x6570;&#x91cc;&#x53ef;&#x4ee5;&#x4f7f;&#x7528;&#x7684;&#x53c2;&#x6570;&#x6709;:&#xa;proto : &#x534f;&#x8bae;&#x540d;&#x79f0;,&#x5982;dhcp,ppp&#xa;cmd : &#x547d;&#x4ee4;,&#x5982;setup,teardown,dump&#xa;interface : &#x5982;network.interface.lan&#xa;data : json&#x683c;&#x5f0f;&#x6570;&#x636e;,&#x4fdd;&#x5b58;&#x4e86;&#x5173;&#x4e8e;&#x6b64;&#x534f;&#x8bae;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;&#xa;ifname : interface&#x7684;main device,&#x5982;eth0.2"/>
<node CREATED="1362800313727" ID="ID_1755581211" MODIFIED="1362800946081" TEXT="&#x8fd9;&#x4e2a;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#x4e3a;:&#xa;$1 : interface,&#x5982;network.interface.lan&#xa;$2 : main device,&#x5982;eth0.2"/>
<node CREATED="1362802288054" ID="ID_168601207" MODIFIED="1362807505984" TEXT="proto_run_command&#xa;&#x5728;json&#x6570;&#x636e;&#x4e2d;&#x8bbe;&#x7f6e;action = 1">
<node CREATED="1362802303781" ID="ID_1613870879" MODIFIED="1362802304980" TEXT="_proto_notify">
<node CREATED="1362802306707" ID="ID_155140176" LINK="#ID_983256444" MODIFIED="1362803425653" TEXT="ubus call network.interface.wan notify_proto &quot;$(json_dump)&quot;&#xa;&#x6b64;&#x5904;&#x51fd;&#x6570;json_dump&#x51fa;&#x6765;&#x7684;&#x6570;&#x636e;&#x4e3a;&#x4e00;&#x4e2a;&#x7c7b;&#x4f3c;&#x4e8e;&quot;udhcpc -f xxx eth0.2&quot;&#x7684;&#x547d;&#x4ee4;&#x884c;&#xa;&#x5b83;&#x544a;&#x8bc9;netifd&#x5982;&#x4f55;&#x6267;&#x884c;&#x534f;&#x8bae;&#x76f8;&#x5173;&#x7684;daemon."/>
</node>
</node>
</node>
<node CREATED="1362800320480" ID="ID_899246861" MODIFIED="1362800332621" TEXT="proto_xxx_teardown"/>
<node CREATED="1362800313727" FOLDED="true" ID="ID_1445187021" LINK="#ID_1763631519" MODIFIED="1362813022645" TEXT="proto_xxx_teardown : &#x6b64;&#x51fd;&#x6570;&#x5728;interface&#x7684;teardown&#x8fc7;&#x7a0b;&#x4e2d;&#x4f1a;&#x88ab;&#x8c03;&#x5230;,&#x89c1;interface_set_down&#xa;&#x5b83;&#x4e3b;&#x8981;&#x662f;&#x542f;&#x52a8;&#x534f;&#x8bae;&#x76f8;&#x5173;&#x7684;daemon(&#x5982;udhcpc,pppd)&#x6765;&#x8fd0;&#x884c;&#x534f;&#x8bae;.">
<node CREATED="1362800313727" ID="ID_1247385994" MODIFIED="1362800934930" TEXT="&#x5728;&#x8fd9;&#x4e2a;&#x51fd;&#x6570;&#x91cc;&#x53ef;&#x4ee5;&#x4f7f;&#x7528;&#x7684;&#x53c2;&#x6570;&#x6709;:&#xa;proto : &#x534f;&#x8bae;&#x540d;&#x79f0;,&#x5982;dhcp,ppp&#xa;cmd : &#x547d;&#x4ee4;,&#x5982;setup,teardown,dump&#xa;interface : &#x5982;network.interface.lan&#xa;data : json&#x683c;&#x5f0f;&#x6570;&#x636e;,&#x4fdd;&#x5b58;&#x4e86;&#x5173;&#x4e8e;&#x6b64;&#x534f;&#x8bae;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;&#xa;ifname : interface&#x7684;main device,&#x5982;eth0.2"/>
<node CREATED="1362800313727" ID="ID_1561327538" MODIFIED="1362800946081" TEXT="&#x8fd9;&#x4e2a;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#x4e3a;:&#xa;$1 : interface,&#x5982;network.interface.lan&#xa;$2 : main device,&#x5982;eth0.2"/>
</node>
</node>
</node>
<node CREATED="1362807709121" FOLDED="true" ID="ID_692627412" MODIFIED="1362814626512" TEXT="dhcp script&#xa;&#x811a;&#x672c;/lib/netifd/dhcp.script&#x5728;udhcpc&#x83b7;&#x53d6;&#x5230;&#x5730;&#x5740;&#x540e;&#x88ab;&#x8c03;&#x7528;&#xa;&#x7528;&#x4e8e;&#x901a;&#x77e5;netifd&#x6240;&#x83b7;&#x53d6;&#x5230;&#x7684;IP&#x76f8;&#x5173;&#x4fe1;&#x606f;">
<node CREATED="1362807856078" FOLDED="true" ID="ID_1009695748" MODIFIED="1362812142502" TEXT="&#x6b64;&#x811a;&#x672c;&#x4e2d;&#x53ef;&#x4ee5;&#x4f7f;&#x7528;&#x7684;&#x73af;&#x5883;&#x53d8;&#x91cf;">
<node CREATED="1362808129530" ID="ID_1628079282" MODIFIED="1362808130490" TEXT="INTERFACE"/>
<node CREATED="1362808004252" ID="ID_1385829817" MODIFIED="1362808008049" TEXT="ip"/>
<node CREATED="1362808017712" ID="ID_998835407" MODIFIED="1362808021270" TEXT="subnet"/>
<node CREATED="1362808031996" ID="ID_1409004054" MODIFIED="1362808035806" TEXT="router"/>
<node CREATED="1362808052096" ID="ID_230934657" MODIFIED="1362808052863" TEXT="staticroutes"/>
<node CREATED="1362808060059" ID="ID_368555475" MODIFIED="1362808060524" TEXT="msstaticroutes"/>
<node CREATED="1362808070161" ID="ID_1811924097" MODIFIED="1362808070355" TEXT="dns"/>
<node CREATED="1362808081613" ID="ID_595318402" MODIFIED="1362808082228" TEXT="domain"/>
<node CREATED="1362808098326" ID="ID_1233368060" MODIFIED="1362808098989" TEXT="ntpsrv"/>
<node CREATED="1362808106387" ID="ID_897470610" MODIFIED="1362808107051" TEXT="timesvr"/>
<node CREATED="1362808113663" ID="ID_1303331338" MODIFIED="1362808114214" TEXT="hostname"/>
<node CREATED="1362808120699" ID="ID_961224336" MODIFIED="1362808121226" TEXT="timezone"/>
</node>
<node CREATED="1362807873616" FOLDED="true" ID="ID_48612743" MODIFIED="1362812147346" TEXT="&#x6b64;&#x811a;&#x672c;&#x7684;&#x53c2;&#x6570;">
<node CREATED="1362807900554" ID="ID_598557447" MODIFIED="1362807902178" TEXT="deconfig"/>
<node CREATED="1362807909882" ID="ID_1650225971" MODIFIED="1362807911362" TEXT="renew"/>
<node CREATED="1362807921626" ID="ID_1925516752" MODIFIED="1362807922254" TEXT="bound"/>
</node>
<node CREATED="1362812177211" ID="ID_521016172" MODIFIED="1362812179875" TEXT="setup_interface">
<node CREATED="1362812199110" FOLDED="true" ID="ID_418091625" MODIFIED="1362813363469" TEXT="&#x51c6;&#x5907;json&#x6570;&#x636e;">
<node CREATED="1362812221820" ID="ID_807697686" MODIFIED="1362812228257" TEXT="action = 0"/>
<node CREATED="1362812247756" ID="ID_1927653370" MODIFIED="1362812292471" TEXT="ifname = *"/>
<node CREATED="1362812260699" ID="ID_822657093" MODIFIED="1362812297011" TEXT="link-up = 1"/>
<node CREATED="1362812272289" ID="ID_473483241" MODIFIED="1362812305099" TEXT="address-external = 0"/>
<node CREATED="1362812383013" ID="ID_341980313" MODIFIED="1362812725810" TEXT="ipaddr = address/mask/broadcast/ptp"/>
<node CREATED="1362812494754" ID="ID_521134281" MODIFIED="1362812738406" TEXT="routes = target/mask/gw"/>
<node CREATED="1362812563167" ID="ID_1717676908" MODIFIED="1362812749936" TEXT="dns = address"/>
<node CREATED="1362812595353" ID="ID_1043141375" MODIFIED="1362812760763" TEXT="dns_search = address"/>
<node CREATED="1362812651367" ID="ID_517742948" MODIFIED="1362812654335" TEXT="keep ="/>
</node>
<node CREATED="1362812798347" ID="ID_1630311788" MODIFIED="1362812799708" TEXT="_proto_notify">
<node CREATED="1362812863117" ID="ID_1003539074" LINK="#ID_1569738856" MODIFIED="1362813378202" TEXT="ubus call network.interface.wan notify_proto &quot;$(json_dump)&quot;&#xa;&#x5c06;udhcpc&#x8fdb;&#x7a0b;&#x83b7;&#x53d6;&#x7684;IP&#x76f8;&#x5173;&#x4fe1;&#x606f;&#x4ee5;json&#x6570;&#x636e;&#x7684;&#x5f62;&#x5f0f;&#x544a;&#x8bc9;netifd"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1362653817704" ID="ID_1875135596" MODIFIED="1371191175181" TEXT="ppp&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362472057555" ID="ID_861468593" MODIFIED="1371191176310" TEXT="struct proto_handler static_proto">
<node CREATED="1362472057555" ID="ID_1526156100" MODIFIED="1362496766164" TEXT=" struct avl_node avl : &#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct avl_tree handlers"/>
<node CREATED="1362472057555" ID="ID_1271795898" MODIFIED="1362472057555" TEXT=" unsigned int flags"/>
<node CREATED="1362472057555" ID="ID_1939062256" MODIFIED="1362653897971" TEXT=" const char *name : &#x534f;&#x8bae;&#x540d;&#x79f0;, ppp"/>
<node CREATED="1362472057555" FOLDED="true" ID="ID_124451918" MODIFIED="1362653917652" TEXT=" const struct config_param_list *config_params&#xa;&#x8be5;&#x534f;&#x8bae;&#x652f;&#x6301;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;">
<node CREATED="1362496835255" FOLDED="true" ID="ID_1367446039" MODIFIED="1362653912339" TEXT="ppp">
<node CREATED="1362536635347" ID="ID_929160572" MODIFIED="1362536637752" TEXT="username"/>
<node CREATED="1362536642262" ID="ID_118258438" MODIFIED="1362536642994" TEXT="password"/>
<node CREATED="1362536648998" ID="ID_217771136" MODIFIED="1362536651028" TEXT="keepalive"/>
<node CREATED="1362536656533" ID="ID_1937566754" MODIFIED="1362536657265" TEXT="demand"/>
<node CREATED="1362536664581" ID="ID_1035257214" MODIFIED="1362536665344" TEXT="pppd_options"/>
<node CREATED="1362536671268" ID="ID_579045305" MODIFIED="1362536672176" TEXT="connect"/>
<node CREATED="1362536677540" ID="ID_1525973133" MODIFIED="1362536678064" TEXT="disconnect"/>
<node CREATED="1362536683651" ID="ID_1418123358" MODIFIED="1362536684591" TEXT="defaultroute"/>
<node CREATED="1362536690899" ID="ID_362798777" MODIFIED="1362536691614" TEXT="peerdns"/>
<node CREATED="1362536697714" ID="ID_722994434" MODIFIED="1362536698638" TEXT="ipv6"/>
<node CREATED="1362536704146" ID="ID_1513673926" MODIFIED="1362536704861" TEXT="mtu"/>
</node>
</node>
<node CREATED="1362472057555" ID="ID_1699757204" MODIFIED="1362653877319" TEXT=" struct interface_proto_state *(*attach)(const struct proto_handler *h, struct interface *iface, struct blob_attr *attr)"/>
</node>
</node>
</node>
</node>
<node CREATED="1362582006916" FOLDED="true" ID="ID_1797330141" MODIFIED="1362802618120" TEXT="&#x521d;&#x59cb;&#x5316;&#x4e4b;&#x524d;&#xa;&#x7a0b;&#x5e8f;&#x4e2d;&#x5e26;&#x6709;&#x5c5e;&#x6027;__attribute__((constructor))&#x7684;&#x51fd;&#x6570;&#x5728;main&#x6267;&#x884c;&#x4e4b;&#x524d;&#x5c31;&#x6267;&#x884c;&#x4e86;">
<node CREATED="1362582153073" FOLDED="true" ID="ID_134774693" MODIFIED="1362802616928" TEXT="proto_shell_init() : &#x6dfb;&#x52a0;&#x7528;shell&#x811a;&#x672c;&#x5b9e;&#x73b0;&#x7684;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362585232895" FOLDED="true" ID="ID_1408264973" MODIFIED="1362754905953" TEXT="&#x626b;&#x63cf;&#x76ee;&#x5f55;/lib/netifd/proto&#x4e0b;&#x7684;&#x6bcf;&#x4e2a;&#x811a;&#x672c;,&#x6267;&#x884c;&quot;xxx.sh &apos;&apos; dump&quot;, &#x5176;&#x4e2d;xxx.sh&#x4e3a;&#x811a;&#x672c;&#x540d;&#x79f0;,&#xa;&#x7136;&#x540e;&#x6839;&#x636e;&#x8fd4;&#x56de;&#x7684;json&#x6570;&#x636e;&#x6dfb;&#x52a0;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;,&#x76ee;&#x524d;&#x6709;dhcp,ppp&#x8fd9;2&#x4e2a;shell&#x811a;&#x672c;&#x5b9e;&#x73b0;&#x7684;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362752776900" ID="ID_650143874" MODIFIED="1362752785553" TEXT="&#x8fd4;&#x56de;&#x7684;json&#x6570;&#x636e;">
<node CREATED="1362754123724" ID="ID_1985962500" MODIFIED="1362754141879" TEXT="dhcp.sh&#x8fd4;&#x56de;&#x7684;json&#x6570;&#x636e;">
<node CREATED="1362754182727" ID="ID_1952057677" MODIFIED="1362754186299" TEXT="name"/>
<node CREATED="1362754159433" ID="ID_1321271575" MODIFIED="1362754160375" TEXT="no-device"/>
<node CREATED="1362754169905" ID="ID_271757657" MODIFIED="1362754170504" TEXT="available"/>
<node CREATED="1362754180555" ID="ID_399758324" MODIFIED="1362754181226" TEXT="config"/>
</node>
</node>
<node CREATED="1362752798597" FOLDED="true" ID="ID_981391478" MODIFIED="1362754826601" TEXT="proto_shell_add_handler">
<node CREATED="1362754322718" ID="ID_1448899598" MODIFIED="1362754376969" TEXT="&#x521d;&#x59cb;&#x5316;&#x57fa;&#x7c7b;struct proto_shell_handler *handler -&gt; proto"/>
<node CREATED="1362754506210" ID="ID_973325965" MODIFIED="1362754581975" TEXT="&#x6839;&#x636e;&#x5b57;&#x6bb5;no-device&#x786e;&#x5b9a;&#x662f;&#x5426;&#x5728;struct proto_shell_handler *handler -&gt; proto.flags&#xa;&#x4e0a;&#x7f6e;&#x4f4d;PROTO_FLAG_NODEV"/>
<node CREATED="1362754506210" ID="ID_1462746439" MODIFIED="1362754616041" TEXT="&#x6839;&#x636e;&#x5b57;&#x6bb5;available&#x786e;&#x5b9a;&#x662f;&#x5426;&#x5728;struct proto_shell_handler *handler -&gt; proto.flags&#xa;&#x4e0a;&#x7f6e;&#x4f4d;PROTO_FLAG_INIT_AVAILABLE"/>
<node CREATED="1362754506210" ID="ID_349415827" MODIFIED="1362754732894" TEXT="&#x6839;&#x636e;&#x5b57;&#x6bb5;config&#x5c06;&#x6b64;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x652f;&#x6301;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;&#x4fdd;&#x5b58;&#x5728;struct proto_shell_handler *handler -&gt; config"/>
<node CREATED="1362754769161" ID="ID_547305119" MODIFIED="1362754801355" TEXT="&#x8c03;&#x7528;add_proto_handler&#x5c06;&#x6b64;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x52a0;&#x5165;&#x5168;&#x5c40;&#x53d8;&#x91cf;handlers"/>
</node>
</node>
</node>
<node CREATED="1362582191532" FOLDED="true" ID="ID_1701461737" MODIFIED="1362585203899" TEXT="static_proto_init()">
<node CREATED="1362584778123" ID="ID_214137804" LINK="#ID_1133311656" MODIFIED="1362585048353" TEXT="&#x6dfb;&#x52a0;static&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;"/>
</node>
<node CREATED="1362582211442" FOLDED="true" ID="ID_327057001" MODIFIED="1362584740797" TEXT="interface_event_init()">
<node CREATED="1362584537498" ID="ID_1574851657" MODIFIED="1362584712283" TEXT="&#x8c03;&#x7528;interface_add_user&#x5728;&#x5168;&#x5c40;&#x53d8;&#x91cf;iface_all_users&#x4e2d;&#x6dfb;&#x52a0;&#x4e00;&#x4e2a;struct interface_user&#x7ed3;&#x6784;,&#xa;iface_all_users&#x4e2d;&#x7684;&#x7528;&#x6237;&#x5c06;&#x5f15;&#x7528;&#x6bcf;&#x4e00;&#x4e2a;&#x5b58;&#x5728;&#x7684;interface."/>
</node>
<node CREATED="1362582225780" ID="ID_889661528" MODIFIED="1362583959194" TEXT="dev_init()&#xa;&#x521d;&#x59cb;&#x5316;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct avl_tree devices,&#xa;devices&#x662f;&#x5b58;&#x653e;&#x6240;&#x6709;device&#x7684;&#x5730;&#x65b9;"/>
<node CREATED="1362582251928" FOLDED="true" ID="ID_476928411" MODIFIED="1362583776389" TEXT="interface_init_list()">
<node CREATED="1362582285798" ID="ID_661889355" LINK="#ID_1831357564" MODIFIED="1362583774270" TEXT="&#x521d;&#x59cb;&#x5316;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct vlist_tree interfaces,&#x8bbe;&#x7f6e;&#x5176;&#x53d8;&#x5316;&#x56de;&#x8c03;&#x51fd;&#x6570;&#x4e3a;interface_update&#xa;interfaces&#x662f;&#x5b58;&#x653e;&#x6240;&#x6709;interface&#x7684;&#x5730;&#x65b9;"/>
<node CREATED="1362582410633" ID="ID_643323582" MODIFIED="1362582496148" TEXT="&#x8bbe;&#x7f6e;interfaces&#x8fd9;&#x68f5;&#x6811;&#x7684;&#x5c5e;&#x6027;&#x4e3a;&#x4e0d;&#x5220;&#x9664;&#x8001;&#x7684;interface&#xa;interfaces.keep_old = true&#xa;interfaces.no_delete = true"/>
</node>
</node>
<node CREATED="1362384270670" ID="ID_932019251" MODIFIED="1362642051549" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1362384289837" ID="ID_632082790" MODIFIED="1362384294200" TEXT="&#x89e3;&#x6790;&#x53c2;&#x6570;"/>
<node CREATED="1362384294765" ID="ID_104646772" MODIFIED="1362384310631" TEXT="&#x6253;&#x5f00;log"/>
<node CREATED="1362384311819" ID="ID_1631796581" MODIFIED="1362384340069" TEXT="&#x521d;&#x59cb;&#x5316;&#x4fe1;&#x53f7;&#x5904;&#x7406;&#x65b9;&#x6cd5;"/>
<node CREATED="1362384402885" FOLDED="true" ID="ID_414398977" MODIFIED="1362577684004" TEXT="netifd_ubus_init">
<node CREATED="1362384960654" ID="ID_336202870" MODIFIED="1362384971433" TEXT="&#x8fde;&#x63a5;&#x5230;ubus daemon"/>
<node CREATED="1362384992539" ID="ID_1357081218" LINK="#ID_588785986" MODIFIED="1362386004606" TEXT="&#x6ce8;&#x518c;ubus object : network"/>
<node CREATED="1362384992539" ID="ID_395747053" LINK="#ID_427662719" MODIFIED="1362386011141" TEXT="&#x6ce8;&#x518c;ubus object : network.device"/>
</node>
<node CREATED="1362387851300" FOLDED="true" ID="ID_886422511" MODIFIED="1362816572670" TEXT="system_init">
<node CREATED="1362387893810" ID="ID_1163718086" MODIFIED="1362816035931">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21019;&#24314;netlink socket
    </p>
  </body>
</html></richcontent>
<node CREATED="1362387964172" ID="ID_690371069" MODIFIED="1362816058504" TEXT="sock_ioctl : &#x63a7;&#x5236;&#x8def;&#x7531;&#x548c;IP"/>
<node CREATED="1362387991595" ID="ID_647681187" MODIFIED="1362816209374">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      rtnl_event : &#25509;&#25910;&#20851;&#20110;&#36335;&#30001;,&#25509;&#21475;,IP&#30340;netlink&#28040;&#24687;
    </p>
    <p>
      cb_rtnl_event
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362387991595" ID="ID_778581530" LINK="#ID_1247644273" MODIFIED="1362816567097">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      hotplug_event : &#25509;&#25910;&#20851;&#20110;hotplug&#30340;netlink&#28040;&#24687;
    </p>
    <p>
      handle_hotplug_event
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362388166734" FOLDED="true" ID="ID_1679068469" MODIFIED="1362818728178" TEXT="config_init_all">
<node CREATED="1362388392334" ID="ID_829484626" MODIFIED="1362388397876" TEXT="&#x52a0;&#x8f7d;uci&#x914d;&#x7f6e;&#x6587;&#x4ef6;/etc/config/network"/>
<node CREATED="1362469507651" ID="ID_296284885" MODIFIED="1362469535356" TEXT="&#x6807;&#x8bb0;&#x6b63;&#x5728;&#x8fdb;&#x884c;&#x914d;&#x7f6e;&#x521d;&#x59cb;&#x5316;(config_init = true)"/>
<node CREATED="1362389067007" ID="ID_127330253" MODIFIED="1362557275017">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      device_reset_config : &#23558;&#27599;&#20010;device&#26631;&#35760;&#20026;
    </p>
    <p>
      &#27809;&#26377;&#20351;&#29992;UCI&#37197;&#32622;(dev-&gt;current_config = false)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362389215109" FOLDED="true" ID="ID_1278299526" MODIFIED="1362653778673">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      config_init_devices
    </p>
    <p>
      &#20026;/etc/config/network&#20013;&#27599;&#19968;&#20010;&#31867;&#22411;&#20026;device&#30340;section
    </p>
    <p>
      &#21019;&#24314;&#19968;&#20010;&#32467;&#26500;&#20307;struct device.&#20849;&#26377;3&#31181;&#31867;&#22411;&#30340;device :
    </p>
    <p>
      type = bridge,
    </p>
    <p>
      type = tunnel,
    </p>
    <p>
      type = ,&#24403;&#27809;&#26377;&#35774;&#32622;type&#36825;&#20010;option&#26102;device&#31867;&#22411;&#20026;simple.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362390623379" FOLDED="true" ID="ID_1615645921" MODIFIED="1362653776909" TEXT="device_create">
<node CREATED="1362393269323" FOLDED="true" ID="ID_10600923" MODIFIED="1362554903772" TEXT="&#x5982;&#x679c;&#x540c;&#x7c7b;&#x578b;&#x4e14;&#x540c;&#x540d;&#x7684;&#x8bbe;&#x5907;&#x5b58;&#x5728;,&#x5219;&#x68c0;&#x67e5;&#x65b0;&#x8001;&#x914d;&#x7f6e;&#x7684;&#x53d8;&#x5316;">
<node CREATED="1362550286190" FOLDED="true" ID="ID_987036764" MODIFIED="1362554716569" TEXT="&#x8c03;&#x7528;device_set_config()&#x5c06;&#x65b0;&#x914d;&#x7f6e;&#x4fdd;&#x5b58;&#x5230;&#x65e7;&#x8bbe;&#x5907;&#x4e2d;">
<node CREATED="1362550454179" ID="ID_995233896" MODIFIED="1362554420826" TEXT="&#x8c03;&#x7528;dev-&gt;type-&gt;reload()&#x9488;&#x5bf9;&#x7279;&#x5b9a;&#x8bbe;&#x5907;&#x7c7b;&#x578b;&#x52a0;&#x8f7d;&#x914d;&#x7f6e;(&#x5373;&#x52a0;&#x8f7d;&#x5c5e;&#x4e8e;&#x5b50;&#x7c7b;&#x7684;&#x914d;&#x7f6e;)"/>
<node CREATED="1362550664500" FOLDED="true" ID="ID_566245439" MODIFIED="1362554694786" TEXT="&#x8c03;&#x7528;device_reload_config()&#x52a0;&#x8f7d;&#x5c5e;&#x4e8e;&#x57fa;&#x7c7b;device&#x7684;&#x914d;&#x7f6e;">
<node CREATED="1362554533126" ID="ID_656407131" MODIFIED="1362554683203" TEXT="&#x5982;&#x679c;device&#x662f;simple&#x7c7b;&#x578b;&#x7684;&#x5b50;&#x7c7b;&#x5219;&#x8c03;&#x7528;device_init_settings&#x5c06;&#x5168;&#x5c40;&#x53d8;&#x91cf;&#xa;struct config_param_list device_attr_list&#x5bf9;&#x5e94;&#x7684;&#x914d;&#x7f6e;&#x4fdd;&#x5b58;&#x5230;dev-&gt;settings&#x4e2d;"/>
</node>
</node>
<node CREATED="1362393336422" ID="ID_284085466" MODIFIED="1362393422258">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#33509;&#37197;&#32622;&#21457;&#29983;&#20102;&#25913;&#21464;,&#21017;&#38656;&#35201;&#37325;&#21551;&#35774;&#22791;,&#36825;&#36890;&#36807;&#20197;&#19979;2&#27493;&#23454;&#29616;
    </p>
    <p>
      device_set_present(odev, false)
    </p>
    <p>
      device_set_present(odev, true)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362393437598" ID="ID_976699463" MODIFIED="1362393459257" TEXT="&#x82e5;&#x914d;&#x7f6e;&#x6ca1;&#x6709;&#x53d8;&#x5316;&#x5219;&#x91ca;&#x653e;&#x65b0;&#x914d;&#x7f6e;"/>
<node CREATED="1362393468957" ID="ID_301169816" MODIFIED="1362393499750" TEXT="&#x82e5;&#x914d;&#x7f6e;&#x53d8;&#x5316;&#x8f83;&#x5927;&#x5bfc;&#x81f4;&#x9700;&#x8981;&#x91cd;&#x65b0;&#x521b;&#x5efa;&#x8bbe;&#x5907;,&#x5219;&#x5148;&#x5220;&#x9664;&#x8001;&#x7684;&#x8bbe;&#x5907;"/>
</node>
<node CREATED="1362393531992" ID="ID_945693072" MODIFIED="1362578102307" TEXT="&#x8c03;&#x7528;dev-&gt;type-&gt;create()&#x51fd;&#x6570;">
<node CREATED="1362453803611" ID="ID_1960425661" LINK="#ID_1857137641" MODIFIED="1362453815818" TEXT="bridge"/>
<node CREATED="1362453829464" ID="ID_918674032" MODIFIED="1362453832212" TEXT="simple"/>
</node>
<node CREATED="1362393559638" ID="ID_330514397" MODIFIED="1362557146042">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      dev-&gt;current_config = true
    </p>
    <p>
      &#34920;&#31034;&#27492;&#35774;&#22791;&#26159;&#26681;&#25454;uci&#37197;&#32622;&#21019;&#24314;&#30340;,&#32780;&#19981;&#26159;&#26681;&#25454;&#40664;&#35748;&#37197;&#32622;&#21019;&#24314;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362393573638" ID="ID_1062859973" LINK="#ID_772003029" MODIFIED="1362466385445">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#37197;&#32622;&#25991;&#20214;&#20013;&#25552;&#21462;&#30340;&#20851;&#20110;&#27492;device&#30340;&#25152;&#26377;&#21407;&#22987;&#37197;&#32622;&#21442;&#25968;&#25918;&#21040;dev-&gt;config
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362393601203" ID="ID_1605241618" MODIFIED="1362393614702" TEXT="&#x8c03;&#x7528;device_replace()&#x5c06;&#x8001;&#x7684;&#x8bbe;&#x5907;&#x66ff;&#x6362;&#x4e3a;&#x65b0;&#x7684;&#x8bbe;&#x5907;"/>
<node CREATED="1362393626802" FOLDED="true" ID="ID_293458819" MODIFIED="1362578285300" TEXT="&#x8c03;&#x7528;dev-&gt;type-&gt;config_init()&#x51fd;&#x6570;">
<node CREATED="1362466594942" ID="ID_441668935" LINK="#ID_753274387" MODIFIED="1362466605349" TEXT="bridge"/>
</node>
</node>
</node>
<node CREATED="1362469468998" FOLDED="true" ID="ID_1055060062" MODIFIED="1362818727336">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      config_init_interfaces
    </p>
    <p>
      &#38024;&#23545;/etc/config/network&#20013;&#27599;&#19968;&#20010;&#31867;&#22411;&#20026;interface&#25110;alias&#30340;section
    </p>
    <p>
      &#35843;&#29992;config_parse_interface
    </p>
  </body>
</html></richcontent>
<node CREATED="1362470250095" FOLDED="true" ID="ID_1277568596" MODIFIED="1362818726744" TEXT="config_parse_interface">
<node CREATED="1362470436994" FOLDED="true" ID="ID_1803400386" MODIFIED="1362730189804">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;section&#30340;type&#23383;&#27573;&#34920;&#26126;&#27492;interface&#20026;bridge&#21017;
    </p>
    <p>
      &#35843;&#29992;config_parse_bridge_interface&#36827;&#34892;&#35299;&#26512;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362470741309" ID="ID_941802655" MODIFIED="1362470841473" TEXT="&#x8bbe;&#x5b9a;device&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;name&#x4e3a;&quot;br-xxx&quot;, &#x5176;&#x4e2d;xxx&#x4e3a;section&#x7684;&#x540d;&#x79f0;"/>
<node CREATED="1362470963213" ID="ID_427965375" MODIFIED="1362471170697">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26681;&#25454;bridge_device_type.config_params&#20174;uci&#20013;&#25552;&#21462;&#37197;&#32622;&#21442;&#25968;
    </p>
    <p>
      uci&#36716;&#25442;&#20986;&#26469;&#30340;&#37197;&#32622;&#21442;&#25968;&#37117;&#20445;&#23384;&#22312;&#20840;&#23616;&#21464;&#37327;struct blob_buf b&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362470889346" ID="ID_1253829405" LINK="#ID_1615645921" MODIFIED="1362470919848" TEXT="&#x8c03;&#x7528;device_create&#x521b;&#x5efa;device"/>
<node CREATED="1362642814070" ID="ID_1953131426" MODIFIED="1362642880954" TEXT="&#x6e05;&#x7a7a;&#x6240;&#x63d0;&#x53d6;&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;,&#x5373;&#x9488;&#x5bf9;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct blob_buf b&#x8c03;&#x7528;"/>
<node CREATED="1362470741309" ID="ID_169840446" MODIFIED="1362470874213" TEXT="&#x8bbe;&#x5b9a;device&#x7684;&#x914d;&#x7f6e;&#x53c2;&#x6570;ifname&#x4e3a;&quot;br-xxx&quot;, &#x5176;&#x4e2d;xxx&#x4e3a;section&#x7684;&#x540d;&#x79f0;">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1362470963213" ID="ID_871274501" MODIFIED="1362471259427">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26681;&#25454;struct config_param_list interface_attr_list&#20174;uci&#20013;&#25552;&#21462;&#37197;&#32622;&#21442;&#25968;
    </p>
    <p>
      uci&#36716;&#25442;&#20986;&#26469;&#30340;&#37197;&#32622;&#21442;&#25968;&#37117;&#20445;&#23384;&#22312;&#20840;&#23616;&#21464;&#37327;struct blob_buf b&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362472772192" ID="ID_1147360440" MODIFIED="1362472785466" TEXT="&#x5206;&#x914d;&#x7ed3;&#x6784;struct interface"/>
<node CREATED="1362472805805" FOLDED="true" ID="ID_1670211112" MODIFIED="1362646012336" TEXT="&#x8c03;&#x7528;interface_init&#x5c06;uci&#x914d;&#x7f6e;&#x8f6c;&#x5316;&#x5230;struct interface&#x4e2d;">
<node CREATED="1362473083737" ID="ID_1538471783" MODIFIED="1362473105683" TEXT="&#x5c06;iface-&gt;name&#x8bbe;&#x7f6e;&#x4e3a;interface section&#x7684;&#x540d;&#x79f0;"/>
<node CREATED="1362473130839" ID="ID_1556935696" MODIFIED="1362473173523">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21021;&#22987;&#21270;&#38142;&#34920;iface-&gt;errors
    </p>
    <p>
      &#21021;&#22987;&#21270;&#38142;&#34920;iface-&gt;users
    </p>
    <p>
      &#21021;&#22987;&#21270;&#38142;&#34920;iface-&gt;hotplug_list
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362473281067" FOLDED="true" ID="ID_1760842967" MODIFIED="1362645797246" TEXT="interface_ip_init">
<node CREATED="1362473539017" FOLDED="true" ID="ID_1069070080" MODIFIED="1362492209936" TEXT="&#x8c03;&#x7528;__interface_ip_init&#x521d;&#x59cb;&#x5316;iface-&gt;proto_ip">
<node CREATED="1362473619940" ID="ID_330936722" MODIFIED="1362473722015">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21363;&#21021;&#22987;&#21270;&#20197;&#19979;&#20960;&#20010;&#21015;&#34920; : dns servers, dns domain, route, ip addr
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362473539017" FOLDED="true" ID="ID_1536236348" MODIFIED="1362473729788" TEXT="&#x8c03;&#x7528;__interface_ip_init&#x521d;&#x59cb;&#x5316;iface-&gt;config_ip">
<node CREATED="1362473619940" ID="ID_385308899" MODIFIED="1362473722015">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21363;&#21021;&#22987;&#21270;&#20197;&#19979;&#20960;&#20010;&#21015;&#34920; : dns servers, dns domain, route, ip addr
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362473588310" ID="ID_160564483" MODIFIED="1362473749292" TEXT="&#x521d;&#x59cb;&#x5316;&#x94fe;&#x8868; : iface-&gt;host_routes"/>
</node>
<node CREATED="1362492449624" ID="ID_109196730" MODIFIED="1362492463820" TEXT="&#x521d;&#x59cb;&#x5316;avl&#x6811;iface-&gt;data"/>
<node CREATED="1362492518025" ID="ID_1188817089" MODIFIED="1362492518316" TEXT="iface-&gt;config_ip.enabled = false"/>
<node CREATED="1362492599342" FOLDED="true" ID="ID_1260834214" MODIFIED="1362561860454" TEXT="&#x5c06;&#x914d;&#x7f6e;&#x53c2;&#x6570;proto&#x6307;&#x5b9a;&#x7684;&#x534f;&#x8bae;&#x52a0;&#x8f7d;&#x5230;&#x6b64;interface&#x4e0a;&#xa;proto_attach_interface()">
<node CREATED="1362537564438" ID="ID_818789602" MODIFIED="1362537590912" TEXT="&#x6839;&#x636e;&#x534f;&#x8bae;&#x540d;&#x79f0;&#x5728;&#x5168;&#x5c40;&#x53d8;&#x91cf;handlers&#x4e2d;&#x67e5;&#x627e;struct proto_handler"/>
<node CREATED="1362537606387" ID="ID_1661802424" LINK="#ID_1986626621" MODIFIED="1362537648088" TEXT="&#x5c06;&#x67e5;&#x627e;&#x5230;&#x7684;&#x7ed3;&#x679c;&#x8d4b;&#x503c;&#x7ed9; iface-&gt;proto_handler = proto"/>
</node>
<node CREATED="1362537688014" ID="ID_643068247" LINK="#ID_1718725503" MODIFIED="1362537884736" TEXT="&#x63d0;&#x53d6;&#x914d;&#x7f6e;&#x53c2;&#x6570;auto&#x5e76;&#x8d4b;&#x503c;&#x7ed9;iface-&gt;autostart"/>
<node CREATED="1362537688014" ID="ID_373132288" MODIFIED="1362538222227" TEXT="&#x63d0;&#x53d6;&#x914d;&#x7f6e;&#x53c2;&#x6570;defaultroute&#x5e76;&#x8d4b;&#x503c;&#x7ed9;iface-&gt;proto_ip.no_defaultroute"/>
<node CREATED="1362537688014" ID="ID_1530899265" MODIFIED="1362538275881" TEXT="&#x63d0;&#x53d6;&#x914d;&#x7f6e;&#x53c2;&#x6570;peerdns&#x5e76;&#x8d4b;&#x503c;&#x7ed9;iface-&gt;proto_ip.no_dns"/>
<node CREATED="1362537688014" ID="ID_476754879" MODIFIED="1362538421334" TEXT="&#x63d0;&#x53d6;&#x914d;&#x7f6e;&#x53c2;&#x6570;dns&#x5c06;&#x5176;&#x4e2d;&#x7684;&#x6bcf;&#x4e2a;dns server&#x6dfb;&#x52a0;&#x5230;iface-&gt;config_ip.dns_servers"/>
<node CREATED="1362537688014" ID="ID_1305320630" MODIFIED="1362538500774" TEXT="&#x63d0;&#x53d6;&#x914d;&#x7f6e;&#x53c2;&#x6570;dns_search&#x5c06;&#x5176;&#x4e2d;&#x7684;&#x6bcf;&#x4e2a;dns domain&#x6dfb;&#x52a0;&#x5230;iface-&gt;config_ip.dns_search"/>
<node CREATED="1362537688014" ID="ID_469901967" MODIFIED="1362538566585" TEXT="&#x63d0;&#x53d6;&#x914d;&#x7f6e;&#x53c2;&#x6570;metric&#x5e76;&#x8d4b;&#x503c;&#x7ed9;iface-&gt;metric"/>
<node CREATED="1362538709782" ID="ID_1740330155" LINK="#ID_913003938" MODIFIED="1362538736092" TEXT="iface-&gt;config_autostart = iface-&gt;autostart"/>
</node>
<node CREATED="1362470963213" ID="ID_1153845058" MODIFIED="1362539850577">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26681;&#25454;iface-&gt;proto_handler-&gt;config_params&#20174;uci&#20013;&#25552;&#21462;&#25152;&#21152;&#36733;&#21327;&#35758;&#29305;&#23450;&#30340;&#37197;&#32622;&#21442;&#25968;
    </p>
    <p>
      uci&#36716;&#25442;&#20986;&#26469;&#30340;&#37197;&#32622;&#21442;&#25968;&#37117;&#20445;&#23384;&#22312;&#20840;&#23616;&#21464;&#37327;struct blob_buf b&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362470963213" ID="ID_1380626705" MODIFIED="1362539977297">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;section&#30340;type&#23383;&#27573;&#34920;&#26126;&#27492;interface&#19981;&#26159;bridge&#21017;
    </p>
    <p>
      &#26681;&#25454;simple_device_type.config_params&#20174;uci&#20013;&#25552;&#21462;&#37197;&#32622;&#21442;&#25968;
    </p>
    <p>
      uci&#36716;&#25442;&#20986;&#26469;&#30340;&#37197;&#32622;&#21442;&#25968;&#37117;&#20445;&#23384;&#22312;&#20840;&#23616;&#21464;&#37327;struct blob_buf b&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362540041417" FOLDED="true" ID="ID_1403729301" MODIFIED="1362672528872">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;interface_add()&#23558;&#25152;&#25552;&#21462;&#30340;&#25152;&#26377;&#37197;&#32622;&#21442;&#25968;&#20445;&#23384;&#21040;iface-&gt;config,
    </p>
    <p>
      &#21516;&#26102;&#23558;interface&#21152;&#20837;&#21040;&#20840;&#23616;avl&#26641;interfaces&#20013;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1362647172358" ID="ID_1857436258" LINK="#ID_1831357564" MODIFIED="1362647294525">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#27880;&#24847;&#21147;: interface&#21152;&#20837;&#21040;&#20840;&#23616;avl&#26641;interfaces&#26102;&#20250;&#35302;&#21457;interface_update&#20989;&#25968;
    </p>
    <p>
      &#20174;&#32780;&#23548;&#33268;interface&#19982;&#23427;&#30340;main device&#21644;L3 device&#20851;&#32852;&#36215;&#26469;.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362549664186" ID="ID_292020519" MODIFIED="1362549819778">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#27492;&#26102;interface&#24050;&#32465;&#23450;&#21040;&#26576;&#20010;device(&#21363;iface-&gt;main_dev.dev&#24050;&#36171;&#20540;),
    </p>
    <p>
      &#21017;&#26681;&#25454;dev-&gt;type-&gt;config_params&#20174;uci&#20013;&#25552;&#21462;&#37197;&#32622;&#21442;&#25968;
    </p>
    <p>
      uci&#36716;&#25442;&#20986;&#26469;&#30340;&#37197;&#32622;&#21442;&#25968;&#37117;&#20445;&#23384;&#22312;&#20840;&#23616;&#21464;&#37327;struct blob_buf b&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362549871035" ID="ID_654511172" LINK="#ID_987036764" MODIFIED="1362550343338">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;device_set_config&#23558;&#25152;&#25552;&#21462;&#30340;&#25152;&#26377;&#37197;&#32622;&#21442;&#25968;&#36716;&#21270;&#21040;&#25152;&#32465;&#23450;&#30340;struct device *dev&#20013;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362469477061" FOLDED="true" ID="ID_171245638" MODIFIED="1362556504588" TEXT="config_init_routes">
<node CREATED="1362555075968" FOLDED="true" ID="ID_5583059" MODIFIED="1362555378995" TEXT="&#x904d;&#x5386;&#x6bcf;&#x4e2a;interface&#x8c03;&#x7528;interface_ip_update_start">
<node CREATED="1362555236692" ID="ID_838024308" MODIFIED="1362555326906" TEXT="&#x9488;&#x5bf9;&#x94fe;&#x8868;iface-&gt;config_ip-&gt;route&#x8c03;&#x7528;vlist_update"/>
<node CREATED="1362555236692" ID="ID_775741100" MODIFIED="1362555340651" TEXT="&#x9488;&#x5bf9;&#x94fe;&#x8868;iface-&gt;config_ip-&gt;addr&#x8c03;&#x7528;vlist_update"/>
</node>
<node CREATED="1362555121917" FOLDED="true" ID="ID_96142379" MODIFIED="1362556502332">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#38024;&#23545;/etc/config/network&#20013;&#27599;&#19968;&#20010;&#31867;&#22411;&#20026;route&#30340;section
    </p>
    <p>
      &#35843;&#29992;config_parse_route
    </p>
  </body>
</html></richcontent>
<node CREATED="1362470963213" ID="ID_67050536" MODIFIED="1362555707126">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26681;&#25454;struct config_param_list route_attr_list&#20174;uci&#20013;&#25552;&#21462;route&#30340;&#37197;&#32622;&#21442;&#25968;
    </p>
    <p>
      uci&#36716;&#25442;&#20986;&#26469;&#30340;&#37197;&#32622;&#21442;&#25968;&#37117;&#20445;&#23384;&#22312;&#20840;&#23616;&#21464;&#37327;struct blob_buf b&#20013;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362555944052" FOLDED="true" ID="ID_1711533802" MODIFIED="1362556483310">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;interface_ip_add_route&#23558;&#36335;&#30001;&#26465;&#30446;&#28155;&#21152;&#21040;
    </p>
    <p>
      iface-&gt;config_ip-&gt;route&#20013;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362555979505" ID="ID_1835625502" MODIFIED="1362556062759" TEXT="&#x6839;&#x636e;&#x8def;&#x7531;&#x6761;&#x76ee;&#x7684;interface&#x5b57;&#x6bb5;&#x627e;&#x51fa;&#x6b64;&#x8def;&#x7531;&#x6240;&#x5c5e;&#x7684;struct interface *iface"/>
<node CREATED="1362556088410" ID="ID_1368357344" MODIFIED="1362556352267">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20998;&#37197;&#32467;&#26500;&#20307;struct device_route *route, &#23558;&#36335;&#30001;&#37197;&#32622;&#21442;&#25968;&#20445;&#23384;&#21040;&#27492;&#32467;&#26500;&#20307;&#20013;
    </p>
    <p>
      &#37197;&#32622;&#21442;&#25968;netmask&#20445;&#23384;&#21040;route -&gt; mask
    </p>
    <p>
      &#37197;&#32622;&#21442;&#25968;target&#20445;&#23384;&#21040;route -&gt; addr
    </p>
    <p>
      &#37197;&#32622;&#21442;&#25968;gateway&#20445;&#23384;&#21040;route -&gt; nexthop
    </p>
    <p>
      &#37197;&#32622;&#21442;&#25968;metric&#20445;&#23384;&#21040;route -&gt; metric
    </p>
    <p>
      &#37197;&#32622;&#21442;&#25968;mtu&#20445;&#23384;&#21040;route -&gt; mtu
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362556378005" ID="ID_742538364" MODIFIED="1362556421022" TEXT="&#x5c06;&#x8def;&#x7531;&#x6761;&#x76ee;struct device_route *route&#x6dfb;&#x52a0;&#x5230;iface-&gt;config_ip-&gt;route"/>
</node>
</node>
<node CREATED="1362555075968" FOLDED="true" ID="ID_1997614713" MODIFIED="1362555377899" TEXT="&#x904d;&#x5386;&#x6bcf;&#x4e2a;interface&#x8c03;&#x7528;interface_ip_update_complete">
<node CREATED="1362555236692" ID="ID_510913259" MODIFIED="1362555366071" TEXT="&#x9488;&#x5bf9;&#x94fe;&#x8868;iface-&gt;config_ip-&gt;route&#x8c03;&#x7528;vlist_flush"/>
<node CREATED="1362555236692" ID="ID_738233742" MODIFIED="1362555371863" TEXT="&#x9488;&#x5bf9;&#x94fe;&#x8868;iface-&gt;config_ip-&gt;addr&#x8c03;&#x7528;vlist_flush"/>
</node>
</node>
<node CREATED="1362469507651" ID="ID_333527996" MODIFIED="1362469580297" TEXT="&#x6807;&#x8bb0;&#x914d;&#x7f6e;&#x521d;&#x59cb;&#x5316;&#x5b8c;&#x6210;(config_init = false)"/>
<node CREATED="1362557787491" FOLDED="true" ID="ID_1750269472" MODIFIED="1362637780069">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      device_reset_old : &#36941;&#21382;&#25152;&#26377;&#35774;&#22791;,&#23558;&#22833;&#21435;uci&#37197;&#32622;&#30340;&#35774;&#22791;&#22238;&#24402;&#21040;&#40664;&#35748;&#37197;&#32622;
    </p>
    <p>
      &#33509;&#35774;&#22791;&#20197;&#21069;&#26377;&#23427;&#30340;uci&#37197;&#32622;&#32780;&#29616;&#22312;&#27809;&#26377;&#20102;,&#21017;&#38656;&#35201;&#26681;&#25454;&#40664;&#35748;&#37197;&#32622;&#37325;&#26032;&#21019;&#24314;&#27492;&#35774;&#22791;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362558018083" ID="ID_1032758554" MODIFIED="1362558221696" TEXT="&#x82e5;device&#x73b0;&#x5728;&#x6709;&#x5b83;&#x7684;uci&#x914d;&#x7f6e;(dev-&gt;current_config == true),&#x5219;&#x65e0;&#x9700;reset"/>
<node CREATED="1362558168632" ID="ID_848800098" MODIFIED="1362558239567" TEXT="&#x82e5;device&#x5df2;&#x7ecf;&#x662f;&#x6839;&#x636e;&#x9ed8;&#x8ba4;&#x914d;&#x7f6e;&#x521b;&#x5efa;&#x7684;(dev-&gt;default_config == true),&#x5219;&#x4e5f;&#x65e0;&#x9700;reset"/>
<node CREATED="1362558273121" ID="ID_1264281491" MODIFIED="1362637779135">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;device_create_default&#26681;&#25454;&#40664;&#35748;&#37197;&#32622;&#21019;&#24314;&#19968;&#20010;device
    </p>
    <p>
      &#27880;&#24847;&#29992;&#40664;&#35748;&#37197;&#32622;&#21019;&#24314;&#30340;device&#23427;&#30340;&#35774;&#22791;&#31867;&#22411;&#23646;&#20110;simple
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362558291327" ID="ID_1218783372" MODIFIED="1362558329369" TEXT="&#x8c03;&#x7528;device_replace&#x7528;&#x65b0;&#x521b;&#x5efa;&#x7684;device&#x66ff;&#x6362;&#x4ee5;&#x524d;&#x8001;&#x7684;device"/>
</node>
<node CREATED="1362560212122" ID="ID_1280620714" MODIFIED="1362560422150">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      device_init_pending : &#33509;&#35774;&#22791;&#21152;&#36733;&#23646;&#20110;&#23376;&#31867;&#30340;&#37197;&#32622;&#30340;&#21160;&#20316;&#34987;&#24310;&#36831;&#20102;(dev-&gt;config_pending == true),
    </p>
    <p>
      &#21017;&#22312;&#36825;&#37324;&#35843;&#29992;dev-&gt;type-&gt;config_init&#32487;&#32493;&#21152;&#36733;&#23646;&#20110;&#23376;&#31867;&#30340;&#37197;&#32622;,&#23436;&#25104;&#21518;&#35774;&#32622;dev-&gt;config_pending = false
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362560492358" FOLDED="true" ID="ID_397386158" MODIFIED="1362560683817" TEXT="&#x8c03;&#x7528;device_free_unused&#x5220;&#x9664;&#x4e0d;&#x518d;&#x88ab;&#x4f7f;&#x7528;&#x7684;&#x8bbe;&#x5907;">
<node CREATED="1362560515973" ID="ID_1706139260" MODIFIED="1362560681596">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20197;&#19979;2&#20010;&#26465;&#20214;&#37117;&#34987;&#28385;&#36275;&#30340;&#35774;&#22791;&#34987;&#26631;&#35760;&#20026;&#19981;&#20877;&#34987;&#20351;&#29992; :
    </p>
    <p>
      dev-&gt;users&#20026;&#31354;, &#21363;&#27809;&#26377;&#29992;&#25143;&#24341;&#29992;&#27492;&#35774;&#22791;
    </p>
    <p>
      dev-&gt;current_config = false, &#21363;uci&#37197;&#32622;&#20013;&#27809;&#26377;&#20851;&#20110;&#35774;&#22791;&#30340;&#37197;&#32622;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362560876188" ID="ID_347815300" MODIFIED="1362560889238" TEXT="&#x8c03;&#x7528;vlist_flush(&amp;interfaces)&#x5237;&#x65b0;&#x6240;&#x6709;interface"/>
<node CREATED="1362561088796" ID="ID_245112385" LINK="#ID_1763631519" MODIFIED="1362712358403">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;interface_start_pending&#24320;&#22987;&#30495;&#27491;bring up L3 interface
    </p>
    <p>
      &#24403;&#19968;&#20010;interface&#21464;&#20026;available(dev-&gt;available == true)&#19988;
    </p>
    <p>
      &#34987;&#37197;&#32622;&#20026;&#33258;&#21160;bring up(dev-&gt;autostart == true)&#21017;&#22312;&#27492;&#22788;
    </p>
    <p>
      bring up&#23427;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362388208299" ID="ID_923528461" MODIFIED="1362388216871" TEXT="uloop_run : &#x4e3b;&#x5faa;&#x73af;"/>
<node CREATED="1362388228090" ID="ID_1407401971" MODIFIED="1362388242868" TEXT="&#x6e05;&#x9664;&#x5e76;&#x9000;&#x51fa;netifd"/>
</node>
<node CREATED="1362453696738" ID="ID_603184996" MODIFIED="1362453740715" TEXT="ubus&#x8c03;&#x7528;&#x5904;&#x7406;">
<node CREATED="1362802654937" FOLDED="true" ID="ID_585994468" MODIFIED="1362819044633" TEXT="network.interface.xxx&#xa;&#x5176;&#x4e2d;xxx&#x4e3a;&#x5177;&#x4f53;&#x7684;interface&#x7684;&#x540d;&#x79f0;">
<node CREATED="1362817130813" ID="ID_1622372154" MODIFIED="1362817144376" TEXT="up : netifd_handle_up">
<node CREATED="1362817310072" ID="ID_445814737" LINK="#ID_1763631519" MODIFIED="1362817423929" TEXT="bring up L3 interface, &#x8fd9;&#x5c06;&#x5bfc;&#x81f4;&#x8fd9;&#x4e2a;interface&#x4e0a;IP&#x76f8;&#x5173;&#x7684;&#x914d;&#x7f6e;&#x88ab;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x53bb;&#xa;interface_set_up"/>
</node>
<node CREATED="1362817154532" ID="ID_875857042" MODIFIED="1362817158242" TEXT="down : netifd_handle_down">
<node CREATED="1362817443112" ID="ID_1873142871" MODIFIED="1362817479004" TEXT="bring down L3 interface, &#x8fd9;&#x5c06;&#x5bfc;&#x81f4;&#x8fd9;&#x4e2a;interface&#x4e0a;IP&#x76f8;&#x5173;&#x7684;&#x914d;&#x7f6e;&#x4ece;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x6e05;&#x9664;&#xa;interface_set_down"/>
</node>
<node CREATED="1362817167100" ID="ID_1003593640" MODIFIED="1362817171014" TEXT="status : netifd_handle_status">
<node CREATED="1362817502677" ID="ID_200863622" MODIFIED="1362817526282" TEXT="&#x8fd4;&#x56de;json&#x6570;&#x636e;&#x4ee5;&#x663e;&#x793a;&#x8fd9;&#x4e2a;interface&#x7684;&#x72b6;&#x6001;&#x4fe1;&#x606f;"/>
</node>
<node CREATED="1362817181235" ID="ID_1499921377" MODIFIED="1362817193388" TEXT="prepare : netifd_handle_iface_prepare"/>
<node CREATED="1362817201566" ID="ID_1941885767" MODIFIED="1362817213501" TEXT="add_device : netifd_iface_handle_device">
<node CREATED="1362817950494" FOLDED="true" ID="ID_1067817783" MODIFIED="1362818970584" TEXT="&#x624b;&#x52a8;&#x6dfb;&#x52a0;&#x4e00;&#x4e2a;device,&#x5e76;&#x5c06;interface&#x7684;main device&#x8bbe;&#x4e3a;&#x6b64;device, &#x6b64;&#x5373;hotplug.&#xa;&#x624b;&#x52a8;&#x6dfb;&#x52a0;&#x7684;device&#x603b;&#x662f;&#x8ba4;&#x4e3a;&#x5b83;&#x5df2;&#x7ecf;&#x51c6;&#x5907;&#x5c31;&#x7eea;,&#x7acb;&#x5373;&#x53ef;&#x4ee5;&#x4f7f;&#x7528;(dev-&gt;present = true)">
<node CREATED="1362818242985" ID="ID_240570598" MODIFIED="1362818297094" TEXT="&#x8c03;&#x7528;device_get()&#x6dfb;&#x52a0;device, &#x5176;&#x4e2d;dev-&gt;external = true&#x8868;&#x660e;&#x6b64;device&#x662f;&#x5916;&#x90e8;&#x624b;&#x52a8;&#x521b;&#x5efa;&#x7684;"/>
<node CREATED="1362818316969" ID="ID_719672637" MODIFIED="1362818327706" TEXT="device_set_present(dev, true), &#x8bbe;&#x7f6e;&#x6b64;device&#x4e3a;present"/>
<node CREATED="1362818358728" ID="ID_232189059" MODIFIED="1362818449570" TEXT="&#x4ece;interface&#x7684;&#x539f;&#x59cb;&#x914d;&#x7f6e;(iface-&gt;config)&#x4e2d;&#x63d0;&#x53d6;&#x5173;&#x4e8e;&#x6b64;device&#x7684;&#x914d;&#x7f6e;,&#x5e76;&#x4fdd;&#x5b58;&#x5230;dev-&gt;settings"/>
<node CREATED="1362818459599" ID="ID_1349763735" MODIFIED="1362818488890" TEXT="&#x8c03;&#x7528;system_if_apply_settings()&#x5c06;device&#x7684;&#x914d;&#x7f6e;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x53bb;"/>
<node CREATED="1362818504671" ID="ID_1753368097" MODIFIED="1362818524710" TEXT="&#x8c03;&#x7528;interface_add_link&#x5207;&#x6362;interface&#x7684;main device">
<node CREATED="1362818546449" ID="ID_1853640170" MODIFIED="1362818583076" TEXT="interface_set_main_dev(iface, dev)&#xa;&#x5c06;interface&#x7684;main device&#x8bbe;&#x7f6e;&#x4e3a;&#x624b;&#x52a8;&#x521b;&#x5efa;&#x7684;device"/>
<node CREATED="1362818594134" ID="ID_675299917" MODIFIED="1362818643823" TEXT="&#x8bbe;&#x7f6e;iface-&gt;main_dev.hotplug = true,&#x8868;&#x660e;main device&#x662f;&#x70ed;&#x63d2;&#x62d4;(hotplug)&#x8fdb;&#x6765;&#x7684;"/>
</node>
</node>
</node>
<node CREATED="1362817222543" ID="ID_773536770" MODIFIED="1362817235866" TEXT="remove_device : netifd_iface_handle_device"/>
<node CREATED="1362802716780" FOLDED="true" ID="ID_82713448" MODIFIED="1362818977600" TEXT="notify_proto : &#x7531;&#x811a;&#x672c;/lib/netifd/proto/xxx.sh&#x901a;&#x77e5;netifd.&#xa;netifd_iface_notify_proto&#x8c03;&#x7528;iface-&gt;proto-&gt;notify">
<node CREATED="1362802920117" ID="ID_1153052532" MODIFIED="1362802921605" TEXT="proto_shell_notify">
<node CREATED="1362803050948" ID="ID_1569738856" MODIFIED="1362803084991" TEXT="action = 0 : proto_shell_update_link">
<node CREATED="1362813418459" ID="ID_607853052" LINK="#ID_375831146" MODIFIED="1362813706962" TEXT="&#x6839;&#x636e;ifname&#x627e;&#x5230;&#x5bf9;&#x5e94;&#x7684;device, &#x5982;&#x679c;&#x6ca1;&#x6709;&#x5219;&#x521b;&#x5efa;&#x5b83;(device_get)&#xa;&#x8fd9;&#x4e2a;device&#x5b9e;&#x9645;&#x4e0a;&#x5c31;&#x662f;interface&#x7684;L3 device"/>
<node CREATED="1362813529068" ID="ID_143896775" MODIFIED="1362813559345" TEXT="&#x8c03;&#x7528;interface_set_l3_dev(iface, dev)&#x5c06;&#x4e0a;&#x9762;&#x627e;&#x5230;&#x7684;device&#x8bbe;&#x7f6e;&#x4e3a;interface&#x7684;L3 device"/>
<node CREATED="1362813578257" ID="ID_1134078070" LINK="#ID_589534618" MODIFIED="1362813670101" TEXT="&#x8c03;&#x7528;device_claim(&amp;iface-&gt;l3_dev)&#x5c06;L3 device&#x7684;&#x62d3;&#x6251;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x53bb;"/>
<node CREATED="1362813774826" ID="ID_1962195385" LINK="#ID_1130437230" MODIFIED="1362813901930" TEXT="&#x5c06;L3 device&#x53d8;&#x4e3a;present(device_set_present(dev, true))&#xa;&#x8fd9;&#x5c06;&#x5bfc;&#x81f4;&#x57fa;&#x4e8e;&#x6b64;device&#x7684;interface&#x53d8;&#x4e3a;available.&#x4ece;&#x800c;bring up interface"/>
<node CREATED="1362814083123" ID="ID_129743327" MODIFIED="1362814313900" TEXT="&#x5c06;&#x7b49;ip address,gateway,route,dns,dns domain&#x76f8;&#x5173;IP&#x914d;&#x7f6e;&#x4ece;json&#x6570;&#x636e;&#x4e2d;&#x4fdd;&#x5b58;&#x5230;iface-&gt;proto_ip&#x4e2d;&#xa;&#x6ce8;&#x610f;&#x8fd9;&#x5bfc;&#x81f4;iface-&gt;proto_ip-&gt;addr&#x7684;&#x53d8;&#x52a8;,&#x4ece;&#x800c;&#x89e6;&#x53d1;&#x51fd;&#x6570;interface_update_proto_addr"/>
<node CREATED="1362814381003" ID="ID_90398015" MODIFIED="1362814413132" TEXT="&#x8c03;&#x7528;struct proto_shell_state *state -&gt; proto.proto_event">
<node CREATED="1362814538590" ID="ID_860655087" LINK="#ID_429210477" MODIFIED="1362814553372" TEXT="interface_proto_cb"/>
</node>
</node>
<node CREATED="1362803050948" ID="ID_1179837123" MODIFIED="1362803153957" TEXT="action = 1 : proto_shell_run_command">
<node CREATED="1362803273705" ID="ID_983256444" MODIFIED="1362803378999" TEXT="&#x7528;&#x4e0a;&#x4e0b;&#x6587;struct proto_shell_state *state -&gt; proto_task&#x542f;&#x52a8;&#x5b50;&#x8fdb;&#x7a0b;&#xa;&#x6765;&#x8fd0;&#x884c;shell&#x811a;&#x672c;&#x4f20;&#x8fc7;&#x6765;&#x7684;command"/>
</node>
<node CREATED="1362803050948" ID="ID_1461131662" MODIFIED="1362803167338" TEXT="action = 2 : proto_shell_kill_command"/>
<node CREATED="1362803050948" ID="ID_1425268834" MODIFIED="1362803180138" TEXT="action = 3 : proto_shell_notify_error"/>
<node CREATED="1362803050948" ID="ID_77599932" MODIFIED="1362803193142" TEXT="action = 4 : proto_shell_block_restart"/>
<node CREATED="1362803050948" ID="ID_1637173354" MODIFIED="1362803204010" TEXT="action = 5 : proto_shell_set_available"/>
<node CREATED="1362803050948" ID="ID_877885855" MODIFIED="1362803216351" TEXT="action = 6 : proto_shell_add_host_dependency"/>
<node CREATED="1362803050948" ID="ID_675977218" MODIFIED="1362803228250" TEXT="action = 7 : proto_shell_setup_failed"/>
</node>
</node>
<node CREATED="1362817258049" ID="ID_1362537892" MODIFIED="1362817270698" TEXT="remove : netifd_iface_remove"/>
<node CREATED="1362817278411" ID="ID_183691623" MODIFIED="1362817292535" TEXT="set_data : netifd_handle_set_data"/>
</node>
</node>
<node CREATED="1362453707169" ID="ID_1807070101" MODIFIED="1362453734635" TEXT="hotplug&#x6d88;&#x606f;&#x5904;&#x7406;">
<node CREATED="1362387991595" FOLDED="true" ID="ID_1247644273" MODIFIED="1362816576063">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      system_init&#20013;&#21019;&#24314;&#30340;hotplug_event&#29992;&#20110;&#25509;&#25910;&#20851;&#20110;hotplug&#30340;netlink&#28040;&#24687;
    </p>
    <p>
      &#23427;&#30340;&#22238;&#35843;&#20989;&#25968;&#20026; : handle_hotplug_event
    </p>
  </body>
</html></richcontent>
<node CREATED="1362816318436" ID="ID_744162968" MODIFIED="1362816320117" TEXT="handle_hotplug_msg">
<node CREATED="1362816367531" ID="ID_1756036590" MODIFIED="1362816466391" TEXT="&#x8c03;&#x7528;device_set_present(dev, add)&#x8bbe;&#x7f6e;&#x6216;&#x6e05;&#x9664;device&#x7684;present&#x72b6;&#x6001;&#xa;&#x8fd9;&#x5c06;&#x5f15;&#x53d1;&#x4e00;&#x7cfb;&#x5217;&#x8fde;&#x9501;&#x53cd;&#x5e94; : &#x5f15;&#x53d1;interface&#x7684;available, &#x4ece;&#x800c;&#x5f15;&#x53d1;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;"/>
</node>
</node>
</node>
<node CREATED="1362453714017" ID="ID_163120555" MODIFIED="1362453726348" TEXT="netlink&#x6d88;&#x606f;&#x5904;&#x7406;"/>
<node CREATED="1362549503877" ID="ID_1023852756" MODIFIED="1362579869704" TEXT="vlist_tree&#x66f4;&#x65b0;">
<node CREATED="1362579857160" FOLDED="true" ID="ID_1254276464" MODIFIED="1371193232003" TEXT="&#x521d;&#x59cb;&#x5316;vlist_tree&#x65f6;&#x4f1a;&#x6ce8;&#x518c;&#x4e00;&#x4e2a;&#x56de;&#x8c03;&#x51fd;&#x6570;,&#xa;&#x5f53;&#x5411;vlist_tree&#x4e2d;&#x6dfb;&#x52a0;&#x6216;&#x5220;&#x9664;&#x8282;&#x70b9;&#x65f6;&#x90fd;&#x4f1a;&#x8c03;&#x7528;&#x6b64;&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1362580831817" ID="ID_1466216060" MODIFIED="1362728814909" TEXT="&#x5f53;struct vlist_tree interfaces&#x6709;&#x53d8;&#x5316;(add/del)&#x65f6;">
<node CREATED="1362580877355" ID="ID_1831357564" MODIFIED="1371193223210" TEXT="interface_update">
<node CREATED="1362581008329" FOLDED="true" ID="ID_1558106822" MODIFIED="1362623482531" TEXT="&#x82e5;&#x662f;&#x65b0;&#x7684;interface&#x66ff;&#x6362;&#x8001;&#x7684;interface">
<node CREATED="1362581150791" ID="ID_1607184423" MODIFIED="1362581152528" TEXT="interface_change_config"/>
</node>
<node CREATED="1362581081613" ID="ID_1991497102" MODIFIED="1362728529110" TEXT="&#x82e5;&#x662f;&#x521b;&#x5efa;&#x65b0;&#x7684;interface">
<node CREATED="1362581362556" FOLDED="true" ID="ID_920411549" MODIFIED="1362727085035">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      proto_init_interface
    </p>
    <p>
      &#21019;&#24314;&#24182;&#21021;&#22987;&#21270;&#25152;&#21152;&#36733;&#21327;&#35758;&#22788;&#29702;&#22120;&#30340;&#21327;&#35758;&#29366;&#24577;(iface-&gt;proto)
    </p>
  </body>
</html></richcontent>
<node CREATED="1362581368022" ID="ID_1648175541" MODIFIED="1362581620604" TEXT="&#x8c03;&#x7528;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x7684;iface-&gt;proto_handler-&gt;attach()&#x51fd;&#x6570;&#xa;&#x6b64;attach&#x51fd;&#x6570;&#x5e94;&#x8be5;&#x8fd4;&#x56de;&#x4e00;&#x4e2a;struct interface_proto_state&#x7ed3;&#x6784;&#xa;&#x5b83;&#x8868;&#x793a;interface&#x4e0e;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x7684;&#x901a;&#x4fe1;&#x63a5;&#x53e3;"/>
<node CREATED="1362581650020" FOLDED="true" ID="ID_918848189" MODIFIED="1362727083665" TEXT="&#x8c03;&#x7528;interface_set_proto_state&#x5c06;iface-&gt;proto&#x8bbe;&#x7f6e;&#x4e3a;&#xa;&#x4e0a;&#x9762;&#x8fd4;&#x56de;&#x7684;struct interface_proto_state&#x7ed3;&#x6784;">
<node CREATED="1362581778093" ID="ID_1312079780" MODIFIED="1362581808553" TEXT="&#x6807;&#x8bb0;interface&#x5f53;&#x524d;&#x72b6;&#x6001;&#x4e3a;down (iface-&gt;state = IFS_DOWN)"/>
<node CREATED="1362581830307" ID="ID_332968402" MODIFIED="1362581855570" TEXT="&#x5c06;iface-&gt;proto&#x8bbe;&#x7f6e;&#x4e3a;attach()&#x8fd4;&#x56de;&#x7684;struct interface_proto_state&#x7ed3;&#x6784;"/>
<node CREATED="1362623826963" ID="ID_1808406733" LINK="#ID_429210477" MODIFIED="1362623912686">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;struct interface_proto_state *state-&gt;proto_event = interface_proto_cb
    </p>
    <p>
      &#27492;&#20989;&#25968;&#29992;&#20110;&#20174;interface&#21521;&#21327;&#35758;&#22788;&#29702;&#22120;&#21457;&#36865;&#20107;&#20214;&#28040;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362626367761" ID="ID_1733471277" MODIFIED="1362728818610" TEXT="interface_claim_device">
<node CREATED="1362626543253" ID="ID_129918556" MODIFIED="1362626786304">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#37325;&#26032;&#24341;&#29992;parent interface
    </p>
    <p>
      parent interface&#30001;iface-&gt;parent_ifname&#21807;&#19968;&#30830;&#23450;,&#36825;&#20010;&#20540;&#21487;&#33021;&#22312;&#37197;&#32622;&#36807;&#31243;&#20013;&#21457;&#29983;&#21464;&#21270;,
    </p>
    <p>
      &#22240;&#27492;&#38656;&#35201;&#20808;&#35299;&#38500;&#23545;&#32769;&#30340;parent interface&#30340;&#24341;&#29992;,&#20877;&#26681;&#25454;iface-&gt;parent_ifname&#25214;&#21040;
    </p>
    <p>
      parent interface,&#20877;&#23545;&#20854;&#21152;&#20197;&#24341;&#29992;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362635252389" ID="ID_1756107758" LINK="#ID_169840446" MODIFIED="1362730158414">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26681;&#25454;interface&#30340;ifname&#25214;&#21040;&#30456;&#24212;&#30340;device,&#22914;&#26524;&#27809;&#26377;&#21017;&#21019;&#24314;&#23427;
    </p>
    <p>
      &#27880;&#24847;: &#31867;&#22411;&#20026;bridge&#30340;interface&#30340;ifname&#22312;interface&#21019;&#24314;&#36807;&#31243;&#20013;
    </p>
    <p>
      &#24050;&#34987;&#20462;&#25913;&#20026;br-xxx,&#20854;&#20013;xxx&#20026;section&#21517;&#31216;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362635334001" FOLDED="true" ID="ID_375831146" MODIFIED="1362738793490" TEXT="device_get">
<node CREATED="1362635879242" FOLDED="true" ID="ID_388800529" MODIFIED="1362738784978">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;device&#21517;&#31216;&#20869;&#21547;&#26377;&#31526;&#21495;'.',&#21017;&#34920;&#26126;&#35201;&#26597;&#25214;&#25110;&#21019;&#24314;&#30340;&#26159;&#24102;vlan&#30340;device
    </p>
    <p>
      &#27492;&#26102;&#24212;&#35843;&#29992;get_vlan_device_chain&#26469;&#26597;&#25214;&#25110;&#21019;&#24314;device
    </p>
  </body>
</html></richcontent>
<node CREATED="1362638181545" ID="ID_931725484" MODIFIED="1362638896274">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20026;&#20102;&#25903;&#25345;&#22810;&#23618;vlan&#26631;&#31614;,&#36825;&#37324;device&#30340;name&#30340;&#26684;&#24335;&#20026;eth0.outmost_vlan.middle_vlan.innermost_vlan
    </p>
    <p>
      &#27604;&#22914;eth0.10.100&#23558;&#21019;&#24314;3&#20010;device:eth0, eth0.10, eth0.10.100.&#36825;&#26679;&#19968;&#20010;&#24102;2&#20010;vlan&#26631;&#31614;
    </p>
    <p>
      (out=10,inner=100)&#30340;&#21253;&#36827;&#20837;eth0&#21518;&#20808;&#25237;&#36882;&#21040;eth0.10&#36825;&#20250;&#23548;&#33268;&#26368;&#22806;&#23618;vlan&#26631;&#31614;10&#34987;&#21093;&#25481;,
    </p>
    <p>
      &#21097;&#19979;vlan&#26631;&#31614;100,&#36825;&#26102;&#36825;&#20010;&#21253;&#20877;&#34987;&#25237;&#36882;&#21040;eth0.10.100&#36825;&#20250;&#23548;&#33268;&#37324;&#23618;vlan&#26631;&#31614;1&#24055;0&#20063;&#34987;&#21093;&#25481;.
    </p>
    <p>
      &#20197;&#27492;&#31867;&#25512;,&#29992;&#36825;&#31181;&#26041;&#24335;&#25903;&#25345;&#22810;&#23618;vlan&#26631;&#31614;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362640436588" ID="ID_354531887" LINK="#ID_375831146" MODIFIED="1362640532701" TEXT="&#x8c03;&#x7528;device_get&#x521b;&#x5efa;&#x5e95;&#x5c42;device, &#x5982;eth0"/>
<node CREATED="1362640487768" FOLDED="true" ID="ID_548499302" MODIFIED="1362738769638" TEXT="&#x8c03;&#x7528;get_vlan_device&#x521b;&#x5efa;&#x4e0a;&#x5c42;&#x5e26;vlan&#x7684;device, &#x5982;eth0.1">
<node CREATED="1362640626494" ID="ID_525267640" MODIFIED="1362640790197">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#30456;&#24212;vlan&#30340;device&#24050;&#32463;&#23384;&#22312;&#21017;&#30452;&#25509;&#36820;&#22238;
    </p>
    <p>
      &#26597;&#35810;&#24213;&#23618;device-&gt;users&#21487;&#20197;&#30693;&#36947;&#30456;&#24212;vlan&#30340;&#19978;&#23618;device&#26159;&#21542;&#24050;&#32463;&#23384;&#22312;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362640869118" ID="ID_650897469" MODIFIED="1362640898091" TEXT="&#x5206;&#x914d;struct vlan_device&#x7ed3;&#x6784;">
<node CREATED="1362640906283" FOLDED="true" ID="ID_1976138157" MODIFIED="1362738336250">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct vlan_device : &#32487;&#25215;&#20110;struct device
    </p>
  </body>
</html></richcontent>
<node CREATED="1362640916922" ID="ID_62168827" MODIFIED="1362641478959" TEXT="struct device dev : &#x57fa;&#x7c7b;"/>
<node CREATED="1362640941448" ID="ID_1126432289" MODIFIED="1362641115576" TEXT="struct device_user dep : &#x7528;&#x4e8e;&#x5f15;&#x7528;&#x5e95;&#x5c42;device"/>
<node CREATED="1362640950584" ID="ID_1511373302" MODIFIED="1362640951475" TEXT="device_state_cb set_state"/>
<node CREATED="1362640960343" ID="ID_1912698032" MODIFIED="1362641133079" TEXT="int id : vlan"/>
</node>
</node>
<node CREATED="1362641137899" ID="ID_816752798" MODIFIED="1362641645482">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21021;&#22987;&#21270;&#22522;&#31867;, &#21363;struct vlan_device -&gt; dev
    </p>
    <p>
      &#36825;&#30456;&#24403;&#20110;&#29992;&#40664;&#35748;&#37197;&#32622;&#21019;&#24314;&#20102;&#22522;&#31867;struct vlan_device -&gt; dev
    </p>
    <p>
      &#36825;&#37324;&#22522;&#31867;&#30340;&#21517;&#31216;(struct vlan_device -&gt; dev -&gt; ifname)&#20026;eth0.10
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362641663638" ID="ID_1235280093" MODIFIED="1362738765972" TEXT="&#x7528;struct vlan_device -&gt; dep&#x5f15;&#x7528;&#x5e95;&#x5c42;device">
<node CREATED="1362738360701" FOLDED="true" ID="ID_714258652" MODIFIED="1362738763094" TEXT="vldev-&gt;dep.cb = vlan_dev_cb&#xa;&#x5f53;vlan device&#x6240;&#x57fa;&#x4e8e;&#x7684;&#x5e95;&#x5c42;device&#x53d8;&#x4e3a;present&#x65f6;&#x5c06;&#x8c03;&#x7528;&#x8fd9;&#x4e2a;&#x56de;&#x8c03;&#x51fd;&#x6570;&#xa;&#x5b83;&#x5c06;&#x8bbe;&#x7f6e;vlan device&#x7684;present&#x4e3a;true">
<node CREATED="1362738537629" ID="ID_1296897282" MODIFIED="1362738590160" TEXT="&#x8bbe;&#x7f6e;vlan device&#x7684;present&#x4e3a;&#x5e95;&#x5c42;device&#x7684;present"/>
</node>
</node>
<node CREATED="1362641775966" ID="ID_695507169" MODIFIED="1362641899736">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36820;&#22238;&#22522;&#31867;struct vlan_device -&gt; dev
    </p>
    <p>
      &#36825;&#37324;&#36816;&#29992;&#20102;&#38754;&#21521;&#23545;&#35937;&#30340;&#22810;&#24577;&#26426;&#21046; : &#32487;&#25215;&#33258;&#30456;&#21516;&#29238;&#31867;&#30340;&#21508;&#23376;&#31867;&#21487;&#20197;&#34987;&#32479;&#19968;&#30475;&#20316;&#26159;&#29238;&#31867;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1362635879242" ID="ID_970329479" MODIFIED="1362636094701">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;device&#21517;&#31216;&#20869;&#21547;&#26377;&#31526;&#21495;'@',&#21017;&#34920;&#26126;&#35201;&#26597;&#25214;&#25110;&#21019;&#24314;&#30340;device&#21035;&#21517;
    </p>
    <p>
      &#27492;&#26102;&#24212;&#35843;&#29992;device_alias_get&#26469;&#26597;&#25214;&#25110;&#21019;&#24314;device
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362636127528" FOLDED="true" ID="ID_1008884480" MODIFIED="1362738789540" TEXT="&#x5982;&#x679c;&#x65e2;&#x4e0d;&#x5e26;vlan&#x4e5f;&#x4e0d;&#x662f;&#x522b;&#x540d;&#x5219;&#x76f4;&#x63a5;&#x5728;avl&#x6811;devices&#x4e2d;&#x67e5;&#x627e;">
<node CREATED="1362636229058" ID="ID_1273471914" MODIFIED="1362637412338">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#25214;&#21040;&#20102;device&#21017;&#36820;&#22238;&#27492;device,
    </p>
    <p>
      &#21516;&#26102;&#22914;&#26524;&#27492;device&#20197;&#21069;&#22312;&#25805;&#20316;&#31995;&#32479;&#19981;&#23384;&#22312;&#32780;&#29616;&#22312;&#23384;&#22312;&#20102;&#21017;&#26356;&#26032;device-&gt;external
    </p>
    <p>
      &#20043;&#21518;&#35843;&#29992;device_set_present&#23558;device&#26631;&#35760;&#20026;&#22312;&#25805;&#20316;&#31995;&#32479;&#20013;&#24050;&#23384;&#22312;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362637577924" ID="ID_450936097" MODIFIED="1362637754929">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#19981;&#23384;&#22312;&#21017;&#35843;&#29992;device_create_default()&#29992;&#40664;&#35748;&#37197;&#32622;&#21019;&#24314;&#19968;&#20010;device&#20877;&#36820;&#22238;
    </p>
    <p>
      &#27880;&#24847;&#29992;&#40664;&#35748;&#37197;&#32622;&#21019;&#24314;&#30340;device&#23427;&#30340;&#35774;&#22791;&#31867;&#22411;&#23646;&#20110;simple
    </p>
  </body>
</html></richcontent>
<node CREATED="1362732867789" FOLDED="true" ID="ID_184689160" MODIFIED="1362736451095" TEXT="device_create_default">
<node CREATED="1362732830999" ID="ID_139345296" MODIFIED="1362732841914" TEXT="&#x5206;&#x914d;struct device *dev&#x7ed3;&#x6784;"/>
<node CREATED="1362732852901" ID="ID_1840077105" MODIFIED="1362732853796" TEXT="dev-&gt;external = external"/>
<node CREATED="1362732894100" ID="ID_1439718593" LINK="#ID_1531825638" MODIFIED="1362733091857" TEXT="&#x8bbe;&#x7f6e;&#x7528;&#x4e8e;&#x5177;&#x4f53;&#x521b;&#x5efa;L2 device&#x7684;&#x51fd;&#x6570;(dev-&gt;set_state = simple_device_set_state)"/>
<node CREATED="1362733139387" ID="ID_1774589793" MODIFIED="1362733141125" TEXT="device_init">
<node CREATED="1362451103942" FOLDED="true" ID="ID_930230979" MODIFIED="1362733453102" TEXT="device_init_virtual">
<node CREATED="1362451117318" ID="ID_253147411" MODIFIED="1362451140800" TEXT="&#x521d;&#x59cb;&#x5316;&#x8bbe;&#x5907;&#x540d;&#x79f0;dev-&gt;ifname"/>
<node CREATED="1362451154116" ID="ID_269754836" MODIFIED="1362451165118" TEXT="&#x521d;&#x59cb;&#x5316;&#x94fe;&#x8868;dev-&gt;users"/>
<node CREATED="1362451173874" ID="ID_975702631" MODIFIED="1362451179037" TEXT="&#x521d;&#x59cb;&#x5316;&#x94fe;&#x8868;dev-&gt;aliases"/>
<node CREATED="1362451200433" ID="ID_1755169818" MODIFIED="1362451248015">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21021;&#22987;&#21270;&#35774;&#22791;&#31867;&#22411;dev-&gt;type, &#22914;&#26524;&#26159;bridge&#21017;&#36825;&#37324;&#21021;&#22987;&#21270;&#20026;
    </p>
    <p>
      &#20840;&#23616;&#21464;&#37327;struct device_type bridge_device_type.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362451279899" ID="ID_733140070" LINK="#ID_600826522" MODIFIED="1362453076877" TEXT="&#x521d;&#x59cb;&#x5316;&#x8bbe;&#x5907;&#x72b6;&#x6001;&#x6539;&#x53d8;&#x51fd;&#x6570;dev-&gt;set_state&#x4e3a;set_device_state"/>
</node>
<node CREATED="1362451504683" ID="ID_389207829" MODIFIED="1362451527157" TEXT="&#x5c06;&#x8bbe;&#x5907;&#x63d2;&#x5165;&#x5168;&#x5c40;&#x7684;avl&#x6811;devices&#x4e2d;"/>
<node CREATED="1362451733915" FOLDED="true" ID="ID_620593276" MODIFIED="1362733460725" TEXT="&#x8c03;&#x7528;system_if_clear_state&#x6e05;&#x9664;&#x6b64;&#x8bbe;&#x5907;&#x76f8;&#x5173;&#x7684;&#x72b6;&#x6001;">
<node CREATED="1362451838900" ID="ID_1480447096" MODIFIED="1362451866029" TEXT="down&#x6b64;&#x8bbe;&#x5907;"/>
<node CREATED="1362451759817" ID="ID_1122397152" MODIFIED="1362451779107" TEXT="&#x5982;&#x679c;&#x6b64;&#x8bbe;&#x5907;&#x662f;bridge&#x5219;&#x5220;&#x9664;&#x8fd9;&#x4e2a;bridge"/>
<node CREATED="1362451783639" ID="ID_218996685" MODIFIED="1362451817441" TEXT="&#x5982;&#x679c;&#x6b64;&#x8bbe;&#x5907;&#x662f;bridge&#x7684;&#x4e00;&#x4e2a;&#x7aef;&#x53e3;,&#x5219;&#x4ece;bridge&#x4e2d;&#x5220;&#x9664;&#x8fd9;&#x4e2a;&#x7aef;&#x53e3;"/>
<node CREATED="1362451878145" ID="ID_1172338418" MODIFIED="1362451898523" TEXT="&#x6e05;&#x9664;&#x6b64;&#x8bbe;&#x5907;&#x76f8;&#x5173;&#x7684;&#x8def;&#x7531;&#x548c;&#x914d;&#x7f6e;&#x7684;IP&#x5730;&#x5740;"/>
</node>
<node CREATED="1362451953084" ID="ID_590803863" MODIFIED="1362734097430">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;dev-&gt;type-&gt;check_state(dev)&#26816;&#27979;device&#22312;&#25805;&#20316;&#31995;&#32479;&#20013;&#26159;&#19981;&#26159;&#23384;&#22312;
    </p>
    <p>
      &#33509;device&#22312;&#25805;&#20316;&#31995;&#32479;&#20013;&#24050;&#23384;&#22312;,&#21017;dev-&gt;present&#20250;&#34987;&#35774;&#32622;&#20026;true
    </p>
    <p>
      &#33509;device&#22312;&#25805;&#20316;&#31995;&#32479;&#20013;&#19981;&#23384;&#22312;,&#21017;dev-&gt;present&#20250;&#34987;&#35774;&#32622;&#20026;false
    </p>
  </body>
</html></richcontent>
<node CREATED="1362733513273" ID="ID_286336227" LINK="#ID_764111726" MODIFIED="1362733861636" TEXT="bridge&#xa;bridge&#x7684;dev-&gt;type-&gt;check_state&#x4e3a;&#x7a7a;,&#xa;&#x56e0;&#x6b64;&#x4e0d;&#x68c0;&#x6d4b;bridge&#x662f;&#x4e0d;&#x662f;&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x5b58;&#x4e0d;&#x5b58;&#x5728;"/>
<node CREATED="1362733519738" ID="ID_933341231" LINK="#ID_1886630449" MODIFIED="1362733567519" TEXT="simple"/>
</node>
</node>
<node CREATED="1362733151951" ID="ID_989476763" MODIFIED="1362733176940" TEXT="&#x6807;&#x8bb0;device&#x662f;&#x6839;&#x636e;&#x9ed8;&#x8ba4;&#x914d;&#x7f6e;&#x521b;&#x5efa;&#x7684;(dev-&gt;default_config = true)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1362642519259" FOLDED="true" ID="ID_1187149103" MODIFIED="1362726982381">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      interface_set_main_dev : &#23558;&#19978;&#38754;&#25214;&#21040;&#30340;device&#35774;&#32622;&#20026;interface&#30340;main device
    </p>
  </body>
</html></richcontent>
<node CREATED="1362710221382" FOLDED="true" ID="ID_43603767" MODIFIED="1362726973875" TEXT="&#x5982;&#x679c;main device&#x548c;L3 device&#x662f;&#x540c;&#x4e00;&#x8bbe;&#x5907;(iface-&gt;main_dev.dev == iface-&gt;l3_dev.dev)&#xa;&#x5219;&#x8c03;&#x7528;interface_set_l3_dev&#x5c06;main device&#x540c;&#x65f6;&#x4e5f;&#x8bbe;&#x7f6e;&#x4e3a;L3 device">
<node CREATED="1362645091367" FOLDED="true" ID="ID_711686961" MODIFIED="1362726972539" TEXT="interface_set_l3_dev">
<node CREATED="1362645121589" ID="ID_463725546" LINK="#ID_1167380574" MODIFIED="1362645515538" TEXT="interface_ip_set_enabled(&amp;iface-&gt;config_ip, false)"/>
<node CREATED="1362645166178" ID="ID_654326384" MODIFIED="1362645166797" TEXT="interface_ip_flush(&amp;iface-&gt;proto_ip)"/>
<node CREATED="1362645195392" ID="ID_797633814" MODIFIED="1362710759778" TEXT="&#x8c03;&#x7528;&#x51fd;&#x6570;device_add_user&#x5728;iface-&gt;l3_dev&#x4e2d;&#x5f15;&#x7528;L3 device"/>
<node CREATED="1362645344117" ID="ID_740315946" MODIFIED="1362646043043" TEXT="&#x6839;&#x636e;iface-&gt;config_ip.enabled&#x51b3;&#x5b9a;&#x662f;&#x5426;enable&#x6b64;interface">
<node CREATED="1362645507946" ID="ID_1167380574" MODIFIED="1362645509477" TEXT="interface_ip_set_enabled"/>
</node>
</node>
</node>
<node CREATED="1362710446246" ID="ID_1909422874" MODIFIED="1362710483217" TEXT="&#x8c03;&#x7528;device_add_user&#x5728;iface-&gt;main_dev&#x4e2d;&#x5f15;&#x7528;main device"/>
<node CREATED="1362710517671" ID="ID_721895748" LINK="#ID_1943555884" MODIFIED="1362710818939" TEXT="&#x5982;&#x679c;&#x4e4b;&#x524d;&#x7684;L3 device&#x5df2;&#x7ecf;&#x88ab;bring up&#x4e86;(iface-&gt;l3_dev.claimed == true)&#xa;&#x5219;&#x5bf9;&#x4e8e;&#x65b0;&#x7684;L3 device&#x4e5f;&#x8981;bring up, &#x5373;device_claim(&amp;iface-&gt;l3_dev)"/>
<node CREATED="1362710221382" ID="ID_1122277222" LINK="#ID_711686961" MODIFIED="1362710414933" TEXT="&#x5982;&#x679c;L3 device&#x8fd8;&#x6ca1;&#x6709;&#x8bbe;&#x7f6e;(iface-&gt;l3_dev.dev == NULL)&#xa;&#x5219;&#x8c03;&#x7528;interface_set_l3_dev&#x5c06;main device&#x540c;&#x65f6;&#x4e5f;&#x8bbe;&#x7f6e;&#x4e3a;L3 device"/>
</node>
<node CREATED="1362642545017" ID="ID_885929765" MODIFIED="1362729221260">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#21327;&#35758;&#22788;&#29702;&#22120;&#25351;&#31034;&#24403;interface&#21021;&#22987;&#21270;&#23436;&#25104;&#21518;&#23601;&#35753;interface&#21464;&#20026;available
    </p>
    <p>
      (iface-&gt;proto_handler-&gt;flags &amp; PROTO_FLAG_INIT_AVAILABLE)&#21017;&#35843;&#29992;
    </p>
    <p>
      interface_set_available,&#36825;&#20250;&#23548;&#33268;&#23545;interface_set_up&#30340;&#35843;&#29992;&#20174;&#32780;&#23548;&#33268;
    </p>
    <p>
      interface&#34987;&#30495;&#27491;&#30340;bring up&#36215;&#26469;(IP&#30456;&#20851;&#37197;&#32622;&#34987;&#24212;&#29992;&#21040;&#25805;&#20316;&#31995;&#32479;&#37324;&#38754;&#21435;)
    </p>
  </body>
</html></richcontent>
<node CREATED="1362731796141" ID="ID_1634729856" LINK="#ID_1763261996" MODIFIED="1362731847423" TEXT="interface_set_available"/>
</node>
</node>
<node CREATED="1362626375137" ID="ID_131026585" MODIFIED="1362646832072">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      netifd_ubus_add_interface
    </p>
    <p>
      &#28155;&#21152;&#19968;&#20010;&#20195;&#34920;&#27492;interface&#30340;ubus object
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362581094934" FOLDED="true" ID="ID_1140226490" MODIFIED="1362623488802" TEXT="&#x82e5;&#x662f;&#x5220;&#x9664;&#x8001;&#x7684;interface">
<node CREATED="1362581190221" ID="ID_755759464" MODIFIED="1362581225751" TEXT="&#x8c03;&#x7528;set_config_state&#x8bbe;&#x7f6e;&#x8001;&#x7684;interface&#x7684;&#x72b6;&#x6001;&#x4e3a;IFC_REMOVE"/>
</node>
</node>
</node>
<node CREATED="1362646914008" FOLDED="true" ID="ID_1574013650" MODIFIED="1362736371597" TEXT="&#x5f53;struct bridge_state *bst -&gt; members&#x6709;&#x53d8;&#x5316;(add/del)&#x65f6;">
<node CREATED="1362671930331" ID="ID_328185503" MODIFIED="1362735093201" TEXT="bridge_member_update">
<node CREATED="1362671972741" ID="ID_85362379" MODIFIED="1362672114942" TEXT="&#x5982;&#x679c;&#x662f;&#x6dfb;&#x52a0;&#x6210;&#x5458;&#xa;&#x5728;struct bridge_member *bm -&gt; dev&#x4e2d;&#x5f15;&#x7528;&#x6210;&#x5458;&#x6240;&#x5bf9;&#x5e94;&#x7684;device"/>
<node CREATED="1362671983765" FOLDED="true" ID="ID_231544260" MODIFIED="1362672268577" TEXT="&#x5982;&#x679c;&#x662f;&#x5220;&#x9664;&#x6210;&#x5458;">
<node CREATED="1362672162947" ID="ID_538027667" MODIFIED="1362672164500" TEXT="bridge_remove_member"/>
<node CREATED="1362672192439" ID="ID_25049469" MODIFIED="1362672240847" TEXT="&#x89e3;&#x9664;struct bridge_member *bm -&gt; dev&#x4e2d;&#x5bf9;&#x6210;&#x5458;device&#x7684;&#x5f15;&#x7528;"/>
<node CREATED="1362672256288" ID="ID_998258418" MODIFIED="1362672266203" TEXT="&#x91ca;&#x653e;struct bridge_member *bm"/>
</node>
</node>
</node>
<node CREATED="1362724543120" FOLDED="true" ID="ID_1591198048" MODIFIED="1362725407909" TEXT="&#x5f53;iface-&gt;proto_ip-&gt;addr&#x548c;iface-&gt;config_ip-&gt;addr&#x6709;&#x53d8;&#x5316;(add/del)&#x65f6;">
<node CREATED="1362724556832" FOLDED="true" ID="ID_761759298" MODIFIED="1362725406630" TEXT="interface_update_proto_addr">
<node CREATED="1362724861222" FOLDED="true" ID="ID_414717260" MODIFIED="1362725073092" TEXT="&#x5982;&#x679c;&#x662f;&#x6dfb;&#x52a0;&#x5730;&#x5740;">
<node CREATED="1362724922085" ID="ID_862099710" MODIFIED="1362724966204" TEXT="&#x8c03;&#x7528;system_add_address&#x5c06;&#x5730;&#x5740;&#x5e94;&#x7528;&#x5230;&#x7f51;&#x7edc;&#x63a5;&#x53e3;&#x4e0a;"/>
<node CREATED="1362725011619" ID="ID_1060668988" MODIFIED="1362725026997" TEXT="&#x8c03;&#x7528;interface_handle_subnet_route&#x6dfb;&#x52a0;&#x4e00;&#x6761;&#x672c;&#x5730;&#x8def;&#x7531;"/>
</node>
<node CREATED="1362724873294" FOLDED="true" ID="ID_1332833967" MODIFIED="1362725072252" TEXT="&#x5982;&#x679c;&#x662f;&#x5220;&#x9664;&#x5730;&#x5740;">
<node CREATED="1362725011619" ID="ID_881243755" MODIFIED="1362725056610" TEXT="&#x8c03;&#x7528;interface_handle_subnet_route&#x5220;&#x9664;&#x672c;&#x5730;&#x8def;&#x7531;"/>
<node CREATED="1362724922085" ID="ID_1792549382" MODIFIED="1362725068059" TEXT="&#x8c03;&#x7528;system_add_address&#x5c06;&#x5730;&#x5740;&#x4ece;&#x7f51;&#x7edc;&#x63a5;&#x53e3;&#x4e0a;&#x5220;&#x9664;"/>
</node>
</node>
</node>
</node>
<node CREATED="1362579977461" ID="ID_677646171" MODIFIED="1362579995402" TEXT="&#x5237;&#x65b0;vlist_tree : vlist_flush"/>
</node>
<node CREATED="1362554775301" ID="ID_1001651075" MODIFIED="1362646944816" TEXT="&#x95ee;&#x9898;">
<node CREATED="1362818142104" ID="ID_1324661543" MODIFIED="1362818149780" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1362818157335" ID="ID_364828316" MODIFIED="1362818166051" TEXT="device&#x7684;present"/>
<node CREATED="1362818166678" ID="ID_244092420" MODIFIED="1362818175409" TEXT="interface&#x7684;available"/>
<node CREATED="1362818176101" ID="ID_663539870" MODIFIED="1362818189957" TEXT="interface&#x7684;main device&#x548c;L3 device"/>
</node>
<node CREATED="1362554781268" FOLDED="true" ID="ID_1973284231" MODIFIED="1362736810075" TEXT="interface&#x6240;&#x7ed1;&#x5b9a;&#x7684;device&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x521b;&#x5efa;&#x7684;">
<node CREATED="1362646969588" ID="ID_1719033131" MODIFIED="1362647035243" TEXT="&#x5f53;interface&#x88ab;&#x6dfb;&#x52a0;&#x5230;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct vlist_tree interfaces&#x65f6;&#x89e6;&#x53d1;interface_update&#x800c;&#x521b;&#x5efa;&#x7684;"/>
</node>
<node CREATED="1362554811779" ID="ID_1344105712" MODIFIED="1362734531312" TEXT="&#x5177;&#x4f53;&#x7684;L2&#x914d;&#x7f6e;(&#x62d3;&#x6251;&#x914d;&#x7f6e;)&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x5c42;&#x53bb;&#x7684;(L2 bring up)">
<node CREATED="1362736193234" FOLDED="true" ID="ID_1630667775" MODIFIED="1362739200664" TEXT="device&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x53d8;&#x4e3a;present&#x7684;&#xa;device&#x53d8;&#x4e3a;present&#x65f6;&#x5c06;&#x5bfc;&#x81f4;&#x57fa;&#x4e8e;&#x5b83;&#x7684;interface&#x53d8;&#x4e3a;available">
<node CREATED="1362736247420" ID="ID_1561676955" LINK="#ID_933341231" MODIFIED="1362736551093" TEXT="&#x5bf9;&#x4e8e;simple device&#x800c;&#x8a00;, &#x5b83;&#x672c;&#x8eab;&#x5c31;&#x662f;&#x5b58;&#x5728;&#x4e8e;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;,&#xa;&#x56e0;&#x6b64;&#x5728;&#x521b;&#x5efa;&#x8fd9;&#x4e2a;simple device&#x4ee5;&#x540e;device&#x5c31;&#x53d8;&#x4e3a;present&#x4e86;&#xa;simple device&#x5305;&#x62ec;:bridge&#x7684;&#x6210;&#x5458;,vlan device&#x6240;&#x57fa;&#x4e8e;&#x7684;device."/>
<node CREATED="1362736728797" ID="ID_1386723343" LINK="#ID_714258652" MODIFIED="1362738737553" TEXT="&#x5bf9;&#x4e8e;vlan device&#x800c;&#x8a00;, &#x5f53;&#x5b83;&#x6240;&#x57fa;&#x4e8e;&#x7684;&#x5e95;&#x5c42;device&#x53d8;&#x4e3a;present&#x65f6;,&#xa;vlan device&#x4e5f;&#x5c31;&#x53d8;&#x4e3a;present&#x4e86;"/>
<node CREATED="1362736742969" ID="ID_1860994324" LINK="#ID_1736525705" MODIFIED="1362739173873" TEXT="&#x5bf9;&#x4e8e;bridge device&#x800c;&#x8a00;, &#x5b83;&#x7684;&#x4efb;&#x4f55;&#x4e00;&#x4e2a;&#x6210;&#x5458;device&#x53d8;&#x4e3a;present&#x65f6;,&#xa;bridge device&#x5c31;&#x53d8;&#x4e3a;present&#x4e86;"/>
</node>
<node CREATED="1362732079841" ID="ID_90818725" LINK="#ID_1363365047" MODIFIED="1362737872015" TEXT="L2 device&#x7684;bring up&#x662f;&#x4ece;device_claim()&#x51fd;&#x6570;&#x5f00;&#x59cb;&#x7684;.&#x800c;&#x8fd9;&#x53c8;&#x662f;&#x7531;interface_set_up&#x89e6;&#x53d1;&#x7684;"/>
<node CREATED="1362649877609" FOLDED="true" ID="ID_589534618" MODIFIED="1362736143190" TEXT="device_claim">
<node CREATED="1362650020064" ID="ID_763537092" MODIFIED="1362650076183" TEXT="&#x5982;&#x679c;&#x5df2;&#x7ecf;&#x8981;&#x6c42;&#x8fc7;&#x4e86;(dep-&gt;claimed = true)&#x5219;&#x8fd4;&#x56de;"/>
<node CREATED="1362650078395" ID="ID_1216110104" MODIFIED="1362650114036" TEXT="dep-&gt;claimed = true, &#x8fd9;&#x91cc;&#x8868;&#x660e;&#x5f15;&#x7528;&#x8005;&#x771f;&#x6b63;&#x9700;&#x8981;&#x88ab;&#x5f15;&#x7528;device&#x4e86;"/>
<node CREATED="1362650138375" ID="ID_1930442487" MODIFIED="1362650243227" TEXT="&#x9012;&#x589e;&#x88ab;&#x5f15;&#x7528;&#x8bbe;&#x5907;&#x7684;dev-&gt;active, &#x82e5;&#x9012;&#x589e;&#x540e;&#x8be5;&#x503c;&#x4e0d;&#x4e3a;1&#x8868;&#x660e;&#x88ab;&#x5f15;&#x7528;&#x8bbe;&#x5907;&#x5df2;&#x7ecf;active&#x4e86;,&#x5219;&#x4e5f;&#x65e0;&#x9700;&#x518d;bring up&#x5b83;&#x4e86;"/>
<node CREATED="1362650273230" ID="ID_1388572685" MODIFIED="1362650307367" TEXT="&#x8c03;&#x7528;device_broadcast_event&#x5e7f;&#x64ad;&#x88ab;&#x5f15;&#x7528;&#x8bbe;&#x5907;&#x4e0a;&#x7684;DEV_EVENT_SETUP&#x4e8b;&#x4ef6;"/>
<node CREATED="1362650347977" ID="ID_1516460920" MODIFIED="1362735456318" TEXT="&#x8c03;&#x7528;dev-&gt;set_state(dev, true)&#x5c06;&#x88ab;&#x5f15;&#x7528;&#x8bbe;&#x5907;&#x7684;&#x72b6;&#x6001;&#x6539;&#x4e3a;UP">
<node CREATED="1362732202327" FOLDED="true" ID="ID_1783443573" MODIFIED="1362736139572" TEXT="&#x72b6;&#x6001;&#x6539;&#x53d8;&#x51fd;&#x6570;(dev-&gt;set_state)">
<node CREATED="1362648115988" ID="ID_160472625" MODIFIED="1362650486010">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19981;&#31649;&#26159;device&#36824;&#26159;interface, &#23427;&#20204;&#30340;&#22522;&#31867;&#21644;&#23376;&#31867;&#37117;&#26377;&#33258;&#24049;&#30340;&#29366;&#24577;
    </p>
    <p>
      &#24403;&#25913;&#21464;&#23427;&#20204;&#30340;&#29366;&#24577;&#26102;,&#20855;&#20307;&#30340;&#37197;&#32622;&#23601;&#20250;&#24212;&#29992;&#21040;&#25805;&#20316;&#31995;&#32479;&#23618;&#21435;
    </p>
    <p>
      &#29366;&#24577;&#30340;&#25913;&#21464;&#36890;&#36807;&#35843;&#29992;dev-&gt;set_state(dev, true|false)&#26469;&#23454;&#29616;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362649007478" FOLDED="true" ID="ID_1827494536" MODIFIED="1362736137780">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22522;&#31867;&#30340;&#29366;&#24577;&#25913;&#21464;&#20989;&#25968;(dev-&gt;set_state)
    </p>
    <p>
      &#19968;&#33324;&#34987;&#35774;&#32622;&#20026;&#23376;&#31867;&#23545;&#24212;&#30340;&#29366;&#24577;&#25913;&#21464;&#20989;&#25968;
    </p>
    <p>
      &#22312;&#36825;&#37324;&#25191;&#34892;&#21482;&#26377;&#23376;&#31867;&#25165;&#38656;&#35201;&#30340;&#25805;&#20316;&#31995;&#32479;&#21160;&#20316;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362650810488" ID="ID_1848178983" MODIFIED="1362650815891" TEXT="bridge">
<node CREATED="1362653147206" FOLDED="true" ID="ID_876676559" MODIFIED="1362735812662" TEXT="bridge_set_state">
<node CREATED="1362653225248" FOLDED="true" ID="ID_1298546404" MODIFIED="1362735811598" TEXT="&#x5982;&#x679c;&#x662f;up&#x5219;&#x8c03;&#x7528;bridge_set_up">
<node CREATED="1362669039533" ID="ID_1995563616" MODIFIED="1362669539374" TEXT="&#x5982;&#x679c;&#x6ca1;&#x6709;&#x6210;&#x5458;(struct bridge_state *bst -&gt;n_present == 0)&#x5219;&#x8fd4;&#x56de;&#x9519;&#x8bef;"/>
<node CREATED="1362669074426" FOLDED="true" ID="ID_682754713" MODIFIED="1362669501853" TEXT="&#x8c03;&#x7528;system_bridge_addbr()&#x6839;&#x636e;&#x4fdd;&#x5b58;&#x5728;struct bridge_state *bst -&gt;config&#x4e2d;&#x7684;&#x914d;&#x7f6e;&#x521b;&#x5efa;bridge">
<node CREATED="1362669376279" ID="ID_1225496494" MODIFIED="1362669383262" TEXT="&#x521b;&#x5efa;bridge"/>
<node CREATED="1362669384748" ID="ID_152189670" MODIFIED="1362669391597" TEXT="&#x5f00;&#x542f;stp"/>
<node CREATED="1362669392377" ID="ID_1533069012" MODIFIED="1362669403291" TEXT="&#x8bbe;&#x7f6e;forward_delay"/>
<node CREATED="1362669418140" ID="ID_730770600" MODIFIED="1362669429070" TEXT="&#x5f00;&#x542f;igmp_snooping"/>
<node CREATED="1362669438651" ID="ID_1585142180" MODIFIED="1362669449768" TEXT="&#x8bbe;&#x7f6e;ageing_time"/>
<node CREATED="1362669458556" ID="ID_1302987888" MODIFIED="1362669466775" TEXT="&#x8bbe;&#x7f6e;hello_time"/>
<node CREATED="1362669467916" ID="ID_432090993" MODIFIED="1362669475210" TEXT="&#x8bbe;&#x7f6e;max_age"/>
</node>
<node CREATED="1362669087651" FOLDED="true" ID="ID_454523228" MODIFIED="1362735210982" TEXT="&#x8c03;&#x7528;bridge_enable_member&#x5728;bridge&#x4e2d;&#x6dfb;&#x52a0;&#x6bcf;&#x4e2a;&#x6210;&#x5458;">
<node CREATED="1362669657780" ID="ID_944735210" MODIFIED="1362669695613" TEXT="&#x5982;&#x679c;&#x6210;&#x5458;&#x4e0d;&#x5b58;&#x5728;(struct bridge_member *bm -&gt; present == false)&#x5219;&#x8fd4;&#x56de;"/>
<node CREATED="1362669823736" ID="ID_550378425" LINK="#ID_1943555884" MODIFIED="1362669927123" TEXT="&#x8c03;&#x7528;device_claim&#x8981;&#x6c42;&#x4f7f;&#x7528;&#x6210;&#x5458;&#x5bf9;&#x5e94;&#x7684;device"/>
<node CREATED="1362669944636" ID="ID_342652214" MODIFIED="1362670040803" TEXT="&#x8c03;&#x7528;system_bridge_addif&#x5c06;&#x6210;&#x5458;&#x6dfb;&#x52a0;&#x5230;bridge&#x4e2d;"/>
</node>
<node CREATED="1362669129559" ID="ID_1654675505" LINK="#ID_719344438" MODIFIED="1362671054540" TEXT="&#x8c03;&#x7528;bridge_reset_primary&#x9009;&#x62e9;&#x4e00;&#x4e2a;primary_port&#xa;&#x5c06;primary_port&#x7684;mac&#x5730;&#x5740;&#x590d;&#x5236;&#x5230;struct bridge_state *bst-&gt;dev.settings.macaddr&#xa;&#x8fd9;&#x4e2a;mac&#x5730;&#x5740;&#x5c06;&#x6210;&#x4e3a;bridge&#x7684;mac&#x5730;&#x5740;"/>
<node CREATED="1362651613968" ID="ID_343081058" LINK="#ID_146327257" MODIFIED="1362651621288" TEXT="set_device_state"/>
</node>
<node CREATED="1362653225248" ID="ID_1108235627" MODIFIED="1362653256201" TEXT="&#x5982;&#x679c;&#x662f;down&#x5219;&#x8c03;&#x7528;bridge_set_down"/>
</node>
</node>
<node CREATED="1362650817079" ID="ID_960599897" MODIFIED="1362650820179" TEXT="vlan">
<node CREATED="1362650888274" FOLDED="true" ID="ID_1813983674" MODIFIED="1362736136430" TEXT="vlan_set_device_state">
<node CREATED="1362651143681" ID="ID_627680033" MODIFIED="1362651699556">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;device_claim&#26469;&#35201;&#27714;vlan device&#25152;&#22522;&#20110;&#30340;&#24213;&#23618;device
    </p>
    <p>
      &#27604;&#22914;vlan device eth0.10&#30340;&#24213;&#23618;device&#26159;eth0
    </p>
    <p>
      &#36825;&#26159;&#19968;&#20010;&#36882;&#24402;&#36807;&#31243;,&#20250;&#23548;&#33268;&#35843;&#29992;&#24213;&#23618;device&#30340;dev-&gt;set_state
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362651728952" ID="ID_1175659499" MODIFIED="1362651866080">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      system_vlan_add
    </p>
    <p>
      &#35843;&#29992;ioctl&#22312;&#24213;&#23618;device&#19978;&#21019;&#24314;vlan
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362651613968" ID="ID_766355158" LINK="#ID_146327257" MODIFIED="1362651621288" TEXT="set_device_state"/>
</node>
</node>
<node CREATED="1362650823623" ID="ID_386730769" MODIFIED="1362650825778" TEXT="simple">
<node CREATED="1362651313605" FOLDED="true" ID="ID_1531825638" MODIFIED="1362734606620" TEXT="simple_device_set_state">
<node CREATED="1362651613968" ID="ID_616674652" LINK="#ID_146327257" MODIFIED="1362651621288" TEXT="set_device_state"/>
</node>
</node>
</node>
<node CREATED="1362649007478" FOLDED="true" ID="ID_1646408668" MODIFIED="1362735828785">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23376;&#31867;&#30340;&#29366;&#24577;&#25913;&#21464;&#20989;&#25968;
    </p>
    <p>
      &#32479;&#19968;&#35774;&#32622;&#20026;set_device_state
    </p>
    <p>
      &#22312;&#36825;&#37324;&#25191;&#34892;&#25152;&#26377;device&#37117;&#38656;&#35201;&#30340;&#25805;&#20316;&#31995;&#32479;&#21160;&#20316;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362650803065" ID="ID_146327257" MODIFIED="1362735819258" TEXT="set_device_state">
<node CREATED="1362651968791" FOLDED="true" ID="ID_433395160" MODIFIED="1362735826561" TEXT="&#x5982;&#x679c;&#x662f;up&#x5219;&#x8c03;&#x7528;system_if_up">
<node CREATED="1362652099326" ID="ID_1578396737" MODIFIED="1362652177107">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;system_if_get_settings
    </p>
    <p>
      &#33719;&#21462;device&#24403;&#21069;&#20851;&#20110;mtu,txqueuelen.mac address&#30340;&#37197;&#32622;,
    </p>
    <p>
      &#24182;&#25226;&#23427;&#20204;&#20445;&#23384;&#21040;dev-&gt;orig_settings
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362652099326" ID="ID_1296586286" MODIFIED="1362652307394">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;system_if_apply_settings
    </p>
    <p>
      &#23558;&#23384;&#20648;&#20110;dev-&gt;settings&#30340;&#20851;&#20110;mtu,txqueuelen.mac address&#30340;&#37197;&#32622;,
    </p>
    <p>
      &#24212;&#29992;&#21040;&#25805;&#20316;&#31995;&#32479;&#20013;&#21435;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362652325823" ID="ID_1472145509" MODIFIED="1362652331386" TEXT="&#x83b7;&#x53d6;dev-&gt;ifindex"/>
<node CREATED="1362652351037" ID="ID_1882976946" MODIFIED="1362652388869" TEXT="&#x5c06;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;device up&#x8d77;&#x6765;,&#x76f8;&#x5f53;&#x4e8e;ifconfig eth0 up"/>
</node>
<node CREATED="1362651968791" FOLDED="true" ID="ID_765906601" MODIFIED="1362652889871" TEXT="&#x5982;&#x679c;&#x662f;down&#x5219;&#x8c03;&#x7528;system_if_down">
<node CREATED="1362652351037" ID="ID_1629550362" MODIFIED="1362652830231" TEXT="&#x5c06;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;device down&#x6389;,&#x76f8;&#x5f53;&#x4e8e;ifconfig eth0 down"/>
<node CREATED="1362652099326" ID="ID_1328681826" MODIFIED="1362652887378">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;system_if_apply_settings&#24674;&#22797;&#37197;&#32622;
    </p>
    <p>
      &#21363;&#23558;&#23384;&#20648;&#20110;dev-&gt;orig_settings&#30340;&#20851;&#20110;mtu,txqueuelen.mac address&#30340;&#37197;&#32622;,
    </p>
    <p>
      &#24212;&#29992;&#21040;&#25805;&#20316;&#31995;&#32479;&#20013;&#21435;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1362650273230" ID="ID_629371994" MODIFIED="1362650332693" TEXT="&#x8c03;&#x7528;device_broadcast_event&#x5e7f;&#x64ad;&#x88ab;&#x5f15;&#x7528;&#x8bbe;&#x5907;&#x4e0a;&#x7684;DEV_EVENT_UP&#x4e8b;&#x4ef6;"/>
</node>
</node>
<node CREATED="1362710976436" ID="ID_1130437230" MODIFIED="1362756677261" TEXT="&#x5177;&#x4f53;&#x7684;L3&#x914d;&#x7f6e;(IP&#x914d;&#x7f6e;)&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x5c42;&#x53bb;&#x7684;(L3 bring up)">
<node CREATED="1362711656540" FOLDED="true" ID="ID_111766168" MODIFIED="1371179487082" TEXT="L3 interface&#x7684;bring up&#x662f;&#x4ece;interface_set_up()&#x51fd;&#x6570;&#x5f00;&#x59cb;&#x7684;.&#xa;&#x4e00;&#x4e2a;L3 interface&#x80fd;&#x591f;&#x88ab;bring up&#x7684;&#x6761;&#x4ef6;&#x662f; : &#xa;iface-&gt;available == true, &#x8fd9;&#x8868;&#x660e;&#x8be5;interface&#x6240;&#x7ed1;&#x5b9a;&#x7684;main device&#x5df2;&#x7ecf;&#x51c6;&#x5907;&#x597d;&#x4e86;">
<node CREATED="1362711969892" ID="ID_1072108086" MODIFIED="1362711976549" TEXT="&#x5bfc;&#x81f4;L3 interface&#x88ab;bring up&#x7684;&#x573a;&#x666f;">
<node CREATED="1362712067355" ID="ID_1138246805" LINK="#ID_245112385" MODIFIED="1362712614336" TEXT="&#x82e5;interface&#x5df2;&#x7ecf;available&#x4e14;&#x8be5;interface&#x914d;&#x7f6e;&#x4e86;autostart&#x53c2;&#x6570;,&#xa;&#x5219;&#x5728;&#x521d;&#x59cb;&#x5316;&#x914d;&#x7f6e;&#x7ed3;&#x675f;&#x540e;&#x7acb;&#x5373;bring up&#x5b83;,&#x89c1;&#x51fd;&#x6570;interface_start_pending"/>
<node CREATED="1362712522723" ID="ID_1191508487" MODIFIED="1362712606283" TEXT="&#x6267;&#x884c;&#x547d;&#x4ee4;ubus call network.interface.wan up, &#x89c1;&#x51fd;&#x6570;netifd_handle_up"/>
<node CREATED="1362712726861" ID="ID_674148951" MODIFIED="1362712732532" TEXT="&#x89c1;&#x51fd;&#x6570;interface_handle_config_change"/>
<node CREATED="1362712860403" ID="ID_584287582" MODIFIED="1362713532543" TEXT="&#x5f53;interface&#x4f1a;&#x53d8;&#x4e3a;available,&#x4e14;interface&#x88ab;&#x914d;&#x7f6e;&#x4e3a;autostart&#x65f6;&#x4f1a;&#x7acb;&#x5373;bring up&#x5b83;,&#xa;&#x89c1;&#x51fd;&#x6570;interface_set_available"/>
</node>
<node CREATED="1362713391984" ID="ID_1253442519" MODIFIED="1362713431876" TEXT="&#x4ec0;&#x4e48;&#x60c5;&#x51b5;&#x4e0b;interface&#x4f1a;&#x53d8;&#x4e3a;available">
<node CREATED="1362731246127" FOLDED="true" ID="ID_1019596924" LINK="#ID_1630667775" MODIFIED="1362737946183" TEXT="&#x5f53;interface&#x7684;main device&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x521b;&#x5efa;&#x8d77;&#x6765;&#x65f6;(dev-&gt;present = true)&#xa;interface&#x5c06;&#x53d8;&#x4e3a;available. &#x8fd9;&#x662f;&#x901a;&#x8fc7;&#x56de;&#x8c03;&#x51fd;&#x6570;(iface-&gt;main_dev.cb = interface_cb)&#xa;&#x54cd;&#x5e94;DEV_EVENT_ADD&#x4e8b;&#x4ef6;&#x6765;&#x5b9e;&#x73b0;&#x7684;.">
<node CREATED="1362731582853" ID="ID_108968343" MODIFIED="1362731584779" TEXT="interface_cb">
<node CREATED="1362642545017" ID="ID_1763261996" MODIFIED="1362731815413" TEXT="interface_set_available">
<node CREATED="1362729072840" ID="ID_1909980859" MODIFIED="1362729078612" TEXT="iface-&gt;available = true"/>
<node CREATED="1362729097727" ID="ID_1085221404" LINK="#ID_1763631519" MODIFIED="1362729396618" TEXT="&#x5982;&#x679c;interface&#x88ab;&#x914d;&#x7f6e;&#x4e3a;&#x81ea;&#x52a8;bring up&#x5219;&#x8c03;&#x7528;interface_set_up&#xa;&#x53bb;&#x771f;&#x6b63;bring up&#x8fd9;&#x4e2a;interface"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1362561310717" ID="ID_1763631519" MODIFIED="1371179488357" TEXT="interface_set_up">
<node CREATED="1362722690876" ID="ID_1792613026" MODIFIED="1362722756801" TEXT="&#x5c06;interface&#x6807;&#x8bb0;&#x4e3a;&#x81ea;&#x52a8;bring up (iface-&gt;autostart = true)"/>
<node CREATED="1362722780633" ID="ID_1234513021" MODIFIED="1362722866203" TEXT="&#x5982;&#x679c;iface-&gt;available == false&#x8868;&#x660e;&#x8be5;interface&#x8fd8;&#x6ca1;&#x6709;&#x51c6;&#x5907;&#x597d;, &#x90a3;&#x5c31;&#x9000;&#x51fa;bring up"/>
<node CREATED="1362561493424" ID="ID_1363365047" LINK="#ID_589534618" MODIFIED="1362737844073" TEXT="&#x8c03;&#x7528;device_claim&#x5f00;&#x59cb;bring up interface&#x6240;&#x7ed1;&#x5b9a;&#x7684;main device(iface-&gt;main_dev.dev)&#xa;&#x8fd9;&#x4f1a;&#x5bfc;&#x81f4;main device&#x6240;&#x4ee3;&#x8868;&#x7684;L2&#x62d3;&#x6251;&#x88ab;&#x771f;&#x6b63;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x53bb;."/>
<node CREATED="1362561586473" ID="ID_1182160259" MODIFIED="1362722994665" TEXT="&#x6807;&#x8bb0;interface&#x6b63;&#x5728;bring up(iface-&gt;state = IFS_SETUP)"/>
<node CREATED="1362562539591" ID="ID_1225359498" MODIFIED="1371191387679" TEXT="&#x901a;&#x8fc7;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x901a;&#x4fe1;&#x63a5;&#x53e3;(iface-&gt;proto)&#x5411;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;(iface-&gt;proto_handler)&#xa;&#x53d1;&#x9001;PROTO_CMD_SETUP&#x6d88;&#x606f;">
<node CREATED="1362723082913" ID="ID_1008927472" MODIFIED="1371179517348" TEXT="interface_proto_event">
<node CREATED="1362723135354" ID="ID_731442422" MODIFIED="1371196159520">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;&#20989;&#25968;proto-&gt;cb()&#20197;&#20415;&#21327;&#35758;&#22788;&#29702;&#22120;&#30417;&#25511;&#20107;&#20214;PROTO_CMD_SETUP
    </p>
    <p>
      &#36825;&#37324;&#23601;&#26159;&#36890;&#30693;&#21327;&#35758;&#22788;&#29702;&#22120;&#35753;&#20854;setup&#33258;&#24049;&#30340;&#21327;&#35758;
    </p>
  </body>
</html></richcontent>
<node CREATED="1362725209764" ID="ID_545059697" LINK="#ID_1516514775" MODIFIED="1362725254290" TEXT="static"/>
<node CREATED="1362725214967" ID="ID_553061082" MODIFIED="1362725216790" TEXT="dhcp"/>
<node CREATED="1362725217330" ID="ID_709230612" MODIFIED="1362725220052" TEXT="ppp"/>
</node>
<node CREATED="1371196174342" ID="ID_75530495" MODIFIED="1371196616575">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#20110;static&#21327;&#35758;&#32780;&#35328;&#23427;&#30340;&#26631;&#35782;PROTO_FLAG_IMMEDIATE&#24050;&#32622;&#20301;,&#34920;&#31034;static&#21327;&#35758;&#32463;&#36807;&#19978;&#38754;&#30340;setup&#21518;
    </p>
    <p>
      &#23601;&#31435;&#21363;up&#36215;&#26469;&#20102;. &#23545;&#20110;dhcp/pppoe&#21327;&#35758;&#32780;&#35328;&#23427;&#30340;&#26631;&#35782;PROTO_FLAG_IMMEDIATE&#27809;&#26377;&#32622;&#20301;,&#34920;&#31034;&#21327;&#35758;
    </p>
    <p>
      &#38656;&#31561;&#24453;&#22806;&#37096;&#36827;&#31243;&#30340;&#28040;&#24687;, &#25925;&#19981;&#33021;&#31435;&#21363;up&#36215;&#26469;.
    </p>
    <p>
      &#24403;&#21327;&#35758;up&#36215;&#26469;&#21518;&#20250;&#35843;&#29992;proto-&gt;proto_event&#20989;&#25968;&#21521;&#22806;&#30028;&#21578;&#30693;protocol&#24050;&#32463;up&#36215;&#26469;&#20102;, &#35265;&#19979;&#38754;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362723147724" ID="ID_1367037535" MODIFIED="1371181277619" TEXT="&#x8c03;&#x7528;&#x51fd;&#x6570;proto-&gt;proto_event&#x5411;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x53d1;&#x9001;IFPEV_UP&#x4e8b;&#x4ef6;">
<node CREATED="1362623785454" ID="ID_429210477" MODIFIED="1371179624923" TEXT="interface_proto_cb&#xa;&#x6b64;&#x51fd;&#x6570;&#x5c06;&#x628a;IP&#x76f8;&#x5173;&#x53c2;&#x6570;&#x6700;&#x7ec8;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x91cc;&#x9762;&#x53bb;">
<node CREATED="1362727342070" ID="ID_1281488644" MODIFIED="1362814655920" TEXT="&#x82e5;&#x4e3a;IFPEV_UP&#x4e8b;&#x4ef6;">
<node CREATED="1362727540672" ID="ID_1486338009" MODIFIED="1362727565286" TEXT="&#x5f53;&#x524d;interface&#x5e94;&#x5904;&#x4e8e;&#x6b63;&#x5728;UP&#x7684;&#x72b6;&#x6001;(iface-&gt;state == IFS_SETUP)"/>
<node CREATED="1362727580564" FOLDED="true" ID="ID_1000873166" MODIFIED="1371181292050" TEXT="interface_ip_set_enabled">
<node CREATED="1362728080719" ID="ID_1782994647" MODIFIED="1362728352921" TEXT="&#x5c06;iface-&gt;config_ip-&gt;addr&#x4e2d;&#x7684;&#x6240;&#x6709;IP&#x5730;&#x5740;&#x5e94;&#x7528;&#x5230;interface&#x7684;L3 device&#x4e0a;&#xa;&#x5e76;&#x6807;&#x8bb0;&#x6bcf;&#x4e2a;&#x5730;&#x5740;&#x5df2;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;(addr-&gt;enabled = true)"/>
<node CREATED="1362728080719" ID="ID_276003622" MODIFIED="1362728381135" TEXT="&#x5c06;iface-&gt;config_ip-&gt;route&#x4e2d;&#x7684;&#x6240;&#x6709;&#x8def;&#x7531;&#x6761;&#x76ee;&#x5e94;&#x7528;&#x5230;interface&#x7684;L3 device&#x4e0a;&#xa;&#x5e76;&#x6807;&#x8bb0;&#x6bcf;&#x4e2a;&#x8def;&#x7531;&#x5df2;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;(route-&gt;enabled = true)"/>
</node>
<node CREATED="1362727593825" ID="ID_1073969339" MODIFIED="1362727653157" TEXT="&#x8c03;&#x7528;system_flush_routes&#x6e05;&#x9664;&#x5f53;&#x524d;&#x7cfb;&#x7edf;&#x7684;route cache&#x4ee5;&#x4fbf;&#x91cd;&#x65b0;cache&#x8def;&#x7531;"/>
<node CREATED="1362727540672" ID="ID_427549518" MODIFIED="1362727805395" TEXT="&#x5c06;interface&#x72b6;&#x6001;&#x6539;&#x4e3a;&#x5df2;&#x7ecf;UP(iface-&gt;state = IFS_UP)"/>
<node CREATED="1362727837319" ID="ID_931954470" MODIFIED="1362727874350" TEXT="&#x53d1;&#x51fa;interface&#x5df2;&#x7ecf;UP&#x7684;&#x4e8b;&#x4ef6;&#x6d88;&#x606f;&#xa;interface_event(iface, IFEV_UP)"/>
<node CREATED="1362727922588" ID="ID_344017570" MODIFIED="1362728021114" TEXT="&#x8c03;&#x7528;interface_write_resolv_conf()&#x5c06;iface-&gt;proto_ip&#x548c;iface-&gt;config_ip&#x4e2d;&#x7684;&#x6240;&#x6709;&#xa;dns server&#x548c;dns domain&#x5199;&#x5165;&#x5230;/etc/resolv.conf&#x6587;&#x4ef6;&#x4e2d;&#x53bb;"/>
</node>
<node CREATED="1362727342070" ID="ID_200481174" MODIFIED="1362727364191" TEXT="&#x82e5;&#x4e3a;IFPEV_DOWN&#x4e8b;&#x4ef6;"/>
<node CREATED="1362727342070" ID="ID_1044258283" MODIFIED="1362727378706" TEXT="&#x82e5;&#x4e3a;IFPEV_LINK_LOST&#x4e8b;&#x4ef6;"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1362554949305" ID="ID_1050521740" LINK="#ID_1175659499" MODIFIED="1362653194394" TEXT="&#x57fa;&#x4e8e;vlan&#x7684;interface&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x521b;&#x5efa;&#x7684;"/>
<node CREATED="1362562942875" ID="ID_930056078" MODIFIED="1362562967413" TEXT="interface&#x4e0e;&#x5b83;&#x52a0;&#x8f7d;&#x7684;&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;&#x662f;&#x5982;&#x4f55;&#x901a;&#x4fe1;&#x7684;">
<node CREATED="1362672678482" ID="ID_1270648709" MODIFIED="1362672694876" TEXT="static&#x534f;&#x8bae;&#x5904;&#x7406;&#x5668;">
<node CREATED="1362672696938" ID="ID_1220012300" LINK="#ID_429210477" MODIFIED="1362728628902" TEXT="&#x9759;&#x6001;&#x914d;&#x7f6e;&#x7684;ip address,netmask,dns,domain,route&#x7b49;&#xa;&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x5e94;&#x7528;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x5c42;&#x53bb;&#x7684;"/>
</node>
</node>
<node CREATED="1362647044079" ID="ID_1154132661" MODIFIED="1362735183224" TEXT="bridge&#x7684;&#x6210;&#x5458;&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x521b;&#x5efa;&#x7684;">
<node CREATED="1362671324100" ID="ID_1931833232" LINK="#ID_403845745" MODIFIED="1362671761861" TEXT="bridge&#x6210;&#x5458;&#x5bf9;&#x5e94;&#x7684;device&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x521b;&#x5efa;"/>
<node CREATED="1362671359816" ID="ID_611705959" LINK="#ID_454523228" MODIFIED="1362671796274" TEXT="bridge&#x6210;&#x5458;&#x662f;&#x4ec0;&#x4e48;&#x65f6;&#x5019;&#x88ab;&#x52a0;&#x5165;&#x5230;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;bridge&#x4e2d;&#x53bb;&#x7684;"/>
</node>
<node CREATED="1362649287171" ID="ID_1864381223" MODIFIED="1362649359225" TEXT="device&#x7684;&#x5f15;&#x7528;&#x5173;&#x7cfb;(struct device_user)&#x662f;&#x5982;&#x4f55;&#x5c06;&#x5f15;&#x7528;&#x8005;&#x4e0e;&#x88ab;&#x5f15;&#x7528;&#x8005;&#x5173;&#x8054;&#x8d77;&#x6765;&#x7684;">
<node CREATED="1362649384028" ID="ID_384343897" MODIFIED="1362649553954">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#20010;device&#21487;&#20197;&#34987;&#22810;&#20010;&#29992;&#25143;&#24341;&#29992;,device-&gt;users&#29992;&#20110;&#23384;&#20648;&#24341;&#29992;&#23427;&#30340;&#29992;&#25143;
    </p>
    <p>
      &#32780;&#29992;&#25143;&#21017;&#29992;struct device_user&#26469;&#23384;&#20648;&#23545;device&#30340;&#24341;&#29992;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362649745986" ID="ID_1943555884" LINK="#ID_589534618" MODIFIED="1362732141618">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;&#24341;&#29992;&#32773;&#30495;&#27491;&#24320;&#22987;&#38656;&#35201;&#34987;&#24341;&#29992;&#32773;&#26102;, &#23427;&#36890;&#36807;device_claim(struct device_user *dep)
    </p>
    <p>
      &#26469;&#23558;&#34987;&#24341;&#29992;&#35774;&#22791;bring up&#36215;&#26469;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362730543593" FOLDED="true" ID="ID_1680298155" MODIFIED="1362734799028" TEXT="main device&#x7684;present(&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x5b58;&#x5728;)&#x5c06;&#x5bfc;&#x81f4;interface&#x7684;available(main device&#x53ef;&#x7528;)&#xa;&#x4e00;&#x4e2a;interface&#x5f15;&#x7528;&#x4e86;&#x5b83;&#x7684;main device, &#x5f53;main device&#x5728;&#x64cd;&#x4f5c;&#x7cfb;&#x7edf;&#x4e2d;&#x521b;&#x5efa;&#x8d77;&#x6765;&#x65f6;&#xa;&#x4f1a;&#x5e7f;&#x64ad;DEV_EVENT_ADD&#x6d88;&#x606f;&#x7ed9;device&#x7684;&#x7528;&#x6237;,&#x663e;&#x7136;interface&#x662f;&#x5b83;&#x7684;main device&#xa;&#x7684;&#x7528;&#x6237;,&#x8fd9;&#x65f6;interface&#x4f1a;&#x88ab;&#x6807;&#x8bb0;&#x4e3a;available,&#x800c;&#x8fd9;&#x4f1a;&#x8fde;&#x9501;&#x7684;&#x89e6;&#x53d1;interface&#x7684;bring up">
<node CREATED="1362730940460" ID="ID_932150191" MODIFIED="1362730942650" TEXT="device_set_present">
<node CREATED="1362730955014" ID="ID_347710438" MODIFIED="1362730966721" TEXT="dev-&gt;sys_present = (true | false)"/>
<node CREATED="1362730976775" ID="ID_917947638" MODIFIED="1362730977544" TEXT="device_refresh_present">
<node CREATED="1362731036667" ID="ID_268742417" MODIFIED="1362731107734" TEXT="&#x5982;&#x679c;device&#x88ab;disabled &#x6216; deferred, &#x5219;&#x8fd8;&#x662f;&#x6807;&#x8bb0;dev-&gt;present&#x4e3a;false"/>
<node CREATED="1362731014982" ID="ID_425000085" MODIFIED="1362731016342" TEXT="__device_set_present">
<node CREATED="1362731136506" ID="ID_879433984" MODIFIED="1362731146691" TEXT="dev-&gt;present = dev-&gt;sys_present"/>
<node CREATED="1362731168681" ID="ID_1018149271" MODIFIED="1362731690747" TEXT="device_broadcast_event(dev, (DEV_EVENT_ADD | DEV_EVENT_REMOVE))&#xa;&#x5411;&#x6b64;device&#x7684;&#x6240;&#x6709;&#x7528;&#x6237;&#x53d1;&#x9001;DEV_EVENT_ADD &#x6216; DEV_EVENT_REMOVE&#x6d88;&#x606f;.&#xa;&#x4e0d;&#x540c;&#x7684;&#x7528;&#x6237;&#x4f1a;&#x5bf9;&#x6b64;&#x6d88;&#x606f;&#x505a;&#x51fa;&#x4e0d;&#x540c;&#x7684;&#x54cd;&#x5e94;">
<node CREATED="1362731697010" ID="ID_1125672815" LINK="#ID_108968343" MODIFIED="1362731751152" TEXT="&#x82e5;&#x7528;&#x6237;&#x662f;interface, &#x5219;&#x8c03;&#x7528;&#x56de;&#x8c03;&#x51fd;&#x6570;interface_cb&#x54cd;&#x5e94;"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1362804268751" ID="ID_1474220823" LINK="#ID_692627412" MODIFIED="1362814759072" TEXT="udhcpc&#x6216;pppd&#x662f;&#x5982;&#x4f55;&#x5c06;&#x83b7;&#x53d6;&#x5230;&#x7684;IP&#x76f8;&#x5173;&#x4fe1;&#x606f;&#x544a;&#x8bc9;&#x7ed9;netifd&#x7684;"/>
<node CREATED="1362804339819" ID="ID_83340095" MODIFIED="1362804392640" TEXT="&#x5f53;&#x67d0;&#x4e2a;&#x7f51;&#x7edc;&#x63a5;&#x53e3;&#x7684;&#x94fe;&#x8def;&#x72b6;&#x6001;&#x53d8;&#x5316;&#x65f6;&#x662f;&#x5982;&#x4f55;&#x901a;&#x77e5;&#x7ed9;netifd&#x7684;"/>
</node>
</node>
</node>
<node CREATED="1342681966576" FOLDED="true" ID="ID_1052819808" MODIFIED="1381485437556" POSITION="right" TEXT="luci">
<node CREATED="1369234400679" FOLDED="true" ID="ID_1154766584" MODIFIED="1370099888122" TEXT="&#x76ee;&#x5f55;&#x7ed3;&#x6784;">
<node CREATED="1369234411377" ID="ID_1783274183" MODIFIED="1369234475439" TEXT="luci &#x7f16;&#x8bd1;&#x65f6;&#x7684;&#x76ee;&#x5f55;&#x7ed3;&#x6784;">
<node CREATED="1369235208204" FOLDED="true" ID="ID_1554038112" MODIFIED="1369235393114" TEXT="applications&#xa;&#x5404;&#x79cd;&#x5e94;&#x7528;">
<node CREATED="1369235254947" ID="ID_974700583" MODIFIED="1369235283245" TEXT="xxx, &#x76ee;&#x5f55;&#x7ed3;&#x6784;&#x4e0e;modules&#x76f8;&#x540c;"/>
</node>
<node CREATED="1369234514398" ID="ID_604654786" MODIFIED="1369234563365" TEXT="modules&#xa;&#x5404;&#x6a21;&#x5757;, module&#x4e0e;application&#x7684;&#x533a;&#x522b;:">
<node CREATED="1369234581605" ID="ID_989681211" MODIFIED="1369234601114" TEXT="xxx, &#x6bd4;&#x5982;admin-full">
<node CREATED="1369234609711" ID="ID_439741621" MODIFIED="1369234751827" TEXT="dist, &#x8fd0;&#x884c;&#x65f6;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;"/>
<node CREATED="1369234609711" ID="ID_1156430348" MODIFIED="1369234903404" TEXT="root, &#x6b64;&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6240;&#x6709;&#x5185;&#x5bb9;&#x5c06;&#x5b8c;&#x5168;&#x590d;&#x5236;&#x5230;&#x8fd0;&#x884c;&#x65f6;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x7684;&#x6839;&#x76ee;&#x5f55;/&#x4e0b;"/>
<node CREATED="1369234791082" ID="ID_519598665" MODIFIED="1369234872592" TEXT="luasrc, &#x6b64;&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6240;&#x6709;&#x5185;&#x5bb9;&#x5c06;&#x590d;&#x5236;&#x5230;&#x8fd0;&#x884c;&#x65f6;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x7684;/usr/lib/lua/luci&#x4e0b;"/>
<node CREATED="1369234791082" ID="ID_530847894" MODIFIED="1369234933022" TEXT="lua, &#x6b64;&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6240;&#x6709;&#x5185;&#x5bb9;&#x5c06;&#x590d;&#x5236;&#x5230;&#x8fd0;&#x884c;&#x65f6;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x7684;/usr/lib/lua&#x4e0b;"/>
<node CREATED="1369234791082" ID="ID_957301155" MODIFIED="1369234975206" TEXT="htdocs, &#x6b64;&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6240;&#x6709;&#x5185;&#x5bb9;&#x5c06;&#x590d;&#x5236;&#x5230;&#x8fd0;&#x884c;&#x65f6;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x7684;/www&#x4e0b;"/>
</node>
</node>
<node CREATED="1369235298888" FOLDED="true" ID="ID_373837893" MODIFIED="1369235390906" TEXT="i18n&#xa;&#x8bed;&#x8a00;&#x672c;&#x5730;&#x5316;&#x7684;&#x8d44;&#x6e90;&#x6587;&#x4ef6;">
<node CREATED="1369235254947" ID="ID_326178371" MODIFIED="1369235283245" TEXT="xxx, &#x76ee;&#x5f55;&#x7ed3;&#x6784;&#x4e0e;modules&#x76f8;&#x540c;"/>
</node>
<node CREATED="1369235298888" FOLDED="true" ID="ID_1898136899" MODIFIED="1369235391626" TEXT="libs&#xa;lua&#x5e93;">
<node CREATED="1369235254947" ID="ID_1512429899" MODIFIED="1369235283245" TEXT="xxx, &#x76ee;&#x5f55;&#x7ed3;&#x6784;&#x4e0e;modules&#x76f8;&#x540c;"/>
</node>
<node CREATED="1369235298888" FOLDED="true" ID="ID_747708537" MODIFIED="1369235464509" TEXT="protocols&#xa;&#x5404;&#x79cd;&#x534f;&#x8bae;">
<node CREATED="1369235254947" ID="ID_1922348713" MODIFIED="1369235283245" TEXT="xxx, &#x76ee;&#x5f55;&#x7ed3;&#x6784;&#x4e0e;modules&#x76f8;&#x540c;"/>
</node>
<node CREATED="1369235298888" FOLDED="true" ID="ID_403402387" MODIFIED="1369235494450" TEXT="themes&#xa;&#x9875;&#x9762;&#x98ce;&#x683c;">
<node CREATED="1369235254947" ID="ID_909727178" MODIFIED="1369235283245" TEXT="xxx, &#x76ee;&#x5f55;&#x7ed3;&#x6784;&#x4e0e;modules&#x76f8;&#x540c;"/>
</node>
</node>
<node CREATED="1369234449684" ID="ID_727551613" MODIFIED="1369234467674" TEXT="luci &#x8fd0;&#x884c;&#x65f6;&#x7684;&#x76ee;&#x5f55;&#x7ed3;&#x6784;"/>
</node>
<node CREATED="1370052453378" ID="ID_621251694" MODIFIED="1370052463985" TEXT="MVC">
<node CREATED="1370052465312" FOLDED="true" ID="ID_1534721610" MODIFIED="1381485433406" TEXT="controller : &#x63a7;&#x5236;&#x5982;&#x4f55;&#x663e;&#x793a;">
<node CREATED="1370052745577" ID="ID_844196490" MODIFIED="1370052876762" TEXT="index&#x51fd;&#x6570; : luci&#x8fd0;&#x884c;&#x65f6;&#x4f1a;&#x626b;&#x63cf;/usr/lib/lua/luci/controller/&#x7528;&#x6237;&#x540d;&#x5982;xxx&#x4e0b;&#x7684;&#x5404;&#x4e2a;&#x6587;&#x4ef6;,&#xa;&#x5e76;&#x8c03;&#x7528;&#x5176;&#x4e2d;&#x7684;index&#x51fd;&#x6570;&#x4ee5;&#x6784;&#x5efa;&#x7f51;&#x9875;"/>
<node CREATED="1370052956389" ID="ID_1466304588" MODIFIED="1370053058967" TEXT="node : &#x8282;&#x70b9;,&#x672c;&#x8eab;&#x5e76;&#x4e0d;&#x663e;&#x793a;&#x9875;&#x9762;,&#x7528;&#x4e8e;&#x5305;&#x542b;&#x4e0b;&#x4e00;&#x7ea7;&#x8282;&#x70b9;,&#x8d77;&#x5230;&#x76ee;&#x5f55;&#x4f5c;&#x7528;">
<node CREATED="1370053121551" ID="ID_878780007" MODIFIED="1370054113463" TEXT="&#x5b9a;&#x4e49; : function node(path), &#x4f8b;&#x5982;:&#xa;page = node(&quot;admin&quot;, &quot;network&quot;)"/>
<node CREATED="1370053125935" ID="ID_76293746" MODIFIED="1370053129561" TEXT="&#x5c5e;&#x6027;">
<node CREATED="1370053236329" ID="ID_1746183026" MODIFIED="1370053263080" TEXT="page.target, &#x5982;&#x4f55;&#x663e;&#x793a;&#x4e0b;&#x4e00;&#x7ea7;&#x8282;&#x70b9;,&#x901a;&#x5e38;&#x4e3a; firstchild()"/>
<node CREATED="1370053330494" ID="ID_1397487713" MODIFIED="1370053646044" TEXT="page.title, &#x663e;&#x793a;&#x5728;&#x9875;&#x9762;&#x4e0a;&#x7684;&#x6807;&#x9898;, _(&#x4efb;&#x610f;&#x5b57;&#x7b26;&#x4e32;),&#x6ce8;&#x610f;&#x7528;_()&#x5305;&#x56f4;"/>
<node CREATED="1370053434807" ID="ID_867934879" MODIFIED="1370053463125" TEXT="page.order, &#x672c;&#x8282;&#x70b9;&#x5728;&#x4e0a;&#x4e00;&#x7ea7;&#x8282;&#x70b9;&#x4e2d;&#x7684;&#x663e;&#x793a;&#x987a;&#x5e8f;"/>
<node CREATED="1370053494891" ID="ID_810356312" MODIFIED="1370053497182" TEXT="page.index"/>
</node>
</node>
<node CREATED="1370052956389" ID="ID_1983674647" MODIFIED="1370060463880" TEXT="entry : &#x53f6;&#x8282;&#x70b9;,&#x672c;&#x8eab;&#x663e;&#x793a;&#x9875;&#x9762;,&#x4e0d;&#x5305;&#x542b;&#x4e0b;&#x4e00;&#x7ea7;&#x8282;&#x70b9;,&#xa;&#x4e0e;node&#x5176;&#x5b9e;&#x662f;&#x540c;&#x4e00;&#x79cd;&#x5bf9;&#x8c61;,&#x53ea;&#x662f;&#x5c5e;&#x6027;&#x4e0d;&#x540c;">
<node CREATED="1370053121551" ID="ID_863365882" MODIFIED="1370054169528" TEXT="&#x5b9a;&#x4e49; : function entry(path, target, title, order), &#x4f8b;&#x5982;:&#xa;page = entry({&quot;admin&quot;, &quot;network&quot;, &quot;network&quot;}, cbi(&quot;admin_network/ifaces&quot;), _(&quot;Interfaces&quot;), 10)"/>
<node CREATED="1370053125935" ID="ID_1513477263" MODIFIED="1370053129561" TEXT="&#x5c5e;&#x6027;">
<node CREATED="1370053236329" ID="ID_1888536250" MODIFIED="1370054273466" TEXT="page.target, &#x5982;&#x4f55;&#x663e;&#x793a;&#x9875;&#x9762;, &#x6709;3&#x79cd;&#x65b9;&#x6cd5;&#x663e;&#x793a;&#x9875;&#x9762;">
<node CREATED="1370054316317" ID="ID_1351197942" MODIFIED="1370054977955" TEXT="function call(name, ...), &apos;...&apos;&#x8868;&#x793a;&#x4f20;&#x7ed9;&#x51fd;&#x6570;name&#x7684;&#x53c2;&#x6570;&#xa;&#x4e00;&#x822c;&#x6765;&#x8bf4;,&#x6b64;&#x79cd;&#x9875;&#x8282;&#x70b9;&#x5e76;&#x4e0d;&#x7528;&#x4e8e;&#x663e;&#x793a;&#x9875;&#x9762;,&#x800c;&#x662f;&#x7528;&#x4e8e;&#x6267;&#x884c;&#x67d0;&#x4e9b;&#x52a8;&#x4f5c;&#xa;&#x5f53;&#x7136;&#x4f60;&#x4e5f;&#x53ef;&#x4ee5;&#x5728;&#x6b64;&#x51fd;&#x6570;&#x4e2d;&#x6267;&#x884c;&#x663e;&#x793a;&#x4efb;&#x52a1;,&#x53ea;&#x4e0d;&#x8fc7;&#x6bd4;&#x8f83;&#x7e41;&#x7410;&#x800c;&#x5df2;.">
<node CREATED="1370054846404" ID="ID_29314750" MODIFIED="1370054859677" TEXT="&#x8c03;&#x7528;&#x51fd;&#x6570;&#x4ee5;&#x6267;&#x884c;&#x52a8;&#x4f5c;">
<node CREATED="1370054908872" ID="ID_201941635" MODIFIED="1370054910192" TEXT="luci.sys.reboot()"/>
</node>
<node CREATED="1370054363684" ID="ID_56121975" MODIFIED="1370054842889" TEXT="&#x8c03;&#x7528;&#x51fd;&#x6570;&#x4ee5;&#x663e;&#x793a;&#x9875;&#x9762;">
<node CREATED="1370054473279" ID="ID_195122923" MODIFIED="1370054506099" TEXT="luci.http.prepare_content(&quot;text/plain&quot;)&#xa;luci.http.write(&quot;web page content&quot;)"/>
</node>
<node CREATED="1370097865063" ID="ID_536148868" MODIFIED="1370097903293" TEXT="&#x4ea4;&#x4e92;">
<node CREATED="1370097905252" ID="ID_652820938" MODIFIED="1370097927939" TEXT="&#x5982;&#x4f55;&#x4ece;&#x9875;&#x9762;&#x8bf7;&#x6c42;&#x4e2d;&#x83b7;&#x53d6;&#x6240;&#x9700;&#x4fe1;&#x606f;"/>
<node CREATED="1370097928695" ID="ID_1581439548" MODIFIED="1370097945953" TEXT="&#x5982;&#x4f55;&#x4e0e;&#x7cfb;&#x7edf;&#x8fdb;&#x884c;&#x4ea4;&#x4e92;"/>
<node CREATED="1370097946909" ID="ID_329885272" MODIFIED="1370097978376" TEXT="&#x5982;&#x4f55;&#x5c06;&#x6267;&#x884c;&#x7ed3;&#x679c;&#x8fd4;&#x56de;&#x7ed9;&#x5ba2;&#x6237;&#x7aef;&#x6d4f;&#x89c8;&#x5668;"/>
</node>
</node>
<node CREATED="1370057225980" ID="ID_780375850" MODIFIED="1370058512646" TEXT="function cbi(model, config)&#xa;&#x8c03;&#x7528;/usr/lib/lua/luci/model/cbi/xx_model_xx&#x6307;&#x5b9a;&#x7684;&#x6587;&#x4ef6;&#x6765;&#x663e;&#x793a;&#x9875;&#x9762;">
<node CREATED="1370058550654" ID="ID_998828667" MODIFIED="1370058664695" TEXT="model : model&#x6587;&#x4ef6;&#x76f8;&#x5bf9;&#x4e8e;usr/lib/lua/luci/model/cbi&#x7684;&#x8def;&#x5f84;"/>
<node CREATED="1370058691705" ID="ID_1240366328" MODIFIED="1370058695920" TEXT="config">
<node CREATED="1370058708972" ID="ID_1160679244" MODIFIED="1370058760429" TEXT="on_valid_to : &#x6307;&#x5b9a;valid&#x65f6;&#x91cd;&#x5b9a;&#x5411;&#x7684;&#x9875;&#x9762;&#x4f4d;&#x7f6e;"/>
<node CREATED="1370058708972" ID="ID_403938598" MODIFIED="1370058928429" TEXT="on_changed_to : &#x6307;&#x5b9a;change&#x65f6;&#x91cd;&#x5b9a;&#x5411;&#x7684;&#x9875;&#x9762;&#x4f4d;&#x7f6e;"/>
<node CREATED="1370058708972" ID="ID_212781274" MODIFIED="1370058935672" TEXT="on_success_to : &#x6307;&#x5b9a;success&#x65f6;&#x91cd;&#x5b9a;&#x5411;&#x7684;&#x9875;&#x9762;&#x4f4d;&#x7f6e;"/>
<node CREATED="1370058708972" ID="ID_483346075" MODIFIED="1370058908779" TEXT="state_handler : &#x6307;&#x5b9a;state&#x6539;&#x53d8;&#x65f6;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1370058823749" ID="ID_822512787" MODIFIED="1370059125420" TEXT="noheader : &#x4e0d;&#x8981;&#x663e;&#x793a;&#x9875;&#x7709;(&#x5373;&#x9875;&#x9762;&#x9876;&#x7aef;&#x7684;&#x9875;&#x9762;&#x5bfc;&#x822a;&#x680f;)"/>
<node CREATED="1370058841101" ID="ID_1410276156" MODIFIED="1370058873681" TEXT="nofooter : &#x4e0d;&#x8981;&#x663e;&#x793a;&#x9875;&#x811a;"/>
</node>
</node>
<node CREATED="1370059232020" ID="ID_1511333832" MODIFIED="1370059368577" TEXT="function template(name)&#xa;&#x8c03;&#x7528;/usr/lib/lua/luci/view/xxx_name_xxx&#x6307;&#x5b9a;&#x7684;html&#x6587;&#x4ef6;&#x6765;&#x663e;&#x793a;&#x9875;&#x9762;"/>
</node>
<node CREATED="1370053330494" ID="ID_1511305899" MODIFIED="1370053646044" TEXT="page.title, &#x663e;&#x793a;&#x5728;&#x9875;&#x9762;&#x4e0a;&#x7684;&#x6807;&#x9898;, _(&#x4efb;&#x610f;&#x5b57;&#x7b26;&#x4e32;),&#x6ce8;&#x610f;&#x7528;_()&#x5305;&#x56f4;"/>
<node CREATED="1370053434807" ID="ID_1959146127" MODIFIED="1370053463125" TEXT="page.order, &#x672c;&#x8282;&#x70b9;&#x5728;&#x4e0a;&#x4e00;&#x7ea7;&#x8282;&#x70b9;&#x4e2d;&#x7684;&#x663e;&#x793a;&#x987a;&#x5e8f;"/>
<node CREATED="1370053494891" ID="ID_1847539664" MODIFIED="1370060470272" TEXT="page.leaf = true, &#x672c;&#x8282;&#x70b9;&#x662f;&#x53f6;&#x8282;&#x70b9;"/>
</node>
</node>
</node>
<node CREATED="1370052511456" ID="ID_1280606276" MODIFIED="1370052555925" TEXT="model : &#x6570;&#x636e;"/>
<node CREATED="1370052516333" ID="ID_66882355" MODIFIED="1370052575229" TEXT="view : &#x663e;&#x793a;&#x7684;&#x683c;&#x5f0f;"/>
</node>
</node>
<node CREATED="1343099945789" FOLDED="true" ID="ID_1249525101" MODIFIED="1361951109392" POSITION="left" TEXT="stream_engine">
<node CREATED="1343099992536" FOLDED="true" ID="ID_941357719" MODIFIED="1362565806253">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#37197;&#32622;&#25509;&#21475;
    </p>
  </body>
</html></richcontent>
<node CREATED="1343113972334" FOLDED="true" ID="ID_522959975" MODIFIED="1353637102602">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uci : /etc/config/network
    </p>
  </body>
</html></richcontent>
<node CREATED="1343100132675" FOLDED="true" ID="ID_505234470" MODIFIED="1343128739605" TEXT="streamengine">
<node CREATED="1343100153458" ID="ID_167908573" MODIFIED="1343100166961" TEXT="traffic_shaping"/>
<node CREATED="1343100177569" ID="ID_1388602287" MODIFIED="1343100178898" TEXT="auto_uplink"/>
<node CREATED="1343100186177" ID="ID_1104095082" MODIFIED="1343100187404" TEXT="qos_uplink"/>
<node CREATED="1343100194673" ID="ID_1056098876" MODIFIED="1343100196122" TEXT="hop_offset"/>
<node CREATED="1343100203824" ID="ID_838717619" MODIFIED="1343100205261" TEXT="qos_enable"/>
<node CREATED="1343100212320" ID="ID_526906750" MODIFIED="1343100213619" TEXT="link_type"/>
<node CREATED="1343100220720" ID="ID_808933928" MODIFIED="1343100222117" TEXT="auto_classification"/>
<node CREATED="1343100229247" ID="ID_174040232" MODIFIED="1343100230840" TEXT="qos_dyn_fragmentation"/>
<node CREATED="1343100240367" ID="ID_523728251" MODIFIED="1343100242137" TEXT="bittorrent_classification"/>
<node CREATED="1343100251007" ID="ID_1668127410" MODIFIED="1343100252361" TEXT="http_content_classification"/>
<node CREATED="1343100260072" ID="ID_1475201297" MODIFIED="1343100261423" TEXT="user_rules_classification"/>
<node CREATED="1343100275742" FOLDED="true" ID="ID_245268421" MODIFIED="1343128731717" TEXT="qos_rule_xx">
<node CREATED="1343100325900" ID="ID_774963527" MODIFIED="1343100369258" TEXT="&#x683c;&#x5f0f;:&#xa;&lt;en dis&gt;/&lt;name&gt;/&lt;prio&gt;/&lt;unused&gt;/&lt;unused&gt;/&lt;proto&gt;/&#xa;&lt;local ip from&gt;/&lt;local ip to&gt;/&lt;local port from&gt;/&lt;local port to&gt;/&#xa;&lt;remote ip from&gt;/&lt;remote ip to&gt;/&lt;remote port from&gt;/&lt;remote port to&gt;"/>
</node>
<node CREATED="1343100387242" FOLDED="true" ID="ID_742974332" MODIFIED="1343113961061" TEXT="http_content_rule_xx">
<node CREATED="1343100406393" ID="ID_1132980232" MODIFIED="1343100417578" TEXT="&#x683c;&#x5f0f; : &lt;en dis&gt;/&lt;name&gt;/&lt;prio&gt;/&lt;major&gt;/&lt;minor&gt;"/>
</node>
</node>
<node CREATED="1343100438232" FOLDED="true" ID="ID_975934187" MODIFIED="1343114020315" TEXT="network_accelerator">
<node CREATED="1343100456503" ID="ID_98627069" MODIFIED="1343100458460" TEXT="auto_load"/>
</node>
<node CREATED="1343100452936" FOLDED="true" ID="ID_1257737320" MODIFIED="1343114022203" TEXT="wanmon">
<node CREATED="1343100479367" ID="ID_1736080288" MODIFIED="1343100480877" TEXT="enabled"/>
</node>
</node>
<node CREATED="1343114248172" FOLDED="true" ID="ID_699441565" MODIFIED="1353637106314" TEXT="proc sys : /sys/devices/system">
<node CREATED="1343114248172" FOLDED="true" ID="ID_787452101" MODIFIED="1343120927561" TEXT="streamengine_classifier">
<node CREATED="1343114248173" FOLDED="true" ID="ID_416982378" MODIFIED="1362565806253" TEXT="streamengine_classifier0">
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="shaper_loaded"/>
<node CREATED="1343114248173" ID="ID_1248413773" MODIFIED="1343114248173" TEXT="streamengine_classifier_if_name"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="streamengine_classifier_stop"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="terminate"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="wan_mode"/>
</node>
</node>
<node CREATED="1343114248173" FOLDED="true" ID="ID_979066669" MODIFIED="1343114349663" TEXT="streamengine_classifier_bittorrent">
<node CREATED="1343114248173" FOLDED="true" ID="ID_324994818" MODIFIED="1343114349662" TEXT="streamengine_classifier_bittorrent0">
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="enabled"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="peer_count"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="qos"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="sensitivity"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="state_dev_major"/>
<node CREATED="1343114248173" MODIFIED="1343114248173" TEXT="terminate"/>
</node>
</node>
<node CREATED="1343114248173" FOLDED="true" ID="ID_513680198" MODIFIED="1343114349665" TEXT="streamengine_classifier_default">
<node CREATED="1343114248173" FOLDED="true" ID="ID_197928840" MODIFIED="1343114349663" TEXT="streamengine_classifier_default0">
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="accel_on_link"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="enabled"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="state_dev_major"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="terminate"/>
</node>
</node>
<node CREATED="1343114248174" FOLDED="true" ID="ID_20749264" MODIFIED="1343114349666" TEXT="streamengine_classifier_http_content">
<node CREATED="1343114248174" FOLDED="true" ID="ID_1091144346" MODIFIED="1343114349666" TEXT="streamengine_classifier_http_content0">
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="add_http_type"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="clear_http_types"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="enabled"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="http_content_qos"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="state_dev_major"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="terminate"/>
</node>
</node>
<node CREATED="1343114248174" FOLDED="true" ID="ID_47321683" MODIFIED="1343114349667" TEXT="streamengine_classifier_user_rules">
<node CREATED="1343114248174" FOLDED="true" ID="ID_1981627074" MODIFIED="1343114349666" TEXT="streamengine_classifier_user_rules0">
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="add_manual_rule"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="clear_manual_rules"/>
<node CREATED="1343114248174" MODIFIED="1343114248174" TEXT="enabled"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="terminate"/>
</node>
</node>
<node CREATED="1343114248175" FOLDED="true" ID="ID_1264215594" MODIFIED="1343121328546" TEXT="streamengine_db">
<node CREATED="1343114248175" FOLDED="true" ID="ID_30194784" MODIFIED="1343114349668" TEXT="streamengine_db0">
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="accel_limit_default"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="allow_reap"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="connection_count"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="connection_counts_simple"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="connection_event_count"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="connections_max"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="expire_all"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="host_count"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="iface_count"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="mapping_count"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="mapping_event_count"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="node_count"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="state_dev_major"/>
<node CREATED="1343114248175" MODIFIED="1343114248175" TEXT="terminate"/>
<node CREATED="1343114248176" MODIFIED="1343114248176" TEXT="tracked_data"/>
<node CREATED="1343114248176" MODIFIED="1343114248176" TEXT="tracked_data_limit"/>
</node>
</node>
<node CREATED="1343114248176" FOLDED="true" ID="ID_72665446" MODIFIED="1343121330138" TEXT="ubi32_na">
<node CREATED="1343114248176" FOLDED="true" ID="ID_1544257122" MODIFIED="1343120924841" TEXT="ubi32_na0">
<node CREATED="1343114248176" MODIFIED="1343114248176" TEXT="cache_dev_major"/>
<node CREATED="1343114248176" MODIFIED="1343114248176" TEXT="reset_counters"/>
</node>
</node>
<node CREATED="1343121331290" FOLDED="true" ID="ID_647083176" MODIFIED="1343121382144" TEXT="ubicom_na_connection_manager_ipv4">
<node CREATED="1343121363000" FOLDED="true" ID="ID_1715045162" MODIFIED="1343121380816" TEXT="ubicom_na_connection_manager_ipv40">
<node CREATED="1343121367480" ID="ID_606200278" MODIFIED="1343121369444" TEXT="stop"/>
<node CREATED="1343121369896" ID="ID_268666195" MODIFIED="1343121378340" TEXT="terminate"/>
</node>
</node>
</node>
</node>
<node CREATED="1343100010104" ID="ID_1327780543" MODIFIED="1343100035187" TEXT="&#x8fd0;&#x884c;&#x811a;&#x672c;"/>
<node CREATED="1343100036087" FOLDED="true" ID="ID_1731772819" MODIFIED="1362565806253" TEXT="&#x5185;&#x6838;&#x6a21;&#x5757;">
<node CREATED="1343117810974" FOLDED="true" ID="ID_139233140" MODIFIED="1353637108123">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ubicom_streamengine_classifier.c
    </p>
    <p>
      streamengine_classifier_thread_fn
    </p>
  </body>
</html></richcontent>
<node CREATED="1343117903754" FOLDED="true" ID="ID_1319783583" MODIFIED="1343118055052" TEXT="streamengine_classifier_dummy_inst">
<node CREATED="1343117936329" ID="ID_1004891433" MODIFIED="1343117989454" TEXT="process = streamengine_classifier_process_callback; &#x9;&#xa;ref = streamengine_classifier_ref_callback; &#x9;&#xa;deref = streamengine_classifier_deref_callback; &#x9;&#xa;na_sync = streamengine_classifier_na_sync_callback; &#x9;&#xa;sync_na = streamengine_classifier_sync_na_callback;"/>
</node>
<node CREATED="1343117917034" FOLDED="true" ID="ID_1033130583" MODIFIED="1343118054388" TEXT="streamengine_classifier_dummy_inst_tcp">
<node CREATED="1343117948312" ID="ID_895945967" MODIFIED="1343118021141" TEXT="process = streamengine_classifier_process_tcp_callback; &#x9;&#xa;ref = streamengine_classifier_ref_callback; &#x9;&#xa;deref = streamengine_classifier_deref_callback; &#x9;&#xa;na_sync = streamengine_classifier_na_sync_callback; &#x9;&#xa;sync_na = streamengine_classifier_sync_na_callback;"/>
</node>
<node CREATED="1343118057620" ID="ID_515163549" LINK="#ID_787452101" MODIFIED="1343118075388" TEXT="&#x6ce8;&#x518c;sys fs"/>
<node CREATED="1343118115170" FOLDED="true" ID="ID_747155173" MODIFIED="1362565806253">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;nf_register_hooks&#22312;postrouting&#27880;&#20876;hook
    </p>
    <p>
      streamengine_classifier_ipv4_ops_post_routing
    </p>
  </body>
</html></richcontent>
<node CREATED="1343126450122" FOLDED="true" ID="ID_974294914" MODIFIED="1362565806253" TEXT="streamengine_classifier_process">
<node CREATED="1343126564598" ID="ID_124312526" MODIFIED="1343126578153" TEXT="&#x5982;&#x679c;&#x662f;tcp&#x5219;&#x8c03;&#x7528;streamengine_classifier_tcp_process"/>
<node CREATED="1343126588886" FOLDED="true" ID="ID_630284445" MODIFIED="1362565806253" TEXT="&#x5982;&#x679c;&#x662f;udp&#x5219;&#x8c03;&#x7528;streamengine_classifier_udp_process">
<node CREATED="1343127681485" FOLDED="true" ID="ID_388981619" MODIFIED="1343212290830">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#27492;&#36830;&#25509;&#19981;&#22312;&#25968;&#25454;&#24211;streamengine_db_connection_table&#20013;&#21017;
    </p>
    <p>
      &#35843;&#29992;streamengine_db_connection_add&#23558;&#36830;&#25509;&#28155;&#21152;&#21040;&#25968;&#25454;&#24211;&#20013;
    </p>
  </body>
</html></richcontent>
<node CREATED="1343130094850" ID="ID_1261025329" MODIFIED="1343130100445" TEXT="&#x521d;&#x59cb;&#x5316;ci"/>
<node CREATED="1343130102785" ID="ID_1727369584" MODIFIED="1343130196814" TEXT="&#x5c06;ci&#x52a0;&#x5165;&#x6570;&#x636e;&#x5e93;streamengine_db_connection_table"/>
<node CREATED="1343130241821" ID="ID_1703322037" MODIFIED="1343130259874" TEXT="&#x5c06;ci&#x52a0;&#x5165;FROM mapping&#x94fe;&#x8868;"/>
<node CREATED="1343130241821" ID="ID_630651637" MODIFIED="1343130276163" TEXT="&#x5c06;ci&#x52a0;&#x5165;TO mapping&#x94fe;&#x8868;"/>
<node CREATED="1343130241821" ID="ID_757908856" MODIFIED="1343130288755" TEXT="&#x5c06;ci&#x52a0;&#x5165;FROM NAT mapping&#x94fe;&#x8868;"/>
<node CREATED="1343130241821" ID="ID_1530569644" MODIFIED="1343130298049" TEXT="&#x5c06;ci&#x52a0;&#x5165;TO NAT mapping&#x94fe;&#x8868;"/>
<node CREATED="1343129550886" ID="ID_1522021716" MODIFIED="1343129584145" TEXT="&#x5982;&#x679c;ci&#x8fd8;&#x6ca1;&#x6709;&#x88ab;&#x653e;&#x5165;streamengine_db&#x7684;&#x4e8b;&#x4ef6;&#x5217;&#x8868;,&#x5219;&#x5c06;&#x5176;&#x653e;&#x5165;"/>
<node CREATED="1343129614548" ID="ID_510578124" MODIFIED="1343130369756">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;ci-&gt;flags&#19978;&#35774;&#32622;&#26631;&#24535;&#20301;STREAMENGINE_DB_CONNECTION_FLAGS_EVENT_ADDED
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343129649267" ID="ID_162917034" MODIFIED="1343129661776" TEXT="&#x5524;&#x9192;&#x5185;&#x6838;&#x7ebf;&#x7a0b;streamengine_db_thread&#x5904;&#x7406;&#x4e8b;&#x4ef6;"/>
</node>
<node CREATED="1343129337637" FOLDED="true" ID="ID_100561126" MODIFIED="1362565806253" TEXT="streamengine_db_connection_data_process">
<node CREATED="1343129709473" FOLDED="true" ID="ID_840758942" MODIFIED="1343212461463">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;ci-&gt;qos_type != STREAMENGINE_CONNECTION_QOS_TYPE_UNDETERMINED
    </p>
  </body>
</html></richcontent>
<node CREATED="1343129550886" ID="ID_1495599035" MODIFIED="1343129584145" TEXT="&#x5982;&#x679c;ci&#x8fd8;&#x6ca1;&#x6709;&#x88ab;&#x653e;&#x5165;streamengine_db&#x7684;&#x4e8b;&#x4ef6;&#x5217;&#x8868;,&#x5219;&#x5c06;&#x5176;&#x653e;&#x5165;"/>
<node CREATED="1343129614548" ID="ID_353847067" MODIFIED="1343129634994">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;ci-&gt;flags&#19978;&#35774;&#32622;&#26631;&#24535;&#20301;STREAMENGINE_DB_CONNECTION_FLAGS_EVENT_PROCESS
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343129649267" ID="ID_1735606584" MODIFIED="1343129661776" TEXT="&#x5524;&#x9192;&#x5185;&#x6838;&#x7ebf;&#x7a0b;streamengine_db_thread&#x5904;&#x7406;&#x4e8b;&#x4ef6;"/>
</node>
<node CREATED="1343129709473" FOLDED="true" ID="ID_1879623575" MODIFIED="1343212459343">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;ci-&gt;qos_type == STREAMENGINE_CONNECTION_QOS_TYPE_UNDETERMINED
    </p>
  </body>
</html></richcontent>
<node CREATED="1343129550886" ID="ID_1185958288" MODIFIED="1343129584145" TEXT="&#x5982;&#x679c;ci&#x8fd8;&#x6ca1;&#x6709;&#x88ab;&#x653e;&#x5165;streamengine_db&#x7684;&#x4e8b;&#x4ef6;&#x5217;&#x8868;,&#x5219;&#x5c06;&#x5176;&#x653e;&#x5165;"/>
<node CREATED="1343129614548" ID="ID_1472817983" MODIFIED="1343129796312">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;ci-&gt;flags&#19978;&#35774;&#32622;&#26631;&#24535;&#20301;STREAMENGINE_DB_CONNECTION_FLAGS_EVENT_DETERMINE
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343129649267" ID="ID_562571416" MODIFIED="1343129661776" TEXT="&#x5524;&#x9192;&#x5185;&#x6838;&#x7ebf;&#x7a0b;streamengine_db_thread&#x5904;&#x7406;&#x4e8b;&#x4ef6;"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1343118115170" ID="ID_1727340345" MODIFIED="1343210821847">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;nf_register_hooks&#22312;input&#27880;&#20876;hook
    </p>
    <p>
      streamengine_classifier_ipv4_ops_input
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343118205023" ID="ID_261826435" MODIFIED="1343121699391">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;ubicom_na_net_dev_register_ipv4_mgr&#27880;&#20876;&#21516;&#27493;&#20989;&#25968;
    </p>
    <p>
      streamengine_classifier_ipv4_net_dev_callback
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343118242366" ID="ID_1408682171" MODIFIED="1343118257407">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;ubicom_na_connection_expire_all_register&#27880;&#20876;
    </p>
    <p>
      streamengine_db_connection_expire_all
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343118276685" ID="ID_1907985016" MODIFIED="1343118289992" TEXT="&#x5185;&#x6838;&#x7ebf;&#x7a0b;&#x8fd0;&#x884c;"/>
<node CREATED="1343118291340" ID="ID_11869530" MODIFIED="1343118301283" TEXT="&#x5185;&#x6838;&#x7ebf;&#x7a0b;&#x6e05;&#x7406;&#x9000;&#x51fa;"/>
</node>
<node CREATED="1343120819213" FOLDED="true" ID="ID_137812124" MODIFIED="1343126085488">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ubicom_na_connection_manager_ipv4.c
    </p>
    <p>
      ubicom_na_connection_manager_ipv4_thread_fn
    </p>
  </body>
</html></richcontent>
<node CREATED="1343120882634" ID="ID_1244175906" LINK="#ID_647083176" MODIFIED="1343121391920" TEXT="&#x6ce8;&#x518c;sys fs"/>
<node CREATED="1343118115170" FOLDED="true" ID="ID_1791740878" MODIFIED="1343126084328">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;nf_register_hooks&#22312;postrouting&#27880;&#20876;hook
    </p>
    <p>
      ubicom_na_connection_manager_ipv4_ops_post_routing
    </p>
  </body>
</html></richcontent>
<node CREATED="1343122397666" ID="ID_919819601" LINK="#ID_249753863" MODIFIED="1343122835586" TEXT="&#x5bf9;&#x4e8e;&#x65b0;&#x5efa;&#x7acb;&#x7684;&#x8fde;&#x63a5;&#x8c03;&#x7528;ubicom_na_create_ipv4_rule&#x6dfb;&#x52a0;&#x5230;NA&#x52a0;&#x901f;&#x5668;&#x4e2d;"/>
</node>
<node CREATED="1343121512067" ID="ID_1650596681" MODIFIED="1343121545668">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;nf_conntrack_register_notifier&#27880;&#20876;&#20107;&#20214;&#36890;&#30693;&#20989;&#25968;
    </p>
    <p>
      ubicom_na_connection_manager_ipv4_conntrack_notifier
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343121595680" FOLDED="true" ID="ID_1974707653" MODIFIED="1343126070744" TEXT="&#x8c03;&#x7528;ubicom_na_net_dev_register_ipv4_mgr&#x6ce8;&#x518c;&#x540c;&#x6b65;&#x51fd;&#x6570;&#xa;ubicom_na_connection_manager_ipv4_net_dev_callback">
<node CREATED="1343121917972" ID="ID_344756900" MODIFIED="1343121948047" TEXT="&#x66f4;&#x65b0;connection&#x7684;&#x7edf;&#x8ba1;"/>
<node CREATED="1343121948739" ID="ID_1003722142" MODIFIED="1343122130192">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;&#26159;tcp&#36830;&#25509;&#21017;&#26356;&#26032;tcp&#29366;&#24577;
    </p>
    <p>
      NA&#21152;&#36895;&#22120;&#20250;&#23450;&#26102;&#35753;&#21253;&#22238;&#27969;&#21040;linux&#32593;&#32476;&#21327;&#35758;&#26632;,
    </p>
    <p>
      &#32780;TCP&#21327;&#35758;&#38656;&#35201;&#26816;&#26597;&#21253;&#30340;&#24207;&#21495;&#31354;&#38388;,&#25925;&#32780;&#36825;&#37324;&#38656;&#35201;
    </p>
    <p>
      &#21516;&#27493;TCP&#29366;&#24577;,&#21542;&#21017;&#22238;&#27969;&#30340;&#21253;&#20250;&#34987;&#20002;&#24323;.
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1343118276685" ID="ID_1701495567" MODIFIED="1343118289992" TEXT="&#x5185;&#x6838;&#x7ebf;&#x7a0b;&#x8fd0;&#x884c;"/>
<node CREATED="1343118291340" ID="ID_1513105415" MODIFIED="1343118301283" TEXT="&#x5185;&#x6838;&#x7ebf;&#x7a0b;&#x6e05;&#x7406;&#x9000;&#x51fa;"/>
</node>
<node CREATED="1343127898372" FOLDED="true" ID="ID_1016731905" MODIFIED="1362565806253" TEXT="&#x5168;&#x5c40;&#x53d8;&#x91cf;">
<node CREATED="1343127904212" FOLDED="true" ID="ID_123998818" MODIFIED="1353637093592" TEXT="struct streamengine_db_connection_instance streamengine_db_connection_table[xxx]">
<node CREATED="1343128187843" MODIFIED="1343128187843" TEXT=" struct streamengine_db_connection_instance *hash_next"/>
<node CREATED="1343128187843" MODIFIED="1343128187843" TEXT=" struct streamengine_db_connection_instance *hash_prev"/>
<node CREATED="1343128187843" MODIFIED="1343128187843" TEXT=" uint32_t from_mtu"/>
<node CREATED="1343128187843" MODIFIED="1343128187843" TEXT=" uint32_t to_mtu"/>
<node CREATED="1343128187843" MODIFIED="1343128187843" TEXT=" uint16_t pppoe_session_id"/>
<node CREATED="1343128187843" MODIFIED="1343128187843" TEXT=" uint8_t pppoe_remote_mac[ETH_ALEN]"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" uint16_t wan_mode"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" uint32_t time_added"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" uint32_t time_determined"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" int protocol"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" streamengine_db_direction_t direction"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" streamengine_db_connection_state_t state_from"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" streamengine_db_connection_state_t state_to"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" streamengine_db_connection_state_t state"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" bool can_accel"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" streamengine_db_connection_acceleration_mode_t accel_mode"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" int accel_count"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" int accel_limit"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" struct streamengine_db_mapping_instance *mapping_from"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" struct streamengine_db_mapping_instance *mapping_to"/>
<node CREATED="1343128187844" MODIFIED="1343128187844" TEXT=" struct streamengine_db_connection_instance *from_next"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_connection_instance *from_prev"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_connection_instance *to_next"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_connection_instance *to_prev"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_mapping_instance *mapping_nat_from"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_mapping_instance *mapping_nat_to"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_connection_instance *from_nat_next"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_connection_instance *from_nat_prev"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_connection_instance *to_nat_next"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" struct streamengine_db_connection_instance *to_nat_prev"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" streamengine_db_connection_final_callback_t final"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" streamengine_db_connection_expired_callback_t expired"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" streamengine_db_connection_reaped_callback_t reaped"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" streamengine_db_connection_generation_changed_callback_t generation_changed"/>
<node CREATED="1343128187845" ID="ID_1556973915" MODIFIED="1343128187845" TEXT=" streamengine_db_connection_accelerate_callback_t accelerate"/>
<node CREATED="1343128187845" MODIFIED="1343128187845" TEXT=" streamengine_db_connection_decelerate_callback_t decelerate"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" void *arg"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint32_t timeout"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" struct streamengine_db_connection_instance *timer_group_next"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" struct streamengine_db_connection_instance *timer_group_prev"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" streamengine_db_connection_timer_group_t timer_group"/>
<node CREATED="1343128187846" ID="ID_1794557196" MODIFIED="1343213210806">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;uint8_t qos
    </p>
    <p>
      QOS&#20998;&#31867;&#32467;&#26524;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343128187846" FOLDED="true" ID="ID_1480323025" MODIFIED="1343213428643">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;streamengine_db_connection_qos_type_t qos_type
    </p>
    <p>
      &#19978;&#38754;&#30340;QOS&#20998;&#31867;&#32467;&#26524;&#26159;&#21542;&#36824;&#21487;&#20197;&#34987;&#20854;&#20182;&#20998;&#31867;&#35268;&#21017;&#25913;&#21464;
    </p>
  </body>
</html></richcontent>
<node CREATED="1343213259290" ID="ID_364693957" MODIFIED="1343213379239">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      STREAMENGINE_CONNECTION_QOS_TYPE_UNDETERMINED
    </p>
    <p>
      &#36824;&#27809;&#26377;&#24471;&#21040;&#20998;&#31867;&#32467;&#26524;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343213268281" ID="ID_1111316480" MODIFIED="1343213395646">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      STREAMENGINE_CONNECTION_QOS_TYPE_FIXED
    </p>
    <p>
      &#20998;&#31867;&#32467;&#26524;&#19981;&#33021;&#20877;&#34987;&#25913;&#21464;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343213276889" ID="ID_1854748076" MODIFIED="1343213413758">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      STREAMENGINE_CONNECTION_QOS_TYPE_VARIABLE
    </p>
    <p>
      &#20998;&#31867;&#32467;&#26524;&#36824;&#21487;&#20197;&#32487;&#32493;&#34987;&#25913;&#21464;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343213287465" ID="ID_1888141485" MODIFIED="1343213427261">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      STREAMENGINE_CONNECTION_QOS_TYPE_INVALID
    </p>
    <p>
      &#20998;&#31867;&#32467;&#26524;&#26080;&#25928;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint16_t classifier_generation"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" struct streamengine_tracker_instance *tracki"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint64_t from_data_total"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint64_t to_data_total"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint64_t from_packet_total"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint64_t to_packet_total"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint64_t from_data_total_dropped"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint64_t to_data_total_dropped"/>
<node CREATED="1343128187846" MODIFIED="1343128187846" TEXT=" uint64_t from_packet_total_dropped"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" uint64_t to_packet_total_dropped"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" struct streamengine_classifier_instance *classi"/>
<node CREATED="1343128187847" ID="ID_1361543626" MODIFIED="1343213561569">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;bool allow_reclassify
    </p>
    <p>
      &#26159;&#21542;&#20801;&#35768;&#32487;&#32493;&#25913;&#21464;&#19978;&#38754;&#30340;QOS&#20998;&#31867;&#32467;&#26524;,&#21363;&#37325;&#20998;&#31867;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1343128187847" FOLDED="true" ID="ID_1421878505" MODIFIED="1343213867012">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;streamengine_classifier_type_t classifier_type
    </p>
    <p>
      &#24403;&#21069;&#30340;QOS&#20998;&#31867;&#32467;&#26524;&#26159;&#30001;&#21738;&#19968;&#31181;&#20998;&#31867;&#35268;&#21017;&#20998;&#31867;&#24471;&#21040;&#30340;
    </p>
  </body>
</html></richcontent>
<node CREATED="1343213801500" ID="ID_700680865" MODIFIED="1343213801500" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_UNDETERMINED"/>
<node CREATED="1343213801500" ID="ID_468255041" MODIFIED="1343213801500" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_DEFAULT"/>
<node CREATED="1343213801501" ID="ID_318474162" MODIFIED="1343213801501" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_USER_RULES"/>
<node CREATED="1343213801501" ID="ID_1574360358" MODIFIED="1343213801501" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_HTTP_CONTENT"/>
<node CREATED="1343213801501" ID="ID_1318301534" MODIFIED="1343213801501" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_HTTP_CONTENT_FIXED"/>
<node CREATED="1343213801501" ID="ID_798875523" MODIFIED="1343213801501" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_BITTORRENT"/>
<node CREATED="1343213801501" ID="ID_1907855161" MODIFIED="1343213801501" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_UNCLASSIFIED"/>
<node CREATED="1343213801501" ID="ID_1590583762" MODIFIED="1343213801501" TEXT=" STREAMENGINE_CLASSIFIER_TYPE_FIXED_OVER_LIMIT"/>
<node CREATED="1343213801501" ID="ID_1854432744" MODIFIED="1343213801501" TEXT=" STREAMENGINE_CLASSIFIFER_TYPE_TELNET_ECHO"/>
</node>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" streamengine_classifier_determine_process_rejected_callback_t determine_rejected"/>
<node CREATED="1343128187847" ID="ID_1047072188" MODIFIED="1343128187847" TEXT=" streamengine_classifier_determine_process_timeout_callback_t determine_timedout"/>
<node CREATED="1343128187847" ID="ID_651553571" MODIFIED="1343128187847" TEXT=" streamengine_classifier_determine_process_callback_t determine_process"/>
<node CREATED="1343128187847" FOLDED="true" ID="ID_630915583" MODIFIED="1343213040761">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;streamengine_classifier_classify_result_t determine_result
    </p>
    <p>
      &#27492;&#36830;&#25509;&#30340;QOS&#20998;&#31867;&#32467;&#26524;
    </p>
  </body>
</html></richcontent>
<node CREATED="1343212991188" ID="ID_413637730" MODIFIED="1343212993486" TEXT="STREAMENGINE_CLASSIFIER_CLASSIFY_RESULT_NO"/>
<node CREATED="1343213001155" ID="ID_1288860037" MODIFIED="1343213003352" TEXT="STREAMENGINE_CLASSIFIER_CLASSIFY_RESULT_MAYBE"/>
<node CREATED="1343213010546" ID="ID_1200166869" MODIFIED="1343213012326" TEXT="STREAMENGINE_CLASSIFIER_CLASSIFY_RESULT_YES_VARIABLE"/>
</node>
<node CREATED="1343128187847" ID="ID_1614446734" MODIFIED="1343128187847" TEXT=" uint8_t determine_phase"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" uint32_t determine_timeout"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" struct streamengine_db_connection_instance *determine_timeout_next"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" struct streamengine_db_connection_instance *determine_timeout_prev"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" uint32_t serial"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" uint32_t flags"/>
<node CREATED="1343128187847" MODIFIED="1343128187847" TEXT=" int refs"/>
<node CREATED="1343128187848" MODIFIED="1343128187848" TEXT=" streamengine_db_connection_hash_t hash_index"/>
<node CREATED="1343128187848" MODIFIED="1343128187848" TEXT=" uint16_t magic"/>
<node CREATED="1343128187848" MODIFIED="1343128187848" TEXT=" struct streamengine_db_connection_instance *event_next"/>
<node CREATED="1343128187848" MODIFIED="1343128187848" TEXT=" struct streamengine_db_connection_instance *event_prev"/>
<node CREATED="1343128187848" MODIFIED="1343128187848" TEXT=" bool in_process_list"/>
</node>
</node>
</node>
<node CREATED="1343100050023" FOLDED="true" ID="ID_1097974778" MODIFIED="1362565806254" TEXT="&#x5185;&#x6838;&#x9a71;&#x52a8;">
<node CREATED="1343118562818" FOLDED="true" ID="ID_434620006" MODIFIED="1362565806253" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1343123041658" FOLDED="true" ID="ID_1105947563" MODIFIED="1362565806253" TEXT="struct na_tx_metadata_object">
<node CREATED="1343123088441" ID="ID_670320473" MODIFIED="1343123090036" TEXT="enum na_tx_metadata_types type"/>
<node CREATED="1343123098904" FOLDED="true" ID="ID_1644384582" MODIFIED="1343126050882" TEXT="union sub">
<node CREATED="1343123436193" FOLDED="true" ID="ID_541694595" MODIFIED="1343126047846" TEXT=" struct na_ipv4_rule_create ipv4_rule_create">
<node CREATED="1343123436193" MODIFIED="1343123436193" TEXT=" uint8_t protocol"/>
<node CREATED="1343123436193" MODIFIED="1343123436193" TEXT=" int32_t flow_interface_num"/>
<node CREATED="1343123436193" MODIFIED="1343123436193" TEXT=" uint32_t flow_ip"/>
<node CREATED="1343123436193" MODIFIED="1343123436193" TEXT=" uint32_t flow_ip_xlate"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint32_t flow_ident"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint32_t flow_ident_xlate"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint16_t flow_mac[3]"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint8_t flow_window_scale"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint32_t flow_max_window"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint32_t flow_end"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint32_t flow_max_end"/>
<node CREATED="1343123436194" MODIFIED="1343123436194" TEXT=" uint32_t flow_mtu"/>
<node CREATED="1343123436195" MODIFIED="1343123436195" TEXT=" uint16_t flow_pppoe_session_id"/>
<node CREATED="1343123436195" MODIFIED="1343123436195" TEXT=" uint16_t flow_pppoe_remote_mac[3]"/>
<node CREATED="1343123436195" MODIFIED="1343123436195" TEXT=" int32_t return_interface_num"/>
<node CREATED="1343123436195" MODIFIED="1343123436195" TEXT=" uint32_t return_ip"/>
<node CREATED="1343123436195" MODIFIED="1343123436195" TEXT=" uint32_t return_ip_xlate"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint32_t return_ident"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint32_t return_ident_xlate"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint16_t return_mac[3]"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint8_t return_window_scale"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint32_t return_max_window"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint32_t return_end"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint32_t return_max_end"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint32_t return_mtu"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint16_t return_pppoe_session_id"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint16_t return_pppoe_remote_mac[3]"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" uint8_t flags"/>
</node>
<node CREATED="1343123436196" ID="ID_1547178778" MODIFIED="1343123436196" TEXT=" struct na_ipv4_rule_destroy ipv4_rule_destroy"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" struct na_ipv6_rule_create ipv6_rule_create"/>
<node CREATED="1343123436196" MODIFIED="1343123436196" TEXT=" struct na_ipv6_rule_destroy ipv6_rule_destroy"/>
<node CREATED="1343123436197" MODIFIED="1343123436197" TEXT=" struct na_l2switch_rule_create l2switch_rule_create"/>
<node CREATED="1343123436197" MODIFIED="1343123436197" TEXT=" struct na_l2switch_rule_destroy l2switch_rule_destroy"/>
<node CREATED="1343123436197" MODIFIED="1343123436197" TEXT=" struct na_mac_address_set mac_address_set"/>
<node CREATED="1343123436197" MODIFIED="1343123436197" TEXT=" struct na_virtual_interface_create virtual_interface_create"/>
<node CREATED="1343123436197" MODIFIED="1343123436197" TEXT=" struct na_virtual_interface_destroy virtual_interface_destroy"/>
<node CREATED="1343123436197" MODIFIED="1343123436197" TEXT=" struct na_pppoe_rule_destroy pppoe_rule_destroy"/>
</node>
</node>
</node>
<node CREATED="1343118585297" FOLDED="true" ID="ID_210263729" MODIFIED="1362565806253" TEXT="&#x5168;&#x5c40;&#x53d8;&#x91cf;">
<node CREATED="1343118591025" FOLDED="true" ID="ID_1870563429" MODIFIED="1343127939328" TEXT="struct ubi32_na_instance ubi32_na">
<node CREATED="1343119337218" ID="ID_1423027649" MODIFIED="1343119337218" TEXT=" struct napi_struct napi"/>
<node CREATED="1343119337218" MODIFIED="1343119337218" TEXT=" uint32_t num_physical_interfaces"/>
<node CREATED="1343119337218" MODIFIED="1343119337218" TEXT=" uint32_t num_virtual_interfaces"/>
<node CREATED="1343119337218" MODIFIED="1343119337218" TEXT=" uint32_t num_total_interfaces"/>
<node CREATED="1343119337218" MODIFIED="1343119337218" TEXT=" spinlock_t lock"/>
<node CREATED="1343119337218" ID="ID_475998402" MODIFIED="1343119337218" TEXT=" struct na_if_map *regs"/>
<node CREATED="1343119337218" ID="ID_1153361824" MODIFIED="1343119337218" TEXT=" uint32_t flags"/>
<node CREATED="1343119337218" FOLDED="true" ID="ID_163729612" MODIFIED="1362565806253">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;ubicom_na_ipv4_sync_callback_t ipv4_sync
    </p>
    <p>
      &#24403;&#21152;&#36895;&#22120;&#36890;&#30693;&#21516;&#27493;&#26465;&#30446;&#26102;&#25152;&#35843;&#29992;&#30340;&#22238;&#35843;&#20989;&#25968;, &#22238;&#35843;&#20989;&#25968;
    </p>
    <p>
      &#20027;&#35201;&#26159;&#26356;&#26032;&#26465;&#30446;&#30340;&#23450;&#26102;&#22120;,&#21450;&#21327;&#35758;&#29366;&#24577;, &#30001;&#21508;&#27169;&#22359;&#35843;&#29992;
    </p>
    <p>
      ubicom_na_net_dev_register_ipv4_mgr&#27880;&#20876;
    </p>
  </body>
</html></richcontent>
<node CREATED="1343120676131" ID="ID_1968877835" LINK="#ID_261826435" MODIFIED="1343120720553">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ubicom_na_connection_manager_ipv4_net_dev_callback
    </p>
    <p>
      (ubicom_na_connection_manager_ipv4.c)
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1343119337218" ID="ID_154029746" MODIFIED="1343119337218" TEXT=" ubicom_na_ipv6_sync_callback_t ipv6_sync"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" ubicom_na_l2switch_sync_callback_t l2switch_sync"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" ubicom_na_connection_expire_all_callback_t conn_expire"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint64_t skb_alloc_err"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint64_t tx_q_full_cnt"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" int irq"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" struct net_device *devices[NA_MAX_TOTAL_INTERFACES]"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" struct ubi32_na_private *virtual_priv[NA_MAX_VIRTUAL_INTERFACES]"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" bool napi_active"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" bool netdevice_notifier"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint32_t cache_dev_major"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint64_t last_rx_jiffies"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint64_t ipv4_accelerated_rx_packets"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint64_t ipv4_accelerated_rx_bytes"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint64_t ipv4_accelerated_tx_packets"/>
<node CREATED="1343119337219" MODIFIED="1343119337219" TEXT=" uint64_t ipv4_accelerated_tx_bytes"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_create_requests"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_create_collisions"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_create_invalid_interface"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_destroy_requests"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_destroy_misses"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_hash_hits"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_hash_reorders"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_flushes"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv4_connection_evictions"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv6_accelerated_rx_packets"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv6_accelerated_rx_bytes"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv6_accelerated_tx_packets"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv6_accelerated_tx_bytes"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv6_connection_create_requests"/>
<node CREATED="1343119337220" MODIFIED="1343119337220" TEXT=" uint64_t ipv6_connection_create_collisions"/>
<node CREATED="1343119337220" ID="ID_37141513" MODIFIED="1343119337220" TEXT=" uint64_t ipv6_connection_create_invalid_interface"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint64_t ipv6_connection_destroy_requests"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint64_t ipv6_connection_destroy_misses"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint64_t ipv6_connection_hash_hits"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint64_t ipv6_connection_hash_reorders"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint64_t ipv6_connection_flushes"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint64_t ipv6_connection_evictions"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_rx_packet_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_rx_byte_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_virtual_rx_packet_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_virtual_rx_byte_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_physical_rx_packet_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_physical_rx_byte_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_nomatch_packet_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_nomatch_byte_count"/>
<node CREATED="1343119337221" MODIFIED="1343119337221" TEXT=" uint32_t l2switch_create_requests"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t l2switch_create_collisions"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t l2switch_create_invalid_interface"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t l2switch_destroy_requests"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t l2switch_destroy_misses"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t l2switch_hash_hits"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t l2switch_hash_reorders"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t l2switch_flushes"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint64_t l2switch_evictions"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t pppoe_session_create_requests"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t pppoe_session_create_failures"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t pppoe_session_destroy_requests"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t pppoe_session_destroy_misses"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint64_t pe_queue_dropped"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint64_t pe_total_ticks"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint32_t pe_worst_case_ticks"/>
<node CREATED="1343119337222" MODIFIED="1343119337222" TEXT=" uint64_t pe_iterations"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint64_t except_queue_dropped"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint64_t except_total_ticks"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint32_t except_worst_case_ticks"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint64_t except_iterations"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint32_t l2switch_queue_dropped"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint64_t l2switch_total_ticks"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint32_t l2switch_worst_case_ticks"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint64_t l2switch_iterations"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint64_t pbuf_alloc_fails"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" uint64_t pbuf_payload_alloc_fails"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" struct na_gmac_statistics na_gmac_statistics[NA_MAX_PHYSICAL_INTERFACES]"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" struct na_ipv4_statistics na_ipv4_statistics[IPV4_CONNECTION_ENTRIES]"/>
<node CREATED="1343119337223" MODIFIED="1343119337223" TEXT=" struct na_ipv6_statistics na_ipv6_statistics[IPV6_CONNECTION_ENTRIES]"/>
<node CREATED="1343119337223" ID="ID_1009974766" MODIFIED="1343119337223" TEXT=" struct na_l2switch_statistics na_l2switch_statistics[L2SWITCH_CONNECTION_ENTRIES]"/>
<node CREATED="1343119337224" ID="ID_1433806955" MODIFIED="1343119337224" TEXT=" struct na_pppoe_statistics na_pppoe_statistics[NA_PPPOE_NUM_SESSION_TOTAL]"/>
<node CREATED="1343119337224" MODIFIED="1343119337224" TEXT=" struct na_pppoe_statistics *na_pppoe_statistics_head"/>
</node>
</node>
<node CREATED="1343120461995" FOLDED="true" ID="ID_1944970795" MODIFIED="1362565806253" TEXT="&#x6536;&#x5305; : ubi32_na_rx">
<node CREATED="1343120492378" FOLDED="true" ID="ID_644831954" MODIFIED="1362565806253" TEXT="ubi32_na_rx_metadata">
<node CREATED="1343120503561" FOLDED="true" ID="ID_1933070354" MODIFIED="1362565806253" TEXT="ubi32_na_rx_metadata_ipv4_rule_sync">
<node CREATED="1343120550248" ID="ID_75024581" LINK="#ID_163729612" MODIFIED="1343122219860">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36890;&#30693;ubi32_na.ipv4_sync&#20013;&#30340;&#22238;&#35843;&#20989;&#25968;&#26356;&#26032;&#26465;&#30446;&#30340;&#29366;&#24577;
    </p>
    <p>
      &#24403;&#21152;&#36895;&#22120;&#36890;&#30693;&#21516;&#27493;&#26465;&#30446;&#26102;&#35843;&#29992;, &#22238;&#35843;&#20989;&#25968;&#20027;&#35201;&#26356;&#26032;&#26465;&#30446;&#30340;&#23450;&#26102;&#22120;,&#21450;&#21327;&#35758;&#29366;&#24577;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1343122711735" FOLDED="true" ID="ID_72561448" MODIFIED="1362565806253" TEXT="&#x53d1;&#x5305;">
<node CREATED="1343122719814" ID="ID_249753863" MODIFIED="1343122817821">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ubicom_na_create_ipv4_rule, &#28155;&#21152;&#26032;&#30340;&#21152;&#36895;&#26465;&#30446;
    </p>
    <p>
      &#23558;&#38656;&#35201;&#28155;&#21152;&#30340;&#36830;&#25509;&#23553;&#35013;&#25104;metadata&#21253;&#21457;&#36865;&#32473;NA&#21152;&#36895;&#22120;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1369234375695" ID="ID_1995546404" MODIFIED="1369234378352" POSITION="left" TEXT="lua"/>
<node CREATED="1381485463079" FOLDED="true" ID="ID_1316949585" MODIFIED="1381488293388" POSITION="left" TEXT="&#x7cfb;&#x7edf;&#x542f;&#x52a8;&#x8fc7;&#x7a0b;">
<node CREATED="1381474650569" ID="ID_1586055297" MODIFIED="1381474775214">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      bootargs=console=ttyS0,115200 root=31:02 rootfstype=jffs2 init=/etc/preinit mtdparts=xxx
    </p>
    <p>
      &#20256;&#36882;&#32473;&#20869;&#26680;&#30340;cmdline&#20013;&#30001;init&#21442;&#25968;&#25351;&#23450;&#20102;&#31532;&#19968;&#20010;&#21551;&#21160;&#30340;&#33050;&#26412;,&#36825;&#37324;&#26159;/etc/preinit
    </p>
  </body>
</html></richcontent>
<node CREATED="1381474958331" ID="ID_229269035" MODIFIED="1381485488682">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23558;&#20197;&#19979;5&#20010;boot hook list&#32622;&#31354;, &#36825;&#23454;&#38469;&#19978;&#26159;5&#20010;&#38142;&#34920;,
    </p>
    <p>
      /lib/preinit/&#19979;&#30340;&#27599;&#20010;&#33050;&#26412;&#20250;&#22312;&#30456;&#24212;&#30340;&#38142;&#34920;&#20013;&#28155;&#21152;&#19968;&#20010;hook&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1381474960619" ID="ID_1715196588" MODIFIED="1381474961911" TEXT="preinit_essential"/>
<node CREATED="1381474968412" ID="ID_1834222772" MODIFIED="1381474968968" TEXT="preinit_main"/>
<node CREATED="1381474974893" ID="ID_1716248222" MODIFIED="1381474975449" TEXT="failsafe"/>
<node CREATED="1381474981278" ID="ID_500526460" MODIFIED="1381474983360" TEXT="initramfs"/>
<node CREATED="1381474987390" ID="ID_706067149" MODIFIED="1381474988673" TEXT="preinit_mount_root"/>
</node>
<node CREATED="1381475040485" FOLDED="true" ID="ID_663166764" MODIFIED="1381485519981" TEXT="&#x6309;&#x7167;&#x6570;&#x5b57;&#x524d;&#x7f00;&#x987a;&#x5e8f;&#x6267;&#x884c;/lib/preinit/&#x4e0b;&#x7684;&#x811a;&#x672c;">
<node CREATED="1381475341878" ID="ID_792217268" MODIFIED="1381475342994" TEXT="02_default_set_state">
<node CREATED="1381476134287" ID="ID_1678265491" MODIFIED="1381476135547" TEXT="define_default_set_state">
<node CREATED="1381475366121" ID="ID_1583294097" MODIFIED="1381475366660" TEXT="/etc/diag.sh"/>
</node>
</node>
<node CREATED="1381475423855" ID="ID_261345923" MODIFIED="1381475424971" TEXT="03_preinit_do_ar71xx.sh">
<node CREATED="1381475443313" ID="ID_605271591" MODIFIED="1381475444221" TEXT="do_ar71xx">
<node CREATED="1381475456963" ID="ID_1996932142" MODIFIED="1381475489379" TEXT="&#x6267;&#x884c;/lib/ar71xx.sh&#x4e2d;&#x7684;ar71xx_board_detect&#x51fd;&#x6570;">
<node CREATED="1381475605140" ID="ID_331881522" MODIFIED="1381476020302" TEXT="&#x8bfb;&#x53d6;/proc/cpuinfo&#x53d6;&#x51fa;&#x5176;&#x4e2d;&#x7684;machine&#x5b57;&#x6bb5;"/>
<node CREATED="1381476058471" ID="ID_1275628495" MODIFIED="1381476068964" TEXT="&#x5c06;board name&#x5199;&#x5165;/tmp/sysinfo/board_name"/>
<node CREATED="1381476079353" ID="ID_249057052" MODIFIED="1381476087894" TEXT="&#x5c06;model name&#x5199;&#x5165;/tmp/sysinfo/model"/>
</node>
</node>
</node>
<node CREATED="1381476161299" ID="ID_437748494" MODIFIED="1381476162126" TEXT="05_enable_reset_button_ar71xx">
<node CREATED="1381476179749" ID="ID_1196269691" MODIFIED="1381476180944" TEXT="preinit_enable_reset_button">
<node CREATED="1381476197751" ID="ID_1749685962" MODIFIED="1381476198738" TEXT="insmod gpio-button-hotplug"/>
</node>
</node>
<node CREATED="1381476230458" ID="ID_1630279908" MODIFIED="1381476231350" TEXT="05_mount_skip"/>
<node CREATED="1381476258366" ID="ID_1735155364" MODIFIED="1381476259369" TEXT="05_set_iface_mac_ar71xx">
<node CREATED="1381476426800" ID="ID_967857151" MODIFIED="1381476585357">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      preinit_set_mac_address
    </p>
    <p>
      &#20174;&#21517;&#20026;config&#30340;mtd&#20998;&#21306;&#20013;&#35835;&#21462;lan&#21644;wan&#30340;mac&#22320;&#22336;,&#24182;&#29992;ifconfig&#21629;&#20196;&#35774;&#32622;&#21040;lan&#21644;wan&#32593;&#21475;&#19978;
    </p>
    <p>
      qualcomm atheros&#27809;&#29992;&#20351;&#29992;&#36825;&#31181;&#26041;&#27861;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1381476451635" ID="ID_1756881923" MODIFIED="1381476452222" TEXT="fetch_mac_from_mtd"/>
</node>
<node CREATED="1381477981998" ID="ID_1324679748" MODIFIED="1381477983066" TEXT="05_set_preinit_iface_ar71xx">
<node CREATED="1381477991967" ID="ID_645399719" MODIFIED="1381477992428" TEXT="set_preinit_iface">
<node CREATED="1381477999936" ID="ID_1375323343" MODIFIED="1381478000445" TEXT="ifname=eth0"/>
</node>
</node>
<node CREATED="1381478035156" ID="ID_1975626322" MODIFIED="1381478036112" TEXT="10_check_for_mtd"/>
<node CREATED="1381478045157" ID="ID_1135871133" MODIFIED="1381478046241" TEXT="10_essential_fs">
<node CREATED="1381478065144" ID="ID_1242062939" MODIFIED="1381478065923" TEXT="do_mount_procfs"/>
<node CREATED="1381478077545" ID="ID_892914717" MODIFIED="1381478079911" TEXT="do_mount_sysfs"/>
<node CREATED="1381478085722" ID="ID_1242760354" MODIFIED="1381478086182" TEXT="do_mount_tmpfs"/>
</node>
<node CREATED="1381478106860" ID="ID_1637255204" MODIFIED="1381478107832" TEXT="10_indicate_failsafe"/>
<node CREATED="1381478114781" ID="ID_56938161" MODIFIED="1381478115449" TEXT="10_indicate_preinit"/>
<node CREATED="1381478123694" ID="ID_1209739342" MODIFIED="1381478124234" TEXT="20_check_jffs2_ready"/>
<node CREATED="1381478159058" ID="ID_1378250426" MODIFIED="1381478159918" TEXT="20_device_fs_mount"/>
<node CREATED="1381478224650" ID="ID_1940364359" MODIFIED="1381478225557" TEXT="30_device_fs_daemons"/>
<node CREATED="1381478234363" ID="ID_590743538" MODIFIED="1381478235254" TEXT="30_failsafe_wait"/>
<node CREATED="1381478244604" ID="ID_455054949" MODIFIED="1381478245463" TEXT="40_init_shm"/>
<node CREATED="1381478281392" ID="ID_79945211" MODIFIED="1381478282332" TEXT="40_mount_devpts"/>
<node CREATED="1381478302322" ID="ID_1591664618" MODIFIED="1381478303214" TEXT="40_mount_jffs2">
<node CREATED="1381478357816" ID="ID_883404864" MODIFIED="1381478402025" TEXT="&#x5c06;rootfs_data&#x5206;&#x533a;&#x6302;&#x8f7d;&#x5230;/tmp/overlay"/>
</node>
<node CREATED="1381478412767" ID="ID_1309887487" MODIFIED="1381478413754" TEXT="40_run_failsafe_hook">
<node CREATED="1381478436961" ID="ID_1699118627" MODIFIED="1381478449582" TEXT="&#x6267;&#x884c;failsafe&#x94fe;&#x8868;&#x4e2d;&#x7684;hook&#x51fd;&#x6570;"/>
</node>
<node CREATED="1381478474646" ID="ID_1399228463" MODIFIED="1381478475585" TEXT="41_merge_overlay_hooks"/>
<node CREATED="1381478655002" ID="ID_1699737328" MODIFIED="1381478655686" TEXT="50_choose_console">
<node CREATED="1381478669483" ID="ID_384263600" MODIFIED="1381478670008" TEXT="choose_console"/>
</node>
<node CREATED="1381478679804" ID="ID_1766030748" MODIFIED="1381478680600" TEXT="50_indicate_regular_preinit"/>
<node CREATED="1381478687325" ID="ID_1508103479" MODIFIED="1381478687993" TEXT="60_init_hotplug"/>
<node CREATED="1381478695102" ID="ID_1495615515" MODIFIED="1381478695706" TEXT="70_initramfs_test"/>
<node CREATED="1381478702383" ID="ID_784073512" MODIFIED="1381478703019" TEXT="70_pivot_jffs2_root"/>
<node CREATED="1381478731970" ID="ID_1622022089" MODIFIED="1381478732654" TEXT="80_mount_root"/>
<node CREATED="1381478765494" ID="ID_208413895" MODIFIED="1381478766130" TEXT="90_init_console"/>
<node CREATED="1381478774663" ID="ID_1582399390" MODIFIED="1381478775347" TEXT="90_mount_no_jffs2"/>
<node CREATED="1381478806987" ID="ID_1732794535" MODIFIED="1381478808135" TEXT="90_restore_config">
<node CREATED="1381478814796" ID="ID_1138320715" MODIFIED="1381478815800" TEXT="restore_config">
<node CREATED="1381478816524" ID="ID_1132536291" MODIFIED="1381478880351" TEXT="&#x5982;&#x679c;&#x6839;&#x76ee;&#x5f55;&#x4e0b;&#x6709;sysupgrade.tgz&#x6587;&#x4ef6;,&#x5219;&#x5c06;&#x5176;&#x89e3;&#x538b;&#x5230;&#x6839;&#x76ee;&#x5f55;&#x4e0b;"/>
</node>
</node>
<node CREATED="1381478897541" ID="ID_1981262123" MODIFIED="1381478898609" TEXT="99_10_failsafe_login"/>
<node CREATED="1381478929449" ID="ID_999209094" MODIFIED="1381478930148" TEXT="99_10_mount_no_mtd"/>
<node CREATED="1381478939098" ID="ID_756107757" MODIFIED="1381478939781" TEXT="99_10_run_init">
<node CREATED="1381478949051" ID="ID_1387239071" MODIFIED="1381478949959" TEXT="run_init">
<node CREATED="1381479065384" ID="ID_112383542" MODIFIED="1381479079285" TEXT="&#x6b64;&#x5373;&#x6267;&#x884c;/sbin/init">
<node CREATED="1381479098764" ID="ID_278480836" MODIFIED="1381479137386" TEXT="busybox&#x7684;init&#x547d;&#x4ee4;&#x6267;&#x884c;/etc/inittab&#x7684;&#x811a;&#x672c;"/>
</node>
</node>
</node>
</node>
<node CREATED="1381479152194" FOLDED="true" ID="ID_85015269" MODIFIED="1381486656016">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      /etc/inittab
    </p>
    <p>
      &#27492;&#33050;&#26412;&#20013;&#27599;&#19968;&#34892;&#30340;&#26684;&#24335;:label:runlevel:action:process
    </p>
  </body>
</html></richcontent>
<node CREATED="1381479226635" ID="ID_298743192" MODIFIED="1381479227990" TEXT="::sysinit:/etc/init.d/rcS S boot">
<node CREATED="1381479468469" ID="ID_6466260" MODIFIED="1381484561181">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25191;&#34892;/etc/rc.d/&#30446;&#24405;&#19979;&#26684;&#24335;&#22914;S00xx&#30340;&#33050;&#26412;
    </p>
    <p>
      /etc/rc.d/&#30446;&#24405;&#19979;&#26684;&#24335;&#22914;S00xx&#30340;&#33050;&#26412;&#23454;&#38469;&#19978;&#26159;&#26144;&#23556;&#21040;/etc/init.d/&#19979;&#30340;&#21516;&#21517;&#33050;&#26412;
    </p>
    <p>
      &#36825;&#37324;&#23454;&#38469;&#19978;&#23601;&#26159;&#25191;&#34892;&#20102;/etc/init.d/xxx start
    </p>
  </body>
</html></richcontent>
<node CREATED="1381480610053" ID="ID_1721753179" MODIFIED="1381480611903" TEXT="K50dropbear = /etc/init.d/dropbear"/>
<node CREATED="1381480617734" ID="ID_971078100" MODIFIED="1381480619641" TEXT="K90network = /etc/init.d/network"/>
<node CREATED="1381480625415" ID="ID_1516456909" MODIFIED="1381480625907" TEXT="K95luci_fixtime = /etc/init.d/luci_fixtime">
<node CREATED="1381480336567" ID="ID_877985408" MODIFIED="1381480348820" TEXT="&#x4fee;&#x6b63;&#x7cfb;&#x7edf;&#x65f6;&#x95f4;"/>
</node>
<node CREATED="1381480637784" ID="ID_1864792971" MODIFIED="1381480639732" TEXT="K98boot = /etc/init.d/boot"/>
<node CREATED="1381480646281" ID="ID_992417656" MODIFIED="1381480646725" TEXT="K99umount = /etc/init.d/umount"/>
<node CREATED="1381480675196" ID="ID_295469213" MODIFIED="1381480675689" TEXT="S05defconfig = /etc/init.d/defconfig">
<node CREATED="1381480237867" ID="ID_1303850167" MODIFIED="1381480286941" TEXT="&#x5c06;/etc/defconfig/board_name/&#x4e0b;&#x7684;&#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x590d;&#x5236;&#x5230;/etc/config&#x76ee;&#x5f55;&#x4e0b;"/>
</node>
<node CREATED="1381480697167" ID="ID_435367933" MODIFIED="1381480697611" TEXT="S05luci_fixtime = /etc/init.d/luci_fixtime">
<node CREATED="1381480336567" ID="ID_275038792" MODIFIED="1381480348820" TEXT="&#x4fee;&#x6b63;&#x7cfb;&#x7edf;&#x65f6;&#x95f4;"/>
</node>
<node CREATED="1381480717553" ID="ID_23867965" MODIFIED="1381480718317" TEXT="S10boot = /etc/init.d/boot">
<node CREATED="1381481209336" ID="ID_1937659600" MODIFIED="1381481210004" TEXT="apply_uci_config">
<node CREATED="1381481231355" ID="ID_229534753" MODIFIED="1381481310751" TEXT="/lib/functions.sh : uci_apply_defaults">
<node CREATED="1381481474694" ID="ID_1376874503" MODIFIED="1381481496516" TEXT="&#x6267;&#x884c;/etc/uci-defaults&#x4e0b;&#x7684;&#x6bcf;&#x4e2a;&#x811a;&#x672c;">
<node CREATED="1381482653946" FOLDED="true" ID="ID_62107675" MODIFIED="1381483897175">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      /etc/uci-defaults/network
    </p>
    <p>
      &#35843;&#29992;/lib/functions/uci-defaults.sh&#20013;&#30340;&#20989;&#25968;ucidef_xxx&#35774;&#32622;network uci&#21442;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1381482691055" ID="ID_1422304362" MODIFIED="1381482726318" TEXT="ucidef_set_interfaces_lan_wan &quot;eth1&quot; &quot;eth0&quot;">
<node CREATED="1381482988704" ID="ID_1597960952" MODIFIED="1381482990039" TEXT="ucidef_set_interface_lan">
<node CREATED="1381483024468" ID="ID_779049806" MODIFIED="1381483064176" TEXT="uci set network.lan=&apos;interface&apos; &#xa;uci set network.lan.ifname=&apos;$ifname&apos; &#xa;uci set network.lan.type=&apos;bridge&apos; &#xa;uci set network.lan.proto=&apos;static&apos; &#xa;uci set network.lan.ipaddr=&apos;192.168.1.1&apos; &#xa;uci set network.lan.netmask=&apos;255.255.255.0&apos;"/>
</node>
<node CREATED="1381482996337" ID="ID_649876126" MODIFIED="1381482996797" TEXT="ucidef_set_interface_wan">
<node CREATED="1381483077434" ID="ID_1288662470" MODIFIED="1381483093599">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uci set network.wan='interface'
    </p>
    <p>
      uci set network.wan.ifname='$ifname'
    </p>
    <p>
      uci set network.wan.proto='dhcp'
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1381482736292" ID="ID_907041911" MODIFIED="1381482737152" TEXT="ucidef_add_switch &quot;switch0&quot; &quot;1&quot; &quot;1&quot;"/>
<node CREATED="1381482750726" ID="ID_628999853" MODIFIED="1381482751457" TEXT="ucidef_add_switch_vlan &quot;switch0&quot; &quot;1&quot; &quot;0 1 2 3 4&quot;"/>
<node CREATED="1381482760199" ID="ID_1007066872" MODIFIED="1381482760914" TEXT="ucidef_add_switch_vlan &quot;switch0&quot; &quot;2&quot; &quot;5 6&quot;"/>
</node>
</node>
<node CREATED="1381481474694" ID="ID_1597487631" MODIFIED="1381481509718" TEXT="&#x5220;&#x9664;/etc/uci-defaults&#x4e0b;&#x7684;&#x6bcf;&#x4e2a;&#x811a;&#x672c;"/>
<node CREATED="1381481527772" ID="ID_295982560" MODIFIED="1381481539689" TEXT="uci commit&#x63d0;&#x4ea4;uci&#x7684;&#x6539;&#x53d8;"/>
</node>
</node>
<node CREATED="1381481192166" ID="ID_1429402524" MODIFIED="1381481192787" TEXT="start">
<node CREATED="1381481204152" ID="ID_604772396" MODIFIED="1381481205284" TEXT="apply_uci_config"/>
</node>
</node>
<node CREATED="1381480728434" ID="ID_72342564" MODIFIED="1381480729406" TEXT="S11ubus = /etc/init.d/ubus"/>
<node CREATED="1381480736387" ID="ID_1242660312" MODIFIED="1381480736879" TEXT="S20network = /etc/init.d/network"/>
<node CREATED="1381480743668" ID="ID_482479609" MODIFIED="1381480744128" TEXT="S39usb = /etc/init.d/usb"/>
<node CREATED="1381480750789" ID="ID_93224060" MODIFIED="1381480751233" TEXT="S45firewall = /etc/init.d/firewall"/>
<node CREATED="1381480758038" ID="ID_286900586" MODIFIED="1381480759404" TEXT="S50cron = /etc/init.d/cron"/>
<node CREATED="1381480765687" ID="ID_446173025" MODIFIED="1381480766942" TEXT="S50dropbear = /etc/init.d/dropbear"/>
<node CREATED="1381480772839" ID="ID_1498229407" MODIFIED="1381480774113" TEXT="S50qos = /etc/init.d/qos"/>
<node CREATED="1381480779384" ID="ID_217266268" MODIFIED="1381480779812" TEXT="S50radvd = /etc/init.d/radvd"/>
<node CREATED="1381480786227" ID="ID_1116491482" MODIFIED="1381480788644" TEXT="S50telnet = /etc/init.d/telnet"/>
<node CREATED="1381480792986" ID="ID_1667846956" MODIFIED="1381480794884" TEXT="S50uhttpd = /etc/init.d/uhttpd"/>
<node CREATED="1381480800555" ID="ID_156944000" MODIFIED="1381480801031" TEXT="S59luci_dhcp_migrate = /etc/init.d/luci_dhcp_migrate"/>
<node CREATED="1381480807115" ID="ID_1207850909" MODIFIED="1381480807576" TEXT="S60dnsmasq = /etc/init.d/dnsmasq"/>
<node CREATED="1381480814028" ID="ID_1869255527" MODIFIED="1381480814440" TEXT="S60ipsec = /etc/init.d/ipsec"/>
<node CREATED="1381480821261" ID="ID_558214772" MODIFIED="1381480821833" TEXT="S60quagga = /etc/init.d/quagga"/>
<node CREATED="1381480828974" ID="ID_476263096" MODIFIED="1381480831447" TEXT="S95done = /etc/init.d/done">
<node CREATED="1381486472396" ID="ID_466816494" MODIFIED="1381486473987" TEXT="firstboot switch2jffs"/>
<node CREATED="1381486483257" ID="ID_1768466643" MODIFIED="1381486527808">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25191;&#34892;&#29992;&#25143;&#33258;&#23450;&#20041;&#30340;&#21551;&#21160;&#33050;&#26412; : /etc/rc.local
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1381480835903" ID="ID_1244424441" MODIFIED="1381480837626" TEXT="S95miniupnpd = /etc/init.d/miniupnpd"/>
<node CREATED="1381480842543" ID="ID_678669899" MODIFIED="1381480844337" TEXT="S96led = /etc/init.d/led"/>
<node CREATED="1381480849232" ID="ID_903511484" MODIFIED="1381480849692" TEXT="S97watchdog = /etc/init.d/watchdog"/>
<node CREATED="1381480855601" ID="ID_1128061491" MODIFIED="1381480857780" TEXT="S98sysntpd = /etc/init.d/sysntpd"/>
<node CREATED="1381480863474" ID="ID_516217324" MODIFIED="1381480863981" TEXT="S99igmpproxy = /etc/init.d/igmpproxy"/>
<node CREATED="1381480871170" ID="ID_1976282178" MODIFIED="1381480871679" TEXT="S99sysctl = /etc/init.d/sysctl"/>
<node CREATED="1381480877907" ID="ID_1721289975" MODIFIED="1381480878479" TEXT="S99sysstat = /etc/init.d/sysstat"/>
</node>
</node>
<node CREATED="1381479315796" ID="ID_210435530" MODIFIED="1381479316576" TEXT="::shutdown:/etc/init.d/rcS K shutdown"/>
<node CREATED="1381479326085" ID="ID_705521314" MODIFIED="1381479381270">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      ttyS0::askfirst:/bin/ash --login
    </p>
    <p>
      &#21551;&#21160;&#19968;&#20010;shell
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1381488296469" FOLDED="true" ID="ID_1796125614" MODIFIED="1381489123641" POSITION="left" TEXT="&#x66f4;&#x65b0;firmware">
<node CREATED="1381484078154" ID="ID_825732373" MODIFIED="1381488393475">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25191;&#34892;&#21629;&#20196;&quot;killall dropbear uhttpd; sleep 1; /sbin/sysupgrade 1 /tmp/firmware.img&quot;
    </p>
    <p>
      &#35265;&#25991;&#20214; : /usr/lib/lua/luci/controller/admin/system.lua
    </p>
  </body>
</html>
</richcontent>
</node>
<node CREATED="1381488396463" ID="ID_1621289104" MODIFIED="1381488467388" TEXT="/sbin/sysupgrade">
<node CREATED="1381488726100" ID="ID_1198989959" MODIFIED="1381488751379" TEXT="/lib/upgrade/common.sh : do_upgrade">
<node CREATED="1381488797180" ID="ID_1253661567" MODIFIED="1381488832701" TEXT="/lib/upgrade/platform.sh : platform_do_upgrade">
<node CREATED="1381488858643" ID="ID_1809528055" MODIFIED="1381488888114" TEXT="/lib/upgrade/ap135.sh : platform_do_upgrade_ap135 &quot;0x9f050000&quot; &quot;$ARGV&quot;">
<node CREATED="1381488956734" ID="ID_677836604" MODIFIED="1381488969609" TEXT="/lib/upgrade/common.sh : default_do_upgrade">
<node CREATED="1381488994370" ID="ID_946610991" MODIFIED="1381488996004" TEXT="get_image &quot;$1&quot; | mtd write - &quot;${PART_NAME:-image}&quot;"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1381484018676" ID="ID_1095975755" MODIFIED="1381488341686" POSITION="right" TEXT="&#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x6062;&#x590d;&#x51fa;&#x5382;&#x8bbe;&#x7f6e;">
<node CREATED="1381484094460" ID="ID_679510578" MODIFIED="1381484247961" TEXT="rootfs&#x5206;&#x533a;&#x52a0;&#x8f7d;&#x5728;/rom&#x76ee;&#x5f55;/&#x4e0b;, &#x6b64;&#x5206;&#x533a;&#x662f;squashfa&#x683c;&#x5f0f;,&#x4e0d;&#x53ef;&#x5199;"/>
<node CREATED="1381484128608" ID="ID_1040878800" MODIFIED="1381484341492" TEXT="rootfs_data&#x5206;&#x533a;&#x52a0;&#x8f7d;&#x5728;/overlay&#x76ee;&#x5f55;&#x4e0b;, &#x6b64;&#x5206;&#x533a;&#x662f;jffs2&#x683c;&#x5f0f;,&#x53ef;&#x5199;,&#x7528;&#x4e8e;&#x4fdd;&#x5b58;&#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x548c;&#x4efb;&#x4f55;&#x5176;&#x4ed6;&#x88ab;&#x4fee;&#x6539;&#x8fc7;&#x7684;&#x6587;&#x4ef6;"/>
<node CREATED="1381484168996" ID="ID_1399885104" MODIFIED="1381484213365" TEXT="/rom&#x4f5c;&#x4e3a;&#x4e0b;&#x5c42;,/overlay&#x4f5c;&#x4e3a;&#x4e0a;&#x5c42;, &#x4e24;&#x8005;&#x5408;&#x5e76;&#x5f62;&#x6210;&#x4e86;&#x6839;&#x76ee;&#x5f55;/"/>
<node CREATED="1381484078154" ID="ID_1874235888" MODIFIED="1381485232311">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#25191;&#34892;&#21629;&#20196;&quot;killall dropbear uhttpd; sleep 1; mtd -r erase rootfs_data&quot;
    </p>
    <p>
      &#35265;&#25991;&#20214; : /usr/lib/lua/luci/controller/admin/system.lua
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1381484400623" ID="ID_1765201625" MODIFIED="1381484511371" TEXT="&#x7ecf;&#x8fc7;&#x4e0a;&#x9762;&#x7684;&#x547d;&#x4ee4;&#x540e;,rootfs_data&#x5206;&#x533a;&#x88ab;&#x6e05;&#x7a7a;,&#xa;&#x7cfb;&#x7edf;&#x91cd;&#x542f;&#x4e4b;&#x540e;&#x6839;&#x76ee;&#x5f55;&#x5c31;&#x7531;/rom&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x6587;&#x4ef6;&#x7ec4;&#x6210;,&#x6b64;&#x65f6;/overlay&#x4e0b;&#x6ca1;&#x6709;&#x5185;&#x5bb9;">
<node CREATED="1381484534414" ID="ID_1136469498" MODIFIED="1381484592615">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36825;&#26679;&#25353;&#29031;openwrt&#30340;&#21021;&#22987;&#21270;&#33050;&#26412;&#25191;&#34892;&#21040;
    </p>
    <p>
      S10boot = /etc/init.d/boot
    </p>
  </body>
</html></richcontent>
<node CREATED="1381484613446" ID="ID_1767412198" LINK="#ID_1376874503" MODIFIED="1381484690159" TEXT="&#x8fd9;&#x65f6;/etc/uci-defaults&#x76ee;&#x5f55;&#x4e0d;&#x4e3a;&#x7a7a;,&#x5c06;&#x6267;&#x884c;&#x91cc;&#x9762;&#x7684;&#x6240;&#x6709;&#x811a;&#x672c;&#x751f;&#x6210;&#x51fa;&#x5382;&#x914d;&#x7f6e;"/>
<node CREATED="1381484699376" ID="ID_288594669" MODIFIED="1381484836399" TEXT="&#x6267;&#x884c;&#x5b8c;/etc/uci-defaults&#x76ee;&#x5f55;&#x4e0b;&#x6240;&#x6709;&#x811a;&#x672c;&#x540e;&#x8fd9;&#x4e9b;&#x811a;&#x672c;&#x88ab;&#x5220;&#x9664;,&#xa;&#x6ce8;&#x610f;&#x8fd9;&#x91cc;&#x7684;&#x5220;&#x9664;&#x662f;&#x5728;/overlay/etc/uci-defaults&#x76ee;&#x5f55;&#x4e0b;&#x505a;overlay-whiteout&#x6807;&#x8bb0;"/>
</node>
</node>
<node CREATED="1381484873300" ID="ID_1787055932" MODIFIED="1381485146711">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#31995;&#32479;&#20877;&#27425;&#37325;&#21551;&#21518;rootfs_data&#20998;&#21306;&#19981;&#20877;&#20026;&#31354;,&#23427;&#20445;&#23384;&#20102;&#37325;&#21551;&#21069;/overlay&#19979;&#30340;&#20462;&#25913;
    </p>
    <p>
      &#30001;&#20110;/overlay/etc/uci-defaults&#30446;&#24405;&#19979;&#20570;&#20102;overlay-whiteout&#26631;&#35760;,
    </p>
    <p>
      &#36825;&#26679;/etc/uci-defaults&#30446;&#24405;&#19979;&#26174;&#31034;&#25152;&#26377;&#33050;&#26412;&#22343;&#34987;&#21024;&#38500;&#20102;,&#25152;&#20197;&#20063;&#23601;&#19981;&#20877;&#25191;&#34892;&#24674;&#22797;&#40664;&#35748;&#20986;&#21378;&#37197;&#32622;&#30340;&#33050;&#26412;&#20102;
    </p>
    <p>
      &#36825;&#26679;/etc/config&#19979;&#30340;&#37197;&#32622;&#23601;&#20445;&#30041;&#20026;&#19978;&#27425;&#20462;&#25913;&#30340;&#20540;&#32780;&#19981;&#26159;&#20986;&#21378;&#37197;&#32622;&#20102;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</map>
