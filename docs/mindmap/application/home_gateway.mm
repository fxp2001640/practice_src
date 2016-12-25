<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1310799068396" ID="ID_38007740" MODIFIED="1310800261908" TEXT="home_gateway">
<node CREATED="1310800265060" ID="ID_1253799980" MODIFIED="1321373229556" POSITION="right" TEXT="masterd">
<node CREATED="1315924612414" FOLDED="true" ID="ID_1843212622" MODIFIED="1321348342396" TEXT="mibsh">
<node CREATED="1315924711339" FOLDED="true" ID="ID_681300211" MODIFIED="1321343164873" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1315925283729" FOLDED="true" ID="ID_1134262980" MODIFIED="1321343164873" TEXT="struct mibshShellContext">
<node CREATED="1315925297437" ID="ID_1783179172" MODIFIED="1315925331599" TEXT="Next"/>
<node CREATED="1315925302205" ID="ID_1960192829" MODIFIED="1315925327236" TEXT="Prev"/>
<node CREATED="1315925319279" ID="ID_1353296191" MODIFIED="1315925353519" TEXT="Sd : accept&#x6240;&#x5f97;&#x5230;&#x7684;socket"/>
<node CREATED="1315925367693" ID="ID_1097601676" MODIFIED="1315925370074" TEXT="struct bufrd ReadBuf"/>
<node CREATED="1315925382256" ID="ID_241622851" MODIFIED="1315925384614" TEXT="struct bufwr WriteBuf"/>
<node CREATED="1315925397035" ID="ID_834348342" MODIFIED="1315925398418" TEXT="struct mibManagerPlugin ManagerPlugin"/>
<node CREATED="1315925411284" ID="ID_1111887300" MODIFIED="1315925413093" TEXT="struct mibshWatch WatchHead"/>
<node CREATED="1315925424227" ID="ID_1116663799" MODIFIED="1315929182782" TEXT="struct evloopTimeout CloseTimeout&#xff1a;&#x5f53;&#x7528;&#x6237;&#x8f93;&#x5165;quit&#x65f6;&#xff0c;&#xa;mibshShutdown&#x5c06;&#x6fc0;&#x6d3b;&#x6b64;&#x5b9a;&#x65f6;&#x5668;&#xff0c;&#x8fdb;&#x884c;&#x4e00;&#x5b9a;&#x5ef6;&#x65f6;&#x540e;&#x518d;&#x6267;&#x884c;&#x6e05;&#x7406;&#x5de5;&#x4f5c;"/>
<node CREATED="1315925442999" ID="ID_1223269091" MODIFIED="1315925537918" TEXT="&#x51fd;&#x6570;&#x6307;&#x9488;&#xff1a;DoneCB&#xff0c;&#x5728;session&#x7ed3;&#x675f;&#x65f6;&#x8c03;&#x7528;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1315925525725" ID="ID_1126603428" MODIFIED="1315925564475" TEXT="DoneCookie&#xff1a;&#x4f20;&#x9012;&#x7ed9;DoneCB&#x7684;&#x53c2;&#x6570;"/>
<node CREATED="1315925577852" ID="ID_1667726248" MODIFIED="1315925580192" TEXT="Quit"/>
<node CREATED="1315925589503" ID="ID_1294978381" MODIFIED="1315925591101" TEXT="Cleaned"/>
<node CREATED="1315925617039" FOLDED="true" ID="ID_754459544" MODIFIED="1321343164873" TEXT="Job">
<node CREATED="1315925632017" ID="ID_18466142" MODIFIED="1315925633777" TEXT="struct mibshQ *QJob"/>
<node CREATED="1315925644546" ID="ID_179859920" MODIFIED="1315925646640" TEXT="Busy"/>
<node CREATED="1315925654581" ID="ID_514484081" MODIFIED="1315931359018" TEXT="JobNumber&#xff1a;&#x5f53;&#x524d;&#x6b63;&#x5728;&#x5904;&#x7406;&#x7684;job"/>
</node>
</node>
<node CREATED="1315929805443" FOLDED="true" ID="ID_1122874899" MODIFIED="1321343164873" TEXT="struct mibshQ">
<node CREATED="1315929824027" ID="ID_594791368" MODIFIED="1315929829795" TEXT="Next"/>
<node CREATED="1315929830278" ID="ID_705878124" MODIFIED="1315929832722" TEXT="enum mibshOperation Operation"/>
<node CREATED="1315929846541" ID="ID_1416263022" MODIFIED="1315929848202" TEXT="mibObjectHandle Object"/>
<node CREATED="1315929864520" ID="ID_1174268710" MODIFIED="1315929867680" TEXT="mibObjectHandle FoundObject"/>
<node CREATED="1315929878465" ID="ID_1558310254" MODIFIED="1315929881537" TEXT="ValueText"/>
<node CREATED="1315929889748" ID="ID_1603842193" MODIFIED="1315929891651" TEXT="IValue"/>
<node CREATED="1315929912386" ID="ID_752802758" MODIFIED="1315929915549" TEXT="DoWatch"/>
</node>
</node>
<node CREATED="1315924722615" FOLDED="true" ID="ID_1009032026" MODIFIED="1321348340252" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1315924941418" FOLDED="true" ID="ID_161785916" MODIFIED="1321348339291" TEXT="mibshInit">
<node CREATED="1315924954155" FOLDED="true" ID="ID_1665170687" MODIFIED="1321348337939" TEXT="mibshInitListen">
<node CREATED="1315925025397" ID="ID_219033858" MODIFIED="1315925029223" TEXT="bind"/>
<node CREATED="1315925001611" ID="ID_858024862" MODIFIED="1315925007235" TEXT="listen"/>
<node CREATED="1315925057112" FOLDED="true" ID="ID_1847497463" MODIFIED="1321348336587" TEXT="&#x521b;&#x5efa;&#x5b9a;&#x65f6;&#x5668;&#xff1a;mibshS.Ready = mibshAccept">
<node CREATED="1315925165090" ID="ID_981496063" MODIFIED="1315925167709" TEXT="accept"/>
<node CREATED="1315925183397" ID="ID_459121890" MODIFIED="1315925226634" TEXT="&#x5c06;accept&#x6240;&#x5f97;&#x7684;socket&#x8bbe;&#x4e3a;&#x975e;&#x963b;&#x585e;O_NONBLOCK"/>
<node CREATED="1315925242070" FOLDED="true" ID="ID_592952305" MODIFIED="1321348335445" TEXT="mibshSessionStart">
<node CREATED="1315925868909" FOLDED="true" ID="ID_322089182" MODIFIED="1321343164873" TEXT="&#x521b;&#x5efa;&#x65b0;&#x7684;struct mibshShellContext&#x7ed3;&#x6784;&#x4f53;">
<node CREATED="1315925946081" ID="ID_727662840" LINK="#ID_633346984" MODIFIED="1315930783498" TEXT="ShellContext-&gt;CloseTimeout = mibshCloseFinal"/>
<node CREATED="1315925979466" ID="ID_1108276288" MODIFIED="1315926374543" TEXT="&#x521b;&#x5efa;&#x8bfb;&#x53d6;&#x7f13;&#x51b2;&#x533a;ShellContext-&gt;ReadBuf&#xff0c;&#x8bfb;&#x53d6;&#x51fd;&#x6570;&#x4e3a;mibshRead"/>
<node CREATED="1315926006946" ID="ID_1482357054" MODIFIED="1315926018838" TEXT="&#x521b;&#x5efa;&#x5199;&#x5165;&#x7f13;&#x51b2;&#x533a;ShellContext-&gt;WriteBuf"/>
<node CREATED="1315926036895" ID="ID_836428102" MODIFIED="1315926046954" TEXT="&#x63d0;&#x793a;&#x7528;&#x6237;&#x8f93;&#x5165;"/>
<node CREATED="1315926103712" FOLDED="true" ID="ID_859180192" MODIFIED="1321343164873" TEXT="&#x4e3a;&#x6b64;shell&#x521b;&#x5efa;manager plugin&#xff1a;ShellContext-&gt;ManagerPlugin">
<node CREATED="1315926185603" ID="ID_1115996727" MODIFIED="1315926188452" TEXT=".JobStart = mibshJobStart"/>
<node CREATED="1315926198532" ID="ID_1485622505" MODIFIED="1315926199882" TEXT=".JobDone = mibshJobDone"/>
<node CREATED="1315926208892" ID="ID_1874272467" MODIFIED="1315926210416" TEXT=".Report = mibshReport"/>
<node CREATED="1315926225704" ID="ID_51490963" MODIFIED="1315926227790" TEXT=".Cookie1 = ShellContext"/>
</node>
</node>
<node CREATED="1315925800448" ID="ID_848113307" MODIFIED="1315925863572" TEXT="&#x5c06;&#x65b0;&#x521b;&#x5efa;&#x7684;struct mibshShellContext&#x7ed3;&#x6784;&#x4f53;&#x63d2;&#x5165;mibshS.FirstShell&#x94fe;&#x8868;"/>
<node CREATED="1315926300442" ID="ID_1525411889" MODIFIED="1315926306511" TEXT="&#x5b89;&#x88c5;ShellContext-&gt;ManagerPlugin"/>
</node>
</node>
<node CREATED="1315927574579" FOLDED="true" ID="ID_1586661552" MODIFIED="1321343164874" TEXT="mibshRead">
<node CREATED="1315927595574" ID="ID_1693020786" MODIFIED="1315927702467" TEXT="&#x82e5;ShellContext-&gt;Job.Busy&#x7f6e;&#x4f4d;&#x8868;&#x793a;&#x6b63;&#x5728;&#x5904;&#x7406;&#x4e00;&#x4e2a;job&#xff0c;&#x5728;&#x5176;&#x5b8c;&#x6210;&#x524d;&#x4e0d;&#x4f1a;&#x5904;&#x7406;&#x4e0b;&#x4e00;&#x4e2a;job"/>
<node CREATED="1315927737735" ID="ID_1415394581" MODIFIED="1315927773699" TEXT="&#x82e5;&#x8bfb;&#x53d6;&#x7f13;&#x51b2;&#x533a;&#x5931;&#x8d25;&#x5219;&#x8fd4;&#x56de;"/>
<node CREATED="1315928339609" FOLDED="true" ID="ID_1713610573" MODIFIED="1321343164874" TEXT="&#x547d;&#x4ee4;&#x5206;&#x7c7b;&#x5904;&#x7406;">
<node CREATED="1315928376691" FOLDED="true" ID="ID_1580001933" MODIFIED="1321343164874" TEXT="quit">
<node CREATED="1315929134281" FOLDED="true" ID="ID_378428269" MODIFIED="1321343164874" TEXT="mibshShutdown">
<node CREATED="1315929273690" FOLDED="true" ID="ID_17703150" MODIFIED="1321343164874" TEXT="mibshClean">
<node CREATED="1315929313239" ID="ID_1986196031" MODIFIED="1315929325272" TEXT="&#x5378;&#x8f7d;manager plugin"/>
<node CREATED="1315925800448" ID="ID_1023399486" MODIFIED="1315929416074" TEXT="&#x5c06;struct mibshShellContext&#x7ed3;&#x6784;&#x4f53;&#x4ece;mibshS.FirstShell&#x94fe;&#x8868;&#x4e2d;&#x5220;&#x9664;"/>
<node CREATED="1315929461896" ID="ID_1096838779" MODIFIED="1315929477805" TEXT="mibshQFree&#x91ca;&#x653e;queue&#x4e2d;&#x7684;job"/>
<node CREATED="1315929479387" ID="ID_809681628" MODIFIED="1315929506514" TEXT="&#x91ca;&#x653e;&#x8bfb;&#x53d6;&#x7f13;&#x51b2;&#x533a;"/>
</node>
<node CREATED="1315929165950" FOLDED="true" ID="ID_633346984" MODIFIED="1321343164874" TEXT="&#x6fc0;&#x6d3b;&#x5b9a;&#x65f6;&#x5668;CloseTimeout&#xff0c;&#x8fdb;&#x884c;&#x4e00;&#x5b9a;&#x5ef6;&#x65f6;&#x540e;&#x518d;&#x6267;&#x884c;&#x6e05;&#x7406;&#x5de5;&#x4f5c;&#xa;mibshCloseFinal&#xff0c; ">
<node CREATED="1315929572723" ID="ID_1727289278" MODIFIED="1315929574500" TEXT="mibshClean"/>
<node CREATED="1315929624098" ID="ID_389422192" MODIFIED="1315929633342" TEXT="&#x91ca;&#x653e;&#x5199;&#x5165;&#x7f13;&#x51b2;&#x533a;"/>
<node CREATED="1315929643160" ID="ID_1064631175" MODIFIED="1315929649039" TEXT="&#x5173;&#x95ed;socket"/>
<node CREATED="1315929673406" ID="ID_1776463705" MODIFIED="1315929686658" TEXT="&#x91ca;&#x653e;&#x7f13;&#x51b2;&#x533a;struct mibshShellContext *ShellContext"/>
<node CREATED="1315929602837" ID="ID_544956548" MODIFIED="1315929611391" TEXT="&#x8c03;&#x7528;DoneCB&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
</node>
</node>
<node CREATED="1315930047912" FOLDED="true" ID="ID_253409200" MODIFIED="1321343164874" TEXT="reset">
<node CREATED="1315930086405" ID="ID_197884636" MODIFIED="1315930156521" TEXT="&#x521b;&#x5efa;&#x8bf7;&#x6c42;struct mibshQ *Q&#xff0c;&#x5e76;&#x5c06;&#x8bf7;&#x6c42;&#x7684;&#x7c7b;&#x578b;&#x8bbe;&#x4e3a;mibshOperation_eReset"/>
</node>
</node>
<node CREATED="1315930186142" ID="ID_1357828747" MODIFIED="1315930203042" TEXT="&#x5c06;&#x8bf7;&#x6c42;&#x52a0;&#x5165;&#x961f;&#x5217;ShellContext-&gt;Job.QJob&#x4e2d;"/>
<node CREATED="1315930322583" ID="ID_728229327" MODIFIED="1315930603076" TEXT="&#x82e5;&#x6ca1;&#x6709;queue&#x547d;&#x4ee4;&#x524d;&#x7f00;&#x5219;&#x7acb;&#x5373;&#x901a;&#x8fc7;manager plugin&#x8bf7;&#x6c42;&#x4e00;&#x4e2a;job,&#x5e76;&#x5c06;ShellContext-&gt;Job.Busy &#x7f6e;&#x4f4d;&#x3002;&#xa;&#x82e5;&#x6709;queue&#x547d;&#x4ee4;&#x524d;&#x7f00;&#x8868;&#x793a;&#x5e94;&#x5c06;&#x7528;&#x6237;&#x7684;&#x591a;&#x4e2a;&#x64cd;&#x4f5c;&#x5408;&#x5e76;&#x4e3a;&#x4e00;&#x4e2a;job&#xff0c;&#x6545;&#x800c;&#x65e0;&#x9700;&#x7acb;&#x5373;&#x8bf7;&#x6c42;&#x4e00;&#x4e2a;job."/>
</node>
<node CREATED="1315931201897" ID="ID_1416128686" MODIFIED="1315931205294" TEXT="mibshJobStart"/>
</node>
</node>
</node>
<node CREATED="1315924843850" FOLDED="true" ID="ID_149472465" MODIFIED="1321343164874" TEXT="&#x5168;&#x5c40;&#x53d8;&#x91cf;">
<node CREATED="1315924858914" ID="ID_1526132154" MODIFIED="1315924892804" TEXT="&#x5b9a;&#x65f6;&#x5668; &#xff1a;mibshS.UnstallTimeout = mibshResumeStalledShells"/>
<node CREATED="1315925117280" ID="ID_983900704" MODIFIED="1315925119588" TEXT="&#x5b9a;&#x65f6;&#x5668;&#xff1a;mibshS.Ready = mibshAccept"/>
</node>
</node>
<node CREATED="1310800278572" ID="ID_466634525" MODIFIED="1337760672274" TEXT="manager plugin">
<node CREATED="1310838193715" FOLDED="true" ID="ID_103598754" MODIFIED="1337582377727" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1310838204087" FOLDED="true" ID="ID_300279557" MODIFIED="1337567738962" TEXT="struct mibManagerPlugin">
<node CREATED="1310838223615" ID="ID_946571730" MODIFIED="1310838226447" TEXT="Name"/>
<node CREATED="1310838239636" ID="ID_1051653975" MODIFIED="1321336408381" TEXT="Instance : &#x540c;&#x4e00;&#x4e2a;manager plugin&#x8d77;&#x591a;&#x4e2a;&#x5b9e;&#x4f8b;&#x65f6;&#xff0c;&#x6b64;&#x503c;&#x7528;&#x4e8e;&#x533a;&#x5206;&#x4e0d;&#x540c;&#x5b9e;&#x4f8b;"/>
<node CREATED="1310838252090" ID="ID_1912519484" MODIFIED="1321336420411" TEXT="Priveleged &#xff1a;&#x4f18;&#x5148;&#x7ea7;"/>
<node CREATED="1310838262281" ID="ID_1586645710" MODIFIED="1310838263883" TEXT="Cookie1"/>
<node CREATED="1310838274143" ID="ID_196062536" MODIFIED="1321336819727" TEXT="JobStart&#x51fd;&#x6570; &#xff1a;&#xa;&#x5f53;&#x67d0;&#x4e00;&#x4e2a;manager plugin&#x8bf7;&#x6c42;&#x4e00;&#x4e2a;job&#x540e;&#xff0c;mib core&#x4f1a;&#x56de;&#x8c03;&#x6b64;&#x51fd;&#x6570;&#xa;manager plugin&#x5e94;&#x5728;&#x6b64;&#x51fd;&#x6570;&#x5185;&#x6267;&#x884c;mib&#x64cd;&#x4f5c;(&#x5982;mibManagerConfigSet)&#x3002;&#xa;manager plugin&#x5e94;&#x5728;&#x6b64;&#x51fd;&#x6570;&#x5185;&#x6700;&#x7ec8;&#x6267;&#x884c;mibManagerJobActivate&#x6216;&#xa;mibManagerJobCancel&#x4ee5;&#x6fc0;&#x6d3b;&#x6216;&#x53d6;&#x6d88;&#x6b64;job&#x3002;"/>
<node CREATED="1310873111548" ID="ID_517701393" MODIFIED="1310873122212" TEXT="JobDone&#x51fd;&#x6570;"/>
<node CREATED="1310873136883" ID="ID_86248952" MODIFIED="1321336994948" TEXT="Report&#x51fd;&#x6570;&#xa;manager plugin&#x8bf7;&#x6c42;&#x7684;job&#x5b8c;&#x6210;&#x540e;&#xff0c;mib core&#x4f1a;&#x56de;&#x8c03;&#x6b64;&#x51fd;&#x6570;&#xa;&#x6b64;&#x51fd;&#x6570;&#x4e00;&#x822c;&#x5411;&#x7528;&#x6237;&#x8fd4;&#x56de;mib&#x64cd;&#x4f5c;&#x7684;&#x6267;&#x884c;&#x7ed3;&#x679c;(&#x5982;&#x8fd4;&#x56de;&#x6240;get&#x7684;mib&#x7684;&#x503c;)"/>
<node CREATED="1310873157643" ID="ID_42500326" MODIFIED="1321337023692" TEXT="Installed &#xff1a;&#x662f;&#x5426;&#x5df2;&#x5b89;&#x88c5;"/>
<node CREATED="1310873168597" ID="ID_584478156" MODIFIED="1310873170651" TEXT="Next"/>
</node>
<node CREATED="1310876966165" FOLDED="true" ID="ID_1838429029" MODIFIED="1337335624799" TEXT="struct mibJobRequest">
<node CREATED="1310876970562" ID="ID_570162506" MODIFIED="1337327526069" TEXT="Next : &#x4e0b;&#x4e00;&#x4e2a;job&#x8bf7;&#x6c42;"/>
<node CREATED="1310876973805" ID="ID_1477300991" MODIFIED="1337327537710" TEXT="Prev : &#x4e0a;&#x4e00;&#x4e2a;job&#x8bf7;&#x6c42;"/>
<node CREATED="1310876991152" ID="ID_1804254888" MODIFIED="1337327558270" TEXT="ManagerPlugin : &#x8bf7;&#x6c42;&#x6b64;job&#x7684;manager plugin"/>
<node CREATED="1310876993526" ID="ID_1498567632" MODIFIED="1337327629405" TEXT="Cookie2 : manager plugin&#x8c03;&#x7528;mibManagerJobRequest&#x8bf7;&#x6c42;&#x6b64;job&#x65f6;&#x4f20;&#x5165;&#x7684;cookie"/>
</node>
<node CREATED="1321239278799" FOLDED="true" ID="ID_197579602" MODIFIED="1321343862995" TEXT="struct mibCurrentJob">
<node CREATED="1321239293465" ID="ID_1227266646" MODIFIED="1321239444919" TEXT="JobNumber:&#x5f53;&#x524d;job&#x7684;&#x7f16;&#x53f7;,0&#x8868;&#x793a;&#x6ca1;&#x6709;job&#x8981;&#x5904;&#x7406;,&#x975e;0&#x503c;&#x7531;mibS.LastJobNumber&#x8d4b;&#x503c;"/>
<node CREATED="1321239507313" ID="ID_1492357901" MODIFIED="1321239509618" TEXT="Cookie2"/>
<node CREATED="1321239520033" FOLDED="true" ID="ID_291051268" MODIFIED="1321343164878" TEXT="JobStage">
<node CREATED="1321239813189" ID="ID_1837369218" MODIFIED="1321239815603" TEXT="mibJobStage_eNoJob"/>
<node CREATED="1321239821172" ID="ID_272766653" MODIFIED="1321239822546" TEXT="mibJobStage_eSetup"/>
<node CREATED="1321239829124" ID="ID_967661616" MODIFIED="1321239830331" TEXT="mibJobStage_eActivated"/>
<node CREATED="1321239835396" ID="ID_989306692" MODIFIED="1321239836509" TEXT="mibJobStage_ePropogate"/>
<node CREATED="1321239842691" ID="ID_1912808771" MODIFIED="1321239843861" TEXT="mibJobStage_eStatusUpdate"/>
<node CREATED="1321239849923" ID="ID_285457473" MODIFIED="1321239851011" TEXT="mibJobStage_eStorage"/>
<node CREATED="1321239856787" ID="ID_51170223" MODIFIED="1321239857818" TEXT="mibJobStage_eReport"/>
</node>
<node CREATED="1321239533424" ID="ID_1342194949" MODIFIED="1321239534964" TEXT="CancelStage"/>
<node CREATED="1321239542784" ID="ID_1270443008" MODIFIED="1321325287576" TEXT="struct mibManagerPlugin *ManagerPlugin : &#x53d1;&#x8d77;&#x6b64;job&#x7684;manager plugin"/>
<node CREATED="1321239573486" ID="ID_1018674459" MODIFIED="1321261248158" TEXT="NStatusUpdateWait : &#x9700;&#x8981;&#x5728;&#x8fd9;&#x4e2a;job&#x4e2d;&#x66f4;&#x65b0;&#x591a;&#x5c11;&#x4e2a;status mib"/>
<node CREATED="1321239582606" ID="ID_680704266" MODIFIED="1321239608563" TEXT="JobCancelling: &#x975e;0&#x8868;&#x793a;&#x6b63;&#x5728;&#x53d6;&#x6d88;&#x5f53;&#x524d;job"/>
<node CREATED="1321239622588" ID="ID_298050389" MODIFIED="1321338735567" TEXT="JobError &#xff1a;job&#x7684;&#x9519;&#x8bef;&#x539f;&#x56e0;"/>
<node CREATED="1321239671706" ID="ID_108128860" MODIFIED="1321325626831" TEXT="NConfigChanges &#xff1a; &#x5728;&#x6b64;job&#x4e2d;&#x6709;&#x591a;&#x5c11;&#x4e2a;config mib&#x7684;&#x503c;&#x88ab;&#x6539;&#x53d8;&#x4e86;"/>
<node CREATED="1321239690457" ID="ID_1979403256" MODIFIED="1321325447537" TEXT="struct mibServicePlugin *CurrentServicePlugin : &#x5f53;&#x524d;&#x9700;&#x8981;&#x88ab;&#x8c03;&#x5ea6;&#x7684;service plugin&#xff0c;&#xa;service plugin&#x88ab;&#x8c03;&#x5ea6;&#x6765;&#x6267;&#x884c;&#x5176;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;&#x6216;status update&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1321239700217" ID="ID_1971405977" MODIFIED="1321239701901" TEXT="CurrentServicePluginCalled"/>
<node CREATED="1321239707913" ID="ID_70812678" MODIFIED="1321239709002" TEXT="IsTr069Job"/>
<node CREATED="1321239714904" ID="ID_911288864" MODIFIED="1321338782718" TEXT="RestoreDoneInThisJob &#xff1a;&#x5df2;&#x5728;&#x6b64;job&#x4e2d;&#x4fdd;&#x5b58;&#x4e86;&#x6574;&#x4e2a;mib&#x6811;"/>
<node CREATED="1321239723416" ID="ID_39986878" MODIFIED="1321287988231" TEXT="JobNoFail &#xff1a;&#x4e0d;&#x5141;&#x8bb8;job fail&#x5373;&#x4f7f;&#x51fa;&#x73b0;err&#x4e5f;&#x8981;&#x7ee7;&#x7eed;&#x4e0b;&#x53bb;"/>
</node>
</node>
<node CREATED="1310876776431" ID="ID_887640632" MODIFIED="1337760673554" TEXT="Job&#x8fc7;&#x7a0b;">
<node CREATED="1310876799531" FOLDED="true" ID="ID_1375761162" MODIFIED="1337334703823" TEXT="1, &#x7531;manager plugin&#x8bf7;&#x6c42;Job&#xa;    mibManagerJobRequest">
<node CREATED="1310877024620" ID="ID_313986524" MODIFIED="1310877381619" TEXT="1, &#x521b;&#x5efa;&#x4e00;&#x4e2a;&#x65b0;&#x7684;struct mibJobRequest&#x5e76;&#x5c06;&#x5176;&#x653e;&#x5165;&#xa;    mibS.JobRequestRoot&#x961f;&#x5217;&#x4e2d;"/>
<node CREATED="1310877584680" ID="ID_138153982" MODIFIED="1310877684505" TEXT="2, &#x8c03;&#x7528;mibManagerPoll&#x8c03;&#x6574;&#x5b9a;&#x65f6;&#x5668;mibS.PollTimeout&#xa;    &#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;&#xff0c;&#x4f7f;&#x5176;&#x5feb;&#x70b9;&#x8d85;&#x65f6;&#x4ee5;&#x5904;&#x7406;Job&#x8bf7;&#x6c42;"/>
</node>
<node CREATED="1310878161248" FOLDED="true" ID="ID_1632206534" MODIFIED="1337577968971" TEXT="2, &#x5b9a;&#x65f6;&#x5668;mibS.PollTimeout&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;mibManagerPollReal &#x5904;&#x7406;Job&#x8bf7;&#x6c42;">
<node CREATED="1310878321332" FOLDED="true" ID="ID_662969757" MODIFIED="1337577967631" TEXT="1, &#x82e5;&#x5f53;&#x524d;&#x6ca1;&#x6709;&#x6b63;&#x5728;&#x5904;&#x7406;&#x4e2d;&#x7684;Job">
<node CREATED="1310878433422" FOLDED="true" ID="ID_1111907915" MODIFIED="1337570846635" TEXT="1, &#x82e5;mibS.JobRequestRoot&#x961f;&#x5217;&#x4e2d;&#x6709;&#x9700;&#x8981;&#x5904;&#x7406;&#x7684;Job&#xff0c;&#xa;    &#x5219;&#x8c03;&#x7528;mibManagerJobStart&#x5f00;&#x59cb;&#x4e00;&#x4e2a;Job.&#x4e4b;&#x540e;&#x518d;&#xa;    &#x8c03;&#x7528;mibManagerPoll&#x8c03;&#x6574;&#x5b9a;&#x65f6;&#x5668;mibS.PollTimeout&#xa;    &#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;&#xff0c;&#x4f7f;&#x5176;&#x5feb;&#x70b9;&#x8d85;&#x65f6;&#x4ee5;&#x5904;&#x7406;Job&#x8bf7;&#x6c42;, &#x4e4b;&#x540e;&#x8fd4;&#x56de;.">
<node CREATED="1310878630409" ID="ID_744364444" MODIFIED="1321239146886" TEXT="1, &#x82e5;&#x6709;&#x67d0;&#x4e2a;manager plugin&#x9501;&#x5b9a;&#x4e86;Job&#x5904;&#x7406;&#x7cfb;&#x7edf;(mibS.LockingManagerPlugin != NULL)&#xff0c;&#xa;    &#x5219;&#x5148;&#x5904;&#x7406;&#x5b83;&#x8bf7;&#x6c42;&#x7684;Job&#xff0c;&#x82e5;&#x6ca1;&#x6709;&#x5219;&#x9009;&#x62e9;&#x961f;&#x5217;&#x4e2d;&#x7684;&#x7b2c;&#x4e00;&#x4e2a;Job&#x8bf7;&#x6c42;"/>
<node CREATED="1310878785730" FOLDED="true" ID="ID_1854211770" MODIFIED="1337566740984" TEXT="2, &#x7528;Job&#x8bf7;&#x6c42;&#x521d;&#x59cb;&#x5316;mibS.Job. mibS.Job&#x8868;&#x793a;&#x5f53;&#x524d;&#x6b63;&#x5728;&#x5904;&#x7406;&#x7684;Job.">
<node CREATED="1310878889335" ID="ID_735047420" MODIFIED="1310878892158" TEXT="mibS.Job.JobNumber = ++mibS.LastJobNumber"/>
<node CREATED="1310878902865" ID="ID_1591373818" MODIFIED="1310878904822" TEXT="mibS.Job.JobStage = mibJobStage_eSetup"/>
<node CREATED="1310878917096" ID="ID_535113434" MODIFIED="1310878917899" TEXT="mibS.Job.ManagerPlugin = Request-&gt;ManagerPlugin"/>
<node CREATED="1310878929096" ID="ID_1062327514" MODIFIED="1310878930654" TEXT="mibS.Job.Cookie2 = Request-&gt;Cookie2"/>
</node>
<node CREATED="1310878971738" ID="ID_1288923227" LINK="#ID_794621156" MODIFIED="1337336327175" TEXT="3, &#x8c03;&#x7528;mibManagerReportUnschedule&#x89e3;&#x6ce8;&#x518c;&#x5b9a;&#x65f6;&#x5668;mibS.InternalJobTimeout&#xa;    mibS.InternalJobTimeout&#x8868;&#x793a;&#x4e00;&#x4e2a;&#x505a;reset&#x548c;restore&#x7684;job,&#x65e2;&#x7136;&#x73b0;&#x5728;&#x5df2;&#x7ecf;&#x5f00;&#x59cb;&#x65b0;&#x7684;job&#x4e86;,&#xa;    &#x56e0;&#x6b64;&#x53ef;&#x4ee5;&#x53d6;&#x6d88;&#x89e6;&#x53d1;&#x7b2c;&#x4e00;&#x4e2a;job&#x7684;&#x5b9a;&#x65f6;&#x5668;&#x4e86;(&#x8981;&#x4e48;&#x73b0;&#x5728;&#x505a;&#x5f97;&#x5c31;&#x662f;&#x7b2c;&#x4e00;&#x4e2a;job,&#x8981;&#x4e48;&#x7b2c;&#x4e00;&#x4e2a;job&#x5df2;&#x7ecf;&#x505a;&#x5b8c;&#x4e86;)"/>
<node CREATED="1310879045452" ID="ID_1517024818" LINK="#ID_805132862" MODIFIED="1310879576746" TEXT="4, &#x6ce8;&#x518c;&#x5b9a;&#x65f6;&#x5668;mibS.JobTimeout, &#x82e5;&#x6b64;Job&#x5728;&#x89c4;&#x5b9a;&#x65f6;&#x95f4;&#x5185;&#xa;    &#x6ca1;&#x6709;&#x6b63;&#x786e;&#x5904;&#x7406;&#x5b8c;&#x6210;&#xff0c;&#x5219;&#x53d6;&#x6d88;&#x6b64;Job"/>
<node CREATED="1310879090450" ID="ID_1599402946" MODIFIED="1310879133239" TEXT="5, &#x8c03;&#x7528;&#x8bf7;&#x6c42;&#x6b64;Job&#x7684;ManagerPlugin&#x7684;JobStart&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1310879142080" ID="ID_795444925" MODIFIED="1310879167919" TEXT="6, &#x5c06;&#x6b64;Job&#x8bf7;&#x6c42;&#x5220;&#x9664;"/>
</node>
<node CREATED="1310878433422" ID="ID_366792931" LINK="#ID_255412536" MODIFIED="1337335104318" TEXT="2, &#x82e5;mibS.JobRequestRoot&#x961f;&#x5217;&#x4e2d;&#x6ca1;&#x6709;&#x6709;&#x9700;&#x8981;&#x5904;&#x7406;&#x7684;Job,&#x4f46;&#x662f;&#x7cfb;&#x7edf;&#x9700;&#x8981;&#x91cd;&#x542f;&#xa;    (mibS.RebootRequired),&#x5219;&#x6ce8;&#x518c;&#x5b9a;&#x65f6;&#x5668;mibS.RebootTimeout, &#x4e4b;&#x540e;&#x8fd4;&#x56de;."/>
<node CREATED="1321258070951" FOLDED="true" ID="ID_931946212" MODIFIED="1337577832624">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      3, &#33509;mibS.JobRequestRoot&#38431;&#21015;&#20013;&#27809;&#26377;&#26377;&#38656;&#35201;&#22788;&#29702;&#30340;Job,&#19988;&#31995;&#32479;&#26080;&#38656;&#37325;&#21551;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#21017;&#35843;&#29992;mibManagerNotifyFix&#36941;&#21382;&#25152;&#26377;&#21494;&#23376;&#33410;&#28857;,&#30830;&#23450;&#21738;&#20123;&#33410;&#28857;&#38656;&#35201;&#26356;&#26032;.
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#36825;&#26159;&#19968;&#20010;&#24120;&#24577;,&#21363;&#20351;&#27809;&#26377;job&#35302;&#21457;mib&#33410;&#28857;&#26356;&#26032;,&#20063;&#35201;&#23450;&#26102;&#26356;&#26032;&#26576;&#20123;mib&#33410;&#28857;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#27604;&#22914;tr069&#20027;&#21160;&#19978;&#25253;&#30340;&#33410;&#28857;.
    </p>
  </body>
</html></richcontent>
<node CREATED="1321259113198" ID="ID_1357353323" MODIFIED="1321259783388" TEXT="1,&#x5982;&#x679c;&#x4e0d;&#x662f;status mib&#x5219;&#x65e0;&#x9700;&#x66f4;&#x65b0;"/>
<node CREATED="1321259143052" ID="ID_91671821" MODIFIED="1321259792383" TEXT="2, &#x5982;&#x679c;status mib&#x662f;permanent(&#x8868;&#x793a;&#x6c38;&#x4e0d;&#x66f4;&#x65b0;)&#x7684;&#x4e5f;&#x65e0;&#x9700;&#x66f4;&#x65b0;"/>
<node CREATED="1321259835490" ID="ID_1636052070" MODIFIED="1321259865740" TEXT="3, &#x5982;&#x679c;&#x4e0d;&#x9700;&#x8981;&#x8fdb;&#x884c;tr069&#x901a;&#x62a5;&#x5219;&#x65e0;&#x9700;&#x66f4;&#x65b0;"/>
<node CREATED="1321259866752" ID="ID_915834788" MODIFIED="1321259926150" TEXT="4, tr069&#x901a;&#x62a5;&#x6a21;&#x5f0f;&#x4e3a;&#x4e3b;&#x52a8;&#x6216;&#x88ab;&#x52a8;&#x65f6;&#x9700;&#x8981;&#x8fdb;&#x884c;&#x66f4;&#x65b0;"/>
<node CREATED="1321260041257" FOLDED="true" ID="ID_1490707645" MODIFIED="1337577831036" TEXT="5, &#x5bf9;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x7684;mib&#x8282;&#x70b9;&#x8c03;&#x7528;mibUpdateNeededSet">
<node CREATED="1321260801355" ID="ID_544704674" MODIFIED="1321260837603" TEXT="&#x82e5;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x5219;&#x5c06;Object-&gt;VarP-&gt;UpdateNeeded&#x8bbe;&#x4e3a;1,&#x5426;&#x5219;&#x8bbe;&#x4e3a;0"/>
<node CREATED="1321260864121" ID="ID_185438814" MODIFIED="1321260900221" TEXT="&#x66f4;&#x65b0;mibS.Job.NStatusUpdateWait(&#x8868;&#x793a;&#x9700;&#x8981;&#x5728;&#x5f53;&#x524d;job&#x4e2d;&#x66f4;&#x65b0;&#x7684;mib&#x8282;&#x70b9;&#x6570;&#x91cf;)"/>
<node CREATED="1321260951270" ID="ID_550405224" MODIFIED="1321261170179" TEXT="&#x9012;&#x589e;&#x6216;&#x9012;&#x51cf;&#x6240;&#x6709;&#x58f0;&#x660e;&#x4e86;&#x6b64;mib&#x8282;&#x70b9;&#x7684;service plugin&#x7684;UpdateNeedCount,&#xa;&#x82e5;&#x6b64;&#x503c;&#x975e;0&#x5219;&#x5e94;&#x5c06;ServicePlugin-&gt;StatusUpdateNeed&#x8bbe;&#x4e3a;1,&#x5426;&#x5219;&#x8bbe;&#x4e3a;0.&#xa;&#x8868;&#x793a;&#x6b64;service plugin&#x9700;&#x8981;&#x66f4;&#x65b0;&#x5b83;&#x58f0;&#x660e;&#x7684;&#x4e00;&#x4e2a;mib&#x8282;&#x70b9;"/>
</node>
<node CREATED="1321260078680" ID="ID_1907769777" LINK="#ID_794621156" MODIFIED="1321260678215" TEXT="6, &#x5982;&#x679c;&#x6574;&#x4e2a;mib&#x6811;&#x4e2d;&#x6709;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x7684;&#x8282;&#x70b9;&#x5219;&#x6ce8;&#x518c;mibS.InternalJobTimeout&#x5b9a;&#x65f6;&#x5668;"/>
</node>
</node>
<node CREATED="1310878321332" ID="ID_1361614279" MODIFIED="1321288341433" TEXT="2, &#x82e5;&#x5f53;&#x524d;&#x6709;&#x6b63;&#x5728;&#x5904;&#x7406;&#x4e2d;&#x7684;Job&#x5219;&#x6839;&#x636e;job&#x7684;&#x72b6;&#x6001;&#x5206;&#x522b;&#x8fdb;&#x884c;&#x5904;&#x7406;&#xff0c;&#x89c1;&#x4e0b;&#x9762;"/>
</node>
<node CREATED="1310879901171" ID="ID_1256682611" MODIFIED="1337760678110" TEXT="3, ManagerPlugin&#x7684;JobStart&#x56de;&#x8c03;&#x51fd;&#x6570;&#x5e94;&#x8fdb;&#x884c;&#x5176;&#x9700;&#x8981;&#x7684;&#x5404;&#x79cd;mib&#x64cd;&#x4f5c;&#xff0c;&#xa;    &#x7136;&#x540e;&#x8c03;&#x7528;mibManagerJobActivate&#x6fc0;&#x6d3b;Job">
<node CREATED="1310888129492" ID="ID_447163723" MODIFIED="1337760679911" TEXT="mib&#x64cd;&#x4f5c;">
<node CREATED="1310888755298" FOLDED="true" ID="ID_1072568733" MODIFIED="1337570822177" TEXT="mibManagerConfigSetFromText">
<node CREATED="1310891391589" FOLDED="true" ID="ID_1325399038" MODIFIED="1337570821162" TEXT="mibManagerConfigSet">
<node CREATED="1310891442277" ID="ID_1838102424" MODIFIED="1310891533117" TEXT="1, Job&#x4ec5;&#x5728;setup&#x6216;actived&#x72b6;&#x6001;&#x624d;&#x80fd;set mib"/>
<node CREATED="1310891564062" ID="ID_1728656013" MODIFIED="1310891699186" TEXT="2, &#x4ec5;&#x6709;&#x672a;&#x9690;&#x85cf;&#x7684;config mib&#x624d;&#x80fd;set,&#x82e5;mib&#x8bbe;&#x5b9a;&#x4e86;RestrictedWrite&#x9650;&#x5236;&#x5199;&#xff0c;&#xa;    &#x5219;&#x8fd8;&#x9700;&#x68c0;&#x67e5;manager plugin&#x662f;&#x5426;&#x6709;&#x5199;&#x7684;&#x6743;&#x9650;"/>
<node CREATED="1310891734708" ID="ID_1773708959" MODIFIED="1310891758625" TEXT="3, &#x82e5;mib&#x503c;&#x672a;&#x53d1;&#x751f;&#x53d8;&#x5316;&#xff0c;&#x5219;&#x8fd4;&#x56de;"/>
<node CREATED="1310892162198" FOLDED="true" ID="ID_650676099" MODIFIED="1337570819912" TEXT="4, &#x8c03;&#x7528;mibObjectVolatileNew&#x5907;&#x4efd;&#x8001;&#x7684;&#x503c;&#xff0c;&#x5206;&#x914d;&#x65b0;&#x7684;&#x503c;">
<node CREATED="1310892516230" ID="ID_38044290" MODIFIED="1310892552847" TEXT="&#x5c06;&#x73b0;&#x6709;&#x503c;Object-&gt;VarP-&gt;VolP&#x5907;&#x4efd;&#x5230;Object-&gt;VarP-&gt;OldVolP"/>
<node CREATED="1310892634100" ID="ID_1888022725" MODIFIED="1310892675267" TEXT="&#x7ed9;&#x73b0;&#x6709;&#x503c;Object-&gt;VarP-&gt;VolP&#x5206;&#x914d;&#x4e00;&#x4e2a;&#x65b0;&#x7684;struct mibObjectVol&#x7ed3;&#x6784;"/>
<node CREATED="1310892713809" ID="ID_542298078" MODIFIED="1310892716535" TEXT="mibS.Job.NConfigChanges++"/>
</node>
<node CREATED="1310892759909" ID="ID_410692396" MODIFIED="1310892782610" TEXT="5, &#x5c06;&#x6240;&#x8bbe;mib &#x503c;&#x590d;&#x5236;&#x5230;Object-&gt;VarP-&gt;VolP"/>
<node CREATED="1310892849293" ID="ID_1045733731" MODIFIED="1310892872144" TEXT="6, &#x8bbe;&#x7f6e;Object-&gt;VarP-&gt;DataEverModified&#x6807;&#x8bb0;mib &#x503c;&#x53d8;&#x5316;&#x4e86;"/>
<node CREATED="1310892940338" ID="ID_1584288542" MODIFIED="1310893009732" TEXT="7, &#x5bf9;&#x6240;&#x6709;depend&#x6b64;mib&#x503c;&#x7684;ServicePlugin-&gt;PropogateNeed, &#x6807;&#x8bb0;&#x5176;&#x9700;&#x8981;&#x5f97;&#x5230;&#x901a;&#x77e5;"/>
</node>
</node>
<node CREATED="1321291323374" FOLDED="true" ID="ID_1975312918" MODIFIED="1321343164892" TEXT="mibServiceStatusSetFromText">
<node CREATED="1321291339658" FOLDED="true" ID="ID_1500787062" MODIFIED="1321343164892" TEXT="mibServiceStatusSet">
<node CREATED="1310891442277" ID="ID_1892934510" MODIFIED="1321291457002" TEXT="1, Job&#x4ec5;&#x5728;setup&#xff0c;actived&#xff0c;propogate, status update&#x72b6;&#x6001;&#x624d;&#x80fd;set status mib"/>
<node CREATED="1310891564062" ID="ID_1789656750" MODIFIED="1321291601907" TEXT="2, &#x8df3;&#x8fc7;config mib, read only&#x7684;mib&#x4ee5;&#x53ca;&#x9690;&#x85cf;&#x7684;mib"/>
<node CREATED="1321291718251" ID="ID_1466535302" MODIFIED="1321291751036" TEXT="3, &#x6839;&#x636e;&#x4f20;&#x5165;&#x53c2;&#x6570;permanent&#x8bbe;&#x7f6e;Object-&gt;VarP-&gt;Permanent"/>
<node CREATED="1321291815021" ID="ID_1749033674" MODIFIED="1321291870457" TEXT="4, &#x82e5;&#x5728;&#x540c;&#x4e00;&#x4e2a;job&#x4e2d;status mib&#x503c;&#x672a;&#x53d1;&#x751f;&#x53d8;&#x5316;&#xff0c;&#x5219;&#x8fd4;&#x56de;"/>
<node CREATED="1321291916983" ID="ID_1946728639" MODIFIED="1321291951019" TEXT="5, &#x5728;Object-&gt;VarP-&gt;VolP-&gt;Data&#x4e0a;&#x8bbe;&#x7f6e;&#x65b0;&#x503c;"/>
<node CREATED="1321292033527" ID="ID_1424615696" MODIFIED="1321292094479" TEXT="6, &#x5728;Object-&gt;VarP-&gt;VolP-&gt;JobNumber&#x4e0a;&#x6807;&#x8bb0;&#x6700;&#x8fd1;&#x66f4;&#x65b0;&#x6b64;status mib&#x7684;job&#xff08;&#x5373;mibS.Job.JobNumber&#xff09;"/>
<node CREATED="1321292196709" ID="ID_897402866" LINK="#ID_1490707645" MODIFIED="1321292331239" TEXT="7, &#x8c03;&#x7528;mibUpdateNeededSet&#x4ee5;&#x6807;&#x8bb0;&#x6b64;status mib&#x66f4;&#x65b0;&#x5b8c;&#x6bd5;"/>
<node CREATED="1321284980733" ID="ID_331649305" MODIFIED="1321292501903" TEXT="8, &#x82e5;&#x5f53;&#x524d;job&#x4e2d;&#x6240;&#x6709;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x7684;status mib&#x90fd;&#x5df2;&#x66f4;&#x65b0;&#x5b8c;&#x6bd5;&#xa;    (mibS.Job.NStatusUpdateWait == 0)&#x5219;&#x8c03;&#x7528;mibManagerPoll&#xa;   &#x8c03;&#x6574;&#x5b9a;&#x65f6;&#x5668;mibS.PollTimeout&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;&#xff0c;&#x4f7f;&#x5176;&#x5feb;&#x70b9;&#x8d85;&#x65f6;&#x4ee5;&#x5904;&#x7406;Job&#x8bf7;&#x6c42;"/>
</node>
</node>
<node CREATED="1310888772361" FOLDED="true" ID="ID_1101143139" MODIFIED="1321343164892" TEXT="mibManagerGetRequest">
<node CREATED="1310891442277" ID="ID_1737818823" MODIFIED="1310891533117" TEXT="1, Job&#x4ec5;&#x5728;setup&#x6216;actived&#x72b6;&#x6001;&#x624d;&#x80fd;set mib"/>
<node CREATED="1310893762718" ID="ID_396313241" MODIFIED="1310893786977" TEXT="2, &#x4ec5;&#x672a;&#x9690;&#x85cf;&#x7684;mib&#x503c;&#x624d;&#x80fd;get"/>
<node CREATED="1310893795812" ID="ID_908525932" MODIFIED="1310893852405" TEXT="3, &#x82e5;mib&#x8282;&#x70b9;&#x4e0d;&#x662f;&#x53f6;&#x5b50;&#x8282;&#x70b9;&#xff0c;&#x5219;&#x5bf9;&#x5176;&#x5b50;&#x8282;&#x70b9;&#x9012;&#x5f52;&#x8c03;&#x7528;mibManagerGetRequest"/>
<node CREATED="1310893885386" ID="ID_319819649" MODIFIED="1310893978622" TEXT="4, &#x5bf9;&#x4e8e;config, readonly, permanent&#x7684;mib&#x8282;&#x70b9;&#xff0c;&#x65e0;&#x987b;service plugin&#x66f4;&#x65b0;&#x6b64;mib&#x503c;&#xff0c;&#x56e0;&#x800c;&#x53ef;&#x4ee5;&#x7acb;&#x5373;&#x8fd4;&#x56de;"/>
<node CREATED="1310894487074" ID="ID_1119712281" LINK="#ID_1490707645" MODIFIED="1321284679079" TEXT="5, &#x5bf9;&#x6b64;status mib&#x8282;&#x70b9;&#x8c03;&#x7528;mibUpdateNeededSet&#x4ee5;&#x8ba9;&#xa;    &#x58f0;&#x660e;&#x4e86;&#x6b64;&#x8282;&#x70b9;&#x7684;service plugin&#x6765;&#x66f4;&#x65b0;&#x6b64;mib&#x8282;&#x70b9;"/>
</node>
</node>
<node CREATED="1310888151335" FOLDED="true" ID="ID_1111060294" MODIFIED="1337577507083" TEXT="mibManagerJobActivate">
<node CREATED="1310894849940" ID="ID_1682829169" MODIFIED="1310894869398" TEXT="&#x5c06;job&#x72b6;&#x6001;&#x8bbe;&#x4e3a;active, mibS.Job.JobStage = mibJobStage_eActivated"/>
<node CREATED="1321353003133" ID="ID_24044909" MODIFIED="1321353204488" TEXT="&#x5982;&#x679c;&#x7cfb;&#x7edf;&#x521d;&#x59cb;&#x9636;&#x6bb5;&#x7684;restore&#x8fc7;&#x7a0b;&#x8fd8;&#x672a;&#x5b8c;&#x6210;(mibS.RestoreDone != 1)&#xff0c;&#x5219;&#x8c03;&#x7528;&#xa;mibS.SaveRestorePlugin.Restore&#x7528;flash&#x4e2d;&#x4fdd;&#x5b58;&#x7684;&#x6587;&#x4ef6;&#x6765;&#x6062;&#x590d;&#x6574;&#x4e2a;mib&#x6811;&#xa;restore&#x5b8c;&#x6210;&#x540e;&#x8bbe;&#x7f6e;mibS.Job.RestoreDoneInThisJob = 1&#x8868;&#x793a;&#x5df2;&#x5728;&#x6b64;job&#x4e2d;&#x5b8c;&#x6210;&#x4e86;restore"/>
<node CREATED="1310894925086" ID="ID_1585940445" MODIFIED="1310894962628" TEXT="mibManagerConfigChangeFilters&#x8c03;&#x7528;&#x6240;&#x6709;service plugin&#x7684;ConfigChangeFilter&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1321284980733" ID="ID_1813815075" MODIFIED="1321285004259" TEXT="&#x8c03;&#x7528;mibManagerPoll&#x8c03;&#x6574;&#x5b9a;&#x65f6;&#x5668;mibS.PollTimeout&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;&#xff0c;&#x4f7f;&#x5176;&#x5feb;&#x70b9;&#x8d85;&#x65f6;&#x4ee5;&#x5904;&#x7406;Job&#x8bf7;&#x6c42;"/>
</node>
</node>
<node CREATED="1310904364180" FOLDED="true" ID="ID_941221829" MODIFIED="1337577614419" TEXT="4, &#x5728;mibManagerPollReal&#x4e2d;&#x9488;&#x5bf9;&#x5df2;&#x5904;&#x4e8e;active&#x72b6;&#x6001;&#x7684;job&#xa;    &#x8c03;&#x7528;mibManagerPropogateSchedule">
<node CREATED="1310894849940" ID="ID_1783992076" MODIFIED="1321285348477" TEXT="&#x5c06;job&#x72b6;&#x6001;&#x8bbe;&#x4e3a;propogate, mibS.Job.JobStage = mibJobStage_ePropogate"/>
<node CREATED="1321285389918" ID="ID_1259577753" MODIFIED="1321286001367" TEXT="&#x904d;&#x5386;&#x6240;&#x6709;service plugin&#x82e5;ServicePlugin-&gt;PropogateNeed&#x7f6e;&#x4f4d;(&#x89c1;mibManagerConfigSet)&#x5219;&#xa;&#x5c06;ServicePlugin-&gt;CallbackScheduled&#x8bbe;&#x4e3a;1&#x8868;&#x793a;&#x9700;&#x8981;&#x8c03;&#x7528;&#x6b64;service plugin&#x7684;&#xa;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;&#xff0c;&#x540c;&#x65f6;&#x5c06;ServicePlugin-&gt;PropogateNeed&#x6e05;&#x4e3a;0"/>
<node CREATED="1321285690547" FOLDED="true" ID="ID_1503264519" MODIFIED="1337577613475" TEXT="&#x8c03;&#x7528;mibManagerPropogate">
<node CREATED="1321285779892" ID="ID_262095010" MODIFIED="1321285894352" TEXT="&#x5bf9;&#x4e8e;&#x9700;&#x8981;&#x8c03;&#x7528;&#x5176;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;service plugin&#x5c06;&#xa;mibS.Job.CurrentServicePlugin&#x8bbe;&#x4e3a;&#x6b64;service plugin"/>
<node CREATED="1321284980733" ID="ID_1670755934" MODIFIED="1321285004259" TEXT="&#x8c03;&#x7528;mibManagerPoll&#x8c03;&#x6574;&#x5b9a;&#x65f6;&#x5668;mibS.PollTimeout&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;&#xff0c;&#x4f7f;&#x5176;&#x5feb;&#x70b9;&#x8d85;&#x65f6;&#x4ee5;&#x5904;&#x7406;Job&#x8bf7;&#x6c42;"/>
</node>
</node>
<node CREATED="1321286609650" FOLDED="true" ID="ID_36840068" MODIFIED="1337579490044" TEXT="5, &#x82e5;job&#x5904;&#x4e8e;propogate&#x72b6;&#x6001;">
<node CREATED="1321286609650" ID="ID_1997001667" MODIFIED="1321287020052" TEXT="1, &#x6839;&#x636e;mibS.Job.CurrentServicePlugin&#x8c03;&#x7528;&#x5176;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;&#xff0c;&#xa;"/>
<node CREATED="1321287022070" ID="ID_1524466069" MODIFIED="1321288803415" TEXT="2, &#x8bbe;&#x7f6e;mibS.Job.CurrentServicePluginCalled = 1&#xff0c;&#xa;   &#x8868;&#x793a;&#x5df2;&#x8c03;&#x5ea6;&#x8fc7;mibS.Job.CurrentServicePlugin&#x7684;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1321288044824" FOLDED="true" ID="ID_1760132345" MODIFIED="1337577636064" TEXT="3, service plugin&#x7684;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;&#x5e94;&#x5728;&#x8c03;&#x7528;&#x7ed3;&#x675f;&#x4e4b;&#x524d;&#x8c03;&#x7528;&#xa;    mibServicePropogationDone&#x5bf9;&#x6267;&#x884c;&#x7ed3;&#x679c;&#x8fdb;&#x884c;&#x53cd;&#x9988;">
<node CREATED="1321288189159" ID="ID_1272443797" LINK="#ID_366792931" MODIFIED="1321288414190" TEXT="1, &#x5982;&#x679c;service plugin&#x8bf7;&#x6c42;&#x91cd;&#x542f;&#x5219;&#x8c03;&#x7528;mibRebootSchedule&#xa;    &#x8bbe;&#x7f6e;mibS.RebootRequired = 1&#x8bf7;&#x6c42;&#x91cd;&#x542f;&#x7cfb;&#x7edf;"/>
<node CREATED="1321288436591" ID="ID_939125585" MODIFIED="1321288465461" TEXT="2, &#x5982;&#x679c;&#x6267;&#x884c;&#x6709;&#x9519;&#x8bef;&#x5219;&#x5728;mibS.Job.JobError&#x4e2d;&#x8bb0;&#x5f55;&#x9519;&#x8bef;"/>
<node CREATED="1321288555528" ID="ID_230772274" MODIFIED="1321288616905" TEXT="3, &#x8bbe;&#x7f6e;ServicePlugin-&gt;CallbackScheduled = 0&#x8868;&#x793a;&#x5df2;&#x8c03;&#x5ea6;&#xa;    &#x8fc7;mibS.Job.CurrentServicePlugin&#x7684;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1321288640636" ID="ID_397262555" LINK="#ID_1503264519" MODIFIED="1321288742721" TEXT="4, &#x8bbe;&#x7f6e;mibS.Job.CurrentServicePlugin = NULL&#x5e76;&#x8c03;&#x7528;&#xa;    mibManagerPropogate&#x4ee5;&#x8c03;&#x5ea6;&#x4e0b;&#x4e00;&#x4e2a;service plugin&#x7684;&#xa;    propogate&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1321288891581" FOLDED="true" ID="ID_1024286030" MODIFIED="1337579488276" TEXT="4, &#x82e5;&#x6240;&#x6709;&#x5fc5;&#x8981;&#x7684;propogate&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;&#x8c03;&#x5ea6;&#x5df2;&#x5b8c;&#x6210;&#xff0c;&#xa;    &#x5219;&#x8c03;&#x7528;mibManagerStatusUpdateSchedule">
<node CREATED="1310894849940" ID="ID_1130607403" MODIFIED="1321289886849" TEXT="1, &#x5c06;job&#x72b6;&#x6001;&#x8bbe;&#x4e3a;status update, mibS.Job.JobStage = mibJobStage_eStatusUpdate"/>
<node CREATED="1321285389918" ID="ID_621779602" MODIFIED="1321289895774" TEXT="2, &#x904d;&#x5386;&#x6240;&#x6709;service plugin&#x82e5;ServicePlugin-&gt;StatusUpdateNeed&#x7f6e;&#x4f4d;(&#x89c1;mibManagerGetRequest)&#x5219;&#xa;&#x5c06;ServicePlugin-&gt;CallbackScheduled&#x8bbe;&#x4e3a;1&#x8868;&#x793a;&#x9700;&#x8981;&#x8c03;&#x7528;&#x6b64;service plugin&#x7684;status update&#x56de;&#x8c03;&#x51fd;&#x6570;&#xff0c;&#x540c;&#x65f6;&#x5c06;ServicePlugin-&gt;StatusUpdateNeed&#x548c;ServicePlugin-&gt;UpdateNeedCount&#x6e05;&#x4e3a;0"/>
<node CREATED="1321289804047" ID="ID_924769552" LINK="#ID_931946212" MODIFIED="1321290087040" TEXT="3, &#x8c03;&#x7528;mibManagerNotifyFix"/>
<node CREATED="1321285690547" FOLDED="true" ID="ID_954308295" MODIFIED="1337577982561" TEXT="4, &#x8c03;&#x7528;mibManagerStatusUpdate">
<node CREATED="1321285779892" ID="ID_711791543" MODIFIED="1321289957145" TEXT="&#x5bf9;&#x4e8e;&#x9700;&#x8981;&#x8c03;&#x7528;&#x5176;status update&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;service plugin&#x5c06;&#xa;mibS.Job.CurrentServicePlugin&#x8bbe;&#x4e3a;&#x6b64;service plugin"/>
<node CREATED="1321284980733" ID="ID_1402816784" MODIFIED="1321285004259" TEXT="&#x8c03;&#x7528;mibManagerPoll&#x8c03;&#x6574;&#x5b9a;&#x65f6;&#x5668;mibS.PollTimeout&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;&#xff0c;&#x4f7f;&#x5176;&#x5feb;&#x70b9;&#x8d85;&#x65f6;&#x4ee5;&#x5904;&#x7406;Job&#x8bf7;&#x6c42;"/>
</node>
</node>
</node>
<node CREATED="1321286609650" FOLDED="true" ID="ID_647086924" MODIFIED="1337579487146" TEXT="6, &#x82e5;job&#x5904;&#x4e8e;status update&#x72b6;&#x6001;">
<node CREATED="1321286609650" ID="ID_1925704342" MODIFIED="1321292645784" TEXT="1, &#x6839;&#x636e;mibS.Job.CurrentServicePlugin&#x8c03;&#x7528;&#x5176;status update&#x56de;&#x8c03;&#x51fd;&#x6570;&#xff0c; &#xa;    &#x6b64;&#x56de;&#x8c03;&#x51fd;&#x6570;&#x4e00;&#x822c;&#x4f1a;&#x8bbe;&#x7f6e;status mib(&#x89c1;mibServiceStatusSet)"/>
<node CREATED="1321287022070" ID="ID_412129598" MODIFIED="1321290320327" TEXT="2, &#x8bbe;&#x7f6e;mibS.Job.CurrentServicePluginCalled = 1&#xff0c;&#xa;   &#x8868;&#x793a;&#x5df2;&#x8c03;&#x5ea6;&#x8fc7;mibS.Job.CurrentServicePlugin&#x7684;status update&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1321290394282" ID="ID_430963348" MODIFIED="1321290571539" TEXT="3, &#x8bbe;&#x7f6e;mibS.Job.CurrentServicePlugin-&gt;CallbackScheduled = 0&#x548c;&#xa;    mibS.Job.CurrentServicePlugin = NULL&#x8868;&#x793a;&#x65e0;&#x9700;&#x518d;&#x8c03;&#x5ea6;&#x6b64;service plugin"/>
<node CREATED="1321290651066" ID="ID_407569261" LINK="#ID_954308295" MODIFIED="1321290707278" TEXT="4, &#x8c03;&#x7528;mibManagerStatusUpdate"/>
<node CREATED="1321288891581" FOLDED="true" ID="ID_984792155" MODIFIED="1337579485132" TEXT="5, &#x82e5;&#x6240;&#x6709;&#x5fc5;&#x8981;&#x7684;status update&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;&#x8c03;&#x5ea6;&#x5df2;&#x5b8c;&#x6210;&#xff0c;&#xa;    &#x5219;&#x8c03;&#x7528;mibManagerReport">
<node CREATED="1321326612244" ID="ID_441307871" MODIFIED="1321326635723" TEXT="1, &#x8c03;&#x7528;mibManagerReportUnschedule&#x53d6;&#x6d88;&#x4e4b;&#x524d;&#x5b89;&#x6392;&#x7684;report"/>
<node CREATED="1321326685849" FOLDED="true" ID="ID_164103772" MODIFIED="1321347842374" TEXT="2, &#x5982;&#x679c;&#x5f53;&#x524d;job&#x53d1;&#x751f;&#x4e86;&#x9519;&#x8bef;(mibS.Job.JobError)&#xff0c;&#x5f53;&#x524d;job&#x8fd8;&#x672a;&#x88ab;&#x53d6;&#x6d88;(mibS.Job.JobCancelling)&#xff0c;&#xa;    &#x4e14;&#x5141;&#x8bb8;&#x5728;job&#x9519;&#x8bef;&#x65f6;&#x53d6;&#x6d88;job(mibS.Job.JobNoFail)&#x5219;&#x8c03;&#x7528;mibManagerJobCancel&#x53d6;&#x6d88;&#x5f53;&#x524d;job">
<node CREATED="1321345278112" ID="ID_1478769835" MODIFIED="1321345510321" TEXT="1, &#x8c03;&#x7528;mibServicePluginFlagClr&#x6e05;&#x9664;&#x6240;&#x6709;service plugin&#x4e0a;&#x7684;&#x4e0b;&#x5217;&#x6807;&#x5fd7;&#xa;    ServicePlugin-&gt;PropogateNeed&#xff0c;ServicePlugin-&gt;StatusUpdateNeed&#xff0c;&#xa;    ServicePlugin-&gt;UpdateNeedCount&#x3002;&#x6b63;&#x5e38;&#x60c5;&#x51b5;&#x4e0b;&#x8fd9;&#x4e9b;&#x6807;&#x5fd7;&#x5e94;&#x8be5;&#x5df2;&#x7ecf;&#x6e05;&#x9664;&#x4e86;&#xff0c;&#xa;    &#x4f46;&#x662f;&#x7531;&#x4e8e;job&#x7684;fail&#x5bfc;&#x81f4;&#x8fd9;&#x4e9b;&#x6807;&#x5fd7;&#x8fd8;&#x9057;&#x7559;&#x7740;&#xff0c;&#x6240;&#x4ee5;&#x8fd9;&#x91cc;&#x9700;&#x8981;&#x6e05;&#x9664;&#x8fd9;&#x4e9b;fail&#x7684;&#x75d5;&#x8ff9;"/>
<node CREATED="1321345971803" ID="ID_1945379461" MODIFIED="1321346273904" TEXT="2, &#x786e;&#x8ba4;&#x73b0;&#x5728;&#x53ef;&#x4ee5;&#x53d6;&#x6d88;&#x5f53;&#x524d;&#x7684;job&#xff0c;&#x5373;&#xff1a;mibS.Job.JobCancelling &#xff01;= 1&#xff0c;&#xa;    &#x5e76;&#x4e14;mibS.Job.JobStage &gt;= mibJobStage_eReport&#xa;"/>
<node CREATED="1321346292574" ID="ID_961783808" MODIFIED="1321346311438" TEXT="3, &#x5728;mibS.Job.JobError&#x4e2d;&#x8bb0;&#x5f55;&#x9519;&#x8bef;&#x539f;&#x56e0;"/>
<node CREATED="1321346329762" ID="ID_665413434" MODIFIED="1321346380386" TEXT="4, &#x5982;&#x679c;mibS.Job.JobNoFail&#x4e3a;1&#x8868;&#x793a;&#x4e0d;&#x5141;&#x8bb8;job&#x5931;&#x8d25;&#xff0c;&#x6545;&#x800c;&#x4e5f;&#x4e0d;&#x80fd;&#x53d6;&#x6d88;job&#xff0c;&#x6240;&#x4ee5;&#x8981;&#x8fd4;&#x56de;"/>
<node CREATED="1321346407437" ID="ID_1559892151" MODIFIED="1321346425381" TEXT="5, &#x8bbe;&#x7f6e;mibS.Job.JobCancelling = 1&#x8868;&#x793a;&#x6b63;&#x5728;&#x53d6;&#x6d88;&#x5f53;&#x524d;job"/>
<node CREATED="1321346443149" ID="ID_824330236" MODIFIED="1321346472150" TEXT="6, &#x5728;mibS.Job.CancelStage&#x4e2d;&#x8bb0;&#x5f55;job&#x53d6;&#x6d88;&#x524d;&#x5904;&#x4e8e;&#x54ea;&#x4e2a;&#x9636;&#x6bb5;"/>
<node CREATED="1321346490933" ID="ID_980820078" LINK="#ID_805132862" MODIFIED="1321346556048" TEXT="7, &#x91cd;&#x65b0;&#x6ce8;&#x518c;&#x5b9a;&#x65f6;&#x5668;mibS.JobTimeout"/>
<node CREATED="1321346636373" FOLDED="true" ID="ID_464853254" MODIFIED="1321347840309" TEXT="8, &#x8c03;&#x7528;mibObjectModifyUndo&#x904d;&#x5386;&#x6240;&#x6709;mib&#x8282;&#x70b9;&#x56de;&#x6eda;&#x6240;&#x505a;&#x8fc7;&#x7684;&#x4fee;&#x6539;">
<node CREATED="1321346781834" ID="ID_1669618825" MODIFIED="1321346923306" TEXT="1, &#x5982;&#x679c;mib&#x8282;&#x70b9;&#x4e4b;&#x524d;&#x88ab;&#x6807;&#x8bb0;&#x4e3a;&#x9700;&#x8981;&#x66f4;&#x65b0;&#xff0c;&#x5219;&#x73b0;&#x5728;&#x6e05;&#x9664;&#x8fd9;&#x4e2a;&#x6807;&#x5fd7;&#xff0c;&#xa;    &#x8868;&#x793a;&#x4e0d;&#x518d;&#x505a;&#x8fd9;&#x4e9b;&#x5bfc;&#x81f4;job fail&#x7684;&#x66f4;&#x65b0;(&#x6b63;&#x662f;&#x8fd9;&#x4e9b;mib&#x8282;&#x70b9;&#x7684;&#x66f4;&#x65b0;&#x5bfc;&#x81f4;&#x4e86;job fail)"/>
<node CREATED="1321347033073" ID="ID_911941131" MODIFIED="1321347064837" TEXT="2, &#x5c06;&#x5907;&#x4efd;&#x7684;Object-&gt;VarP-&gt;OldVolP&#x6062;&#x590d;&#x5230;Object-&gt;VarP-&gt;VolP"/>
</node>
<node CREATED="1321347120068" ID="ID_28366808" MODIFIED="1321347203570" TEXT="9, &#x5c06;&#x5f53;&#x524d;job&#x7684;&#x9636;&#x6bb5;&#x91cd;&#x65b0;&#x8bbe;&#x4e3a;mibJobStage_eActivated&#xff0c;&#xa;    &#x8c03;&#x7528;mibManagerPoll&#x4ee5;&#x91cd;&#x65b0;&#x8c03;&#x5ea6;&#x5f53;&#x524d;job"/>
<node CREATED="1321347243340" ID="ID_1866475196" MODIFIED="1321347814035" TEXT="job&#x53d6;&#x6d88;&#x673a;&#x5236;&#xff1a;&#xa;1,&#x9996;&#x5148;&#x8981;&#x6e05;&#x9664;&#x5bfc;&#x81f4;&#x5f53;&#x524d;job fail&#x7684;&#x539f;&#x56e0;&#xa;(&#x82e5;&#x662f;status update&#x5bfc;&#x81f4;&#x7684;&#xff0c;&#x5219;&#x4e0d;&#x518d;update&#x90a3;&#x4e2a;status mib)&#xa;2,&#x7528;&#x5907;&#x4efd;&#x7684;&#x503c;&#x91cd;&#x5199;config mib&#xa;3,&#x91cd;&#x65b0;&#x5f00;&#x59cb;&#x5f53;&#x524d;job&#xff0c;&#x76f8;&#x5f53;&#x4e8e;&#x5f00;&#x59cb;&#x4e86;&#x53e6;&#x4e00;&#x4e2a;&#x65b0;&#x7684;job&#xa;(&#x5728;&#x65b0;&#x7684;job&#x4e2d;&#x8bbe;&#x7f6e;config mib&#xff0c;&#x53ea;&#x4e0d;&#x8fc7;&#x6240;&#x7528;&#x7684;&#x503c;&#x5c31;&#x662f;&#x4e4b;&#x524d;&#x5907;&#x4efd;&#x7684;&#x503c;)"/>
</node>
<node CREATED="1321326890644" ID="ID_109860164" LINK="#ID_413490537" MODIFIED="1321339635313" TEXT="3, &#x8ba9;job&#x8fdb;&#x5165;mibJobStage_eStorage&#x9636;&#x6bb5;&#xff0c;&#x5982;&#x679c;&#x5728;&#x8fd9;&#x4e2a;job&#x4e2d;&#x8fd8;&#x672a;&#xa;    &#x4fdd;&#x5b58;&#x8fc7;&#x6574;&#x4e2a;mib&#x6811;(mibS.Job.RestoreDoneInThisJob)&#x5219;&#x8c03;&#x7528;&#xa;    mibS.SaveRestorePlugin.Storage&#x56de;&#x8c03;&#x51fd;&#x6570;&#x4fdd;&#x5b58;&#x6574;&#x4e2a;mib&#x6811;"/>
<node CREATED="1321327138267" ID="ID_1207248776" MODIFIED="1321327151767" TEXT="4, &#x5982;&#x679c;&#x4fdd;&#x5b58;&#x5931;&#x8d25;&#x5219;&#x8c03;&#x7528;mibManagerJobCancel&#x53d6;&#x6d88;&#x5f53;&#x524d;job"/>
<node CREATED="1321327317566" FOLDED="true" ID="ID_1316072595" MODIFIED="1337579305296" TEXT="5, &#x8ba9;job&#x8fdb;&#x5165;mibJobStage_eReport&#x9636;&#x6bb5;&#xff0c;&#x8c03;&#x7528;mibObjectModifyUnlink&#xa;    &#x91ca;&#x653e;&#x4e4b;&#x524d;&#x5907;&#x4efd;&#x7684;Object-&gt;VarP-&gt;OldVolP(&#x89c1;mibManagerConfigSet)">
<node CREATED="1321327574597" ID="ID_724989923" MODIFIED="1321327657068" TEXT="1, &#x904d;&#x5386;&#x6240;&#x6709;&#x8282;&#x70b9;&#xff0c;&#x6e05;&#x9664;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x7684;&#x6807;&#x5fd7;&#xa;    mibUpdateNeededSet(Object, 0)"/>
<node CREATED="1321327694889" FOLDED="true" ID="ID_1552785482" MODIFIED="1337579304182" TEXT="2, &#x8c03;&#x7528;mibObjectVolatileConfirm&#x91ca;&#x653e;Object-&gt;VarP-&gt;OldVolP">
<node CREATED="1321327787248" ID="ID_1902323283" MODIFIED="1321327858778" TEXT="1, &#x91ca;&#x653e;Object-&gt;VarP-&gt;OldVolP-&gt;Data &#x548c; &#xa;    Object-&gt;VarP-&gt;OldVolP"/>
<node CREATED="1321327795132" ID="ID_464358019" MODIFIED="1321327799355" TEXT="2, Object-&gt;VarP-&gt;OldVolP = NULL"/>
<node CREATED="1321327879568" ID="ID_765635792" MODIFIED="1321327882318" TEXT="3, Object-&gt;VarP-&gt;UpdateNeeded = 0"/>
<node CREATED="1321327895880" ID="ID_1915391235" MODIFIED="1321327918744" TEXT="4, Object-&gt;VarP-&gt;OldHidden = 0"/>
</node>
<node CREATED="1321327951916" ID="ID_1135680270" MODIFIED="1321327956137" TEXT="3, Object-&gt;VarP-&gt;FactoryResetInProgress = 0"/>
<node CREATED="1321327967289" ID="ID_1002874235" MODIFIED="1321327970318" TEXT="4, Object-&gt;VarP-&gt;UnhideInProgress = 0"/>
</node>
<node CREATED="1321328026795" ID="ID_183031453" MODIFIED="1321328095812" TEXT="6, &#x8c03;&#x7528;&#x53d1;&#x8d77;&#x8fd9;&#x4e2a;job&#x7684;manager plugin&#x7684;JobDone&#x56de;&#x8c03;&#x51fd;&#x6570;(mibS.Job.ManagerPlugin-&gt;JobDone)"/>
<node CREATED="1321328130615" ID="ID_236699833" MODIFIED="1321328165628" TEXT="7, &#x8c03;&#x7528;&#x6240;&#x6709;manager plugin&#x7684;report&#x56de;&#x8c03;&#x51fd;&#x6570;(ManagerPlugin-&gt;Report)"/>
<node CREATED="1321328187270" ID="ID_1078293855" LINK="#ID_805132862" MODIFIED="1321328216767" TEXT="8, &#x53d6;&#x6d88;&#x5b9a;&#x65f6;&#x5668;mibS.JobTimeout"/>
<node CREATED="1321328320750" ID="ID_579306313" MODIFIED="1321343437689" TEXT="9, &#x5220;&#x9664;&#x5f53;&#x524d;job&#xff0c;&#x6574;&#x4e2a;job&#x8fc7;&#x7a0b;&#x5c31;&#x7ed3;&#x675f;&#x4e86;"/>
</node>
</node>
</node>
<node CREATED="1321348256806" FOLDED="true" ID="ID_1154295819" MODIFIED="1337582376978" TEXT="&#x5b9e;&#x4f8b;">
<node CREATED="1321348283926" FOLDED="true" ID="ID_1106039322" MODIFIED="1337570994760" TEXT="mib-internal-job&#xa;&#x5728;&#x7cfb;&#x7edf;&#x521d;&#x59cb;&#x9636;&#x6bb5;&#x5c06;&#x6574;&#x4e2a;mib&#x6811;&#x6062;&#x590d;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;">
<node CREATED="1321348677251" ID="ID_1564859927" LINK="#ID_1084572528" MODIFIED="1321348749585" TEXT="&#x521d;&#x59cb;&#x5316;"/>
<node CREATED="1310873223981" FOLDED="true" ID="ID_1128884932" MODIFIED="1337570994094" TEXT=".JobStart = mibInternalJobStart">
<node CREATED="1321348930479" ID="ID_773622739" MODIFIED="1321348950195" TEXT="1, &#x8bbe;&#x7f6e;mibS.Job.JobNoFail = 1&#x4ee5;&#x5c06;job&#x6807;&#x8bb0;&#x4e3a;&#x4e0d;&#x53ef;fail"/>
<node CREATED="1321348981809" FOLDED="true" ID="ID_1317571839" MODIFIED="1337570993091" TEXT="2, mibManagerObjectDefaultRestore&#xa;    &#x5c06;&#x6bcf;&#x4e2a;&#x8282;&#x70b9;&#x7684;&#x503c;&#x6062;&#x590d;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;&#x5373;factory reset">
<node CREATED="1321349035388" FOLDED="true" ID="ID_818909250" MODIFIED="1337570992208" TEXT="1, &#x8c03;&#x7528;mibManagerObjectDefaultRestoreRecurse&#x904d;&#x5386;&#x6240;&#x6709;mib&#x8282;&#x70b9;&#xff0c;&#xa;    &#x5bf9;&#x6bcf;&#x4e2a;mib&#x8282;&#x70b9;&#x8c03;&#x7528;mibManagerObjectDefaultRestore1, &#x540c;&#x65f6;&#x8bbe;&#x7f6e;&#xa;    Object-&gt;Type-&gt;VarP-&gt;ServicePlugin-&gt;PropogateNeed&#x8868;&#x793a;&#x6240;&#x6709;&#xa;    depend&#x6b64;mib&#x7684;service plugin&#x9700;&#x8981;&#x76f8;&#x5e94;mib&#x503c;&#x7684;&#x6539;&#x53d8;,&#x5373;&#x505a;Propogate,&#xa;    &#x89c1;job&#x8fc7;&#x7a0b;&#x7684;Propogate&#x72b6;&#x6001;.">
<node CREATED="1321349883534" ID="ID_1543170716" MODIFIED="1337568041204" TEXT="mib&#x8282;&#x70b9;&#x6062;&#x590d;&#x9009;&#x9879;">
<node CREATED="1321349937250" ID="ID_1412555745" MODIFIED="1321349970954" TEXT="mibObjectDefaultRestoreFlag_ConfigOnly&#xa;mibObjectDefaultRestoreFlag_Preserve&#xa;mibObjectDefaultRestoreFlag_ACSReset&#xa;mibObjectDefaultRestoreFlag_RestoreReset"/>
</node>
<node CREATED="1321350135446" FOLDED="true" ID="ID_985968079" MODIFIED="1337568436135" TEXT="1, &#x8bbe;&#x7f6e;Object-&gt;VarP-&gt;FactoryResetInProgress&#xa;    &#x8868;&#x793a;&#x6b63;&#x5904;&#x4e8e;factory reset&#x8fc7;&#x7a0b;&#x4e2d;">
<node CREATED="1321350225385" ID="ID_1555364001" MODIFIED="1321350230969" TEXT="mibObjectFactoryResetSource_NoReset"/>
<node CREATED="1321350235726" ID="ID_914729502" MODIFIED="1321350296538" TEXT="mibObjectFactoryResetSource_User &#xa;&#x8868;&#x793a;&#x662f;&#x7528;&#x6237;&#x5728;&#x547d;&#x4ee4;&#x884c;&#x8f93;&#x5165;reset&#x5bfc;&#x81f4;&#x4e86;factory reset"/>
<node CREATED="1321350306547" ID="ID_238940336" MODIFIED="1321350349213" TEXT="mibObjectFactoryResetSource_ACS&#xa;&#x8868;&#x793a;&#x662f;tr069&#x8fdc;&#x7a0b;&#x670d;&#x52a1;&#x5668;&#x6267;&#x884c;&#x4e86;factory reset"/>
<node CREATED="1321350359923" ID="ID_1580595475" MODIFIED="1321350408110" TEXT="mibObjectFactoryResetSource_Restore&#xa;&#x8868;&#x793a;&#x662f;mib core&#x5728;&#x7cfb;&#x7edf;&#x542f;&#x52a8;&#x9636;&#x6bb5;&#x6267;&#x884c;&#x4e86;factory reset"/>
</node>
<node CREATED="1321350478981" ID="ID_1905501983" MODIFIED="1321350528010" TEXT="2, &#x5982;&#x679c;&#x6062;&#x590d;&#x9009;&#x9879;&#x4ec5;&#x6307;&#x5b9a;reset config mib&#x5219;&#x8df3;&#x8fc7;&#x4e0d;&#x662f;config mib&#x7684;&#x8282;&#x70b9;"/>
<node CREATED="1321350633094" ID="ID_538962470" LINK="#ID_724870293" MODIFIED="1321350889957" TEXT="3, &#x82e5;mib&#x7684;&#x5b9a;&#x4e49;&#x6307;&#x5b9a;&#x4e86;&#x5728;partial reset&#x8fc7;&#x7a0b;&#x4e2d;&#x4e0d;&#x8981;reset&#x6b64;mib&#x7684;&#x503c;&#x5219;&#x8df3;&#x8fc7;&#x6b64;mib"/>
<node CREATED="1321351108168" FOLDED="true" ID="ID_1886554450" MODIFIED="1337569100656" TEXT="4, &#x5982;&#x679c;&#x9700;&#x8981;&#x9690;&#x85cf;&#x8282;&#x70b9;&#x5219;&#x8c03;&#x7528;mibObjectVolatileHide&#x9690;&#x85cf;&#x8282;&#x70b9;">
<node CREATED="1321351189407" ID="ID_592512821" MODIFIED="1321351224879" TEXT="1, &#x5c06;&#x539f;&#x6709;&#x503c;Object-&gt;VarP-&gt;VolP&#x5907;&#x4efd;&#x5230;Object-&gt;VarP-&gt;OldVolP"/>
<node CREATED="1321351251307" ID="ID_1262787634" MODIFIED="1321351280871" TEXT="2, &#x5c06;&#x65b0;&#x503c;Object-&gt;VarP-&gt;VolP&#x8bbe;&#x7f6e;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;Object-&gt;Type-&gt;Default"/>
<node CREATED="1321351305353" ID="ID_747518467" MODIFIED="1321351321697" TEXT="3, &#x8bbe;&#x7f6e;Object-&gt;VarP-&gt;Hidden&#x5c06;&#x8282;&#x70b9;&#x6807;&#x8bb0;&#x4e3a;&#x9690;&#x85cf;"/>
<node CREATED="1321351333604" ID="ID_1201475944" MODIFIED="1321351354658" TEXT="4, Object-&gt;VarP-&gt;Permanent = 0&#xa;    mibS.Job.NConfigChanges++"/>
</node>
<node CREATED="1321351492177" FOLDED="true" ID="ID_921349375" MODIFIED="1337570200759" TEXT="5, &#x8c03;&#x7528;mibObjectVolatileDefault&#x5c06;&#x8282;&#x70b9;&#x7684;&#x503c;&#x6062;&#x590d;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;">
<node CREATED="1321351189407" ID="ID_31553144" MODIFIED="1321351224879" TEXT="1, &#x5c06;&#x539f;&#x6709;&#x503c;Object-&gt;VarP-&gt;VolP&#x5907;&#x4efd;&#x5230;Object-&gt;VarP-&gt;OldVolP"/>
<node CREATED="1321351251307" ID="ID_571283302" MODIFIED="1321351280871" TEXT="2, &#x5c06;&#x65b0;&#x503c;Object-&gt;VarP-&gt;VolP&#x8bbe;&#x7f6e;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;Object-&gt;Type-&gt;Default"/>
<node CREATED="1321351305353" ID="ID_29334087" MODIFIED="1321351564623" TEXT="3, &#x6e05;&#x9664;Object-&gt;VarP-&gt;Hidden&#x5c06;&#x8282;&#x70b9;&#x6807;&#x8bb0;&#x4e3a;&#x975e;&#x9690;&#x85cf;"/>
<node CREATED="1321351641995" ID="ID_1197652207" MODIFIED="1321351828448" TEXT="4, &#x5982;&#x679c;mib&#x8282;&#x70b9;&#x4e3a;status mib&#x5219;&#x56e0;&#x4e3a;status mib&#x968f;&#x65f6;&#x8981;&#x5199;&#x5165;&#xff0c;&#xa;    &#x6545;&#x5e94;&#x4fdd;&#x8bc1;&#x6b64;mib&#x7684;&#x503c;&#x662f;&#x53ef;&#x5199;&#x7684;&#xff0c;&#x8fd9;&#x9700;&#x8981;&#x8c03;&#x7528;mibObjectVolatileNew&#x6765;&#x4e3a;&#xa;    Object-&gt;VarP-&gt;VolP&#x5206;&#x914d;&#x4e00;&#x5757;&#x52a8;&#x6001;&#x5185;&#x5b58;&#xff0c;&#x800c;&#x4e0d;&#x662f;&#x8ba9;&#x5b83;&#x6307;&#x5411;&#x4e0d;&#x53ef;&#x5199;&#x7684;&#xa;    Object-&gt;Type-&gt;Default"/>
<node CREATED="1321351333604" ID="ID_1641782234" MODIFIED="1321351880394" TEXT="5, mibS.Job.NConfigChanges++"/>
</node>
<node CREATED="1321351910338" ID="ID_97405332" MODIFIED="1321351932939" TEXT="6, &#x8bbe;&#x7f6e;Object-&gt;VarP-&gt;DataEverModified = 0&#x8868;&#x793a;&#x6b64;&#x8282;&#x70b9;&#x8fd8;&#x672a;&#x88ab;&#x4fee;&#x6539;&#x8fc7;"/>
</node>
<node CREATED="1321349170389" ID="ID_848115369" LINK="#ID_1789022" MODIFIED="1321349417147" TEXT="2, &#x8c03;&#x7528;mibManagerFactoryResetFilters&#x4ee5;&#x8c03;&#x7528;&#x6bcf;&#x4e2a;&#xa;    service plugin&#x7684;FactoryResetFilter&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
<node CREATED="1321349065217" ID="ID_959602517" LINK="#ID_985968079" MODIFIED="1321352033119" TEXT="3, &#x6807;&#x8bb0;&#x6bcf;&#x4e2a;mib&#x8282;&#x70b9;&#x4e0d;&#x518d;&#x5904;&#x4e8e;factory reset&#x8fc7;&#x7a0b;&#x4e2d;&#xa;   (&#x5373;Object-&gt;VarP-&gt;FactoryResetInProgress = 0)"/>
</node>
<node CREATED="1321348992117" ID="ID_461337896" LINK="#ID_1111060294" MODIFIED="1321353797113" TEXT="3, &#x8c03;&#x7528;mibManagerJobActivate&#x6fc0;&#x6d3b;&#x6b64;job"/>
</node>
<node CREATED="1310873239662" FOLDED="true" ID="ID_284994721" MODIFIED="1337328373174" TEXT=".JobDone = mibInternalJobDone">
<node CREATED="1321352181762" ID="ID_77432670" MODIFIED="1321352231820" TEXT="&#x8bbe;&#x7f6e;mibS.RestoreDone = 1&#x8868;&#x793a;&#x7cfb;&#x7edf;&#x542f;&#x52a8;&#x9636;&#x6bb5;&#xa;&#x5bf9;mib&#x6811;&#x7684;factory reset&#x5de5;&#x4f5c;&#x5df2;&#x505a;&#x5b8c;"/>
</node>
<node CREATED="1310873267545" FOLDED="true" ID="ID_1101667266" MODIFIED="1321352272757" TEXT=".Report = mibInternalJobReport">
<node CREATED="1321352254361" ID="ID_233061037" MODIFIED="1321352271577" TEXT="&#x8fd4;&#x56de;&#xff0c;&#x4e0d;&#x505a;&#x4efb;&#x4f55;&#x4e8b;"/>
</node>
</node>
<node CREATED="1337329804110" ID="ID_1856179970" MODIFIED="1337329834364" TEXT="filexfer"/>
</node>
</node>
<node CREATED="1310800332387" ID="ID_1255932449" MODIFIED="1337325171030" TEXT="mibcore">
<node CREATED="1310814529420" ID="ID_682477820" MODIFIED="1310814594131" TEXT="mib&#x5b9a;&#x4e49;: apps/gateway/gwmib/gwmib.mib"/>
<node CREATED="1310814596216" ID="ID_150739048" MODIFIED="1337761889994" TEXT="mib&#x7f16;&#x8bd1;:&#xa;mibParse&#x5c06;&#x628a;gwmib.mib&#x7ffb;&#x8bd1;&#x4e3a;&#xa;c&#x6e90;&#x6587;&#x4ef6;&#xff0c;&#x5373;gwmib.amibc, &#x6b64;&#x6587;&#x4ef6;&#x88ab;&#x5305;&#x542b;&#x5728;gwmib.c&#x4e2d;&#xa;h&#x5934;&#x6587;&#x4ef6;&#xff0c;&#x5373;gwmib.amibh&#xff0c;&#x6b64;&#x6587;&#x4ef6;&#x88ab;&#x5305;&#x542b;&#x5728;gwmib.h&#x4e2d;">
<node CREATED="1310815126423" ID="ID_286636558" MODIFIED="1337761891556" TEXT="gwmib.amibh&#xa;&#x6b64;&#x6587;&#x4ef6;&#x4e2d;&#x5b9a;&#x4e49;&#x4e86;&#xa;struct gwmibObjectTypeVarStruct&#xa;struct gwmibObjectTypeStruct&#xa;struct gwmibObjectVarStruct&#xa;struct gwmibObjectStruct&#xa;&#x56db;&#x79cd;&#x7ed3;&#x6784;&#x4f53;&#x7ed3;&#x6784;&#x4f53;,&#x5b83;&#x4eec;&#x90fd;&#x63cf;&#x8ff0;&#x4e86;&#x6574;&#x4e2a;mib&#x7684;&#x6811;&#x5f62;&#x7ed3;&#x6784;&#xff1a;">
<node CREATED="1310815280006" FOLDED="true" ID="ID_515685008" MODIFIED="1337594720597" TEXT="struct gwmibObjectTypeVarStruct">
<node CREATED="1310815321947" FOLDED="true" ID="ID_1423421290" MODIFIED="1337594719041">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct
    </p>
    <p>
      {<br />&#160;&#160;&#160;&#160;struct mibObjectTypeVar _OT;<br />&#160;&#160;&#160;&#160;struct
    </p>
    <p>
      &#160;&#160;&#160;{<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct mibObjectTypeVar _OT;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;....<br />&#160;&#160;&#160;&#160;}<font color="#d30808">child</font>;<br />}InternetGatewayDevice;
    </p>
  </body>
</html></richcontent>
<node CREATED="1310829545838" FOLDED="true" ID="ID_1745308569" MODIFIED="1337594718120" TEXT="struct mibObjectTypeVar">
<node CREATED="1310829945370" ID="ID_912449990" MODIFIED="1310829986754" TEXT="struct mibServicePlugin *ServicePlugin : &#x58f0;&#x660e;&#x6b64;mib&#x503c;&#x7684;service plugin"/>
</node>
</node>
</node>
<node CREATED="1310824055680" FOLDED="true" ID="ID_1748275431" MODIFIED="1337760655729" TEXT="struct gwmibObjectTypeStruct">
<node CREATED="1310815321947" FOLDED="true" ID="ID_687718962" MODIFIED="1337654668549">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct
    </p>
    <p>
      {<br />&#160;&#160;&#160;&#160;struct mibObjectType _OT;<br />&#160;&#160;&#160;&#160;struct
    </p>
    <p>
      &#160;&#160;&#160;{<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct mibObjectType _OT;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;....<br />&#160;&#160;&#160;&#160;}<font color="#d30808">child</font>;<br />}InternetGatewayDevice;
    </p>
  </body>
</html></richcontent>
<node CREATED="1310825119723" FOLDED="true" ID="ID_1862685066" MODIFIED="1337654667963" TEXT="struct mibObjectType&#xa;&#x6b64;&#x7ed3;&#x6784;&#x5305;&#x542b;&#x7684;&#x662f;&#x8282;&#x70b9;&#x7684;&#x7c7b;&#x578b;&#x548c;&#x521d;&#x59cb;&#x503c;">
<node CREATED="1310825172663" ID="ID_276823094" MODIFIED="1310825175220" TEXT="Name"/>
<node CREATED="1310825189240" ID="ID_1537919513" MODIFIED="1310825253833" TEXT="Path : &#x5168;&#x8def;&#x5f84;"/>
<node CREATED="1310825204825" ID="ID_787796442" MODIFIED="1310825280178" TEXT="Tr069Name :tr069&#x4e2d;&#x7684;&#x522b;&#x540d;"/>
<node CREATED="1310825226187" ID="ID_1177145934" MODIFIED="1310825309296" TEXT="Id : &#x5bf9;&#x5e94;snmp&#x4e2d;&#x7684;ID"/>
<node CREATED="1310825343323" ID="ID_653532924" MODIFIED="1310825365899" TEXT="Parent : &#x7236;&#x8282;&#x70b9;"/>
<node CREATED="1310825376181" ID="ID_185491851" MODIFIED="1321249901484" TEXT="NextSibling : &#x5144;&#x5f1f;&#x8282;&#x70b9;"/>
<node CREATED="1310825403695" ID="ID_37117396" MODIFIED="1310825421777" TEXT="FirstChild : &#x5b50;&#x8282;&#x70b9;"/>
<node CREATED="1310825452946" FOLDED="true" ID="ID_259623796" MODIFIED="1321343164907" TEXT="DataType">
<node CREATED="1310825483860" ID="ID_637904099" MODIFIED="1310825574635" TEXT="mibDataType_eUnknown = 0,&#xa;mibDataType_eNode,&#xa;mibDataType_eArray,&#xa;mibDataType_eEnum,&#xa;mibDataType_eEnumSet,&#xa;mibDataType_eBool,&#xa;mibDataType_eInt32,&#xa;mibDataType_eUInt32,&#xa;mibDataType_eText,&#xa;mibDataType_eBlobData, "/>
</node>
<node CREATED="1310825694483" FOLDED="true" ID="ID_334981211" MODIFIED="1321249983740" TEXT="struct mibEnumeration *EnumType : &#x5982;&#x679c;DataType&#x662f;&#xa;mibDataType_eEnum&#x6216;mibDataType_eEnumSet&#x65f6;&#xff0c;&#x672c;&#xa;&#x6307;&#x9488;&#x6307;&#x5411;&#x5177;&#x4f53;&#x7684;&#x679a;&#x4e3e;&#x7c7b;&#x578b;">
<node CREATED="1310825930563" ID="ID_598883262" MODIFIED="1310825934618" TEXT="Name"/>
<node CREATED="1310825942988" ID="ID_1587615336" MODIFIED="1310825962336" TEXT="Next : &#x94fe;&#x8868;&#x4e2d;&#x7684;&#x4e0b;&#x4e00;&#x4e2a;&#x8282;&#x70b9;"/>
<node CREATED="1310825979343" FOLDED="true" ID="ID_612745157" MODIFIED="1321343164907" TEXT="struct mibEnumerationChoice *Choices">
<node CREATED="1310826057860" ID="ID_600359966" MODIFIED="1310826130552" TEXT="Name : &#x9009;&#x9879;&#x540d;&#x79f0;"/>
<node CREATED="1310826071837" ID="ID_912845293" MODIFIED="1310826152641" TEXT="Value : &#x9009;&#x9879;&#x6570;&#x503c;"/>
<node CREATED="1310826099551" ID="ID_385236426" MODIFIED="1310826112844" TEXT="AltName : &#x522b;&#x540d;"/>
</node>
<node CREATED="1310825995680" ID="ID_1346665838" MODIFIED="1310826040204" TEXT="NChoices : &#x9009;&#x9879;&#x6570;&#x91cf;"/>
</node>
<node CREATED="1310826181237" ID="ID_1196784165" MODIFIED="1310826183464" TEXT="Tr069DataType"/>
<node CREATED="1310826205750" ID="ID_1366849542" MODIFIED="1321254505493">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MaxSize : &#22914;&#26524;&#31867;&#22411;&#20026;mibDataType_eText&#21017;&#34920;&#31034;&#23383;&#31526;&#20018;&#22823;&#23567;,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#22914;&#26524;&#20026;mibDataType_eArray&#21017;&#34920;&#31034;&#25968;&#32452;&#22823;&#23567;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1310826245833" ID="ID_1296130327" MODIFIED="1310826293701" TEXT="Max : &#x6700;&#x5927;&#x503c;"/>
<node CREATED="1310826259250" ID="ID_123647579" MODIFIED="1310826281961" TEXT="Min : &#x6700;&#x5c0f;&#x503c;"/>
<node CREATED="1310826409629" FOLDED="true" ID="ID_1454400236" MODIFIED="1321343164907" TEXT="AutoHide : &#x4ec5;&#x9488;&#x5bf9;&#x6709;&#x5b50;&#x8282;&#x70b9;&#x7684;NODE&#xff0c;&#x8868;&#x793a;&#x662f;&#x5426;&#x9690;&#x85cf;NODE&#x4e0b;&#x7684;&#x5b50;&#x8282;&#x70b9;&#xa;&#x4e00;&#x822c;&#x6027;NODE&#x4e0d;&#x9690;&#x85cf;&#x81ea;&#x5df1;&#x7684;&#x5b50;&#x8282;&#x70b9;&#xff0c;&#x800c;&#x6570;&#x7ec4;NODE&#x9700;&#x8981;&#x9690;&#x85cf;&#x81ea;&#x5df1;&#x7684;&#x5b50;&#x8282;&#x70b9;&#xa;mib&#x6811;&#x6709;3&#x79cd;&#x8282;&#x70b9;&#xff1a;">
<node CREATED="1310827590623" ID="ID_667817811" MODIFIED="1310827631202" TEXT="&#x4e00;&#x822c;&#x6027;NODE, &#x6b64;&#x79cd;&#x8282;&#x70b9;&#x5305;&#x542b;&#x5b50;&#x8282;&#x70b9;&#xff0c;&#x4f46;&#x5b50;&#x8282;&#x70b9;&#x4e0d;&#x662f;&#x6570;&#x7ec4;&#xff0c;&#x5373;&#x5404;&#x5b50;&#x8282;&#x70b9;&#x7c7b;&#x578b;&#x4e0d;&#x4e00;&#x6837;"/>
<node CREATED="1310827590623" ID="ID_1182867445" MODIFIED="1310827651835" TEXT="&#x6570;&#x7ec4;NODE, &#x6b64;&#x79cd;&#x8282;&#x70b9;&#x5305;&#x542b;&#x5b50;&#x8282;&#x70b9;&#xff0c;&#x5b50;&#x8282;&#x70b9;&#x7ec4;&#x6210;&#x6570;&#x7ec4;&#xff0c;&#x5373;&#x5404;&#x5b50;&#x8282;&#x70b9;&#x4e3a;&#x540c;&#x4e00;&#x7c7b;&#x578b;"/>
<node CREATED="1310827590623" ID="ID_970105056" MODIFIED="1310827660907" TEXT="leaf&#x53f6;&#x5b50;&#x8282;&#x70b9;&#xff0c;&#x6b64;&#x79cd;&#x8282;&#x70b9;&#x4e0d;&#x5305;&#x542b;&#x5b50;&#x8282;&#x70b9;"/>
</node>
<node CREATED="1310827889403" ID="ID_984868542" MODIFIED="1310827932555" TEXT="ReadOnly : &#x53ea;&#x8bfb;&#xff0c;&#x8868;&#x793a;&#x8282;&#x70b9;&#x6c38;&#x8fdc;&#x4fdd;&#x6301;&#x9ed8;&#x8ba4;&#x503c;&#x65e0;&#x6cd5;&#x4fee;&#x6539;"/>
<node CREATED="1310828038878" FOLDED="true" ID="ID_724870293" MODIFIED="1337568615699" TEXT="Preserve : &#x5728;partial reset&#x8fc7;&#x7a0b;&#x4e2d;&#x4e0d;&#x4fee;&#x6539;&#x6b64;&#x8282;&#x70b9;&#x7684;&#x503c;">
<node CREATED="1321350773011" ID="ID_1837237383" MODIFIED="1321350829826" TEXT="MIB_PRESERVE_ACS&#xa;&#x4e0d;&#x8981;&#x5728;ACS&#x89e6;&#x53d1;&#x7684;factory reset&#x4e2d;&#x4fee;&#x6539;&#x6b64;&#x8282;&#x70b9;&#x7684;&#x503c;"/>
<node CREATED="1321350773011" ID="ID_551650757" MODIFIED="1321350864437" TEXT="MIB_PRESERVE_USER&#xa;&#x4e0d;&#x8981;&#x5728;&#x7528;&#x6237;&#x547d;&#x4ee4;&#x884c;&#x89e6;&#x53d1;&#x7684;factory reset&#x4e2d;&#x4fee;&#x6539;&#x6b64;&#x8282;&#x70b9;&#x7684;&#x503c;"/>
</node>
<node CREATED="1310829315990" ID="ID_79914490" MODIFIED="1310829387211" TEXT="Tr069NoActiveInform : &#x5f53;&#x8282;&#x70b9;&#x503c;&#x53d8;&#x5316;&#x65f6;&#xff0c;0&#x4e3b;&#x52a8;&#x4e0a;&#x62a5;&#xff0f;1&#x88ab;&#x52a8;&#x4e0a;&#x62a5;"/>
<node CREATED="1310829407053" ID="ID_1090292465" MODIFIED="1310829450498" TEXT="Sensitive : &#x4e0d;&#x8981;&#x5c06;&#x6b64;&#x8282;&#x70b9;&#x503c;&#x7684;&#x53d8;&#x5316;&#x4e0a;&#x62a5;&#x7ed9;tr069"/>
<node CREATED="1310829497323" ID="ID_1405039173" MODIFIED="1310829499500" TEXT="UseMinValue"/>
<node CREATED="1310829507660" ID="ID_968892719" MODIFIED="1310829509474" TEXT="UseMaxValue"/>
<node CREATED="1310829521677" ID="ID_1436281159" LINK="#ID_911587842" MODIFIED="1310835881686" TEXT="struct mibObjectVol Default : &#x9ed8;&#x8ba4;&#x503c;,&#x5f53;&#x6b64;&#x8282;&#x70b9;&#x7684;&#x503c;&#x672a;&#x88ab;&#x4fee;&#x6539;&#x65f6;&#x4e0b;&#x9762;VarP-&gt;VolP&#x6307;&#x5411;&#x672c;&#x503c;"/>
<node CREATED="1310829545838" ID="ID_1449106542" LINK="#ID_1745308569" MODIFIED="1310830359111" TEXT="struct mibObjectTypeVar *VarP"/>
</node>
</node>
</node>
<node CREATED="1310824244079" FOLDED="true" ID="ID_1622960081" MODIFIED="1337760658672" TEXT="struct gwmibObjectVarStruct">
<node CREATED="1310815321947" FOLDED="true" ID="ID_39412074" MODIFIED="1337760657736">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct
    </p>
    <p>
      {<br />&#160;&#160;&#160;&#160;struct mibObjectVar _O;<br />&#160;&#160;&#160;&#160;struct
    </p>
    <p>
      &#160;&#160;&#160;{<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct mibObjectVar _O;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;....<br />&#160;&#160;&#160;&#160;}<font color="#d30808">child</font>;<br />}InternetGatewayDevice;
    </p>
  </body>
</html></richcontent>
<node CREATED="1310830683741" FOLDED="true" ID="ID_1377982753" MODIFIED="1337760657229" TEXT="struct mibObjectVar&#xa;&#x6b64;&#x7ed3;&#x6784;&#x4e2d;&#x5305;&#x542b;&#x7684;&#x662f;&#x8282;&#x70b9;&#x7684;&#x52a8;&#x6001;&#x72b6;&#x6001;">
<node CREATED="1310830726640" FOLDED="true" ID="ID_911587842" MODIFIED="1337569674360">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct mibObjectVol *VolP
    </p>
    <p>
      &#26412;&#20540;&#21253;&#21547;&#20102;mib&#33410;&#28857;&#30340;&#20540;,&#24403;&#33410;&#28857;&#38544;&#34255;&#25110;&#20026;&#40664;&#35748;&#20540;&#26102;,
    </p>
    <p>
      &#23427;&#25351;&#21521;&amp;object-&gt;type-&gt;default.&#21542;&#21017;&#25351;&#21521;&#21160;&#24577;&#20998;&#37197;&#30340;&#20869;&#23384;
    </p>
  </body>
</html></richcontent>
<node CREATED="1310834799227" FOLDED="true" ID="ID_1216472002" MODIFIED="1321255462460" TEXT="union mibObjectData Data">
<node CREATED="1310835127991" ID="ID_717562047" MODIFIED="1310835130942" TEXT="EnumValue"/>
<node CREATED="1310835657662" ID="ID_1824643484" MODIFIED="1310835659840" TEXT="EnumSetValue"/>
<node CREATED="1310835669790" ID="ID_312375230" MODIFIED="1310835673063" TEXT="BoolValue"/>
<node CREATED="1310835681119" ID="ID_1284368024" MODIFIED="1310835682951" TEXT="IntValue"/>
<node CREATED="1310835696880" ID="ID_1923698140" MODIFIED="1310835698575" TEXT="UIntValue"/>
<node CREATED="1310835709841" ID="ID_131454973" MODIFIED="1310835711962" TEXT="TextValue"/>
</node>
<node CREATED="1310834810787" ID="ID_482271295" MODIFIED="1321255579214" TEXT="JobNumber : &#x6700;&#x8fd1;&#x4e00;&#x6b21;&#x66f4;&#x65b0;&#x6b64;mib&#x503c;&#x7684;job"/>
<node CREATED="1310834822078" ID="ID_1713620177" MODIFIED="1337569671767" TEXT="NonTr069JobNumber : &#x6700;&#x8fd1;&#x4e00;&#x6b21;&#x66f4;&#x65b0;&#x6b64;mib&#x503c;&#x7684;&#x975e;tr069&#x7684;job"/>
<node CREATED="1310834832758" ID="ID_1333916311" MODIFIED="1310834922187" TEXT="MustFree &#xff1a;&#x5982;&#x679c;&#x672c;&#x7ed3;&#x6784;&#x662f;malloc&#x51fa;&#x6765;&#x7684;&#x5219;&#x9700;free"/>
<node CREATED="1310834845300" ID="ID_843938423" MODIFIED="1310834947224" TEXT="MustFreeData : &#x5982;&#x679c;&#x672c;&#x7ed3;&#x6784;&#x7684;Data&#x662f;malloc&#x51fa;&#x6765;&#x7684;&#x5219;&#x9700;free"/>
<node CREATED="1310834880258" ID="ID_956085737" MODIFIED="1310834984582" TEXT="IsConfig : &#x662f;config&#x8fd8;&#x662f;status"/>
<node CREATED="1310834994871" ID="ID_1154304637" MODIFIED="1310836416224" TEXT="Tr069AlwaysInform &#xff1a; &#x5728;&#x6bcf;&#x6b21;&#x901a;&#x544a;&#x4e2d;&#x5305;&#x542b;&#x6b64;&#x503c;"/>
<node CREATED="1310835006277" ID="ID_1699718864" MODIFIED="1310836346326" TEXT="Tr069InformMode tr069&#x901a;&#x544a;&#x6a21;&#x5f0f;&#xff0c;&#x6709;&#x4e3b;&#x52a8;&#x901a;&#x544a;&#x548c;&#x88ab;&#x52a8;&#x901a;&#x544a;2&#x79cd;"/>
<node CREATED="1310835016982" ID="ID_1990569876" MODIFIED="1310836290658" TEXT="RestrictedWrite : &#x4ec5;&#x6709;tr069&#x8fdc;&#x7a0b;&#x7ba1;&#x7406;&#x5668;&#x624d;&#x80fd;&#x4fee;&#x6539;&#x6b64;&#x503c;"/>
<node CREATED="1310835025987" ID="ID_1774738685" MODIFIED="1310836308220" TEXT="VendorBits &#xff1a; &#x5382;&#x5bb6;&#x79c1;&#x6709;&#x6570;&#x636e;"/>
</node>
<node CREATED="1310830838504" ID="ID_568428737" MODIFIED="1310830879487" TEXT="struct mibObjectVol *OldVolP : &#x4fee;&#x6539;&#x4e4b;&#x524d;&#x7684;&#x503c;&#xff0c;&#x7528;&#x4e8e;rollback"/>
<node CREATED="1310830924726" ID="ID_586403378" MODIFIED="1310830945926" TEXT="FactoryResetInProgress : &#x6b63;&#x5904;&#x4e8e;reset&#x8fc7;&#x7a0b;&#x4e2d;"/>
<node CREATED="1310830961001" ID="ID_1474016162" MODIFIED="1310830980393" TEXT="UnhideInProgress : &#x6b63;&#x5904;&#x4e8e;unhide&#x8fc7;&#x7a0b;&#x4e2d;"/>
<node CREATED="1310831005300" ID="ID_1427135612" MODIFIED="1321255123735" TEXT="UpdateNeeded : &#x9700;&#x8981;&#x66f4;&#x65b0;&#x6b64;status mib"/>
<node CREATED="1310831022989" ID="ID_1001179535" MODIFIED="1321255187629" TEXT="Preserve : &#x5728;partial reset&#x8fc7;&#x7a0b;&#x4e2d;&#x4e0d;reset&#x6b64;mib&#x7684;&#x503c;"/>
<node CREATED="1310831041086" ID="ID_4686826" MODIFIED="1321255277929" TEXT="DataEverModified : &#x81ea;factory reset&#x4ee5;&#x6765;&#x6b64;mib&#x7684;&#x503c;&#x662f;&#x5426;&#x88ab;&#x4fee;&#x6539;&#x8fc7;"/>
<node CREATED="1310831053127" ID="ID_1316003443" MODIFIED="1321255318709" TEXT="OldDataEverModified : &#x5bf9;&#x4e0a;&#x9762;&#x7684;DataEverModified&#x7684;&#x5907;&#x4efd;"/>
<node CREATED="1310831071064" ID="ID_1925730351" MODIFIED="1310836873753" TEXT="Hidden &#xff1a;&#x8282;&#x70b9;&#x662f;&#x5426;&#x9700;&#x8981;&#x9690;&#x85cf;"/>
<node CREATED="1310831125708" ID="ID_1571530510" MODIFIED="1310831127754" TEXT="OldHidden"/>
<node CREATED="1310831141781" ID="ID_277035377" MODIFIED="1310831144196" TEXT="DefaultHidden"/>
<node CREATED="1310831167063" ID="ID_692085431" MODIFIED="1310831171103" TEXT="AsyncUpdateNeeded"/>
<node CREATED="1310831179064" ID="ID_461112602" MODIFIED="1321255382331" TEXT="Permanent"/>
</node>
</node>
</node>
<node CREATED="1310824365359" ID="ID_1101773001" MODIFIED="1337761893027" TEXT="struct gwmibObjectStruct">
<node CREATED="1310815321947" ID="ID_395679611" MODIFIED="1337761895469">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct
    </p>
    <p>
      {<br />&#160;&#160;&#160;&#160;struct mibObject _O;<br />&#160;&#160;&#160;&#160;struct
    </p>
    <p>
      &#160;&#160;&#160;{<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;struct mibObject _O;<br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;....<br />&#160;&#160;&#160;&#160;}<font color="#d30808">child</font>;<br />}InternetGatewayDevice;
    </p>
  </body>
</html></richcontent>
<node CREATED="1310831231411" ID="ID_793995211" MODIFIED="1337761896771" TEXT="struct mibObject">
<node CREATED="1310831249116" ID="ID_829751170" LINK="#ID_1862685066" MODIFIED="1321256106483" TEXT="struct mibObjectType *Type &#xff1a;&#x6307;&#x5411;&#x8282;&#x70b9;&#x7684;&#x7c7b;&#x578b;&#x63cf;&#x8ff0;&#x7ed3;&#x6784;"/>
<node CREATED="1310831263038" ID="ID_1504561265" MODIFIED="1310831264918" TEXT="Path"/>
<node CREATED="1310831275910" ID="ID_907302858" MODIFIED="1310831277627" TEXT="Name"/>
<node CREATED="1310831291735" ID="ID_1085796475" MODIFIED="1310831303893" TEXT="Parent : &#x7236;&#x8282;&#x70b9;"/>
<node CREATED="1310831312505" ID="ID_420457744" MODIFIED="1310831342565" TEXT="NextSibling : &#x5144;&#x5f1f;&#x8282;&#x70b9;"/>
<node CREATED="1310831351180" ID="ID_1176993367" MODIFIED="1310831363996" TEXT="FirstChild : &#x5b50;&#x8282;&#x70b9;"/>
<node CREATED="1310831378565" ID="ID_55792823" LINK="#ID_1377982753" MODIFIED="1321256134114" TEXT="struct mibObjectVar *VarP"/>
</node>
</node>
</node>
</node>
<node CREATED="1310824848288" FOLDED="true" ID="ID_1243122419" MODIFIED="1337760666529" TEXT="gwmib.amibc &#x6b64;&#x6587;&#x4ef6;&#x4e2d;&#x5b9a;&#x4e49;&#x4e86;&#x4ee5;&#x4e0b;&#x5168;&#x5c40;&#x53d8;&#x91cf;&#xff1a;">
<node CREATED="1310831752135" ID="ID_1712634570" LINK="#ID_515685008" MODIFIED="1310831860256" TEXT="struct gwmibObjectTypeVarStruct gwmibObjectTypeVars"/>
<node CREATED="1310831765896" ID="ID_185779537" LINK="#ID_1748275431" MODIFIED="1310834288175" TEXT="struct gwmibObjectTypeStruct      gwmibObjectTypes : &#x4ee5;&#x6811;&#x7684;&#x5f62;&#x5f0f;&#x5b9a;&#x4e49;&#x6bcf;&#x4e2a;&#x8282;&#x70b9;&#x7684;&#x7c7b;&#x578b;&#x63cf;&#x8ff0;&#x7ed3;&#x6784;"/>
<node CREATED="1310831777449" ID="ID_410246203" LINK="#ID_1622960081" MODIFIED="1310834365164" TEXT="struct gwmibObjectVarStruct        gwmibObjectVars &#xff1a; &#x4ee5;&#x6811;&#x7684;&#x5f62;&#x5f0f;&#x5b9a;&#x4e49;&#x6bcf;&#x4e2a;&#x8282;&#x70b9;&#x7684;&#x503c;"/>
<node CREATED="1310831790986" ID="ID_1688256660" LINK="#ID_1101773001" MODIFIED="1310834322617" TEXT="struct gwmibObjectStruct             gwmibObjects &#xff1a; &#x4ee5;&#x6811;&#x7684;&#x5f62;&#x5f0f;&#x5b9a;&#x4e49;&#x6bcf;&#x4e2a;&#x8282;&#x70b9;"/>
<node CREATED="1310831818396" FOLDED="true" ID="ID_561375637" MODIFIED="1337587079386" TEXT="struct mibTable                                gwmibMibTable &#xff1a;&#x4f20;&#x5165;masterd&#x4e2d;&#x7684;mibInit&#x51fd;&#x6570;">
<node CREATED="1310831928452" ID="ID_1976484797" MODIFIED="1310832900910" TEXT="struct mibEnumeration *FirstEnum : &#x5c06;&#x6240;&#x6709;&#x7684;&#x679a;&#x4e3e;&#x7c7b;&#x578b;&#x94fe;&#x63a5;&#x6210;&#x4e00;&#x4e2a;&#x8868;"/>
<node CREATED="1310831943181" ID="ID_130905005" MODIFIED="1310833479473" TEXT="struct mibObjectType RootObjectType :"/>
<node CREATED="1310831957550" ID="ID_207001836" MODIFIED="1310833044356" TEXT="struct mibObject RootObject : mib tree&#x7684;&#x6839;&#x8282;&#x70b9;"/>
<node CREATED="1310832624308" ID="ID_176488219" MODIFIED="1310832626628" TEXT="NErrors"/>
</node>
</node>
</node>
<node CREATED="1310837262316" FOLDED="true" ID="ID_1557223257" MODIFIED="1337578548559" TEXT="&#x521d;&#x59cb;&#x5316; &#xff1a; mibInit">
<node CREATED="1310837396759" ID="ID_1181711776" MODIFIED="1337327817497" TEXT="1, mibObjectVolatileInit">
<node CREATED="1310837427720" ID="ID_1319574077" MODIFIED="1310837486741" TEXT="1, &#x5c06;&#x6bcf;&#x4e2a;Object-&gt;VarP-&gt;VolP&#x6307;&#x5411;&#x8282;&#x70b9;&#x7684;&#x9ed8;&#x8ba4;&#x503c;&#xff0c;&#x5373;Object-&gt;Type-&gt;Default"/>
<node CREATED="1310837550432" ID="ID_647986622" MODIFIED="1310837886864" TEXT="2, &#x82e5;&#x8282;&#x70b9;&#x65e0;&#x9700;&#x9690;&#x85cf;&#x4e14;&#x4e3a;status&#x53f6;&#x5b50;&#x8282;&#x70b9;&#xff0c;&#x8868;&#x660e;&#x6b64;&#x8282;&#x70b9;&#x7684;&#x503c;&#x4f1a;&#x88ab;&#x7acb;&#x5373;&#x4fee;&#x6539;&#xff0c;&#xa;    &#x56e0;&#x6b64;&#x4e3a;&#x5176;&#x503c;&#xff08;Object-&gt;VarP-&gt;VolP&#xff09;&#x91cd;&#x65b0;&#x5206;&#x914d;struct mibObjectVol&#x7ed3;&#x6784;&#xff0c;&#xa;    &#x5e76;&#x7528;&#x8001;&#x503c;&#x521d;&#x59cb;&#x5316;&#x65b0;&#x503c;"/>
<node CREATED="1310837952341" ID="ID_1959880840" MODIFIED="1310837957105" TEXT="3, Object-&gt;VarP-&gt;Preserve = Object-&gt;Type-&gt;Preserve"/>
</node>
<node CREATED="1310838081341" ID="ID_1084572528" MODIFIED="1337326661075" TEXT="2, &#x5b89;&#x88c5;&#x7b2c;&#x4e00;&#x4e2a;manage plugin : &#xa;    InternalJobPlugin">
<node CREATED="1310873223981" ID="ID_913649353" LINK="#ID_1128884932" MODIFIED="1337328395168" TEXT=".JobStart = mibInternalJobStart"/>
<node CREATED="1310873239662" ID="ID_965917990" LINK="#ID_284994721" MODIFIED="1337328402597" TEXT=".JobDone = mibInternalJobDone"/>
<node CREATED="1310873267545" ID="ID_1915573319" LINK="#ID_1101667266" MODIFIED="1337328408730" TEXT=".Report = mibInternalJobReport"/>
</node>
<node CREATED="1310873413509" FOLDED="true" ID="ID_1154301199" MODIFIED="1337578546859" TEXT="3, &#x6dfb;&#x52a0;&#x5b9a;&#x65f6;&#x5668;&#xff1a;">
<node CREATED="1310873442183" ID="ID_719105368" MODIFIED="1310878122605" TEXT="mibS.PollTimeout = mibManagerPollReal &#xff1a;&#x6b64;&#x5b9a;&#x65f6;&#x5668;&#x5904;&#x7406;Job&#x8bf7;&#x6c42;"/>
<node CREATED="1310873470596" ID="ID_805132862" MODIFIED="1310879421086" TEXT="mibS.JobTimeout = mibManagerJobTimeout &#xff1a;&#x5f53;&#x67d0;&#x4e2a;Job&#x5904;&#x7406;&#x53d1;&#x751f;&#x5f02;&#x5e38;&#x6216;&#x5360;&#x7528;&#x65f6;&#x95f4;&#x8d85;&#x65f6;&#xff0c;&#x5219;&#x9700;&#x53d6;&#x6d88;&#x6b64;Job"/>
<node CREATED="1310873500346" FOLDED="true" ID="ID_794621156" MODIFIED="1337578544575" TEXT="mibS.InternalJobTimeout = mibInternalJobStartHandler">
<node CREATED="1321348207278" ID="ID_843555776" LINK="#ID_1106039322" MODIFIED="1321348356141" TEXT="&#x7528;mibS.InternalJobPlugin&#x8fd9;&#x4e2a;manager plugin&#x8bf7;&#x6c42;&#x4e00;&#x4e2a;&#x65b0;&#x7684;job"/>
</node>
<node CREATED="1310873521518" FOLDED="true" ID="ID_255412536" MODIFIED="1337328919451" TEXT="mibS.RebootTimeout = mibRebootTimeoutHandler: &#x7cfb;&#x7edf;&#x91cd;&#x542f;&#x5b9a;&#x65f6;&#x5668;">
<node CREATED="1321240973559" FOLDED="true" ID="ID_1352492273" MODIFIED="1337328918055">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36229;&#26102;&#21518;&#35843;&#29992;&#22238;&#35843;&#20989;&#25968;mibS.RebootCB&#21363;
    </p>
    <p>
      masterdRebootHandlerFromMib
    </p>
  </body>
</html></richcontent>
<node CREATED="1321247848266" FOLDED="true" ID="ID_649617660" MODIFIED="1337328344555" TEXT="&#x5c06;masterdS.RebootRequired&#x7f6e;&#x4e3a;1,&#x7136;&#x540e;&#x8c03;&#x7528;exit.&#x8fd9;&#x5c06;&#x5bfc;&#x81f4;&#xa;masterd&#x7684;&#x4fe1;&#x53f7;&#x5904;&#x7406;&#x51fd;&#x6570;masterdExitHandler&#x88ab;&#x8c03;&#x7528;.">
<node CREATED="1321248109727" ID="ID_1849441037" MODIFIED="1321248127817" TEXT="&#x8c03;&#x7528;&#x7cfb;&#x7edf;&#x547d;&#x4ee4;reboot"/>
<node CREATED="1321248128477" ID="ID_1020827159" MODIFIED="1321248155257" TEXT="kill&#x6389;masterd&#x7684;&#x6240;&#x6709;&#x5b50;&#x8fdb;&#x7a0b;"/>
</node>
</node>
</node>
</node>
<node CREATED="1310873609854" ID="ID_1363743522" MODIFIED="1310873622675" TEXT="4, &#x6dfb;&#x52a0;mib&#x83dc;&#x5355;"/>
<node CREATED="1310873663824" ID="ID_1481658352" MODIFIED="1321353531562" TEXT="5, &#x8c03;&#x7528;mibInternalJobStartHandler&#x8bf7;&#x6c42;&#x7b2c;&#x4e00;&#x4e2a;Job&#xff0c;&#x4ee5;&#x505a;factory reset&#xa;    &#x5728;mib internal job&#x8c03;&#x7528;mibManagerJobActivate&#x6fc0;&#x6d3b;&#x7b2c;&#x4e00;&#x4e2a;job&#x65f6;&#xff0c;&#xa;    &#x4f1a;&#x7528;flash&#x4e2d;&#x4fdd;&#x5b58;&#x7684;&#x6587;&#x4ef6;&#x6765;&#x6062;&#x590d;&#x6574;&#x4e2a;mib&#x6811;&#x3002;&#x6ce8;&#x610f;&#x8fd9;2&#x4e2a;restore&#xff0c;&#x524d;&#x8005;&#x5c06;&#x6574;&#x4e2a;&#xa;    mib&#x6811;&#x6062;&#x590d;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;&#xff0c;&#x800c;&#x540e;&#x8005;&#x5c06;&#x6574;&#x4e2a;mib&#x6811;&#x6062;&#x590d;&#x4e3a;flash&#x4e2d;&#x4fdd;&#x5b58;&#x7684;&#x503c;&#x3002;&#x8fd9;2&#x4e2a;&#xa;    restore&#x90fd;&#x4f1a;&#x5728;&#x7b2c;&#x4e00;&#x4e2a;job&#x4e2d;&#x5b8c;&#x6210;&#x3002;"/>
</node>
<node CREATED="1318341784310" FOLDED="true" ID="ID_413490537" MODIFIED="1321353585668" TEXT="mib&#x7684;&#x5b58;&#x50a8;&#x4e0e;&#x6062;&#x590d;">
<node CREATED="1318342106354" FOLDED="true" ID="ID_861134278" MODIFIED="1321352376907" TEXT="&#x4e0e;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;">
<node CREATED="1318342310016" FOLDED="true" ID="ID_1059773924" MODIFIED="1321352373720" TEXT="mibS.SaveRestorePlugin&#xa;&#x5f53;&#x7cfb;&#x7edf;&#x7b2c;&#x4e00;&#x6b21;&#x8d77;&#x6765;&#x65f6;&#x4f1a;&#x8c03;&#x7528;Restore&#x51fd;&#x6570;&#x4ece;&#x6587;&#x4ef6;&#x4e2d;&#x6062;&#x590d;mib&#x503c;&#xa;&#x800c;&#x6bcf;&#x6b21;configurable mib&#x503c;&#x53d8;&#x5316;&#x540e;&#x4f1a;&#x5728;JobReport&#x9636;&#x6bb5;&#x8c03;&#x7528;Storage&#x4fdd;&#x5b58;mib&#x503c;&#x5230;&#x6587;&#x4ef6;&#x4e2d;">
<node CREATED="1318342231919" ID="ID_1560861719" MODIFIED="1318342494148" TEXT="&#x901a;&#x8fc7;&#x51fd;&#x6570;mibSaveRestorePluginInstall&#x5b89;&#x88c5;"/>
<node CREATED="1318342343371" FOLDED="true" ID="ID_998189336" MODIFIED="1321352373001" TEXT="struct mibSaveRestorePlugin&#x7ed3;&#x6784;">
<node CREATED="1318342410176" ID="ID_191227952" MODIFIED="1318342412710" TEXT="Name"/>
<node CREATED="1318342418987" ID="ID_42656015" MODIFIED="1318342425250" TEXT="&#x51fd;&#x6570;&#x6307;&#x9488;Restore"/>
<node CREATED="1318342433055" ID="ID_1971486113" MODIFIED="1318342460850" TEXT="&#x51fd;&#x6570;&#x6307;&#x9488;Storage"/>
</node>
</node>
<node CREATED="1318342580943" FOLDED="true" ID="ID_1876921060" MODIFIED="1321343164923" TEXT="mibS.StorageSave&#xa;&#x5f53;&#x7528;&#x6237;&#x5728;mibsh&#x4e2d;&#x8f93;&#x5165;save&#x547d;&#x4ee4;&#x65f6;&#xff0c;&#x4f1a;&#x901a;&#x8fc7;mibSave&#x8c03;&#x7528;&#x6b64;&#x51fd;&#x6570;">
<node CREATED="1318342610097" ID="ID_101839328" MODIFIED="1321340213693" TEXT="&#x901a;&#x8fc7;&#x51fd;&#x6570;mibStorageSaveCBSet&#x5b89;&#x88c5;(&#x89c1;nvs)"/>
</node>
<node CREATED="1318342593820" FOLDED="true" ID="ID_147848241" MODIFIED="1321343164924" TEXT="mibS.StorageLoad&#xa;&#x5f53;&#x7528;&#x6237;&#x5728;mibsh&#x4e2d;&#x8f93;&#x5165;load&#x547d;&#x4ee4;&#x65f6;&#xff0c;&#x4f1a;&#x901a;&#x8fc7;mibLoad&#x8c03;&#x7528;&#x6b64;&#x51fd;&#x6570;">
<node CREATED="1318342635557" ID="ID_479671661" MODIFIED="1321340225632" TEXT="&#x901a;&#x8fc7;&#x51fd;&#x6570;mibStorageLoadCBSet&#x5b89;&#x88c5;(&#x89c1;nvs)"/>
</node>
</node>
<node CREATED="1318343642371" FOLDED="true" ID="ID_792085288" MODIFIED="1321343148669" TEXT="nvs&#xa;&#x4e3b;&#x8981;&#x5b9e;&#x73b0;&#x4e86;mib&#x5b58;&#x50a8;&#x4e0e;&#x6062;&#x590d;&#x7684;&#x63a5;&#x53e3;&#x3002;nvs&#x7528;&#x4e8e;&#x5c06;mib&#x503c;&#x4fdd;&#x5b58;&#x5230;&#x67d0;&#x4e2a;&#x6587;&#x4ef6;&#xff0c;&#xa;&#x518d;&#x7531;&#x66f4;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;&#x5c06;&#x6b64;&#x6587;&#x4ef6;&#x4fdd;&#x5b58;&#x5230;flash&#x7684;mib&#x5206;&#x533a;&#xff0c;&#x5176;&#x4e0e;&#x66f4;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;&#xa;&#x4e3a;struct nvsOptions">
<node CREATED="1318343672204" FOLDED="true" ID="ID_1092557955" MODIFIED="1321343164926" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1318344205762" ID="ID_1332101721" MODIFIED="1318344238505" TEXT="nvsS.Opt = *Options&#x4fdd;&#x5b58;&#x66f4;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;"/>
<node CREATED="1318343787299" FOLDED="true" ID="ID_157949427" MODIFIED="1321343142055" TEXT="mibStorageSaveCBSet(nvsSave)&#xa;&#x5373;&#x521d;&#x59cb;&#x5316;mibS.StorageSave&#x63a5;&#x53e3;">
<node CREATED="1318345626853" ID="ID_1673244410" LINK="#ID_1009918409" MODIFIED="1318345635185" TEXT="nvsTextSave"/>
</node>
<node CREATED="1318343851541" FOLDED="true" ID="ID_119047598" MODIFIED="1321343142061" TEXT="mibStorageLoadCBSet(nvsLoad)&#xa;&#x5373;&#x521d;&#x59cb;&#x5316;mibS.StorageLoad&#x63a5;&#x53e3;">
<node CREATED="1318345651108" ID="ID_338748290" LINK="#ID_894367814" MODIFIED="1318345658836" TEXT="nvsTextRestore"/>
</node>
<node CREATED="1318343893119" ID="ID_419055586" MODIFIED="1318343918214" TEXT="nvsMenuInit&#xa;&#x5b89;&#x88c5;save,load&#x547d;&#x4ee4;"/>
<node CREATED="1318343938786" FOLDED="true" ID="ID_1155546450" MODIFIED="1321343142063" TEXT="mibSaveRestorePluginInstall(&amp;nvsS.SaveRestorePlugin)&#xa;&#x5373;&#x521d;&#x59cb;&#x5316;mibS.SaveRestorePlugin&#x63a5;&#x53e3;">
<node CREATED="1318344969483" FOLDED="true" ID="ID_752495803" MODIFIED="1321343142063" TEXT="nvsStorage">
<node CREATED="1318344982843" FOLDED="true" ID="ID_1009918409" MODIFIED="1321343113454" TEXT="nvsTextSave">
<node CREATED="1321341170745" FOLDED="true" ID="ID_214200956" MODIFIED="1321343003945" TEXT="&#x8c03;&#x7528;mibNvsSaveWrite&#x5c06;mib&#x6811;&#x5199;&#x5165;&#x6587;&#x4ef6;">
<node CREATED="1321341387784" ID="ID_116338727" MODIFIED="1321341471260" TEXT="1, &#x5c06;&#x6240;&#x6709;&#x9690;&#x85cf;&#x7684;&#x6570;&#x7ec4;&#x8282;&#x70b9;&#x5199;&#x4e3a;&#xff1a;&quot;hidenArrayNode -hiden&quot;"/>
<node CREATED="1321341387784" ID="ID_1224402665" MODIFIED="1321341572198" TEXT="2, &#x5c06;&#x6240;&#x6709;&#x672a;&#x9690;&#x85cf;&#x7684;&#x6570;&#x7ec4;&#x8282;&#x70b9;&#x5199;&#x4e3a;&#xff1a;&quot;unhidenArrayNode -unhiden&quot;"/>
<node CREATED="1321341633721" FOLDED="true" ID="ID_1954266925" MODIFIED="1321342992320" TEXT="3, &#x8c03;&#x7528;mibDisplaySiblings&#x5c06;&#x6240;&#x6709;&#x4e0d;&#x540c;&#x4e8e;&#x9ed8;&#x8ba4;&#x503c;&#x7684;config mib&#x5199;&#x5165;&#x6587;&#x4ef6;">
<node CREATED="1321341867501" FOLDED="true" ID="ID_104094480" MODIFIED="1321342989937" TEXT="mibDisplayObject">
<node CREATED="1321342833439" ID="ID_1983230175" MODIFIED="1321342849727" TEXT="-m &#x662f;&#x5426;&#x5df2;&#x4fee;&#x6539;"/>
<node CREATED="1321342867066" ID="ID_886849418" MODIFIED="1321342877479" TEXT="-r &#x662f;&#x5426;&#x4e3a;Restricted Write"/>
<node CREATED="1321342889980" ID="ID_1252794327" MODIFIED="1321342900009" TEXT="-i Tr069 Inform Mode"/>
<node CREATED="1321342912484" ID="ID_1072313758" MODIFIED="1321342921872" TEXT="-v Vendor Attributes"/>
<node CREATED="1321342933133" ID="ID_727519164" MODIFIED="1321342943609" TEXT="-d &#x6570;&#x636e;&#x503c;"/>
</node>
<node CREATED="1321342077798" FOLDED="true" ID="ID_1059694177" MODIFIED="1321342196937" TEXT="&#x8c03;&#x7528;&#x7684;mibDisplayObject&#x7684;&#x9009;&#x9879;&#x4e3a;">
<node CREATED="1321342141960" ID="ID_494228161" MODIFIED="1321342191177" TEXT="MIB_DISPLAY_OPTION_VERBOSE &#xa;MIB_DISPLAY_OPTION_SHOW_NODES &#xa;MIB_DISPLAY_OPTION_CONFIG_ONLY &#xa;MIB_DISPLAY_OPTION_STATUS_ONLY &#xa;MIB_DISPLAY_OPTION_ALTNAME &#xa;MIB_DISPLAY_OPTION_NUMERIC &#xa;MIB_DISPLAY_OPTION_NON_DEFAULT &#xa;MIB_DISPLAY_OPTION_VALUE_ONLY &#xa;MIB_DISPLAY_OPTION_NVS &#xa;MIB_DISPLAY_OPTION_SHOW_HIDDEN &#xa;MIB_DISPLAY_OPTION_NODE_ERROR &#xa;MIB_DISPLAY_OPTION_PATH_ONLY &#xa;MIB_DISPLAY_OPTION_MODIFIED_ONLY"/>
</node>
</node>
</node>
<node CREATED="1318345010181" ID="ID_1788920471" MODIFIED="1318345061734" TEXT="&#x8c03;&#x7528;&#x5e95;&#x5c42;&#x63a5;&#x53e3;nvsS.Opt.StorageCallback&#xa;&#x5c06;&#x4fdd;&#x5b58;&#x7684;mib&#x6587;&#x4ef6;&#x5199;&#x5165;flash&#x7684;mib&#x5206;&#x533a;"/>
</node>
</node>
<node CREATED="1318345102207" FOLDED="true" ID="ID_1178757313" MODIFIED="1321343142063" TEXT="nvsRestore">
<node CREATED="1318345113211" FOLDED="true" ID="ID_894367814" MODIFIED="1321343142063" TEXT="nvsTextRestore">
<node CREATED="1318345191681" ID="ID_474359494" MODIFIED="1318345560366" TEXT="&#x7cfb;&#x7edf;&#x521d;&#x59cb;&#x5316;&#x65f6;&#x5e95;&#x5c42;&#x5df2;&#x5c06;flash&#x7684;mib&#x5206;&#x533a;&#x6062;&#x590d;&#x5230;&#x67d0;&#x4e2a;&#x6587;&#x4ef6;&#xff0c;&#xa;Restore&#x65f6;&#x5373;&#x7528;&#x6b64;&#x6587;&#x4ef6;&#x6062;&#x590d;mib&#x503c;"/>
</node>
</node>
</node>
</node>
<node CREATED="1318345701312" FOLDED="true" ID="ID_705118636" MODIFIED="1321343142066" TEXT="&#x4e0e;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;&#xa;struct nvsOptions">
<node CREATED="1318345772507" ID="ID_1766354339" MODIFIED="1318345975995" TEXT="Format&#xa;&#x5e95;&#x5c42;&#x6062;&#x590d;mib&#x6587;&#x4ef6;&#x540e;&#x544a;&#x8bc9;nvs&#x6587;&#x4ef6;&#x7684;&#x683c;&#x5f0f;"/>
<node CREATED="1318345783370" ID="ID_1311987987" MODIFIED="1318346035642" TEXT="FilePath&#xa;&#x4fdd;&#x5b58;&#x6216;&#x6062;&#x590d;mib&#x6587;&#x4ef6;&#x65f6;&#x6587;&#x4ef6;&#x8def;&#x5f84;"/>
<node CREATED="1318345796512" ID="ID_1601549224" MODIFIED="1318346095503" TEXT="&#x51fd;&#x6570;&#x6307;&#x9488;StorageCallback&#xa;nvs&#x8c03;&#x7528;&#x6b64;&#x63a5;&#x53e3;&#x8ba9;&#x5e95;&#x5c42;&#x5c06;mib&#x6587;&#x4ef6;&#x5199;&#x5165;flash&#x7684;mib&#x5206;&#x533a;"/>
</node>
<node CREATED="1318346551267" FOLDED="true" ID="ID_115269049" MODIFIED="1321343142073" TEXT="nvsblob&#xa;&#x4e3a;&#x4e86;&#x8282;&#x7701;&#x7a7a;&#x95f4;&#xff0c;&#x9700;&#x8981;&#x5c06;&#x6587;&#x672c;&#x683c;&#x5f0f;&#x7684;mib&#x6587;&#x4ef6;&#x8fdb;&#x884c;&#x538b;&#x7f29;&#xff0c;&#x5e76;&#x52a0;&#x4e0a;&#x5fc5;&#x8981;&#x7684;&#x5934;&#x90e8;&#x548c;&#x5c3e;&#x90e8;&#x3002;&#xa;&#x5934;&#x90e8;&#x4e00;&#x822c;&#x5305;&#x542b;&#x6709;&#x5e8f;&#x53f7;&#x548c;&#x6821;&#x9a8c;&#x548c;&#x3002;&#x5e8f;&#x5217;&#x53f7;&#x7528;&#x4e8e;&#x5197;&#x4f59;&#x5907;&#x4efd;&#x3002;&#xa;nvsblob&#x7684;&#x4f5c;&#x7528;&#x5373;&#x662f;&#x5c06;nvs&#x751f;&#x6210;&#x7684;&#x6587;&#x672c;&#x683c;&#x5f0f;&#x7684;mib&#x6587;&#x4ef6;&#x53d8;&#x4e3a;&#x538b;&#x7f29;&#x683c;&#x5f0f;&#xff0c;&#x518d;&#x8c03;&#x7528;&#xa;&#x66f4;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;&#x5c06;&#x538b;&#x7f29;&#x6587;&#x4ef6;&#x5199;&#x5165;flash&#x7684;mib&#x5206;&#x533a;&#x3002;">
<node CREATED="1318346972989" FOLDED="true" ID="ID_1434166019" MODIFIED="1321343142068" TEXT="&#x4e0e;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;&#xa;struct nvsblobDriver">
<node CREATED="1318347041402" ID="ID_447658529" MODIFIED="1318347065792" TEXT="NLocations"/>
<node CREATED="1318347074536" ID="ID_817223687" MODIFIED="1318347075579" TEXT="LocationSize"/>
<node CREATED="1318347084640" ID="ID_753483596" MODIFIED="1318347090938" TEXT="&#x51fd;&#x6570;&#x6307;&#x9488;read"/>
<node CREATED="1318347100168" ID="ID_1914984157" MODIFIED="1318347105971" TEXT="&#x51fd;&#x6570;&#x6307;&#x9488;erase"/>
<node CREATED="1318347113129" ID="ID_1474128612" MODIFIED="1318347118327" TEXT="&#x51fd;&#x6570;&#x6307;&#x9488;write"/>
</node>
<node CREATED="1318347322134" FOLDED="true" ID="ID_1046068270" MODIFIED="1321343142073" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1318347330837" ID="ID_1072320636" MODIFIED="1318347363141" TEXT="&#x4fdd;&#x5b58;&#x66f4;&#x5e95;&#x5c42;&#x7684;&#x63a5;&#x53e3;nvsblobS.Driver = *Driver"/>
<node CREATED="1318349160104" ID="ID_912915443" MODIFIED="1318349230075" TEXT="&#x521b;&#x5efa;&#x5ef6;&#x65f6;&#x5b9a;&#x65f6;&#x5668;nvsblobS.StorageTimeout&#x8fdb;&#x884c;&#x5197;&#x4f59;&#x5907;&#x4efd;&#xa;nvsblobStore"/>
<node CREATED="1318349256652" ID="ID_373556879" MODIFIED="1318349258602" TEXT="nvsblobLowInit"/>
<node CREATED="1318349280019" FOLDED="true" ID="ID_512804208" MODIFIED="1321343142071" TEXT="nvsInit(&amp;nvsblobS.NvsOptions)&#xa;&#x521d;&#x59cb;&#x5316;&#x4e0e;nvs&#x7684;&#x63a5;&#x53e3;struct nvsOptions">
<node CREATED="1318349349897" FOLDED="true" ID="ID_1405647829" MODIFIED="1321343142070" TEXT="nvsblobStorageCallback">
<node CREATED="1318349823382" ID="ID_39680674" MODIFIED="1318349848506" TEXT="&#x8c03;&#x7528;nvsblobPack&#x5c06;mib&#x6587;&#x4ef6;&#x53d8;&#x4e3a;&#x538b;&#x7f29;&#x683c;&#x5f0f;"/>
<node CREATED="1318349855967" ID="ID_1401524979" MODIFIED="1318349948770" TEXT="&#x5982;&#x679c;&#x6700;&#x65b0;&#x5907;&#x4efd;&#x4e0e;&#x4e0a;&#x4e00;&#x6b21;&#x5907;&#x4efd;&#x4e0d;&#x540c;&#x5219;&#x9700;&#x8981;&#x8c03;&#x7528;nvsblobStore&#x5199;&#x5165;flash"/>
</node>
</node>
</node>
<node CREATED="1318349467713" FOLDED="true" ID="ID_302916845" MODIFIED="1321343142073" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1318349476044" FOLDED="true" ID="ID_1629391579" MODIFIED="1321340458353" TEXT="struct nvsblobState">
<node CREATED="1318349490357" ID="ID_1318872719" MODIFIED="1318349541843" TEXT="struct nvsblobDriver Driver&#xa;&#x4e0e;&#x4e0b;&#x5c42;&#x7684;&#x63a5;&#x53e3;"/>
<node CREATED="1318349504123" ID="ID_132564928" MODIFIED="1318349526810" TEXT="struct nvsOptions NvsOptions&#xa;&#x4e0e;&#x4e0a;&#x5c42;nvs&#x7684;&#x63a5;&#x53e3;"/>
<node CREATED="1318349556461" ID="ID_1102854418" MODIFIED="1318349650383" TEXT="BestLocation&#xa;BestSize&#xa;BestSequence&#xa;BestBlob&#xa;&#x4e0a;&#x4e00;&#x4e2a;&#x5907;&#x4efd;&#x7684;&#x76f8;&#x5173;&#x4fe1;&#x606f;"/>
<node CREATED="1318349667855" ID="ID_673670968" MODIFIED="1318349669518" TEXT="BlobSequence[nvsblobMaxLocations]"/>
<node CREATED="1318349677050" ID="ID_1917879302" MODIFIED="1318349716581" TEXT="NewSequence&#xa;NewSize&#xa;NewBlob&#xa;&#x6700;&#x65b0;&#x5907;&#x4efd;&#x7684;&#x76f8;&#x5173;&#x4fe1;&#x606f;"/>
<node CREATED="1318349728384" ID="ID_186779136" MODIFIED="1318349729873" TEXT="struct evloopTimeout StorageTimeout"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1337325874931" ID="ID_1064181633" MODIFIED="1337334857723" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1337326398517" FOLDED="true" ID="ID_1473374639" MODIFIED="1337578942347" TEXT="struct mibSession mibS">
<node CREATED="1337326398517" ID="ID_556266234" MODIFIED="1337328459484" TEXT=" int IsInit : &#x662f;&#x5426;&#x5df2;&#x5b8c;&#x6210;&#x521d;&#x59cb;&#x5316;"/>
<node CREATED="1337326398517" ID="ID_101036458" MODIFIED="1337326398517" TEXT=" struct dbgModule *DebugModule"/>
<node CREATED="1337326398517" ID="ID_612272198" LINK="#ID_561375637" MODIFIED="1337328584995" TEXT=" const struct mibTable *MibTable : mib&#x6811;&#x7684;&#x6839;&#x7ed3;&#x70b9;"/>
<node CREATED="1337326398517" ID="ID_856541557" LINK="#ID_300279557" MODIFIED="1337328658506" TEXT=" struct mibManagerPlugin *ManagerPlugins : &#x7cfb;&#x7edf;&#x4e2d;&#x6240;&#x6709;manager plugin&#x7684;&#x94fe;&#x8868;"/>
<node CREATED="1337326398517" ID="ID_718786981" LINK="#ID_1942590489" MODIFIED="1337328700913" TEXT=" struct mibServicePlugin *ServicePlugins : &#x7cfb;&#x7edf;&#x4e2d;&#x6240;&#x6709;service plugin&#x7684;&#x94fe;&#x8868;"/>
<node CREATED="1337326398517" MODIFIED="1337326398517" TEXT=" struct mibSaveRestorePlugin SaveRestorePlugin"/>
<node CREATED="1337326398517" ID="ID_508950169" LINK="#ID_719105368" MODIFIED="1337327219991" TEXT=" struct evloopTimeout PollTimeout"/>
<node CREATED="1337326398517" ID="ID_884743891" LINK="#ID_805132862" MODIFIED="1337327229941" TEXT=" struct evloopTimeout JobTimeout"/>
<node CREATED="1337326398517" ID="ID_333247705" LINK="#ID_794621156" MODIFIED="1337327260158" TEXT=" struct evloopTimeout InternalJobTimeout"/>
<node CREATED="1337326398518" ID="ID_431648769" LINK="#ID_255412536" MODIFIED="1337327286481" TEXT=" struct evloopTimeout RebootTimeout"/>
<node CREATED="1337326398518" ID="ID_475126821" LINK="#ID_1838429029" MODIFIED="1337327167996" TEXT=" struct mibJobRequest JobRequestRoot : &#x5b58;&#x653e;job&#x8bf7;&#x6c42;&#x7684;&#x94fe;&#x8868;"/>
<node CREATED="1337326398518" FOLDED="true" ID="ID_660687649" MODIFIED="1337566620068" TEXT=" struct mibManagerPlugin *LockingManagerPlugin">
<node CREATED="1337335482761" ID="ID_1693671167" MODIFIED="1337335520431" TEXT="&#x5f53;&#x591a;&#x4e2a;manager plugin&#x8bf7;&#x6c42;&#x4e86;&#x591a;&#x4e2a;job&#x65f6;,&#x67d0;&#x4e2a;&#x7279;&#x6743;manager plugin&#x53ef;&#x4ee5;&#x9501;&#x5b9a;mib&#x4ee5;&#x8ba9;mib&#x5148;&#x5904;&#x7406;&#x5b8c;&#x81ea;&#x5df1;&#x7684;job&#x8bf7;&#x6c42;,&#x4e4b;&#x540e;&#x518d;&#x5904;&#x7406;&#x5176;&#x4ed6;manager plugin&#x7684;job&#x8bf7;&#x6c42;"/>
</node>
<node CREATED="1337326398518" ID="ID_333494379" MODIFIED="1337335892054" TEXT=" unsigned LastJobNumber : &#x4e0a;&#x4e00;&#x4e2a;&#x5b8c;&#x6210;&#x7684;job&#x7684;&#x7f16;&#x53f7;,&#x4e0b;&#x4e00;&#x4e2a;job&#x7684;&#x7f16;&#x53f7;&#x4e3a;&#x6b64;&#x503c;&#x52a0;&#x4e00;"/>
<node CREATED="1337326398518" FOLDED="true" ID="ID_1638049905" MODIFIED="1337578940960" TEXT="struct mibCurrentJob Job : &#x5f53;&#x524d;&#x6b63;&#x5728;&#x5904;&#x7406;&#x7684;job">
<node CREATED="1337326398518" ID="ID_946685885" MODIFIED="1337335252355" TEXT=" unsigned JobNumber : &#x5f53;&#x524d;&#x6b63;&#x5728;&#x5904;&#x7406;&#x7684;job, &#x5f53;&#x6b64;&#x503c;&#x4e3a;0&#x65f6;&#x8868;&#x793a;&#x5f53;&#x524d;&#x6ca1;&#x6709;&#x8981;&#x5904;&#x7406;&#x7684;job"/>
<node CREATED="1337326398518" ID="ID_82987842" MODIFIED="1337335632041" TEXT=" void *Cookie2 : manager plugin&#x8c03;&#x7528;mibManagerJobRequest&#x8bf7;&#x6c42;&#x6b64;job&#x65f6;&#x4f20;&#x5165;&#x7684;cookie"/>
<node CREATED="1337326398518" FOLDED="true" ID="ID_1853305006" LINK="#ID_887640632" MODIFIED="1337335759273" TEXT=" enum mibJobStage JobStage : job&#x7684;&#x72b6;&#x6001;">
<node CREATED="1337335684449" ID="ID_1284729315" MODIFIED="1337335686028" TEXT="mibJobStage_eNoJob"/>
<node CREATED="1337335693708" ID="ID_92438598" MODIFIED="1337335695378" TEXT="mibJobStage_eSetup"/>
<node CREATED="1337335701489" ID="ID_1165832726" MODIFIED="1337335703108" TEXT="mibJobStage_eActivated"/>
<node CREATED="1337335716656" ID="ID_1894481291" MODIFIED="1337335718663" TEXT="mibJobStage_ePropogate"/>
<node CREATED="1337335725752" ID="ID_347311951" MODIFIED="1337335726306" TEXT="mibJobStage_eStatusUpdate"/>
<node CREATED="1337335732494" ID="ID_912602677" MODIFIED="1337335733995" TEXT="mibJobStage_eStorage"/>
<node CREATED="1337335740191" ID="ID_72324850" MODIFIED="1337335741763" TEXT="mibJobStage_eReport"/>
</node>
<node CREATED="1337326398518" MODIFIED="1337326398518" TEXT=" enum mibJobStage CancelStage"/>
<node CREATED="1337326398518" ID="ID_698686720" MODIFIED="1337335799836" TEXT=" struct mibManagerPlugin *ManagerPlugin : &#x8bf7;&#x6c42;&#x6b64;job&#x7684;manager plugin"/>
<node CREATED="1337326398518" ID="ID_1546599614" MODIFIED="1337578307369" TEXT=" int NStatusUpdateWait : &#x5728;&#x6b64;&#x6b21;job&#x4e2d;&#x6709;&#x591a;&#x5c11;&#x4e2a;status mib&#x9700;&#x8981;&#x66f4;&#x65b0;"/>
<node CREATED="1337326398518" ID="ID_1074800142" MODIFIED="1337578671705" TEXT=" int JobCancelling : &#x5f53;job&#x53d1;&#x751f;&#x9519;&#x8bef;&#x65f6;&#x9700;&#x8981;&#x53d6;&#x6d88;job,&#x6b64;&#x503c;&#x8868;&#x793a;&#x6b63;&#x5728;&#x53d6;&#x6d88;job"/>
<node CREATED="1337326398518" ID="ID_389237371" MODIFIED="1337578621500" TEXT=" enum mibErr JobError : &#x5f53;&#x524d;job&#x53d1;&#x751f;&#x9519;&#x8bef;&#x65f6;&#x7684;&#x9519;&#x8bef;&#x539f;&#x56e0;"/>
<node CREATED="1337326398518" ID="ID_1625736817" MODIFIED="1337569036017" TEXT=" int NConfigChanges : &#x5728;&#x8fd9;&#x4e2a;job&#x4e2d;&#x6709;&#x591a;&#x5c11;&#x4e2a;config&#x8282;&#x70b9;&#x7684;&#x503c;&#x6539;&#x53d8;&#x4e86;"/>
<node CREATED="1337326398518" FOLDED="true" ID="ID_91478991" MODIFIED="1337571801777" TEXT=" struct mibServicePlugin *CurrentServicePlugin">
<node CREATED="1337571248537" ID="ID_557585330" MODIFIED="1337571684264" TEXT="config propogate&#x6216;status update&#x90fd;&#x6d89;&#x53ca;&#x5230;&#x8981;&#x8c03;&#x7528;service plugin&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;, &#x6b64;&#x503c;&#x8868;&#x793a;&#xa;&#x4e0b;&#x4e00;&#x4e2a;&#x9700;&#x8981;&#x8c03;&#x7528;&#x5176;&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;service plugin, &#x6bcf;&#x6b21;mibManagerPollReal&#x8c03;&#x7528;&#x53ea;&#x5904;&#x7406;&#x4e00;&#x4e2a;&#xa;service plugin&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;."/>
</node>
<node CREATED="1337326398518" ID="ID_1444026950" MODIFIED="1337571798321" TEXT=" int CurrentServicePluginCalled : &#x5df2;&#x7ecf;&#x5b8c;&#x6210;&#x4e86;&#x5bf9;&#x67d0;&#x4e2a;service plugin&#x56de;&#x8c03;&#x51fd;&#x6570;&#x7684;&#x8c03;&#x7528;, &#x89c1;&#x4e0a;&#x9762;"/>
<node CREATED="1337326398519" MODIFIED="1337326398519" TEXT=" int IsTr069Job"/>
<node CREATED="1337326398519" ID="ID_270262323" MODIFIED="1337578936308" TEXT=" int RestoreDoneInThisJob : &#x8868;&#x793a;&#x5728;&#x6b64;job&#x4e2d;&#x5b8c;&#x6210;&#x4e86;mib&#x503c;&#x7684;&#x6062;&#x590d;&#x6216;&#x5b58;&#x50a8;&#x5373;restore,store"/>
<node CREATED="1337326398519" ID="ID_1519931453" MODIFIED="1337336491144" TEXT=" int JobNoFail : &#x6b64;job&#x4e0d;&#x80fd;&#x5931;&#x8d25;,&#x56e0;&#x800c;&#x4e5f;&#x4e0d;&#x80fd;&#x56de;&#x6eda;"/>
</node>
<node CREATED="1337326398519" ID="ID_1023159372" MODIFIED="1337328826697" TEXT=" int RebootRequired : &#x5df2;&#x7ecf;&#x6536;&#x5230;mib&#x547d;&#x4ee4;reboot,&#x7cfb;&#x7edf;&#x9700;&#x8981;&#x91cd;&#x542f;"/>
<node CREATED="1337326398519" FOLDED="true" ID="ID_106691740" MODIFIED="1337329237994" TEXT=" void (*RebootCB)(void) : &#x6536;&#x5230;&#x91cd;&#x542f;&#x547d;&#x4ee4;&#x540e;&#x9700;&#x8981;&#x6267;&#x884c;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;">
<node CREATED="1337329008926" ID="ID_666095260" MODIFIED="1337329234552" TEXT="masterdRebootHandlerFromMib    (&#x521d;&#x59cb;&#x5316;&#x4f4d;&#x7f6e; : masterdMain.c/main/mibRebootCBSet)"/>
</node>
<node CREATED="1337326398519" FOLDED="true" ID="ID_865919641" LINK="#ID_1084572528" MODIFIED="1337327020299" TEXT=" struct mibManagerPlugin InternalJobPlugin">
<node CREATED="1337326899393" ID="ID_361689971" MODIFIED="1337326984908" TEXT="&#x6b64;plugin&#x7684;&#x4f5c;&#x7528;&#x6709;2&#x4e2a;:&#xa;1, &#x5c06;&#x6240;&#x6709;mib&#x503c;&#x6062;&#x590d;&#x5230;&#x9ed8;&#x8ba4;&#x503c;&#xa;2, &#x5c06;&#x6240;&#x6709;mib&#x503c;&#x6062;&#x590d;&#x5230;flash&#x4e2d;&#x914d;&#x7f6e;&#x6587;&#x4ef6;&#x5185;&#x4fdd;&#x5b58;&#x7684;&#x503c;"/>
</node>
<node CREATED="1337326398519" MODIFIED="1337326398519" TEXT=" int RestoreDone"/>
<node CREATED="1337326398519" ID="ID_216383012" MODIFIED="1337326398519" TEXT=" enum mibErr (*StorageSave)(const char *FilePath)"/>
<node CREATED="1337326398519" ID="ID_1798184936" MODIFIED="1337326398519" TEXT=" enum mibErr (*StorageLoad)(unsigned JobNumber, const char *FilePath)"/>
<node CREATED="1337326398519" FOLDED="true" ID="ID_1159328661" MODIFIED="1337566645229" TEXT="struct VolAlloc">
<node CREATED="1337326398519" MODIFIED="1337326398519" TEXT=" unsigned NVolAllocTotal"/>
<node CREATED="1337326398519" MODIFIED="1337326398519" TEXT=" unsigned NVolAllocFree"/>
<node CREATED="1337326398519" MODIFIED="1337326398519" TEXT=" union mibVolAlloc *FreeList"/>
</node>
</node>
</node>
</node>
<node CREATED="1310800342204" FOLDED="true" ID="ID_359541855" MODIFIED="1337325065890" TEXT="libath">
<node CREATED="1310813346244" FOLDED="true" ID="ID_94069442" MODIFIED="1337325063961" TEXT="&#x4fe1;&#x53f7;&#x5904;&#x7406;">
<node CREATED="1310813412496" ID="ID_1886715689" MODIFIED="1310813522769" TEXT="signalExitInit &#x6dfb;&#x52a0;&#x4fe1;&#x53f7;&#x5904;&#x7406;&#x51fd;&#x6570;&#xa;apps/gateway/libath/signalExit.c"/>
<node CREATED="1310813527761" ID="ID_325019910" MODIFIED="1310813543025" TEXT="signalExitSignalHandler&#x4fe1;&#x53f7;&#x5904;&#x7406;&#x51fd;&#x6570;"/>
<node CREATED="1310813563943" ID="ID_355690911" MODIFIED="1310813662625" TEXT="signalExitSignalsToCatch&#x6307;&#x5b9a;&#x54ea;&#x4e9b;&#x4fe1;&#x53f7;&#x9700;&#x8981;&#x5904;&#x7406;&#xa;signalExitSignalsToIgnore&#x6307;&#x5b9a;&#x54ea;&#x4e9b;&#x4fe1;&#x53f7;&#x9700;&#x8981;&#x5ffd;&#x7565;"/>
</node>
<node CREATED="1310876051879" FOLDED="true" ID="ID_1512666254" MODIFIED="1337325061463" TEXT="mib&#x901a;&#x4fe1;">
<node CREATED="1310876078174" ID="ID_1055927578" MODIFIED="1310876091292" TEXT="client : mibif"/>
<node CREATED="1310876092448" ID="ID_420042993" MODIFIED="1310876099548" TEXT="server : mibsh"/>
</node>
<node CREATED="1321373267933" FOLDED="true" ID="ID_178529381" MODIFIED="1337325054051" TEXT="&#x5f02;&#x6b65;&#x4e8b;&#x4ef6;&#x5904;&#x7406;">
<node CREATED="1321373330869" ID="ID_1944135127" MODIFIED="1321373470813" TEXT="evloopRun&#xa;&#x5728;masterd&#x5b8c;&#x6210;&#x6240;&#x6709;&#x521d;&#x59cb;&#x5316;&#x4e4b;&#x540e;&#x5373;&#x8c03;&#x7528;&#x6b64;&#x51fd;&#x6570;&#x8fdb;&#x884c;&#x65e0;&#x9650;&#x5faa;&#x73af;&#xff0c;&#xa;&#x4ee5;&#x5904;&#x7406;&#x53ef;&#x80fd;&#x53d1;&#x751f;&#x7684;&#x5f02;&#x6b65;&#x4e8b;&#x4ef6;(&#x6587;&#x4ef6;&#x53ef;&#x8bfb;&#xff0c;&#x6587;&#x4ef6;&#x53ef;&#x5199;&#xff0c;&#x5b9a;&#x65f6;&#x5668;&#x8d85;&#x65f6;)"/>
<node CREATED="1321373505497" FOLDED="true" ID="ID_1972684571" MODIFIED="1321413242190" TEXT="&#x5b9a;&#x65f6;&#x5668;&#xa;&#x7528;&#x6237;&#x6ce8;&#x518c;&#x4e00;&#x4e2a;&#x5b9a;&#x65f6;&#x5668;&#xff0c;&#x6307;&#x5b9a;&#x5176;&#x5904;&#x7406;&#x51fd;&#x6570;&#xff0c;&#xa;&#x5219;&#x5728;&#x8d85;&#x65f6;&#x540e;&#x4f1a;&#x8c03;&#x7528;&#x5176;&#x5904;&#x7406;&#x51fd;&#x6570;">
<node CREATED="1321374748918" FOLDED="true" ID="ID_1913688328" MODIFIED="1321413242189" TEXT="1, &#x521b;&#x5efa;&#x5b9a;&#x65f6;&#x5668;">
<node CREATED="1321373873033" FOLDED="true" ID="ID_82424302" MODIFIED="1321413242181" TEXT="void evloopTimeoutCreate&#xa;(&#xa;  struct evloopTimeout *T&#xa;  const char *Description,&#xa;  void (*CB)(void *Cookie1),&#xa;  void *Cookie1&#xa;)">
<node CREATED="1321374174159" ID="ID_1084799981" MODIFIED="1321374303107" TEXT="T&#xff1a;&#x4e00;&#x4e2a;struct evloopTimeout&#x7ed3;&#x6784;&#xff0c;&#x7528;&#x6237;&#x65e0;&#x9700;&#x4e86;&#x89e3;&#x5176;&#x7ed3;&#x6784;&#xff0c;&#xa;&#x4ec5;&#x9700;&#x4f20;&#x5165;&#x6b64;&#x7ed3;&#x6784;&#x4f9b;&#x5b58;&#x50a8;&#x5b9a;&#x65f6;&#x5668;&#x76f8;&#x5173;&#x4fe1;&#x606f;&#x5373;&#x53ef;"/>
<node CREATED="1321374310617" ID="ID_310847609" MODIFIED="1321374328003" TEXT="Description&#xff1a;&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x63cf;&#x8ff0;"/>
<node CREATED="1321374329013" ID="ID_1599579714" MODIFIED="1321375419325" TEXT="CB&#xff1a;&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;&#xff0c;&#x683c;&#x5f0f;&#x5e94;&#x5982; void xxxTimeoutHandler(struct evloopTimeout *T)"/>
<node CREATED="1321374350784" ID="ID_1092904571" MODIFIED="1321375685196" TEXT="Cookie1&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;&#x5b9a;&#x65f6;&#x5668;&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopTimeoutCookie1&#x83b7;&#x53d6;&#xa;Cookie2&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;&#x5b9a;&#x65f6;&#x5668;&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopTimeoutCookie2&#x83b7;&#x53d6;&#xa;Cookie3&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;&#x5b9a;&#x65f6;&#x5668;&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopTimeoutCookie3&#x83b7;&#x53d6;"/>
</node>
</node>
<node CREATED="1321374764929" FOLDED="true" ID="ID_343221540" MODIFIED="1321375934109" TEXT="2, &#x6ce8;&#x518c;&#x5b9a;&#x65f6;&#x5668;&#xa;2.1 &#x5b9a;&#x65f6;&#x5668;&#x8d85;&#x65f6;&#x540e;&#x76f8;&#x5f53;&#x4e8e;&#x5220;&#x9664;&#x4e86;&#x6b64;&#x5b9a;&#x65f6;&#x5668;&#xff0c;&#xa;&#x800c;&#x5e76;&#x4e0d;&#x81ea;&#x52a8;&#x91cd;&#x6ce8;&#x518c;&#x6b64;&#x5b9a;&#x65f6;&#x5668;&#xff0c;&#x6240;&#x4ee5;&#x82e5;&#x6709;&#x5fc5;&#x8981;&#xff0c;&#xa;&#x5e94;&#x5728;&#x5b9a;&#x65f6;&#x5668;&#x5904;&#x7406;&#x51fd;&#x6570;&#x4e2d;&#x91cd;&#x6ce8;&#x518c;&#x6b64;&#x5b9a;&#x65f6;&#x5668;&#xa;2.2 &#x6ce8;&#x518c;&#x4e00;&#x4e2a;&#x5df2;&#x7ecf;&#x6ce8;&#x518c;&#x7684;&#x5b9a;&#x65f6;&#x5668;&#xff0c;&#x76f8;&#x5f53;&#x4e8e;&#x4fee;&#x6539;&#xa;&#x5df2;&#x6ce8;&#x518c;&#x5b9a;&#x65f6;&#x5668;&#x7684;&#x8d85;&#x65f6;&#x65f6;&#x95f4;">
<node CREATED="1321374538598" FOLDED="true" ID="ID_1211502667" MODIFIED="1321375934102" TEXT="void evloopTimeoutRegister&#xa;(&#xa;  struct evloopTimeout *T,&#xa;  unsigned Seconds,&#xa;  unsigned USec&#xa;)">
<node CREATED="1321374174159" ID="ID_263172345" MODIFIED="1321374303107" TEXT="T&#xff1a;&#x4e00;&#x4e2a;struct evloopTimeout&#x7ed3;&#x6784;&#xff0c;&#x7528;&#x6237;&#x65e0;&#x9700;&#x4e86;&#x89e3;&#x5176;&#x7ed3;&#x6784;&#xff0c;&#xa;&#x4ec5;&#x9700;&#x4f20;&#x5165;&#x6b64;&#x7ed3;&#x6784;&#x4f9b;&#x5b58;&#x50a8;&#x5b9a;&#x65f6;&#x5668;&#x76f8;&#x5173;&#x4fe1;&#x606f;&#x5373;&#x53ef;"/>
<node CREATED="1321374914218" ID="ID_635954443" MODIFIED="1321374998424" TEXT="Seconds&#x548c;USec&#xff1a;&#x81ea;&#x6ce8;&#x518c;&#x4e4b;&#x65f6;&#x7b97;&#x8d77;&#x7684;&#x76f8;&#x5bf9;&#x8d85;&#x65f6;&#x65f6;&#x95f4;"/>
</node>
</node>
<node CREATED="1321375021376" FOLDED="true" ID="ID_936297175" MODIFIED="1321375934113" TEXT="3, &#x5220;&#x9664;&#x5b9a;&#x65f6;&#x5668;">
<node CREATED="1321375092739" ID="ID_478400493" MODIFIED="1321375117483" TEXT="void evloopTimeoutUnregister (struct evloopTimeout *T)"/>
</node>
<node CREATED="1321375159484" FOLDED="true" ID="ID_1953709574" MODIFIED="1321375934113" TEXT="4, &#x67e5;&#x8be2;&#x5b9a;&#x65f6;&#x5668;&#x5269;&#x4f59;&#x65f6;&#x95f4;">
<node CREATED="1321375246438" ID="ID_1441231501" MODIFIED="1321375249283" TEXT="int evloopTimeoutRemaining(struct evloopTimeout *T, unsigned *SecondsP, unsigned *USecP)"/>
</node>
</node>
<node CREATED="1321373511902" FOLDED="true" ID="ID_1957435899" MODIFIED="1321413242200" TEXT="ReadReady&#xa;&#x5728;&#x6587;&#x4ef6;&#x53ef;&#x8bfb;&#x4e4b;&#x540e;&#x8c03;&#x7528;&#x5904;&#x7406;&#x51fd;&#x6570;">
<node CREATED="1321376122105" FOLDED="true" ID="ID_592666610" MODIFIED="1321413242199" TEXT="1, &#x521b;&#x5efa;ReadReady">
<node CREATED="1321376139195" FOLDED="true" ID="ID_1988917312" MODIFIED="1321413242196" TEXT="void evloopReadReadyCreate&#xa;(&#xa;  struct evloopReady *R,&#xa;  const char *Description,&#xa;  int Fd,&#xa;  void (*CB)(void *Cookie1),&#xa;  void *Cookie1&#xa;)">
<node CREATED="1321374174159" ID="ID_1962302757" MODIFIED="1321376327448" TEXT="R&#xff1a;&#x4e00;&#x4e2a;struct evloopReady&#x7ed3;&#x6784;&#xff0c;&#x7528;&#x6237;&#x65e0;&#x9700;&#x4e86;&#x89e3;&#x5176;&#x7ed3;&#x6784;&#xff0c;&#xa;&#x4ec5;&#x9700;&#x4f20;&#x5165;&#x6b64;&#x7ed3;&#x6784;&#x4f9b;&#x5b58;&#x50a8;ReadReady&#x76f8;&#x5173;&#x4fe1;&#x606f;&#x5373;&#x53ef;"/>
<node CREATED="1321374310617" ID="ID_626212588" MODIFIED="1321376352383" TEXT="Description&#xff1a;ReadReady&#x7684;&#x63cf;&#x8ff0;"/>
<node CREATED="1321376357009" ID="ID_1682365126" MODIFIED="1321376403380" TEXT="Fd: &#x9700;&#x8981;&#x68c0;&#x6d4b;&#x662f;&#x5426;&#x53ef;&#x8bfb;&#x7684;&#x6587;&#x4ef6;"/>
<node CREATED="1321376416381" ID="ID_544982172" MODIFIED="1321376536760" TEXT="CB&#xff1a;&#x5f53;&#x6587;&#x4ef6;&#x53ef;&#x8bfb;&#x65f6;&#x8c03;&#x7528;&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;&#xff0c;&#x683c;&#x5f0f;&#x5e94;&#x5982;void xxxReadHandler(struct evloopReady *R)"/>
<node CREATED="1321374350784" ID="ID_1490934914" MODIFIED="1321376649978" TEXT="Cookie1&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;ReadReady&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopReadyCookie1Get&#x83b7;&#x53d6;&#xa;Cookie2&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;ReadReady&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopReadyCookie2Get&#x83b7;&#x53d6;&#xa;Cookie3&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;ReadReady&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopReadyCookie3Get&#x83b7;&#x53d6;"/>
</node>
</node>
<node CREATED="1321376705180" FOLDED="true" ID="ID_646378935" MODIFIED="1321376744612" TEXT="2, &#x6ce8;&#x518c;ReadReady">
<node CREATED="1321376723653" ID="ID_973678040" MODIFIED="1321376738986" TEXT="void evloopReadyRegister(struct evloopReady *R)"/>
</node>
<node CREATED="1321376750821" FOLDED="true" ID="ID_33745510" MODIFIED="1321376798029" TEXT="3, &#x5220;&#x9664;ReadReady">
<node CREATED="1321376784586" ID="ID_570950671" MODIFIED="1321376796082" TEXT="void evloopReadyUnregister(struct evloopReady *R)"/>
</node>
</node>
<node CREATED="1321373569516" FOLDED="true" ID="ID_1959377631" MODIFIED="1321413242202" TEXT="WriteReady&#xa;&#x5728;&#x6587;&#x4ef6;&#x53ef;&#x5199;&#x4e4b;&#x540e;&#x8c03;&#x7528;&#x5904;&#x7406;&#x51fd;&#x6570;">
<node CREATED="1321376122105" FOLDED="true" ID="ID_997981502" MODIFIED="1321377115095" TEXT="1, &#x521b;&#x5efa;WriteReady">
<node CREATED="1321376139195" FOLDED="true" ID="ID_766703699" MODIFIED="1321413242202" TEXT="void evloopWriteReadyCreate&#xa;(&#xa;  struct evloopReady *R,&#xa;  const char *Description,&#xa;  int Fd,&#xa;  void (*CB)(void *Cookie1),&#xa;  void *Cookie1&#xa;)">
<node CREATED="1321374174159" ID="ID_245487115" MODIFIED="1321376327448" TEXT="R&#xff1a;&#x4e00;&#x4e2a;struct evloopReady&#x7ed3;&#x6784;&#xff0c;&#x7528;&#x6237;&#x65e0;&#x9700;&#x4e86;&#x89e3;&#x5176;&#x7ed3;&#x6784;&#xff0c;&#xa;&#x4ec5;&#x9700;&#x4f20;&#x5165;&#x6b64;&#x7ed3;&#x6784;&#x4f9b;&#x5b58;&#x50a8;ReadReady&#x76f8;&#x5173;&#x4fe1;&#x606f;&#x5373;&#x53ef;"/>
<node CREATED="1321374310617" ID="ID_623238218" MODIFIED="1321376352383" TEXT="Description&#xff1a;ReadReady&#x7684;&#x63cf;&#x8ff0;"/>
<node CREATED="1321376357009" ID="ID_1512829497" MODIFIED="1321377032865" TEXT="Fd: &#x9700;&#x8981;&#x68c0;&#x6d4b;&#x662f;&#x5426;&#x53ef;&#x5199;&#x7684;&#x6587;&#x4ef6;"/>
<node CREATED="1321376416381" ID="ID_1797360775" MODIFIED="1321377052790" TEXT="CB&#xff1a;&#x5f53;&#x6587;&#x4ef6;&#x53ef;&#x5199;&#x65f6;&#x8c03;&#x7528;&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;&#xff0c;&#x683c;&#x5f0f;&#x5e94;&#x5982;void xxxWriteHandler(struct evloopReady *R)"/>
<node CREATED="1321374350784" ID="ID_1836564693" MODIFIED="1321377090128" TEXT="Cookie1&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;WriteReady&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopReadyCookie1Get&#x83b7;&#x53d6;&#xa;Cookie2&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;WriteReady&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopReadyCookie2Get&#x83b7;&#x53d6;&#xa;Cookie3&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;WriteReady&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;evloopReadyCookie3Get&#x83b7;&#x53d6;"/>
</node>
</node>
<node CREATED="1321376705180" FOLDED="true" ID="ID_217119771" MODIFIED="1321409471596" TEXT="2, &#x6ce8;&#x518c;WriteReady">
<node CREATED="1321376723653" ID="ID_926739639" MODIFIED="1321376738986" TEXT="void evloopReadyRegister(struct evloopReady *R)"/>
</node>
<node CREATED="1321376750821" FOLDED="true" ID="ID_112818999" MODIFIED="1321409517583" TEXT="3, &#x5220;&#x9664;WriteReady">
<node CREATED="1321376784586" ID="ID_1510708517" MODIFIED="1321376796082" TEXT="void evloopReadyUnregister(struct evloopReady *R)"/>
</node>
</node>
<node CREATED="1321373577821" FOLDED="true" ID="ID_1098028112" MODIFIED="1321413231438" TEXT="read buffer&#xa;&#x5728;&#x6587;&#x4ef6;&#x53ef;&#x8bfb;&#x4e4b;&#x540e;&#x8bfb;&#x53d6;&#x6307;&#x5b9a;&#x6570;&#x91cf;&#x7684;&#x5b57;&#x8282;&#x5185;&#x5bb9;&#x5230;&#xa;read buffer&#x7f13;&#x51b2;&#x533a;&#x4e2d;&#xff0c;&#x7136;&#x540e;&#x8c03;&#x7528;&#x5904;&#x7406;&#x51fd;&#x6570;">
<node CREATED="1321410236414" FOLDED="true" ID="ID_337380159" MODIFIED="1321413231435" TEXT="1, &#x521b;&#x5efa; read buffer">
<node CREATED="1321410251259" FOLDED="true" ID="ID_1160588626" MODIFIED="1321412315399" TEXT="void bufrdCreate&#xa;(&#xa;  struct bufrd *B,&#xa;  const char *Description,&#xa;  int Fd,&#xa;  int BufSize,&#xa;  void (*CB)(void *Cookie1),&#xa;  void *Cookie1&#xa;)">
<node CREATED="1321374174159" ID="ID_1129153720" MODIFIED="1321410417828" TEXT="B&#xff1a;&#x4e00;&#x4e2a;struct bufrd&#x7ed3;&#x6784;&#xff0c;&#x7528;&#x6237;&#x65e0;&#x9700;&#x4e86;&#x89e3;&#x5176;&#x7ed3;&#x6784;&#xff0c;&#xa;&#x4ec5;&#x9700;&#x4f20;&#x5165;&#x6b64;&#x7ed3;&#x6784;&#x4f9b;&#x5b58;&#x50a8;read buffer&#x76f8;&#x5173;&#x4fe1;&#x606f;&#x5373;&#x53ef;"/>
<node CREATED="1321374310617" ID="ID_515808999" MODIFIED="1321410525068" TEXT="Description&#xff1a;read buffer&#x7684;&#x63cf;&#x8ff0;"/>
<node CREATED="1321376357009" ID="ID_843209431" MODIFIED="1321376403380" TEXT="Fd: &#x9700;&#x8981;&#x68c0;&#x6d4b;&#x662f;&#x5426;&#x53ef;&#x8bfb;&#x7684;&#x6587;&#x4ef6;"/>
<node CREATED="1321410450429" ID="ID_140814918" MODIFIED="1321410490408" TEXT="BufSize:&#x6587;&#x4ef6;&#x53ef;&#x8bfb;&#x4e4b;&#x540e;&#x9700;&#x8981;&#x8bfb;&#x53d6;&#x591a;&#x5c11;&#x5b57;&#x8282;&#x7684;&#x5185;&#x5bb9;"/>
<node CREATED="1321376416381" ID="ID_466576814" MODIFIED="1321410583098" TEXT="CB&#xff1a;&#x5f53;&#x6587;&#x4ef6;&#x53ef;&#x8bfb;&#x65f6;&#x8c03;&#x7528;&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;&#xff0c;&#x683c;&#x5f0f;&#x5e94;&#x5982;void xxxReadHandler(struct bufrd *B)"/>
<node CREATED="1321374350784" ID="ID_1763829277" MODIFIED="1321410681882" TEXT="Cookie1&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;read buffer&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;bufrdCookie1Get&#x83b7;&#x53d6;&#xa;Cookie2&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;read buffer&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;bufrdCookie2Get&#x83b7;&#x53d6;&#xa;Cookie3&#xff1a;&#x63d0;&#x4f9b;&#x7ed9;read buffer&#x5904;&#x7406;&#x51fd;&#x6570;&#x7684;&#x53c2;&#x6570;&#xff0c;&#x7528;&#x51fd;&#x6570;bufrdCookie3Get&#x83b7;&#x53d6;"/>
<node CREATED="1321410714435" FOLDED="true" ID="ID_730304869" MODIFIED="1321412314758" TEXT="&#x5b9e;&#x73b0;">
<node CREATED="1321410748759" ID="ID_1383615760" MODIFIED="1321410817985" TEXT="1, &#x521d;&#x59cb;&#x5316;struct bufrd&#x7ed3;&#x6784;&#xa;B-&gt;Buf = malloc(B-&gt;BufSize)"/>
<node CREATED="1321410838757" FOLDED="true" ID="ID_734879276" MODIFIED="1321412313575" TEXT="2, &#x521b;&#x5efa;&#x4e00;&#x4e2a;ReadReady&#xa;evloopReadReadyCreate(&amp;B-&gt;Ready, Description, Fd, bufrdReady, B)&#xa;&#x5728;&#x6587;&#x4ef6;&#x53ef;&#x8bfb;&#x4e4b;&#x540e;&#x8c03;&#x7528;&#x56de;&#x8c03;&#x51fd;&#x6570;bufrdReady">
<node CREATED="1321411024018" ID="ID_1213798180" MODIFIED="1321412307478" TEXT="1, &#x4ece;&#x53ef;&#x8bfb;&#x6587;&#x4ef6;&#x4e2d;&#x8bfb;&#x53d6;B-&gt;BufSize&#x6570;&#x91cf;&#x7684;&#x5b57;&#x8282;&#x5185;&#x5bb9;&#x5230;&#x7f13;&#x51b2;&#x533a;B-&gt;Buf&#x7684;&#x540e;&#x9762;"/>
<node CREATED="1321411114006" ID="ID_1918507866" MODIFIED="1321411184350" TEXT="2, &#x5982;&#x679c;&#x8bfb;&#x5230;&#x4e86;B-&gt;BufSize&#x6570;&#x91cf;&#x7684;&#x5185;&#x5bb9;&#x5219;&#x89e3;&#x6ce8;&#x518c;ReadReady"/>
<node CREATED="1321411222357" ID="ID_836791649" MODIFIED="1321411312459" TEXT="3, &#x5faa;&#x73af;&#x8c03;&#x7528;read buffer&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;&#x76f4;&#x5230;&#x7f13;&#x51b2;&#x533a;&#x5185;&#x7684;&#x5185;&#x5bb9;&#x88ab;&#x6d88;&#x8d39;&#x5b8c;&#xa;    (&#x5373;B-&gt;NBytes = 0)"/>
</node>
<node CREATED="1321410926563" ID="ID_1795840559" MODIFIED="1321410948265" TEXT="3, &#x6ce8;&#x518c;&#x4e0a;&#x8ff0;ReadReady&#xa;evloopReadyRegister(&amp;B-&gt;Ready)"/>
</node>
</node>
</node>
<node CREATED="1321411371957" FOLDED="true" ID="ID_1662890477" MODIFIED="1321413231436" TEXT="2, &#x6d88;&#x8d39; read buffer">
<node CREATED="1321411499862" ID="ID_1281156140" MODIFIED="1321411532269" TEXT="1, &#x8c03;&#x7528;int bufrdNBytesGet(struct bufrd *B)&#x83b7;&#x53d6;&#x6240;&#x8bfb;&#x53d6;&#x5185;&#x5bb9;&#x7684;&#x957f;&#x5ea6;"/>
<node CREATED="1321411421775" ID="ID_306784973" MODIFIED="1321411546510" TEXT="2, &#x8c03;&#x7528;void *bufrdBufGet(struct bufrd *B)&#x83b7;&#x53d6;&#x6240;&#x8bfb;&#x53d6;&#x5185;&#x5bb9;&#x6240;&#x653e;&#x7f6e;&#x7684;&#x4f4d;&#x7f6e;"/>
<node CREATED="1321411703398" FOLDED="true" ID="ID_1581736014" MODIFIED="1321411930843" TEXT="3, &#x8c03;&#x7528;void bufrdConsume(struct bufrd *B, int NBytes)&#xa;    &#x544a;&#x8bc9;read buffer&#x6d88;&#x8d39;&#x4e86;&#x591a;&#x5c11;&#x5185;&#x5bb9;">
<node CREATED="1321411756631" ID="ID_1314777343" MODIFIED="1321411836490" TEXT="1, &#x5982;&#x679c;&#x6240;&#x8bfb;&#x53d6;&#x7684;&#x5185;&#x5bb9;&#x8fd8;&#x672a;&#x88ab;&#x6d88;&#x8d39;&#x5b8c;&#x5219;&#x5c06;&#xa;    &#x5269;&#x4f59;&#x90e8;&#x5206;&#x79fb;&#x52a8;&#x5230;&#x7f13;&#x51b2;&#x533a;&#x7684;&#x9996;&#x90e8;&#x8d77;&#x59cb;&#x5730;&#x5740;&#x5904;"/>
<node CREATED="1321411873732" ID="ID_634501931" MODIFIED="1321411917087" TEXT="2, &#x82e5;&#x7f13;&#x51b2;&#x533a;&#x672a;&#x6ee1;&#x5219;&#x91cd;&#x65b0;&#x6ce8;&#x518c;ReadReady"/>
</node>
</node>
<node CREATED="1321412387327" FOLDED="true" ID="ID_1476936622" MODIFIED="1321413231438" TEXT="3, &#x5220;&#x9664; read buffer">
<node CREATED="1321412402404" FOLDED="true" ID="ID_342144869" MODIFIED="1321413231437" TEXT="void bufrdDestroy(struct bufrd *B)">
<node CREATED="1321412433038" ID="ID_486825597" MODIFIED="1321412441728" TEXT="1, &#x89e3;&#x6ce8;&#x518c;ReadReady"/>
<node CREATED="1321412442331" ID="ID_1538234170" MODIFIED="1321412451696" TEXT="2, &#x5173;&#x95ed;&#x6587;&#x4ef6;"/>
<node CREATED="1321412462499" ID="ID_147262396" MODIFIED="1321412476796" TEXT="3, &#x91ca;&#x653e;malloc&#x7684;&#x7f13;&#x51b2;&#x533a;"/>
<node CREATED="1321412477897" ID="ID_612305565" MODIFIED="1321412501414" TEXT="4, &#x6e05;&#x7a7a;struct bufrd&#x7ed3;&#x6784;"/>
</node>
</node>
</node>
<node CREATED="1321373585523" ID="ID_440232107" MODIFIED="1321373592609" TEXT="write buffer"/>
</node>
<node CREATED="1321413255261" FOLDED="true" ID="ID_738735867" MODIFIED="1337325059081" TEXT="&#x6a21;&#x5757;&#x4f9d;&#x8d56;">
<node CREATED="1321413347499" FOLDED="true" ID="ID_960515566" MODIFIED="1321415293323" TEXT="&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;provider">
<node CREATED="1321413523789" FOLDED="true" ID="ID_841418455" MODIFIED="1321415293322" TEXT="1&#xff0c;&#x6ce8;&#x518c;&#x6240;&#x63d0;&#x4f9b;&#x7684;&#x670d;&#x52a1;">
<node CREATED="1321413567776" FOLDED="true" ID="ID_456844086" MODIFIED="1321415293315" TEXT="void serviceProvideInit&#xa;(&#xa;  struct serviceProvide *P,&#xa;  const char *Name,&#xa;  void (*CB)(void *Cookie),&#xa;  void *Cookie&#xa;)">
<node CREATED="1321415065603" ID="ID_350126263" MODIFIED="1321415077608" TEXT="P&#xff1a;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;"/>
<node CREATED="1321415090004" ID="ID_1036137379" MODIFIED="1321415206606" TEXT="Name&#xff1a;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;&#x63cf;&#x8ff0;"/>
<node CREATED="1321415107691" ID="ID_914382545" MODIFIED="1321415284407" TEXT="CB&#xff1a;&#x5f53;&#x672c;&#x670d;&#x52a1;&#x88ab;&#x4f7f;&#x7528;&#x6216;&#x88ab;&#x505c;&#x7528;&#x65f6;&#x6240;&#x8c03;&#x7528;&#x7684;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;"/>
<node CREATED="1321415146821" ID="ID_1431427276" MODIFIED="1321415177622" TEXT="Cookie&#xff1a;&#x4f20;&#x7ed9;CB&#x7684;&#x53c2;&#x6570;"/>
</node>
</node>
<node CREATED="1321413993390" FOLDED="true" ID="ID_493039638" MODIFIED="1321415293322" TEXT="2, &#x5411;&#x6d88;&#x8d39;&#x8005;&#x901a;&#x544a;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;&#x7684;&#x72b6;&#x6001;&#x53d1;&#x751f;&#x4e86;&#x6539;&#x53d8;">
<node CREATED="1321414040836" ID="ID_1296625737" MODIFIED="1321414124707" TEXT="void serviceProvideChange(struct serviceProvide *P,enum serviceState State) &#xa;&#x4fdd;&#x5b58;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;&#x7684;&#x65b0;&#x72b6;&#x6001;&#x5e76;&#x8c03;&#x7528;&#x6240;&#x6709;&#x4f7f;&#x7528;&#x4e86;&#x672c;&#x670d;&#x52a1;&#x7684;&#x6d88;&#x8d39;&#x8005;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
</node>
<node CREATED="1321413369284" FOLDED="true" ID="ID_549854599" MODIFIED="1321415293332" TEXT="&#x670d;&#x52a1;&#x6d88;&#x8d39;&#x8005;consumer">
<node CREATED="1321413831582" FOLDED="true" ID="ID_708565134" MODIFIED="1321415293326" TEXT="1, &#x58f0;&#x660e;&#x6240;&#x4f7f;&#x7528;&#x7684;&#x670d;&#x52a1;">
<node CREATED="1321413845396" FOLDED="true" ID="ID_1732493229" MODIFIED="1321415293323" TEXT="void serviceUseInit&#xa;(&#xa;  struct serviceUse *U,&#xa;  struct serviceProvide *P,&#xa;  const char *Name,&#xa;  void (*CB)(void *Cookie),&#xa;  void *Cookie&#xa;)">
<node CREATED="1321415046387" ID="ID_1014146724" MODIFIED="1321415085726" TEXT="U&#xff1a;&#x670d;&#x52a1;&#x6d88;&#x8d39;&#x8005;"/>
<node CREATED="1321415065603" ID="ID_375703692" MODIFIED="1321415077608" TEXT="P&#xff1a;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;"/>
<node CREATED="1321415090004" ID="ID_79289373" MODIFIED="1321415107152" TEXT="Name&#xff1a;&#x670d;&#x52a1;&#x6d88;&#x8d39;&#x8005;&#x63cf;&#x8ff0;"/>
<node CREATED="1321415107691" ID="ID_1085088391" MODIFIED="1321415145167" TEXT="CB&#xff1a;&#x5f53;&#x670d;&#x52a1;&#x72b6;&#x6001;&#x53d1;&#x751f;&#x6539;&#x53d8;&#x65f6;&#x6240;&#x8c03;&#x7528;&#x7684;&#x6d88;&#x8d39;&#x8005;&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;"/>
<node CREATED="1321415146821" ID="ID_153302499" MODIFIED="1321415177622" TEXT="Cookie&#xff1a;&#x4f20;&#x7ed9;CB&#x7684;&#x53c2;&#x6570;"/>
</node>
</node>
<node CREATED="1321414396692" FOLDED="true" ID="ID_99260630" MODIFIED="1321415293326" TEXT="2, &#x5f00;&#x59cb;&#x4f7f;&#x7528;&#x670d;&#x52a1;&#xff0c;&#x4e00;&#x822c;&#x5728;&#x6a21;&#x5757;&#x7684;LowStart&#x4e2d;&#x8c03;&#x7528;&#xa;void serviceUseOn(struct serviceUse *U)">
<node CREATED="1321414537688" ID="ID_284982678" MODIFIED="1321414564038" TEXT="&#x8c03;&#x7528;&#x6240;&#x4f7f;&#x7528;&#x670d;&#x52a1;&#x7684;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1321414408530" FOLDED="true" ID="ID_1813116282" MODIFIED="1321415293330" TEXT="3, &#x6682;&#x505c;&#x4f7f;&#x7528;&#x670d;&#x52a1;&#xff0c;&#x4e00;&#x822c;&#x5728;&#x6a21;&#x5757;&#x7684;LowStop&#x4e2d;&#x8c03;&#x7528;&#xa;void serviceUseOff(struct serviceUse *U)">
<node CREATED="1321414537688" ID="ID_1347349399" MODIFIED="1321414564038" TEXT="&#x8c03;&#x7528;&#x6240;&#x4f7f;&#x7528;&#x670d;&#x52a1;&#x7684;&#x670d;&#x52a1;&#x63d0;&#x4f9b;&#x8005;&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;"/>
</node>
</node>
</node>
</node>
<node CREATED="1310800347179" FOLDED="true" ID="ID_1280767746" MODIFIED="1337336931790" TEXT="service plugin">
<node CREATED="1310895017566" FOLDED="true" ID="ID_1615788583" MODIFIED="1337336931179" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1310895086435" FOLDED="true" ID="ID_1942590489" MODIFIED="1337336928454" TEXT="struct mibServicePlugin">
<node CREATED="1310895103039" ID="ID_1556296163" MODIFIED="1310895105513" TEXT="Name"/>
<node CREATED="1310895114279" ID="ID_39601226" MODIFIED="1310895158341" TEXT="Instance &#xff1a;&#x5b9e;&#x4f8b;&#x53f7;&#xff0c;&#x540c;&#x4e00;service plugin&#x6709;&#x591a;&#x4e2a;&#x5b9e;&#x4f8b;&#x65f6;&#x4f7f;&#x7528;"/>
<node CREATED="1310895185721" ID="ID_698632216" MODIFIED="1310895248540" TEXT="Propogate&#x51fd;&#x6570; &#xff1a;&#x5f53;&#x6240;&#x4f9d;&#x8d56;&#x7684;mib&#x503c;&#x53d1;&#x751f;&#x53d8;&#x5316;&#x65f6;&#x8c03;&#x7528;&#x6b64;&#x56de;&#x8c03;&#x51fd;&#x6570;&#xff0c;&#x4ee5;&#x66f4;&#x65b0;&#x5e95;&#x5c42;&#x7cfb;&#x7edf;"/>
<node CREATED="1310895274404" ID="ID_1950052607" MODIFIED="1310897048545" TEXT="StatusUpdate&#x51fd;&#x6570; &#xff1a;&#x5f53;&#x6240;&#x58f0;&#x660e;&#x7684;status mib &#x503c;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x65f6;&#xff08;&#x5982;manager plugin get&#x6b64;mib&#x503c;&#xff09;&#xff0c;&#xa;&#x8c03;&#x7528;&#x6b64;&#x56de;&#x8c03;&#x51fd;&#x6570;&#x66f4;&#x65b0;mib&#x503c;"/>
<node CREATED="1310895468216" FOLDED="true" ID="ID_1789022" MODIFIED="1337332224785" TEXT="FactoryResetFilter&#x51fd;&#x6570; &#xff1a;factory reset&#x9996;&#x5148;&#x4f1a;&#x5c06;mib&#x6587;&#x4ef6;&#x4e2d;&#x5b9a;&#x4e49;&#x7684;&#x9ed8;&#x8ba4;&#x503c;&#x590d;&#x5236;&#x5230;mib&#x8282;&#x70b9;&#xff0c;&#xa;&#x7136;&#x540e;&#x8c03;&#x7528;service plugin&#x7684;FactoryResetFilter&#x3002;&#x5982;&#x679c;service plugin&#x4e0d;&#x5e0c;&#x671b;&#x4fee;&#x6539;reset&#x540e;&#x7684;&#xa;mib&#x503c;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;&#xff0c;&#x5219;&#x53ef;&#x4ee5;&#x5728;&#x6b64;&#x51fd;&#x6570;&#x4e2d;&#x4fee;&#x6539;reset&#x540e;&#x7684;mib&#x503c;">
<node CREATED="1310896393305" ID="ID_1960068049" MODIFIED="1310896436281" TEXT="1, &#x9996;&#x5148;&#x5e94;&#x8c03;&#x7528;mibObjectFactoryResetInProgress&#x786e;&#x5b9a;&#x8981;&#x4fee;&#x6539;&#x7684;mib&#x8282;&#x70b9;&#x5904;&#x4e8e;factory reset&#x4e2d;"/>
<node CREATED="1310896466452" ID="ID_1303595705" MODIFIED="1310896493498" TEXT="2, &#x518d;&#x8c03;&#x7528;mib&#x64cd;&#x4f5c;&#x51fd;&#x6570;&#x5bf9;mib&#x8282;&#x70b9;&#x8fdb;&#x884c;&#x4fee;&#x6539;"/>
</node>
<node CREATED="1310896609873" FOLDED="true" ID="ID_690696859" MODIFIED="1337332239421" TEXT="UnhideFilter&#x51fd;&#x6570; &#xff1a;unhide&#x9996;&#x5148;&#x4f1a;&#x5c06;mib&#x6587;&#x4ef6;&#x4e2d;&#x5b9a;&#x4e49;&#x7684;&#x9ed8;&#x8ba4;&#x503c;&#x590d;&#x5236;&#x5230;mib&#x8282;&#x70b9;&#xff0c; &#xa;&#x7136;&#x540e;&#x8c03;&#x7528;service plugin&#x7684;UnhideFilter&#x3002;&#x5982;&#x679c;service plugin&#x4e0d;&#x5e0c;&#x671b;&#x4fee;&#x6539;unhide&#x540e;&#x7684;&#xa;mib&#x503c;&#x4e3a;&#x9ed8;&#x8ba4;&#x503c;&#xff0c;&#x5219;&#x53ef;&#x4ee5;&#x5728;&#x6b64;&#x51fd;&#x6570;&#x4e2d;&#x4fee;&#x6539;unhide&#x540e;&#x7684;mib&#x503c;">
<node CREATED="1310896393305" ID="ID_1382537886" MODIFIED="1310896770428" TEXT="1, &#x9996;&#x5148;&#x5e94;&#x8c03;&#x7528;mibObjectUnhideInProgress&#x786e;&#x5b9a;&#x8981;&#x4fee;&#x6539;&#x7684;mib&#x8282;&#x70b9;&#x5904;&#x4e8e;unhide&#x4e2d;"/>
<node CREATED="1310896466452" ID="ID_1443967505" MODIFIED="1310896493498" TEXT="2, &#x518d;&#x8c03;&#x7528;mib&#x64cd;&#x4f5c;&#x51fd;&#x6570;&#x5bf9;mib&#x8282;&#x70b9;&#x8fdb;&#x884c;&#x4fee;&#x6539;"/>
</node>
<node CREATED="1310896836585" ID="ID_1084806375" MODIFIED="1310897035362" TEXT="ConfigChangeFilter&#x51fd;&#x6570; &#xff1a;&#x5f53;manager plugin&#x5bf9;mib&#x503c;&#x505a;&#x51fa;&#x4fee;&#x6539;&#x540e;&#x8c03;&#x7528;&#x6240;&#x6709;&#xa;service plugin&#x7684;ConfigChangeFilter&#x51fd;&#x6570;&#xff0c;service plugin&#x53ef;&#x4ee5;&#x5728;&#x6b64;&#x51fd;&#x6570;&#x4e2d;&#x505a;&#x51fa;&#x518d;&#x6b21;&#x4fee;&#x6539;"/>
<node CREATED="1310897075495" ID="ID_1828027280" MODIFIED="1337332524170" TEXT="Installed : &#x5df2;&#x5b89;&#x88c5;"/>
<node CREATED="1310897085814" ID="ID_864661252" MODIFIED="1310897086504" TEXT="Next"/>
<node CREATED="1310897097344" ID="ID_1394595147" MODIFIED="1321343797663" TEXT="CallbackScheduled : &#xa;&#x7531;&#x4e8e;&#x67d0;&#x4e9b;&#x539f;&#x56e0;(propogate&#x6216;status update&#x7b49;)&#xa;job&#x8fc7;&#x7a0b;&#x4e2d;&#x9700;&#x8981;&#x8c03;&#x7528;&#x672c;service plugin&#x7684;&#x56de;&#x8c03;&#x51fd;&#x6570;&#xff0c;&#xa;&#x6b64;&#x503c;&#x8868;&#x793a;&#x662f;&#x5426;&#x5df2;&#x8c03;&#x5ea6;&#x672c;service plugin"/>
<node CREATED="1310897126062" ID="ID_251372974" MODIFIED="1310897146620" TEXT="N &#xff1a;&#x7528;&#x4e8e;&#x94fe;&#x5165;depend/claim&#x94fe;&#x8868;&#x4e2d;"/>
<node CREATED="1310897159341" ID="ID_919591571" MODIFIED="1310897253413" TEXT="PropogateNeed &#xff1a;&#x5f53;&#x6240;&#x4f9d;&#x8d56;&#x7684;config mib&#x503c;&#x53d8;&#x5316;&#x65f6;&#xff0c;&#x6807;&#x8bb0;&#x9700;&#x8981;&#x901a;&#x544a;&#x672c;service plugin"/>
<node CREATED="1310897226858" ID="ID_398613404" MODIFIED="1310897305233" TEXT="StatusUpdateNeed : &#x5f53;&#x6240;&#x58f0;&#x660e;&#x7684;status mib&#x503c;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x65f6;&#xff0c;&#xa;&#x6807;&#x8bb0;&#x9700;&#x8981;&#x901a;&#x544a;&#x672c;service plugin&#x5bf9;status mib&#x503c;&#x8fdb;&#x884c;&#x66f4;&#x65b0;"/>
<node CREATED="1310897314609" ID="ID_112886178" MODIFIED="1321249041013" TEXT="UpdateNeedCount :&#x4e00;&#x4e2a;service pluin&#x53ef;&#x80fd;&#x58f0;&#x660e;&#x4e86;&#x5f88;&#x591a;status mib,&#x5f53;&#x8fd9;&#x4e2a;service plugin&#x6709;&#x591a;&#x4e2a;status mib&#x9700;&#x8981;&#x66f4;&#x65b0;&#x65f6;&#x7528;&#x8fd9;&#x4e2a;&#x503c;&#x8fdb;&#x884c;&#x8ba1;&#x6570;,&#x5f53;&#x6b64;&#x503c;&#x4e3a;0&#x65f6;&#x9700;&#x5c06;&#x4e0a;&#x9762;&#x7684;statusUpdateNeed&#x6e05;&#x4e3a;0"/>
</node>
</node>
<node CREATED="1310895029160" FOLDED="true" ID="ID_348418865" MODIFIED="1337332910760" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1337332382117" ID="ID_1576298656" LINK="#ID_718786981" MODIFIED="1337332486835" TEXT="mibServicePluginInstall&#xa;&#x5c06;service plugin&#x94fe;&#x5165;mibS.ServicePlugins&#x4e2d;,&#x5e76;&#x6807;&#x8bb0;&#x5df2;&#x5b8c;&#x6210;&#x5b89;&#x88c5;"/>
<node CREATED="1310893307516" FOLDED="true" ID="ID_1407740068" MODIFIED="1337332903838" TEXT="mibServiceDepend&#xa;&#x58f0;&#x660e;&#x5bf9;&#x67d0;&#x4e2a;config mib&#x503c;&#x7684;&#x4f9d;&#x8d56;&#xff0c;&#x5f53;&#x5176;&#xa;&#x53d1;&#x751f;&#x53d8;&#x5316;&#x65f6;&#x9700;&#x8981;&#x901a;&#x77e5;&#x672c;service plugin">
<node CREATED="1310893428952" ID="ID_1054214191" MODIFIED="1337332735138" TEXT="&#x5c06;service plugin&#x52a0;&#x5165;mib&#x503c;&#x7684;&#x94fe;&#x8868;Object-&gt;Type-&gt;VarP-&gt;ServicePlugin&#x4e2d;&#xa;&#x6b64;&#x94fe;&#x8868;&#x7528;struct mibServicePlugin xxx-&gt;N&#x6765;&#x8fdb;&#x884c;&#x94fe;&#x63a5;"/>
</node>
<node CREATED="1310894191024" FOLDED="true" ID="ID_1398961057" MODIFIED="1337332903217" TEXT="mibServiceStatusClaim&#xa;&#x58f0;&#x660e;&#x67d0;&#x4e2a;status mib&#x503c;&#xff0c;&#x5f53;&#x5176;&#x9700;&#x8981;&#x66f4;&#x65b0;&#x65f6;&#x901a;&#x77e5;&#xa;&#x672c;service plugin&#x6765;&#x5bf9;&#x8fd9;&#x4e2a;status mib&#x503c;&#x8fdb;&#x884c;&#x66f4;&#x65b0;">
<node CREATED="1310893428952" ID="ID_246322319" MODIFIED="1337332735138" TEXT="&#x5c06;service plugin&#x52a0;&#x5165;mib&#x503c;&#x7684;&#x94fe;&#x8868;Object-&gt;Type-&gt;VarP-&gt;ServicePlugin&#x4e2d;&#xa;&#x6b64;&#x94fe;&#x8868;&#x7528;struct mibServicePlugin xxx-&gt;N&#x6765;&#x8fdb;&#x884c;&#x94fe;&#x63a5;"/>
</node>
</node>
</node>
</node>
<node CREATED="1310800824622" FOLDED="true" ID="ID_695162304" MODIFIED="1321343187512" POSITION="left" TEXT="&#x73af;&#x5883;&#x53d8;&#x91cf;">
<node CREATED="1310801310036" FOLDED="true" ID="ID_782062041" MODIFIED="1321343187511">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      export DBG_LEVELS=<font color="#e72020">moduleName</font>=<font color="#d61919">level</font>,moduleName=level
    </p>
  </body>
</html></richcontent>
<node CREATED="1310802484247" FOLDED="true" ID="ID_1507333792" MODIFIED="1310812935286" TEXT="moduleName&#x4e3a;&#x6a21;&#x5757;&#x540d;&#xff0c;&#xa;&#x6bd4;&#x5982;igmp, wan, brouting, wlan&#x7b49;&#xff0c;&#xa;all&#x8868;&#x793a;&#x6240;&#x6709;&#x6a21;&#x5757;">
<node CREATED="1310812652927" ID="ID_932621265" MODIFIED="1310812704070" TEXT="&#x4efb;&#x4e00;&#x6a21;&#x5757;&#x53ef;&#x8c03;&#x7528;dbgModuleFind&#xff08;moduleName&#xff09;&#x6dfb;&#x52a0;&#x4e00;&#x4e2a;&#x6a21;&#x5757;&#x540d;"/>
</node>
<node CREATED="1310802577582" ID="ID_550727453" MODIFIED="1310802755044" TEXT="level&#x4e3a;&#x8c03;&#x8bd5;&#x7b49;&#x7ea7;&#xff0c;&#x4ece;&#x4f4e;&#x5230;&#x9ad8;&#x5206;&#x522b;&#x4e3a;&#xff1a;&#xa;DBGERR&#xa;DBGINFO&#xa;DBGDEBUG&#xa;DBGDUMP&#xa;&#x7b49;&#x7ea7;&#x8d8a;&#x9ad8;&#x5219;&#x6253;&#x5370;&#x4fe1;&#x606f;&#x8d8a;&#x591a;"/>
<node CREATED="1310812983603" ID="ID_1277298078" MODIFIED="1310813052899" TEXT="&#x8c03;&#x7528;dbgf(dbgModule, level, format)&#x8f93;&#x51fa;&#x8c03;&#x8bd5;&#x4fe1;&#x606f;"/>
</node>
<node CREATED="1310810322871" ID="ID_493453039" MODIFIED="1310810659681" TEXT="export DBG_APPEDN_FILE_PATH=filePath&#xa;&#x6240;&#x6709;&#x7684;&#x6253;&#x5370;&#x5c06;&#x8ffd;&#x52a0;&#x5230;&#x8bbe;&#x5b9a;&#x7684;&#x6587;&#x4ef6;&#x4e2d;,masterd&#x542f;&#x52a8;&#x65f6;&#x4e0d;&#x6e05;&#x7a7a;&#x6b64;&#x6587;&#x4ef6;&#xa;export DBG_OUT_FILE_PATH=filePath&#xa;&#x6240;&#x6709;&#x7684;&#x6253;&#x5370;&#x5c06;&#x8ffd;&#x52a0;&#x5230;&#x8bbe;&#x5b9a;&#x7684;&#x6587;&#x4ef6;&#x4e2d;,masterd&#x542f;&#x52a8;&#x65f6;&#x6e05;&#x7a7a;&#x6b64;&#x6587;&#x4ef6;"/>
<node CREATED="1310811337736" ID="ID_1444554783" MODIFIED="1310811929133">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      export MASTERD_INIT_ONLY=<font color="#d30f0f">moduleBitmap</font>&#160;&#25351;&#23450;&#21482;&#21021;&#22987;&#21270;&#26576;&#20123;&#27169;&#22359;<br />export MASTERD_SKIP_INIT=<font color="#ce1818">moduleBitmap</font>&#160;&#25351;&#23450;&#21021;&#22987;&#21270;&#26102;&#36339;&#36807;&#26576;&#20123;&#27169;&#22359;<br />
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1310874658189" FOLDED="true" ID="ID_1967810501" MODIFIED="1321343178077" POSITION="right" TEXT="web">
<node CREATED="1310874765591" FOLDED="true" ID="ID_465844516" MODIFIED="1321343178076" TEXT="cgi">
<node CREATED="1310874794033" FOLDED="true" ID="ID_184609572" MODIFIED="1321343178076" TEXT="cgiMain">
<node CREATED="1310874851524" ID="ID_1199372083" MODIFIED="1310874940611" TEXT="1, &#x5982;&#x679c;&#x8bf7;&#x6c42;&#x65b9;&#x6cd5;&#x4e3a;POST&#x5219;&#x8868;&#x793a;&#x8981;&#x8fdb;&#x884c;&#x56fa;&#x4ef6;&#x5347;&#x7ea7;&#xff0c;&#xa;    &#x56e0;&#x6b64;&#x8c03;&#x7528;fwupdate"/>
<node CREATED="1310874923090" FOLDED="true" ID="ID_967988654" MODIFIED="1321343178072" TEXT="2, &#x5982;&#x679c;&#x8bf7;&#x6c42;&#x65b9;&#x6cd5;&#x4e3a;GET&#x5219;&#x641c;&#x7d22;action&#x5b57;&#x6bb5;&#xff0c;&#x6839;&#x636e;&#x6b64;&#x5b57;&#x6bb5;&#xa;    &#x5728;funcAction&#x4e2d;&#x627e;&#x5230;&#x5bf9;&#x5e94;&#x7684;&#x5904;&#x7406;&#x51fd;&#x6570;">
<node CREATED="1310875144594" ID="ID_1466478719" MODIFIED="1310875178247" TEXT="&quot;.shtml&quot; = mibOperate"/>
<node CREATED="1310875144594" ID="ID_529127871" MODIFIED="1310875196048" TEXT="&quot;.html&quot; = mibOperate"/>
<node CREATED="1310875144594" ID="ID_1898107370" MODIFIED="1310875218811" TEXT="&quot;.reboot&quot; = rebootRouter"/>
<node CREATED="1310875231293" ID="ID_302754825" MODIFIED="1310875244654" TEXT="&quot;ClearLog&quot; = clearLog"/>
<node CREATED="1310875256401" ID="ID_1177125267" MODIFIED="1310875266912" TEXT="&quot;restore&quot; = resetFactory"/>
<node CREATED="1310875282826" ID="ID_1149899748" MODIFIED="1310875292590" TEXT="&quot;usbbackup&quot; = usbbacker"/>
<node CREATED="1310875305285" ID="ID_774558337" MODIFIED="1310875311652" TEXT="&quot;usbxdown&quot; = usbxdown"/>
<node CREATED="1310875320252" ID="ID_1169837826" MODIFIED="1310875327190" TEXT="&quot;login&quot; = login"/>
<node CREATED="1310875338210" ID="ID_34214343" MODIFIED="1310875344142" TEXT="&quot;logout&quot; = logout"/>
<node CREATED="1310875353586" ID="ID_1145619208" MODIFIED="1310875359609" TEXT="&quot;captiveportal&quot; = captiveportal"/>
<node CREATED="1310875374913" ID="ID_1063226322" MODIFIED="1310875385172" TEXT="&quot;UnloadWlan&quot; = doWlanUnload"/>
<node CREATED="1310875396580" ID="ID_1372474295" MODIFIED="1310875404548" TEXT="&quot;XCTBIND&quot; = addevent"/>
<node CREATED="1310875415273" ID="ID_1558410804" MODIFIED="1310875424399" TEXT="&quot;XCTACCOUNTCHANGE&quot; = addevent"/>
</node>
</node>
</node>
</node>
<node CREATED="1317365693226" FOLDED="true" ID="ID_187301508" MODIFIED="1321343193710" POSITION="left" TEXT="makefile">
<node CREATED="1317365811603" FOLDED="true" ID="ID_1607000903" MODIFIED="1321343193709">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#39030;&#23618;make
    </p>
  </body>
</html></richcontent>
<node CREATED="1317366580600" FOLDED="true" ID="ID_1812955497" MODIFIED="1321343193699">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build/Makefile
    </p>
    <p>
      &#27492;makefile &#20808;&#21518;include&#20102;&#20004;&#20010;&#25991;&#20214;,&#21363;:
    </p>
    <p>
      build/scripts/<font color="#197616"><i>BOARD_TYPE</i></font>/config.<font color="#197616"><i>BOARD_TYPE </i></font>
    </p>
    <p>
      build/scripts/<font color="#197616"><i>BOARD_TYPE</i></font>/Makefile.<font color="#197616"><i>BOARD_TYPE</i></font>
    </p>
  </body>
</html></richcontent>
<node CREATED="1317366598939" FOLDED="true" ID="ID_1992135104" MODIFIED="1321343193696">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build/scripts/<font color="#197616"><i>BOARD_TYPE</i></font>/config.<font color="#197616"><i>BOARD_TYPE</i></font>
    </p>
  </body>
</html></richcontent>
<node CREATED="1317366924504" FOLDED="true" ID="ID_510906142" MODIFIED="1318052196232" TEXT="&#x5b9a;&#x4e49;&#x7684;&#x914d;&#x7f6e;&#x5b8f;">
<node CREATED="1317370939609" FOLDED="true" ID="ID_885695721" MODIFIED="1318041721111" TEXT="uboot,flash&#x53ca;&#x5206;&#x533a;&#x76f8;&#x5173;">
<node CREATED="1317367379626" ID="ID_1555431587" MODIFIED="1317367382105" TEXT="ERASEBLOCKSIZE"/>
<node CREATED="1317367424162" ID="ID_561336773" MODIFIED="1317367426282" TEXT="FLASH_SIZE"/>
<node CREATED="1317367615855" ID="ID_838700131" MODIFIED="1317367661636" TEXT="DUAL_FIRMWAREIMAGE_SUPPORT: &#x5212;&#x5206;flash&#x5206;&#x533a;&#x65f6;,&#x662f;&#x5426;&#x9700;&#x8981;&#x5212;&#x5206;image&#x7684;&#x5197;&#x4f59;&#x5206;&#x533a;"/>
<node CREATED="1317367460200" ID="ID_1575342389" MODIFIED="1317367523593" TEXT="BOARD_STRING: &#x5b9a;&#x4e49;&#x4e86;uboot&#x4e2d;&#x7684;bootargs"/>
<node CREATED="1317367545796" ID="ID_1483255173" MODIFIED="1317367579290" TEXT="COMPRESSED_UBOOT: &#x7f16;&#x8bd1;&#x51fa;&#x6765;&#x7684;uboot&#x662f;&#x5426;&#x662f;&#x538b;&#x7f29;&#x8fc7;&#x7684;"/>
<node CREATED="1317741126302" ID="ID_319965904" MODIFIED="1317741167987" TEXT="TFTPPATH: &#x6240;&#x751f;&#x6210;&#x7684;image&#x7684;&#x5b58;&#x653e;&#x76ee;&#x5f55;"/>
<node CREATED="1317741691849" ID="ID_172039140" MODIFIED="1317741742556" TEXT="FWUPGRADE_BUILD_DIR: &#x5347;&#x7ea7;&#x7a0b;&#x5e8f;&#x7684;&#x5b58;&#x653e;&#x4f4d;&#x7f6e;"/>
<node CREATED="1317742443447" ID="ID_1035535397" MODIFIED="1317742445452" TEXT="AH_CAL_IN_FLASH"/>
<node CREATED="1317742452935" ID="ID_1070150180" MODIFIED="1317742454603" TEXT="AH_CAL_RADIOS"/>
<node CREATED="1317742462165" ID="ID_1949281421" MODIFIED="1317742463603" TEXT="AH_CAL_LOCATIONS"/>
</node>
<node CREATED="1317371295471" FOLDED="true" ID="ID_1335887496" MODIFIED="1318052194393" TEXT="&#x5185;&#x6838;&#x53ca;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x76f8;&#x5173;">
<node CREATED="1317370915542" ID="ID_1296759480" MODIFIED="1317370918224" TEXT="TARGETFSSIZE"/>
<node CREATED="1317367207848" FOLDED="true" ID="ID_198209902" LINK="#ID_1657813232" MODIFIED="1321343193695" TEXT="BUILD_TYPE">
<node CREATED="1317367228315" ID="ID_105678595" MODIFIED="1317367230435" TEXT="jffs2"/>
<node CREATED="1317367256921" ID="ID_301571754" MODIFIED="1317367258813" TEXT="squashfs"/>
</node>
<node CREATED="1317741185486" ID="ID_833103402" MODIFIED="1317741188064" TEXT="KERNEL"/>
<node CREATED="1317741194553" ID="ID_80652997" MODIFIED="1317741204348" TEXT="KERNELVER&#xff1a;&#x5185;&#x6838;&#x7248;&#x672c;"/>
<node CREATED="1317741215442" ID="ID_1316201136" MODIFIED="1317741216854" TEXT="KERNELTARGET"/>
<node CREATED="1317741225483" ID="ID_388739261" MODIFIED="1317741273425" TEXT="COMPRESSKERNEL&#xff1a;&#x662f;&#x5426;&#x538b;&#x7f29;&#x5185;&#x6838;">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1317741247304" ID="ID_1536588832" MODIFIED="1317741276768" TEXT="KERNELARCH&#xff1a;&#x5185;&#x6838;&#x7684;&#x5e73;&#x53f0;">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1317742868509" ID="ID_485237672" MODIFIED="1317742870096" TEXT="VFAT_FS"/>
<node CREATED="1317742881149" ID="ID_71932169" MODIFIED="1317742881867" TEXT="NTFS_FS"/>
</node>
<node CREATED="1317371192111" FOLDED="true" ID="ID_537633683" MODIFIED="1317741488784" TEXT="&#x7f16;&#x8bd1;&#x76f8;&#x5173;">
<node CREATED="1317371086319" ID="ID_1338433263" MODIFIED="1317371138683" TEXT="BUILD_LIBRARYOPT: &#x662f;&#x5426;&#x5bf9;lib&#x5e93;&#x8fdb;&#x884c;&#x4f18;&#x5316;,&#x5373;&#x5220;&#x9664;&#x5e93;&#x4e2d;&#x4e0d;&#x5fc5;&#x8981;&#x7684;object"/>
<node CREATED="1317371405439" ID="ID_1032254002" MODIFIED="1317372100431" TEXT="TOOLCHAIN: &#x6240;&#x7528;&#x7684;&#x7f16;&#x8bd1;&#x5668;"/>
<node CREATED="1317372139392" ID="ID_87592857" MODIFIED="1317372141902" TEXT="UBOOT_GCC_4_3_3_EXTRA_CFLAGS"/>
<node CREATED="1317372152122" ID="ID_1933438626" MODIFIED="1317372169268" TEXT="TOOLPREFIX: &#x7f16;&#x8bd1;&#x5668;&#x5e73;&#x53f0;"/>
<node CREATED="1317372203322" ID="ID_1378978658" MODIFIED="1317372217889" TEXT="TOOLARCH:&#x7f16;&#x8bd1;&#x5de5;&#x5177;&#x7684;&#x4f4d;&#x7f6e;"/>
</node>
<node CREATED="1317741491089" FOLDED="true" ID="ID_1336240796" MODIFIED="1318041716592" TEXT="&#x65e0;&#x7ebf;&#x76f8;&#x5173;">
<node CREATED="1317741635763" ID="ID_58434727" MODIFIED="1317741638854" TEXT="BUILD_UMAC"/>
<node CREATED="1317741653969" ID="ID_1067183100" MODIFIED="1317741654626" TEXT="BUS"/>
<node CREATED="1317741663857" ID="ID_1075878588" MODIFIED="1317741664823" TEXT="TARGETARCH"/>
<node CREATED="1317741865100" ID="ID_1119592996" MODIFIED="1317741867660" TEXT="ATH_CAP_PHYERR_DIAG"/>
<node CREATED="1317741879001" ID="ID_817979320" MODIFIED="1317741880740" TEXT="ATH_SUPPORT_IQUE"/>
<node CREATED="1317741891410" ID="ID_669311328" MODIFIED="1317741892880" TEXT="ATH_SUPPORT_UAPSD"/>
<node CREATED="1317741902666" ID="ID_275761271" MODIFIED="1317741904902" TEXT="AR5416_G_MODE"/>
<node CREATED="1317741911980" ID="ID_1286170993" MODIFIED="1317741913979" TEXT="AR9100"/>
<node CREATED="1317741924658" ID="ID_1553710796" MODIFIED="1317741928353" TEXT="AH_SUPPORT_HOWL"/>
<node CREATED="1317741937280" ID="ID_17947091" MODIFIED="1317741939687" TEXT="AH_SUPPORT_OWL"/>
<node CREATED="1317741948274" ID="ID_395871219" MODIFIED="1317741949280" TEXT="AH_DEBUG"/>
<node CREATED="1317741963384" ID="ID_1692586707" MODIFIED="1317741965314" TEXT="ATH_GMAC_TXQUEUELEN"/>
<node CREATED="1317742027170" ID="ID_395910511" MODIFIED="1317742029059" TEXT="AH_SUPPORT_AR5212"/>
<node CREATED="1317742047615" ID="ID_1432596134" MODIFIED="1317742049911" TEXT="AH_SUPPORT_5111"/>
<node CREATED="1317742058355" ID="ID_1541709371" MODIFIED="1317742060958" TEXT="AH_SUPPORT_5112"/>
<node CREATED="1317742071028" ID="ID_1833967408" MODIFIED="1317742073560" TEXT="AH_SUPPORT_2413"/>
<node CREATED="1317742082852" ID="ID_281282674" MODIFIED="1317742085507" TEXT="AH_SUPPORT_5111"/>
<node CREATED="1317742094142" ID="ID_1012251558" MODIFIED="1317742095324" TEXT="AH_SUPPORT_5112"/>
<node CREATED="1317742104284" ID="ID_1033290254" MODIFIED="1317742106363" TEXT="AH_SUPPORT_2413"/>
<node CREATED="1317742114506" ID="ID_253247531" MODIFIED="1317742115497" TEXT="AH_SUPPORT_5413"/>
<node CREATED="1317742124740" ID="ID_316998843" MODIFIED="1317742126843" TEXT="AH_SUPPORT_2316"/>
<node CREATED="1317742134056" ID="ID_314863076" MODIFIED="1317742136457" TEXT="AH_SUPPORT_2317"/>
<node CREATED="1317742144020" ID="ID_596319949" MODIFIED="1317742145759" TEXT="AH_SUPPORT_2425"/>
<node CREATED="1317742154151" ID="ID_1461285295" MODIFIED="1317742157067" TEXT="AH_SUPPORT_SOWL"/>
<node CREATED="1317742330803" ID="ID_1766196292" MODIFIED="1317742333012" TEXT="ATH_CHAINMASK_SELECT"/>
<node CREATED="1317742342711" ID="ID_1365031048" MODIFIED="1317742344723" TEXT="ATH_RXBUF"/>
<node CREATED="1317742353346" ID="ID_1381355902" MODIFIED="1317742355309" TEXT="ATH_TXBUF"/>
<node CREATED="1317742362303" ID="ID_1107039804" MODIFIED="1317742364723" TEXT="ATH_CAP_AMSDU"/>
<node CREATED="1317742373426" ID="ID_1996246147" MODIFIED="1317742374542" TEXT="IEEE80211_MCAST_ENHANCEMENT"/>
<node CREATED="1317742383861" ID="ID_1300290349" MODIFIED="1317742385978" TEXT="ATH_RB"/>
<node CREATED="1317742718797" ID="ID_253342056" MODIFIED="1317742720186" TEXT="AH_WAR_52640"/>
<node CREATED="1317742763090" ID="ID_609431037" MODIFIED="1317742764969" TEXT="ATH_WLAN_COMBINE"/>
<node CREATED="1317742776060" ID="ID_881935813" MODIFIED="1317742777721" TEXT="ATH_NO_5G_SUPPORT"/>
<node CREATED="1317742786603" ID="ID_1173807485" MODIFIED="1317742788941" TEXT="ATH_NO_SW_CRYPTO"/>
<node CREATED="1317742915384" ID="ID_640220920" MODIFIED="1317742916556" TEXT="ATH_SUPPORT_TxBF"/>
</node>
<node CREATED="1317741516660" FOLDED="true" ID="ID_703722974" MODIFIED="1318041722425" TEXT="&#x65e0;&#x7ebf;&#x5b89;&#x5168;&#x76f8;&#x5173;">
<node CREATED="1317741540131" ID="ID_1476945300" MODIFIED="1317741560490" TEXT="BUILD_WPA2&#xff1a;&#x662f;&#x5426;&#x7f16;&#x8bd1;WPA2"/>
<node CREATED="1317741575127" ID="ID_1899573799" MODIFIED="1317741576157" TEXT="BUILD_WPA2_ATHR"/>
<node CREATED="1317741591947" ID="ID_852181052" MODIFIED="1317741592776" TEXT="BUILD_WPA2_NO_APSTART"/>
<node CREATED="1317741601965" ID="ID_1764645582" MODIFIED="1317741602982" TEXT="BUILD_WPA2_NO_EXAMPLES"/>
<node CREATED="1317741619210" ID="ID_336209237" MODIFIED="1317741620349" TEXT="CONFIG_ETHERSTA"/>
<node CREATED="1317742419572" ID="ID_1900327167" MODIFIED="1317742421019" TEXT="ATH_WPS_IE"/>
<node CREATED="1317742686722" ID="ID_143596194" MODIFIED="1317742688788" TEXT="STA_WPS"/>
<node CREATED="1317742699451" ID="ID_36512244" MODIFIED="1317742701526" TEXT="WPS_LED_GPIO_PIN"/>
<node CREATED="1317742734983" ID="ID_818494779" MODIFIED="1317742736559" TEXT="ATH_SUPPORT_WAPI"/>
<node CREATED="1317742745183" ID="ID_473081741" MODIFIED="1317742747218" TEXT="ATH_WAPI_PKCS12"/>
<node CREATED="1317742898509" ID="ID_1717846546" MODIFIED="1317742900569" TEXT="WPS_OPT_TINYUPNP_CONFIG_EXTERNAL"/>
</node>
<node CREATED="1317742250574" FOLDED="true" ID="ID_1028685694" MODIFIED="1318041862816" TEXT="BSP&#x76f8;&#x5173;">
<node CREATED="1317742230826" ID="ID_1860450676" MODIFIED="1317742232690" TEXT="ATH_SUPPORT_DFS"/>
<node CREATED="1317742199918" ID="ID_122068727" MODIFIED="1317742201554" TEXT="AH_SUPPORT_HORNET"/>
<node CREATED="1317742185396" ID="ID_1265498507" MODIFIED="1317742189033" TEXT="AH_SUPPORT_EEPROM_AR9330"/>
<node CREATED="1317742174747" ID="ID_537383556" MODIFIED="1317742176840" TEXT="AH_SUPPORT_AR9300"/>
<node CREATED="1317742162531" ID="ID_62729084" MODIFIED="1317742165037" TEXT="AH_SUPPORT_AR5416"/>
<node CREATED="1317742499576" ID="ID_909080953" MODIFIED="1317742501704" TEXT="ATH_WLAN_LED"/>
<node CREATED="1317742524770" ID="ID_1460765128" MODIFIED="1317742527262" TEXT="GPIO_PIN_FUNC_0"/>
<node CREATED="1317742535109" ID="ID_693815348" MODIFIED="1317742538638" TEXT="GPIO_PIN_FUNC_1"/>
<node CREATED="1317742546270" ID="ID_184002406" MODIFIED="1317742547527" TEXT="GPIO_PIN_FUNC_2"/>
<node CREATED="1317742557090" ID="ID_1881620796" MODIFIED="1317742558853" TEXT="AP_USB_LED_GPIO"/>
<node CREATED="1317742805441" ID="ID_1206425311" MODIFIED="1317742807066" TEXT="BUILD_OPTIMIZED"/>
<node CREATED="1317742820142" ID="ID_1126528151" MODIFIED="1317742821671" TEXT="ATH_CONFIG_NVRAM"/>
<node CREATED="1317742829939" ID="ID_1498253271" MODIFIED="1317742831668" TEXT="CONFIG_NO_STDOUT_DEBUG"/>
<node CREATED="1317742847850" ID="ID_1244142916" MODIFIED="1317742849952" TEXT="ATH_SUPPORT_SPECTRAL"/>
<node CREATED="1317742933213" ID="ID_389027711" MODIFIED="1317742934693" TEXT="CONFIG_HORNET_XTAL"/>
<node CREATED="1317742951382" ID="ID_159226762" MODIFIED="1317742952193" TEXT="CONFIG_HORNET_1_1_WAR"/>
<node CREATED="1317742965874" ID="ID_966970608" MODIFIED="1317742966500" TEXT="AG7240_BROADCAST_ENABLE"/>
<node CREATED="1317742977700" ID="ID_1391106469" MODIFIED="1317742978833" TEXT="ATH_TRAFFIC_FAST_RECOVER"/>
<node CREATED="1317742987871" ID="ID_1658207929" MODIFIED="1317742989574" TEXT="ATH_SUPPORT_ANT_DIV_COMB"/>
<node CREATED="1317743005988" ID="ID_372386030" MODIFIED="1317743006542" TEXT="AP_USB_LED_GPIO"/>
<node CREATED="1317743015323" ID="ID_765995398" MODIFIED="1317743020206" TEXT="WPS_LED_GPIO_PIN"/>
<node CREATED="1317743031891" ID="ID_207978209" MODIFIED="1317743033847" TEXT="ATH_SUPPORT_LED"/>
<node CREATED="1317743076878" ID="ID_1614841846" MODIFIED="1317743078052" TEXT="JUMPSTART_GPIO"/>
<node CREATED="1317743086875" ID="ID_1550572556" MODIFIED="1317743088313" TEXT="AP_RESET_GPIO"/>
<node CREATED="1317743099207" ID="ID_299955039" MODIFIED="1317743101630" TEXT="NEW_DDR_TAP_CAL"/>
<node CREATED="1317743110389" ID="ID_922368104" MODIFIED="1317743112356" TEXT="AP_WATCHDOG_RESET_DISABLE"/>
</node>
</node>
</node>
<node CREATED="1317366615902" FOLDED="true" ID="ID_1608827490" MODIFIED="1321343193697">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build/scripts/<font color="#197616"><i>BOARD_TYPE</i></font>/Makefile.<font color="#197616"><i>BOARD_TYPE</i></font>
    </p>
  </body>
</html></richcontent>
<node CREATED="1317366929349" FOLDED="true" ID="ID_1447085704" MODIFIED="1318042179336" TEXT="&#x5b9a;&#x4e49;&#x7684;&#x914d;&#x7f6e;&#x5b8f;">
<node CREATED="1318041979954" FOLDED="true" ID="ID_91947265" MODIFIED="1318042036842" TEXT="GWLANG">
<node CREATED="1318041995494" ID="ID_111042290" MODIFIED="1318041997656" TEXT="ch"/>
<node CREATED="1318041998292" ID="ID_87372197" MODIFIED="1318042000911" TEXT="mlang_en"/>
</node>
<node CREATED="1318042038109" ID="ID_446667696" MODIFIED="1318042040442" TEXT="IMAGEPATH"/>
</node>
</node>
<node CREATED="1317366860307" FOLDED="true" ID="ID_1114148790" MODIFIED="1318054447305" TEXT="&#x5b9a;&#x4e49;&#x7684;&#x914d;&#x7f6e;&#x5b8f;">
<node CREATED="1317367207848" FOLDED="true" ID="ID_1657813232" MODIFIED="1318044343131" TEXT="BUILD_TYPE">
<node CREATED="1317367228315" ID="ID_818845605" MODIFIED="1317367230435" TEXT="jffs2"/>
<node CREATED="1317367256921" ID="ID_1335678425" MODIFIED="1317367258813" TEXT="squashfs"/>
</node>
<node CREATED="1318044389194" FOLDED="true" ID="ID_1192943075" MODIFIED="1318044658313" TEXT="TFTPPATH">
<node CREATED="1318044395866" ID="ID_463034548" MODIFIED="1318044403345" TEXT="/tftpboot"/>
</node>
<node CREATED="1318044435833" ID="ID_1883184025" MODIFIED="1318044448440" TEXT="COMPRESSED_UBOOT:&#x662f;&#x5426;&#x538b;&#x7f29;uboot"/>
<node CREATED="1318044478840" ID="ID_881642280" MODIFIED="1318044480734" TEXT="ATH_CONFIG_NVRAM"/>
<node CREATED="1318044487627" ID="ID_726642117" MODIFIED="1318044489063" TEXT="ATH_SINGLE_CFG"/>
<node CREATED="1318044496872" FOLDED="true" ID="ID_777982165" MODIFIED="1321343193698" TEXT="INSTALL_BLACKLIST">
<node CREATED="1318044500299" ID="ID_1195379874" MODIFIED="1318044503124" TEXT="None"/>
</node>
<node CREATED="1318044521598" FOLDED="true" ID="ID_1170695212" MODIFIED="1318044628352" TEXT="NANDJFFS2FILE">
<node CREATED="1318044533954" ID="ID_1894075266" MODIFIED="1318044535333" TEXT="$(BOARD_TYPE)$(BUILD_CONFIG)$(BUILD_EXT)-nand-jffs2"/>
</node>
<node CREATED="1318044543562" FOLDED="true" ID="ID_1074149638" MODIFIED="1318044629297" TEXT="YAFFS2FILE">
<node CREATED="1318044555267" ID="ID_1140639755" MODIFIED="1318044557368" TEXT="$(BOARD_TYPE)$(BUILD_CONFIG)$(BUILD_EXT)-yaffs2"/>
</node>
<node CREATED="1318044565721" FOLDED="true" ID="ID_1187278738" MODIFIED="1318044630137" TEXT="JFFS2FILE">
<node CREATED="1318044576819" ID="ID_437278067" MODIFIED="1318044578880" TEXT="$(BOARD_TYPE)$(BUILD_CONFIG)$(BUILD_EXT)-jffs2"/>
</node>
<node CREATED="1318044587718" FOLDED="true" ID="ID_1406296103" MODIFIED="1318044630912" TEXT="IMAGEPATH">
<node CREATED="1318044600713" ID="ID_196768410" MODIFIED="1318044602462" TEXT="$(TOPDIR)/images/$(BOARD_TYPE)$(BUILD_CONFIG)$(BUILD_EXT)"/>
</node>
<node CREATED="1318044610664" FOLDED="true" ID="ID_404752457" MODIFIED="1318044766253" TEXT="MODCPPATH">
<node CREATED="1318044621495" ID="ID_652961777" MODIFIED="1318044623228" TEXT="$(TOPDIR)/modules/$(BOARD_TYPE)$(BUILD_CONFIG)$(BUILD_EXT)"/>
</node>
<node CREATED="1318044767639" ID="ID_1272947904" MODIFIED="1318044769874" TEXT="KERNEL_BUILD_CONFIG"/>
<node CREATED="1318044785545" FOLDED="true" ID="ID_575370551" MODIFIED="1318044802182" TEXT="INFOFILE">
<node CREATED="1318044798023" ID="ID_843170113" MODIFIED="1318044800832" TEXT="vmlinux$(BUILD_CONFIG)$(BUILD_EXT).info"/>
</node>
<node CREATED="1318044834400" ID="ID_1381451612" MODIFIED="1318044835115" TEXT="KTFILE"/>
<node CREATED="1318044849742" FOLDED="true" ID="ID_808084442" MODIFIED="1318044988111" TEXT="UBOOTFILE">
<node CREATED="1318044889025" ID="ID_1847058643" MODIFIED="1318044907224" TEXT="&#x672a;&#x538b;&#x7f29;&#x7684;&#x4e3a;u-boot$(BUILD_CONFIG)$(BUILD_EXT).bin"/>
<node CREATED="1318044931507" ID="ID_1925998647" MODIFIED="1318044940466" TEXT="&#x538b;&#x7f29;&#x7684;&#x4e3a;tuboot$(BUILD_CONFIG)$(BUILD_EXT).bin"/>
</node>
<node CREATED="1318044858834" FOLDED="true" ID="ID_1281674169" MODIFIED="1318044988951" TEXT="UBOOT_BINARY">
<node CREATED="1318044889025" ID="ID_594328442" MODIFIED="1318044976382" TEXT="&#x672a;&#x538b;&#x7f29;&#x7684;&#x4e3a;u-boot.bin"/>
<node CREATED="1318044931507" ID="ID_1772105433" MODIFIED="1318044984894" TEXT="&#x538b;&#x7f29;&#x7684;&#x4e3a;tuboot.bin"/>
</node>
<node CREATED="1318045014208" FOLDED="true" ID="ID_1355458766" MODIFIED="1318045029897" TEXT="INSTALL_ROOT">
<node CREATED="1318045026826" ID="ID_1570871153" MODIFIED="1318045028743" TEXT="$(TOPDIR)/rootfs-$(BOARD_TYPE)$(BUILD_CONFIG)$(BUILD_EXT)$(NAND).build"/>
</node>
<node CREATED="1318045070332" FOLDED="true" ID="ID_1875487560" MODIFIED="1318045084525" TEXT="IMAGE_ROOT">
<node CREATED="1318045081946" ID="ID_571987231" MODIFIED="1318045083422" TEXT="$(TOPDIR)/rootfs-$(BOARD_TYPE)$(BUILD_CONFIG)$(BUILD_EXT)$(NAND).optbuild"/>
</node>
</node>
</node>
<node CREATED="1318042247184" FOLDED="true" ID="ID_1822101330" MODIFIED="1321343193708" TEXT="router">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build/scripts/<i><font color="#197616">BOARD_TYPE</font></i>/Makefile.<i><font color="#197616">BOARD_TYPE</font></i>
    </p>
  </body>
</html></richcontent>
<node CREATED="1318042538301" FOLDED="true" ID="ID_1864737899" MODIFIED="1321343193708" TEXT="image_root">
<node CREATED="1318042650084" FOLDED="true" ID="ID_475332441" MODIFIED="1321343193707" TEXT="INSTALLS&#x53d8;&#x91cf;&#x5b9a;&#x4e49;&#x7684;&#x76ee;&#x6807;&#xff0c;&#x6839;&#x636e;&#x5b9a;&#x4e49;&#x7684;&#x914d;&#x7f6e;&#x5b8f;&#x800c;&#x53d8;&#x5316;">
<node CREATED="1318042766055" FOLDED="true" ID="ID_1941596058" MODIFIED="1318154907178" TEXT="common_mainline">
<node CREATED="1318043622002" FOLDED="true" ID="ID_1028286047" MODIFIED="1321343193700" TEXT="check_tftp&#xa;&#x521b;&#x5efa;&#x4ee5;&#x4e0b;&#x76ee;&#x5f55;&#xff1a;&#xa;/tftpboot&#xa;images/&#x53ca;&#x5176;&#x4ee5;&#x4e0b;&#x5b50;&#x76ee;&#x5f55;">
<node CREATED="1318043840889" ID="ID_417345174" MODIFIED="1318044050695" TEXT="image_prep&#xa;&#x521b;&#x5efa;&#x4ee5;&#x4e0b;&#x76ee;&#x5f55;&#xff1a;&#xa;/tftpboot&#xa;images/&#x53ca;&#x5176;&#x4ee5;&#x4e0b;&#x5b50;&#x76ee;&#x5f55;&#xa;modules/&#x53ca;&#x5176;&#x4ee5;&#x4e0b;&#x5b50;&#x76ee;&#x5f55;&#xa;&#xa;"/>
</node>
<node CREATED="1318043634325" FOLDED="true" ID="ID_1344959497" MODIFIED="1318051449151" TEXT="router_rootfs_prep&#xa;ln -sf /tmp $(INSTALL_ROOT)/var&#xa;ln -sf /var/local/tmp/resolv.conf $(INSTALL_ROOT)/etc/resolv.conf&#xa;ln -sf /var/local/tmp/TZ $(INSTALL_ROOT)/etc/TZ&#xa;&#x5220;&#x9664;&#x4e00;&#x4e9b;&#x4e0d;&#x5fc5;&#x8981;&#x7684;&#x6587;&#x4ef6;">
<node CREATED="1318044159934" ID="ID_488589519" MODIFIED="1318051085832" TEXT="rootfs_prep&#xa;&#x5c06;rootfs/common/* &#x590d;&#x5236;&#x5230; $(INSTALL_ROOT)&#xa;&#x5c06;rootfs/$(BOARD_TYPE)$(BUILD_CONFIG)/* &#x590d;&#x5236;&#x5230; $(INSTALL_ROOT)"/>
</node>
<node CREATED="1318043647191" ID="ID_1231325303" MODIFIED="1318051758626" TEXT="toolchain_build&#xa;&#x7f16;&#x8bd1;&#x5de5;&#x5177;&#x94fe;"/>
<node CREATED="1318043658082" ID="ID_1841086898" MODIFIED="1318052035664" TEXT="sqlzma_build&#xa;&#x7f16;&#x8bd1;&#x7528;&#x4e8e;&#x751f;&#x6210;squashfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x7684;&#x5de5;&#x5177;"/>
<node CREATED="1318043667988" FOLDED="true" ID="ID_120726883" MODIFIED="1318052886247" TEXT="kernel_build&#xa;&#x7f16;&#x8bd1;&#x5185;&#x6838;">
<node CREATED="1318052658432" ID="ID_1350935742" LINK="#ID_417345174" MODIFIED="1318052769296" TEXT="image_prep"/>
<node CREATED="1318052668682" ID="ID_187414919" MODIFIED="1318052881989" TEXT="initramfs_prep&#xa;&#x7f16;&#x8bd1;boot/initramfs"/>
</node>
<node CREATED="1318043677764" ID="ID_1483664481" MODIFIED="1318052562727" TEXT="kernel_info&#xa;&#x751f;&#x6210;vmlinux-router.info&#x6587;&#x4ef6;"/>
<node CREATED="1318043688291" FOLDED="true" ID="ID_1225548528" MODIFIED="1318053215461" TEXT="enet_build&#xa;&#x7f16;&#x8bd1;&#x4ee5;&#x592a;&#x7f51;&#x9a71;&#x52a8;">
<node CREATED="1318053054796" ID="ID_992892892" MODIFIED="1318053123134" TEXT="eth_diag&#xa;&#x7f16;&#x8bd1;&#x4ee5;&#x592a;&#x7f51;&#x9a71;&#x52a8;&#x8c03;&#x8bd5;&#x5de5;&#x5177;ethreg"/>
</node>
<node CREATED="1318043709837" ID="ID_1714768812" MODIFIED="1318053301502" TEXT="busybox_build&#xa;&#x7f16;&#x8bd1;busybox"/>
<node CREATED="1318043721764" FOLDED="true" ID="ID_937430810" MODIFIED="1321343193700" TEXT="wpa2&#xa;&#x7f16;&#x8bd1;wpa2">
<node CREATED="1318053385738" ID="ID_664738588" MODIFIED="1318053387915" TEXT="wpa2_clean"/>
</node>
<node CREATED="1318043735574" ID="ID_1508188276" MODIFIED="1318053495622" TEXT="sar&#xa;&#x7f16;&#x8bd1;&#x7cfb;&#x7edf;&#x8d44;&#x6e90;&#x67e5;&#x770b;&#x5de5;&#x5177;sar"/>
<node CREATED="1318043743149" ID="ID_326646833" MODIFIED="1318053609557" TEXT="art_mod&#xa;&#x7f16;&#x8bd1;&#x7528;&#x4e8e;&#x65e0;&#x7ebf;&#x6821;&#x51c6;&#x7684;ART&#x6a21;&#x5757;"/>
</node>
<node CREATED="1318042778452" ID="ID_1964431249" MODIFIED="1318053919881" TEXT="uboot&#xa;&#x7f16;&#x8bd1;uboot"/>
<node CREATED="1318042790583" FOLDED="true" ID="ID_1508927802" MODIFIED="1318054416311" TEXT="driver_build&#xa;&#x7f16;&#x8bd1;&#x65e0;&#x7ebf;&#x9a71;&#x52a8;">
<node CREATED="1318053952074" ID="ID_1873154340" MODIFIED="1318053954464" TEXT="main_hal_build"/>
<node CREATED="1318053964305" ID="ID_773059058" MODIFIED="1318054072126" TEXT="wireless_tools_main&#xa;&#x7f16;&#x8bd1;iwpriv&#xff0c;iwconfig&#xff0c;iwlist&#x7b49;&#x65e0;&#x7ebf;&#x5de5;&#x5177;"/>
<node CREATED="1318053974578" ID="ID_671808741" MODIFIED="1318054356123" TEXT="ath_tools&#xa;&#x7f16;&#x8bd1;athstats,80211stats,athstatsclr,pktlogconf,&#xa;radartool,spectraltool,pktlogdump,athadhoc,mplay,&#xa;aowstatlog,rpttool,tx99tool&#x7b49;&#x65e0;&#x7ebf;&#x8c03;&#x8bd5;&#x5de5;&#x5177;"/>
</node>
<node CREATED="1318042802395" FOLDED="true" ID="ID_767588118" MODIFIED="1321343193701" TEXT="gateway_build&#xa;&#x7f16;&#x8bd1;masterd&#x53ca;&#x5176;&#x76f8;&#x5173;&#x7684;&#x5e94;&#x7528;&#x7a0b;&#x5e8f;">
<node CREATED="1318054490980" ID="ID_1055593325" MODIFIED="1318054564651" TEXT="openssl_build&#xa;&#x7f16;&#x8bd1;openssl"/>
</node>
<node CREATED="1318042813653" FOLDED="true" ID="ID_585984225" MODIFIED="1318054707186" TEXT="httpd_build&#xa;&#x7f16;&#x8bd1;web server">
<node CREATED="1318054689079" ID="ID_1834673042" LINK="#ID_767588118" MODIFIED="1318054703876" TEXT="gateway_build"/>
</node>
<node CREATED="1318042833139" ID="ID_835491854" MODIFIED="1318043027988" TEXT="&#x5982;&#x679c;&#x5b8f;ATH_SUPPORT_SPECTRAL&#x503c;&#x4e3a;1&#x5219;&#x5305;&#x542b;&#x76ee;&#x6807;&#xa;                     spectral_app_build"/>
<node CREATED="1318042833139" ID="ID_112099238" MODIFIED="1318043103823" TEXT="&#x5982;&#x679c;&#x5b8f;ATH_SUPPORT_WAPI&#x503c;&#x4e3a;1&#x5219;&#x5305;&#x542b;&#x76ee;&#x6807;&#xa;                     wapi_build"/>
<node CREATED="1318042833139" ID="ID_1756430871" MODIFIED="1318043146825" TEXT="&#x5982;&#x679c;&#x5b8f;VFAT_FS&#x503c;&#x4e3a;1&#x5219;&#x5305;&#x542b;&#x76ee;&#x6807;&#xa;           vfat_fs_build"/>
<node CREATED="1318042833139" ID="ID_1050441253" MODIFIED="1318043199675" TEXT="&#x5982;&#x679c;&#x5b8f;NTFS_FS&#x503c;&#x4e3a;1&#x5219;&#x5305;&#x542b;&#x76ee;&#x6807;&#xa;           ntfs_fs_build"/>
<node CREATED="1318042833139" FOLDED="true" ID="ID_782203961" MODIFIED="1318056243627" TEXT="&#x5982;&#x679c;&#x5b8f;BUILD_CONFIG&#x503c;&#x4e3a;-router&#x5219;&#x5305;&#x542b;&#x76ee;&#x6807;&#xa;router_build&#x548c;create-gateway-binary">
<node CREATED="1318054810946" FOLDED="true" ID="ID_376378675" MODIFIED="1318056238038" TEXT="router_build">
<node CREATED="1318054817461" ID="ID_856989342" MODIFIED="1318054819975" TEXT="iptables_build"/>
<node CREATED="1318054829860" ID="ID_1628346519" MODIFIED="1318054833537" TEXT="dnsmasq_build"/>
<node CREATED="1318054840607" ID="ID_1246750122" MODIFIED="1318054842436" TEXT="inadyn_build"/>
<node CREATED="1318054850176" ID="ID_1718466111" MODIFIED="1318054852381" TEXT="pppd_build"/>
<node CREATED="1318054862038" ID="ID_394394816" MODIFIED="1318054863368" TEXT="iproute2_build"/>
<node CREATED="1318054871874" ID="ID_736445479" MODIFIED="1318056202152" TEXT="nls_build&#xa;&#x7f16;&#x8bd1;mount&#x6240;&#x8981;&#x652f;&#x6301;&#x7684;&#x5b57;&#x7b26;&#x96c6;nls_iso8859"/>
<node CREATED="1318054880408" ID="ID_86354592" MODIFIED="1318055066280" TEXT="ipt_build&#xa;&#x7f16;&#x8bd1;netfilter&#x5185;&#x6838;&#x6a21;&#x5757;&#xff1a;rtsp,classify,webstr,NATTYPE,IMQ"/>
<node CREATED="1318054890853" ID="ID_521943344" MODIFIED="1318055154773" TEXT="sched_build&#xa;&#x7f16;&#x8bd1;&#x5185;&#x6838;QoS&#x7684;wrr&#x8c03;&#x5ea6;&#x6a21;&#x5757;"/>
<node CREATED="1318054900593" ID="ID_1996903543" MODIFIED="1318055214896" TEXT="IMQ_build&#xa;&#x7f16;&#x8bd1;IMQ&#x865a;&#x62df;&#x63a5;&#x53e3;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
<node CREATED="1318054909408" ID="ID_1116267066" MODIFIED="1318055467937" TEXT="usb_build&#xa;&#x7f16;&#x8bd1;usb&#x9a71;&#x52a8;scsi_mod.ko&#xff0c;sd_mod.ko&#xff0c;usb-storage.ko&#x7b49;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
<node CREATED="1318054923024" ID="ID_710733118" MODIFIED="1318055619392" TEXT="routed_build&#xa;&#x7f16;&#x8bd1;&#x8def;&#x7531;&#x534f;&#x8bae;"/>
<node CREATED="1318054930566" ID="ID_97384408" MODIFIED="1318055632281" TEXT="routed2_build&#xa;&#x7f16;&#x8bd1;&#x8def;&#x7531;&#x534f;&#x8bae;"/>
</node>
</node>
</node>
</node>
<node CREATED="1318056514818" FOLDED="true" ID="ID_1071899936" MODIFIED="1318154868314" TEXT="uimage_mainline&#xa;&#x751f;&#x6210;lzma&#x683c;&#x5f0f;&#x7684;image">
<node CREATED="1318154247792" ID="ID_120351713" MODIFIED="1318154250067" TEXT="zImage_build"/>
</node>
<node CREATED="1318056537762" FOLDED="true" ID="ID_1357158903" MODIFIED="1318154379804" TEXT="squashfs_build_ap121">
<node CREATED="1318056684949" ID="ID_1225484690" MODIFIED="1318056809199" TEXT="squashfs_build&#xa;&#x5229;&#x7528;mksquashfs&#x5c06;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x6253;&#x5305;&#x6210;squashfs&#x683c;&#x5f0f;"/>
</node>
<node CREATED="1318056547112" ID="ID_409626618" MODIFIED="1318154829027" TEXT="firmware_upgrade_build&#xa;&#x751f;&#x6210;cpio&#x683c;&#x5f0f;&#x7684;&#x5347;&#x7ea7;&#x6587;&#x4ef6;fwupgrade&#xff0c;&#x5b83;&#x5305;&#x542b;&#x4e86;&#xff1a;&#xa;&#x5185;&#x6838;&#x548c;&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x7ec4;&#x6210;&#x7684;upgrade.cpio&#x4ee5;&#x53ca;&#x7248;&#x672c;&#xff0c;checksum&#xff0c;&#xa;&#x548c;&#x4e00;&#x4e2a;&#x5347;&#x7ea7;&#x7a0b;&#x5e8f;upgrader"/>
</node>
<node CREATED="1318042412412" FOLDED="true" ID="ID_1598126340" MODIFIED="1321343193709" TEXT="ap">
<richcontent TYPE="NOTE"><html>
  <head>
    
  </head>
  <body>
    <p>
      build/scripts/<i><font color="#197616">BOARD_TYPE</font></i>/Makefile.<i><font color="#197616">BOARD_TYPE</font></i>
    </p>
  </body>
</html></richcontent>
<node CREATED="1318042569261" ID="ID_730581601" MODIFIED="1318042571959" TEXT="image_root"/>
</node>
<node CREATED="1317367096439" FOLDED="true" ID="ID_1674872029" MODIFIED="1321343193709" TEXT="&#x9700;&#x8981;&#x5728;&#x547d;&#x4ee4;&#x884c;&#x63d0;&#x4f9b;&#x7684;&#x914d;&#x7f6e;&#x5b8f;">
<node CREATED="1317367180459" ID="ID_400702078" MODIFIED="1317367182387" TEXT="BOARD_TYPE"/>
</node>
</node>
</node>
</node>
</map>
