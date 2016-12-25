<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1417561555746" ID="ID_1753731940" MODIFIED="1417561572454" TEXT="perf event">
<node CREATED="1417561665701" FOLDED="true" ID="ID_101954892" MODIFIED="1417820744742" POSITION="right" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1417561672147" ID="ID_149716540" MODIFIED="1417561685662" TEXT="Akronite&#x521d;&#x59cb;&#x5316;">
<node CREATED="1417561686713" ID="ID_810654727" MODIFIED="1417561687745" TEXT="init_hw_perf_events">
<node CREATED="1417561758540" ID="ID_1166250457" MODIFIED="1417820021825" TEXT="cpu_pmu = armv7_krait_pmu_init()">
<node CREATED="1417761442602" ID="ID_831995110" MODIFIED="1417761494298" TEXT="&#x521d;&#x59cb;&#x5316;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct arm_pmu krait_pmu&#xff0c; &#x8fd9;&#x4e2a;&#x53d8;&#x91cf;&#x4e5f;&#x662f;&#x8981;&#x8fd4;&#x56de;&#x7684;struct arm_pmu"/>
<node CREATED="1417809302641" ID="ID_1037681205" MODIFIED="1417809347502" TEXT="&#x6e05;&#x9664;PMRES0, PMRES1, PMRES2, VPMRES0&#x4e2d;&#x7684;&#x503c;"/>
<node CREATED="1417810074217" ID="ID_1807472002" MODIFIED="1417810100312" TEXT="&#x6839;&#x636e;krait&#x7248;&#x672c;&#x7684;&#x4e0d;&#x540c;,&#x521d;&#x59cb;&#x5316;&#x6620;&#x5c04;&#x6570;&#x7ec4;armv7_krait_perf_cache_map"/>
</node>
<node CREATED="1417561776939" ID="ID_1303548435" MODIFIED="1417561777603" TEXT="cpu_pmu_init(cpu_pmu);"/>
<node CREATED="1417561799428" ID="ID_1435768523" MODIFIED="1417561799973" TEXT="register_cpu_notifier(&amp;pmu_cpu_notifier);"/>
<node CREATED="1417561814769" ID="ID_818985616" MODIFIED="1417561815339" TEXT="armpmu_register(cpu_pmu, &quot;cpu&quot;, PERF_TYPE_RAW);">
<node CREATED="1417561863417" ID="ID_313371250" MODIFIED="1417561864494" TEXT="armpmu_init(armpmu);">
<node CREATED="1417819959282" ID="ID_587945218" MODIFIED="1417819974791" TEXT="&#x521d;&#x59cb;&#x5316;armpmu-&gt;pmu&#x4e2d;&#x7684;&#x51fd;&#x6570;&#x6307;&#x9488;"/>
</node>
<node CREATED="1417561883204" ID="ID_1600805030" MODIFIED="1417561883939" TEXT="perf_pmu_register(&amp;armpmu-&gt;pmu, name, type);"/>
</node>
<node CREATED="1417561828604" ID="ID_885850468" MODIFIED="1417561829451" TEXT="cpu_pm_register_notifier(&amp;perf_cpu_pm_notifier_block);"/>
</node>
</node>
</node>
<node CREATED="1417638746199" FOLDED="true" ID="ID_1040918165" MODIFIED="1417820745806" POSITION="right" TEXT="PMU">
<node CREATED="1417638847372" FOLDED="true" ID="ID_69528061" MODIFIED="1417658082179" TEXT="&#x539f;&#x7406;">
<node CREATED="1417638859767" ID="ID_622105227" MODIFIED="1417641210237">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      PMU&#26159;&#19968;&#20010;&#24615;&#33021;&#30417;&#25511;&#37096;&#20214;, &#29992;&#20110;&#32479;&#35745;&#21508;&#31181;&#36719;&#20214;&#30340;&#21644;&#30828;&#20214;&#30340;&#20107;&#20214;,&#26681;&#25454;&#36825;&#20123;&#32479;&#35745;&#25968;&#25454;,&#21487;&#20197;&#20998;&#26512;&#31995;&#32479;&#30340;&#24615;&#33021;.
    </p>
    <p>
      &#27880;&#24847;PMU&#26159;per CPU&#30340;, &#20063;&#23601;&#26159;&#35828;&#22312;&#22810;&#26680;&#31995;&#32479;&#20013;,&#27599;&#20010;CPU&#37117;&#26377;&#19968;&#20010;PMU. &#21478;&#22806;&#33455;&#29255;&#35774;&#35745;&#21378;&#21830;&#21487;&#33021;&#36824;&#20250;&#35774;&#35745;&#39069;&#22806;&#30340;PMU&#29992;&#20110;&#32479;&#35745;&#20854;&#23427;&#20107;&#20214;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417638977614" ID="ID_466548543" MODIFIED="1417639099192" TEXT="PMU&#x662f;arm&#x5b9a;&#x4e49;&#x7684;&#x4e00;&#x5957;&#x5173;&#x4e8e;&#x6027;&#x80fd;&#x76d1;&#x63a7;&#x7684;&#x89c4;&#x8303;, &#x73b0;&#x6709;PMUv1&#x548c;PMUv2&#x4e24;&#x4e2a;&#x7248;&#x672c;, &#x89c1;&#x6587;&#x6863;ARM_architecture_reference_manual"/>
<node CREATED="1417639170853" ID="ID_1650760574" MODIFIED="1417639212927">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_block_1.png" />
  </body>
</html></richcontent>
<node CREATED="1417639279821" ID="ID_131846403" MODIFIED="1417640845217" TEXT="PMU&#x5b9a;&#x4e49;&#x4e86;32&#x4e2a;&#x8ba1;&#x6570;&#x5668;, &#x5176;&#x4e2d;&#x4e00;&#x4e2a;cycle counter&#x56fa;&#x5b9a;&#x7528;&#x4e8e;&#x7edf;&#x8ba1;CPU cycle, &#x5176;&#x4ed6;31&#x4e2a;counter&#x53ef;&#x4ee5;&#x7f16;&#x7a0b;&#x7528;&#x4e8e;&#x7edf;&#x8ba1;&#x6307;&#x5b9a;&#x7684;&#x4e8b;&#x4ef6;, &#x6bcf;&#x4e2a;&#x8ba1;&#x6570;&#x5668;&#x6709;&#x4e00;&#x4e2a;id, &#x5bf9;&#x5e94;0-31, &#x6ce8;&#x610f;31&#x56fa;&#x5b9a;&#x7528;&#x4e8e;cycle counter"/>
<node CREATED="1417640022087" ID="ID_113417479" MODIFIED="1417640043394" TEXT="PMU&#x5b9a;&#x4e49;&#x4e86;3&#x79cd;&#x8bbf;&#x95ee;PMU&#x7684;&#x65b9;&#x5f0f;">
<node CREATED="1417640049253" ID="ID_1928525642" MODIFIED="1417640078194" TEXT="&#x901a;&#x8fc7;&#x534f;&#x5904;&#x7406;&#x5668;CP15&#x8bbf;&#x95ee;"/>
<node CREATED="1417640080608" ID="ID_1381475229" MODIFIED="1417640167044" TEXT="&#x5c06;PMU&#x7684;&#x5bc4;&#x5b58;&#x5668;&#x6620;&#x5c04;&#x5230;CPU&#x7684;&#x5185;&#x5b58;&#x5730;&#x5740;&#x7a7a;&#x95f4;, &#x8f6f;&#x4ef6;&#x7528;&#x666e;&#x901a;&#x7684;&#x5185;&#x5b58;&#x8bbf;&#x95ee;&#x5f62;&#x5f0f;&#x8bbf;&#x95ee;PMU&#x5bc4;&#x5b58;&#x5668;"/>
<node CREATED="1417640174567" ID="ID_838904870" MODIFIED="1417640230727" TEXT="&#x901a;&#x8fc7;&#x5916;&#x90e8;debug&#x8bbe;&#x5907;&#x6765;&#x8bbf;&#x95ee;, &#x5982;trace"/>
</node>
<node CREATED="1417640458166" ID="ID_584823158" MODIFIED="1417640986278" TEXT="&#x8ba1;&#x6570;&#x5668;&#x6ea2;&#x51fa;&#x65f6;, PMOVSR&#x5bc4;&#x5b58;&#x5668;&#x4e2d;&#x8fd9;&#x4e2a;&#x8ba1;&#x6570;&#x5668;id&#x5bf9;&#x5e94;&#x7684;bit&#x4f1a;&#x7f6e;&#x4f4d;, &#x540c;&#x65f6;&#x4f1a;&#x5411;CPU&#x53d1;&#x51fa;&#x4e00;&#x4e2a;&#x4e2d;&#x65ad;&#x4fe1;&#x53f7;, &#x800c;&#x8ba1;&#x6570;&#x5668;&#x5219;&#x7ee7;&#x7eed;&#x8ba1;&#x6570;"/>
<node CREATED="1417641770815" ID="ID_561220857" MODIFIED="1417641813456" TEXT="&#x9664;&#x4e86;cycle counter&#x4e4b;&#x5916;&#x5176;&#x5b83;&#x6bcf;&#x4e2a;&#x8ba1;&#x6570;&#x5668;&#x90fd;&#x53ef;&#x4ee5;&#x7f16;&#x7a0b;&#x7528;&#x4e8e;&#x7edf;&#x8ba1;&#x7279;&#x5b9a;&#x7c7b;&#x578b;&#x7684;&#x4e8b;&#x4ef6;"/>
</node>
<node CREATED="1417639589175" ID="ID_928131551" MODIFIED="1417639620556" TEXT="PMU&#x63d0;&#x4f9b;&#x7684;&#x8f6f;&#x4ef6;&#x63a5;&#x53e3;">
<node CREATED="1417639621702" ID="ID_156231478" MODIFIED="1417641628824">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20840;&#23616;enable/disable&#25152;&#26377;&#35745;&#25968;&#22120;
    </p>
    <p>
      enable/disable&#26576;&#20010;&#29305;&#23450;&#30340;&#35745;&#25968;&#22120;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417639666238" ID="ID_1474983280" MODIFIED="1417639695723" TEXT="reset&#x67d0;&#x4e2a;&#x7279;&#x5b9a;&#x7684;&#x8ba1;&#x6570;&#x5668;"/>
<node CREATED="1417639697861" ID="ID_97159576" MODIFIED="1417639704876" TEXT="read/write&#x67d0;&#x4e2a;&#x7279;&#x5b9a;&#x7684;&#x8ba1;&#x6570;&#x5668;"/>
<node CREATED="1417639711877" ID="ID_1769430778" MODIFIED="1417639744074" TEXT="&#x6807;&#x8bb0;&#x67d0;&#x4e2a;&#x8ba1;&#x6570;&#x5668;&#x662f;&#x5426;&#x5df2;&#x7ecf;overflow&#x6ea2;&#x51fa;"/>
<node CREATED="1417639751871" ID="ID_520822379" MODIFIED="1417639811410" TEXT="&#x8ba1;&#x6570;&#x5668;&#x6ea2;&#x51fa;&#x65f6;&#x5411;CPU&#x53d1;&#x51fa;&#x4e2d;&#x65ad;"/>
<node CREATED="1417639814150" ID="ID_502445938" MODIFIED="1417639845420" TEXT="enable/disable&#x8ba1;&#x6570;&#x5668;&#x6ea2;&#x51fa;&#x65f6;&#x662f;&#x5426;&#x5411;CPU&#x53d1;&#x51fa;&#x4e2d;&#x65ad;"/>
<node CREATED="1417639887373" ID="ID_500792494" MODIFIED="1417639921282" TEXT="&#x4e3a;&#x67d0;&#x4e2a;&#x8ba1;&#x6570;&#x5668;&#x6307;&#x5b9a;&#x8981;&#x7edf;&#x8ba1;&#x7684;&#x4e8b;&#x4ef6;&#x7c7b;&#x578b;"/>
<node CREATED="1417640407982" ID="ID_1130327301" MODIFIED="1417640436450" TEXT="&#x662f;&#x5426;&#x5141;&#x8bb8;&#x7528;&#x6237;&#x7a7a;&#x95f4;&#x7684;&#x7a0b;&#x5e8f;&#x8bbf;&#x95ee;PMU&#x8ba1;&#x6570;&#x5668;"/>
</node>
</node>
<node CREATED="1417809077651" ID="ID_1387070724" MODIFIED="1417809078707" TEXT="&#x5bc4;&#x5b58;&#x5668;">
<node CREATED="1417640610240" FOLDED="true" ID="ID_590332510" MODIFIED="1417819894133" TEXT="ARM&#x6807;&#x51c6;&#x5bc4;&#x5b58;&#x5668;">
<node CREATED="1417640618568" ID="ID_1680287977" MODIFIED="1417640626389">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_registers_1.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417645861996" FOLDED="true" ID="ID_232075907" MODIFIED="1417812121840" TEXT="PMCR, Performance Monitors Control Register">
<node CREATED="1417646092515" ID="ID_1060288839" MODIFIED="1417646099595">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMCR.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417646121764" ID="ID_1409752943" MODIFIED="1417646123719" TEXT="IMP, bits[31:24]">
<node CREATED="1417646145844" ID="ID_1613106629" MODIFIED="1417646148083" TEXT="Implementer code. This field is RO with an IMPLEMENTATION DEFINED value"/>
</node>
<node CREATED="1417646161355" ID="ID_1213177213" MODIFIED="1417646163201" TEXT="IDCODE, bits[23:16]">
<node CREATED="1417646172957" ID="ID_1972801262" MODIFIED="1417646174902" TEXT="Identification code. This field is RO with an IMPLEMENTATION DEFINED value."/>
</node>
<node CREATED="1417646188338" ID="ID_357567649" MODIFIED="1417646190326" TEXT="N, bits[15:11]">
<node CREATED="1417646206277" ID="ID_992797334" MODIFIED="1417646208329" TEXT="Number of event counters. This field is RO with an IMPLEMENTATION DEFINED value that indicates the number of counters implemented."/>
<node CREATED="1417646245771" ID="ID_1245842232" MODIFIED="1417646247814" TEXT="An implementation can implement only the Cycle Count Register, PMCCNTR. This is indicated by a value of 0b00000 for the N field."/>
</node>
<node CREATED="1417646277100" ID="ID_1649752666" MODIFIED="1417646279279" TEXT="DP, bit[5]">
<node CREATED="1417646309573" ID="ID_778954264" MODIFIED="1417646312580" TEXT="Disable PMCCNTR when event counting is prohibited."/>
</node>
<node CREATED="1417646325107" ID="ID_426182526" MODIFIED="1417646327615" TEXT="X, bit[4]">
<node CREATED="1417646348779" ID="ID_1642922238" MODIFIED="1417646350905" TEXT="This bit enables the exporting of events to another debug device, such as a trace macrocell, over an event bus."/>
</node>
<node CREATED="1417646364109" ID="ID_1423323975" MODIFIED="1417646366243" TEXT="D, bit[3]">
<node CREATED="1417646386589" ID="ID_1055898608" MODIFIED="1417646388565" TEXT="Cycle counter clock divider.">
<node CREATED="1417646400517" ID="ID_1524873244" MODIFIED="1417646402408" TEXT="0 When enabled, PMCCNTR counts every clock cycle."/>
<node CREATED="1417646422619" ID="ID_1711492555" MODIFIED="1417646424795" TEXT="1 When enabled, PMCCNTR counts once every 64 clock cycles."/>
</node>
</node>
<node CREATED="1417646443557" ID="ID_938321378" MODIFIED="1417646445803" TEXT="C, bit[2]">
<node CREATED="1417646462461" ID="ID_556822404" MODIFIED="1417646464647" TEXT="Cycle counter reset. This bit is WO.">
<node CREATED="1417646496285" ID="ID_647324668" MODIFIED="1417646496796" TEXT="0 No action."/>
<node CREATED="1417646483555" ID="ID_584955015" MODIFIED="1417646484204" TEXT="1 Reset PMCCNTR to zero.">
<node CREATED="1417646593085" ID="ID_716761192" MODIFIED="1417646595418" TEXT="Resetting PMCCNTR does not clear the PMCCNTR overflow bit to 0."/>
</node>
</node>
</node>
<node CREATED="1417646513197" ID="ID_417845512" MODIFIED="1417646515127" TEXT="P, bit[1]">
<node CREATED="1417646528987" ID="ID_508074363" MODIFIED="1417646529487" TEXT="Event counter reset. This bit is WO.">
<node CREATED="1417646496285" ID="ID_1154703362" MODIFIED="1417646496796" TEXT="0 No action."/>
<node CREATED="1417646547467" ID="ID_1164629685" MODIFIED="1417646549648" TEXT="1 Reset all event counters, not including PMCCNTR, to zero.">
<node CREATED="1417646579101" ID="ID_1235304682" MODIFIED="1417646581261" TEXT="Resetting the event counters does not clear any overflow bits to 0."/>
</node>
</node>
</node>
<node CREATED="1417646607099" ID="ID_1700250965" MODIFIED="1417646608919" TEXT="E, bit[0]">
<node CREATED="1417646627509" ID="ID_452245107" MODIFIED="1417646630863" TEXT="0 All counters, including PMCCNTR, are disabled."/>
<node CREATED="1417646641203" ID="ID_898578483" MODIFIED="1417646642935" TEXT="1 All counters are enabled."/>
</node>
<node CREATED="1417646678653" ID="ID_1316805482" MODIFIED="1417646680931" TEXT="Accessing the PMCR">
<node CREATED="1417646702347" ID="ID_1361491407" MODIFIED="1417646774606">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MRC p15, 0, &lt;Rt&gt;, c9, c12, 0&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;; Read PMCR into Rt
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417646766795" ID="ID_1967124255" MODIFIED="1417646768843" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c12, 0        ; Write Rt to PMCR"/>
</node>
</node>
<node CREATED="1417646820300" FOLDED="true" ID="ID_1078478946" MODIFIED="1417761988257" TEXT="PMCNTENSET, Performance Monitors Count Enable Set register">
<node CREATED="1417646910885" ID="ID_953120746" MODIFIED="1417646917340">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMCNTENSET.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417646936395" ID="ID_1921924866" MODIFIED="1417646938567" TEXT="C, bit[31]">
<node CREATED="1417646948715" ID="ID_250395716" MODIFIED="1417646950654" TEXT="PMCCNTR enable bit"/>
</node>
<node CREATED="1417646977659" ID="ID_1275523012" MODIFIED="1417646979527" TEXT="Px, bit[x], for x = 0 to (N&#x2013;1)">
<node CREATED="1417646989477" ID="ID_289218712" MODIFIED="1417646991463" TEXT="Event counter x, PMNx, enable bit."/>
</node>
<node CREATED="1417647052413" ID="ID_63880386" MODIFIED="1417647054931" TEXT="Accessing the PMCNTENSET register">
<node CREATED="1417647068606" ID="ID_1215469713" MODIFIED="1417647085237" TEXT="MRC p15, 0, &lt;Rt&gt;, c9, c12, 1        ; Read PMCNTENSET into Rt"/>
<node CREATED="1417647098979" ID="ID_1673865023" MODIFIED="1417647118291" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c12, 1        ; Write Rt to PMCNTENSET"/>
</node>
</node>
<node CREATED="1417646820300" FOLDED="true" ID="ID_8308007" MODIFIED="1417762620850" TEXT="PMCNTENCLR, Performance Monitors Count Enable Clear register">
<node CREATED="1417646910885" ID="ID_496921698" MODIFIED="1417646917340">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMCNTENSET.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417646936395" ID="ID_641004445" MODIFIED="1417646938567" TEXT="C, bit[31]">
<node CREATED="1417646948715" ID="ID_1743183245" MODIFIED="1417646950654" TEXT="PMCCNTR enable bit"/>
</node>
<node CREATED="1417646977659" ID="ID_526945849" MODIFIED="1417646979527" TEXT="Px, bit[x], for x = 0 to (N&#x2013;1)">
<node CREATED="1417646989477" ID="ID_1721365465" MODIFIED="1417646991463" TEXT="Event counter x, PMNx, enable bit."/>
</node>
<node CREATED="1417647052413" ID="ID_328362436" MODIFIED="1417762107947" TEXT="Accessing the PMCNTENCLR register">
<node CREATED="1417647068606" ID="ID_2650327" MODIFIED="1417762114079" TEXT="MRC p15, 0, &lt;Rt&gt;, c9, c12, 2        ; Read PMCNTENCLR into Rt"/>
<node CREATED="1417647098979" ID="ID_1701362880" MODIFIED="1417762116970" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c12, 2        ; Write Rt to PMCNTENCLR"/>
</node>
</node>
<node CREATED="1417647152373" FOLDED="true" ID="ID_1666195562" MODIFIED="1417649712921" TEXT="PMOVSR, Performance Monitors Overflow Flag Status Register">
<node CREATED="1417647289747" ID="ID_986204806" MODIFIED="1417647296819">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMOVSR.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417647234805" ID="ID_897475055" MODIFIED="1417647236348" TEXT="C, bit[31]">
<node CREATED="1417647250916" ID="ID_1194722508" MODIFIED="1417647252839" TEXT="PMCCNTR overflow bit."/>
</node>
<node CREATED="1417647265317" ID="ID_1310645609" MODIFIED="1417647284930" TEXT="Px, bit[x], for x = 0 to (N&#x2013;1)">
<node CREATED="1417647277149" ID="ID_269948650" MODIFIED="1417647279206" TEXT="Event counter x, PMNx, overflow bit."/>
</node>
<node CREATED="1417647052413" ID="ID_1517439100" MODIFIED="1417647332354" TEXT="Accessing the PMOVSR register">
<node CREATED="1417647068606" ID="ID_200447743" MODIFIED="1417647358564" TEXT="MRC p15, 0, &lt;Rt&gt;, c9, c12, 3;        ; Read PMOVSR into Rt"/>
<node CREATED="1417647098979" ID="ID_777036734" MODIFIED="1417647376062" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c12, 3;        ; Write Rt to PMOVSR"/>
</node>
</node>
<node CREATED="1417647489404" FOLDED="true" ID="ID_810309973" MODIFIED="1417647699103" TEXT="PMSWINC, Performance Monitors Software Increment register">
<node CREATED="1417647552948" ID="ID_1515325927" MODIFIED="1417647561048">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMSWINC.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417647563428" ID="ID_1390422231" MODIFIED="1417647564480" TEXT="Px, bit[x], for x = 0 to (N&#x2013;1)">
<node CREATED="1417647579430" ID="ID_67122298" MODIFIED="1417647581423" TEXT="Event counter x, PMNx, software increment bit. This bit is WO.">
<node CREATED="1417647594172" ID="ID_700606084" MODIFIED="1417647596098" TEXT="0 No action, the write is ignored."/>
<node CREATED="1417647616076" ID="ID_507507089" MODIFIED="1417647617911" TEXT="1, if PMNx is enabled and configured to count the Software increment event Increment the PMNx event counter by 1."/>
</node>
</node>
<node CREATED="1417647637046" ID="ID_1989343732" MODIFIED="1417647639087" TEXT="Accessing the PMSWINC register">
<node CREATED="1417647655068" ID="ID_279368382" MODIFIED="1417647674910">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MCR p15, 0, &lt;Rt&gt;, c9, c12, 4; Write Rt to PMSWINC
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1417647958750" FOLDED="true" ID="ID_1742984589" MODIFIED="1417762633475" TEXT="PMSELR, Performance Monitors Event Counter Selection Register">
<node CREATED="1417648027772" ID="ID_1905981620" MODIFIED="1417648033368">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMSELR.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417648035508" ID="ID_1530339043" MODIFIED="1417648037568" TEXT="SEL, bits[4:0]">
<node CREATED="1417648060748" ID="ID_1272173257" MODIFIED="1417648062400" TEXT="Selects event counter, PMNx, where x is the value held in this field. That is, the SEL field identifies which event counter, PMN SEL , is accessed, when a subsequent access to PMXEVTYPER or PMXEVCNTR occurs."/>
</node>
<node CREATED="1417648082878" ID="ID_934743715" MODIFIED="1417648084856" TEXT="Accessing the PMSELR">
<node CREATED="1417648097116" ID="ID_1691725834" MODIFIED="1417648131082">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MRC p15, 0, &lt;Rt&gt;, c9, c12, 5&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;; Read PMSELR into Rt
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417648132732" ID="ID_982576069" MODIFIED="1417648134359" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c12, 5        ; Write Rt to PMSELR"/>
</node>
</node>
<node CREATED="1417648165286" FOLDED="true" ID="ID_1245845381" MODIFIED="1417648292377" TEXT="PMCEID0 and PMCEID1, Performance Monitors Common Event ID registers">
<node CREATED="1417648197580" ID="ID_390161956" MODIFIED="1417648199481" TEXT="The PMCEIDn registers define which common architectural and common microarchitectural feature events are implemented."/>
<node CREATED="1417648245412" ID="ID_929030718" MODIFIED="1417648261017" TEXT="Every bit means a event type, Event implemented if set to 1 or not implemented if set to 0"/>
</node>
<node CREATED="1417648293869" FOLDED="true" ID="ID_52752770" MODIFIED="1417648822777" TEXT="PMCCNTR, Performance Monitors Cycle Count Register">
<node CREATED="1417648313380" ID="ID_1812669037" MODIFIED="1417648315067" TEXT="The PMCCNTR holds the value of the processor Cycle Counter, CCNT, that counts processor clock cycles."/>
<node CREATED="1417648394037" ID="ID_1446693544" MODIFIED="1417648395769" TEXT="Accessing the PMCCNTR">
<node CREATED="1417648335308" ID="ID_1895775598" MODIFIED="1417648378611">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MRC p15, 0, &lt;Rt&gt;, c9, c13, 0&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;: Read PMCCNTR into Rt
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417648380981" ID="ID_377980445" MODIFIED="1417648382675" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c13, 0        : Write Rt to PMCCNTR"/>
</node>
</node>
<node CREATED="1417648435494" FOLDED="true" ID="ID_356621583" MODIFIED="1417648989106" TEXT="PMXEVTYPER, Performance Monitors Event Type Select Register">
<node CREATED="1417648461605" ID="ID_653983384" MODIFIED="1417648463362" TEXT="When PMSELR.SEL selects an event counter, PMNx, PMXEVTYPER configures which event increments that event counter."/>
<node CREATED="1417648523508" ID="ID_1850584394" MODIFIED="1417648531566">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMXEVTYPER.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417648635341" ID="ID_686690101" MODIFIED="1417648636873" TEXT="P, bit[31]">
<node CREATED="1417648677031" ID="ID_602182954" MODIFIED="1417648680004" TEXT="0 Count events when executing at PL1."/>
<node CREATED="1417648689318" ID="ID_1648370147" MODIFIED="1417648691174" TEXT="1 Do not count events when executing at PL1."/>
</node>
<node CREATED="1417648644783" ID="ID_1668718348" MODIFIED="1417648646553" TEXT="U, bit[30]">
<node CREATED="1417648709541" ID="ID_1502747391" MODIFIED="1417648711705" TEXT="0 Count events when executing at PL0."/>
<node CREATED="1417648724749" ID="ID_1850386687" MODIFIED="1417648726476" TEXT="1 Do not count events when executing at PL0."/>
</node>
<node CREATED="1417648533533" ID="ID_369507942" MODIFIED="1417648535315" TEXT="evtCount, bits[7:0]">
<node CREATED="1417648549254" ID="ID_1212545473" MODIFIED="1417648550990" TEXT="Event to count. The event number of the event that is counted by the selected event counter, PMNx."/>
</node>
<node CREATED="1417648750310" ID="ID_1525892331" MODIFIED="1417648751957" TEXT="Accessing the PMXEVTYPER">
<node CREATED="1417648335308" ID="ID_1072803503" MODIFIED="1417648803851">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MRC p15, 0, &lt;Rt&gt;, c9, c13, 1&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;: Read PMXEVTYPER into Rt
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417648380981" ID="ID_1554448340" MODIFIED="1417648811629" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c13, 1        : Write Rt to PMXEVTYPER"/>
</node>
</node>
<node CREATED="1417648862157" FOLDED="true" ID="ID_922065410" MODIFIED="1417763690717" TEXT="PMXEVCNTR, Performance Monitors Event Count Register">
<node CREATED="1417648889333" ID="ID_1260103907" MODIFIED="1417648891044" TEXT="The PMXEVCNTR reads or writes the value of the selected event counter, PMNx. PMSELR.SEL determines which event counter is selected."/>
<node CREATED="1417648906941" ID="ID_483724286" MODIFIED="1417648908651" TEXT="Accessing the PMXEVCNTR">
<node CREATED="1417648937439" ID="ID_1318928987" MODIFIED="1417648939368" TEXT="Update the PMSELR to select the required event counter, PMNx."/>
<node CREATED="1417648335308" ID="ID_1320032691" MODIFIED="1417648958610">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      MRC p15, 0, &lt;Rt&gt;, c9, c13, 2&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;: Read PMXEVCNTR into Rt
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417648380981" ID="ID_1684531995" MODIFIED="1417648968238" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c13, 2        : Write Rt to PMXEVCNTR"/>
</node>
</node>
<node CREATED="1417647700564" FOLDED="true" ID="ID_983647496" MODIFIED="1417649428569" TEXT="PMUSERENR, Performance Monitors User Enable Register">
<node CREATED="1417647722500" ID="ID_1565609784" MODIFIED="1417647724548" TEXT="PMUSERENR enables or disables User mode access to the Performance Monitors."/>
<node CREATED="1417647786508" ID="ID_1014295616" MODIFIED="1417647793751">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMUSERENR.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417647796278" ID="ID_1099772801" MODIFIED="1417647798228" TEXT="EN, bit[0]">
<node CREATED="1417647808814" ID="ID_701757560" MODIFIED="1417647810684" TEXT="0 User mode access to the Performance Monitors disabled."/>
<node CREATED="1417647823446" ID="ID_1569663060" MODIFIED="1417647825258" TEXT="1 User mode access to the Performance Monitors enabled."/>
</node>
<node CREATED="1417647837572" ID="ID_488967033" MODIFIED="1417647839592" TEXT="Accessing the PMUSERENR">
<node CREATED="1417647850254" ID="ID_33633653" MODIFIED="1417647867845" TEXT="MRC p15, 0, &lt;Rt&gt;, c9, c14, 0        : Read PMUSERENR into Rt"/>
<node CREATED="1417647877484" ID="ID_1164993180" MODIFIED="1417647892945" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c14, 0        : Write Rt to PMUSERENR"/>
</node>
</node>
<node CREATED="1417649014837" FOLDED="true" ID="ID_1389346229" MODIFIED="1417763463886" TEXT="PMINTENSET, Performance Monitors Interrupt Enable Set register">
<node CREATED="1417649071551" ID="ID_1122720743" MODIFIED="1417649083084">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMINTENSET.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417649085039" ID="ID_140637342" MODIFIED="1417649086713" TEXT="C, bit[31]">
<node CREATED="1417649097565" ID="ID_1896042954" MODIFIED="1417649099256" TEXT="PMCCNTR overflow interrupt request enable bit."/>
</node>
<node CREATED="1417649113605" ID="ID_166973490" MODIFIED="1417649115277" TEXT="Px, bit[x], for x = 0 to (N&#x2013;1)">
<node CREATED="1417649128047" ID="ID_353017020" MODIFIED="1417649130188" TEXT="Event counter x, PMNx, overflow interrupt request enable bit."/>
</node>
<node CREATED="1417647837572" ID="ID_1433193999" MODIFIED="1417649169476" TEXT="Accessing the PMINTENSET">
<node CREATED="1417647850254" ID="ID_149150042" MODIFIED="1417649178683" TEXT="MRC p15, 0, &lt;Rt&gt;, c9, c14, 1        : Read PMINTENSET into Rt"/>
<node CREATED="1417647877484" ID="ID_154609910" MODIFIED="1417649186218" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c14, 1        : Write Rt to PMINTENSET"/>
</node>
</node>
<node CREATED="1417649014837" FOLDED="true" ID="ID_1946855375" MODIFIED="1417819452391" TEXT="PMINTENCLR, Performance Monitors Interrupt Enable Clear register">
<node CREATED="1417649071551" ID="ID_140722842" MODIFIED="1417649083084">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMINTENSET.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417649085039" ID="ID_96783628" MODIFIED="1417649086713" TEXT="C, bit[31]">
<node CREATED="1417649097565" ID="ID_1758984610" MODIFIED="1417649099256" TEXT="PMCCNTR overflow interrupt request enable bit."/>
</node>
<node CREATED="1417649113605" ID="ID_1056451737" MODIFIED="1417649115277" TEXT="Px, bit[x], for x = 0 to (N&#x2013;1)">
<node CREATED="1417649128047" ID="ID_786889146" MODIFIED="1417649130188" TEXT="Event counter x, PMNx, overflow interrupt request enable bit."/>
</node>
<node CREATED="1417647837572" ID="ID_13556193" MODIFIED="1417649169476" TEXT="Accessing the PMINTENSET">
<node CREATED="1417647850254" ID="ID_178282650" MODIFIED="1417819432698" TEXT="MRC p15, 0, &lt;Rt&gt;, c9, c14, 2        : Read PMINTENCLR into Rt"/>
<node CREATED="1417647877484" ID="ID_1850083386" MODIFIED="1417819446581" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c14, 2        : Write Rt to PMINTENCLR"/>
</node>
</node>
<node CREATED="1417649220151" FOLDED="true" ID="ID_1032536157" MODIFIED="1417649711441" TEXT="PMOVSSET, Performance Monitors Overflow Flag Status Set register">
<node CREATED="1417649416174" ID="ID_1592463447" MODIFIED="1417649421981">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_reg_PMOVSSET.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417647234805" ID="ID_423783809" MODIFIED="1417647236348" TEXT="C, bit[31]">
<node CREATED="1417647250916" ID="ID_1270009689" MODIFIED="1417649509096" TEXT="PMCCNTR overflow bit."/>
</node>
<node CREATED="1417647265317" ID="ID_1281082245" MODIFIED="1417647284930" TEXT="Px, bit[x], for x = 0 to (N&#x2013;1)">
<node CREATED="1417647277149" ID="ID_1173899702" MODIFIED="1417647279206" TEXT="Event counter x, PMNx, overflow bit."/>
</node>
<node CREATED="1417647052413" ID="ID_394491648" MODIFIED="1417649486885" TEXT="Accessing the PMOVSSET register">
<node CREATED="1417647068606" ID="ID_1226928507" MODIFIED="1417649690808" TEXT="MRC p15, 0, &lt;Rt&gt;, c9, c14, 3;        ; Read PMOVSSET into Rt"/>
<node CREATED="1417647098979" ID="ID_1128413144" MODIFIED="1417649698654" TEXT="MCR p15, 0, &lt;Rt&gt;, c9, c14, 3;        ; Write Rt to PMOVSSET"/>
</node>
</node>
</node>
<node CREATED="1417809098448" FOLDED="true" ID="ID_696565307" MODIFIED="1417819892302" TEXT="Krait&#x6269;&#x5c55;&#x5bc4;&#x5b58;&#x5668;">
<node CREATED="1417809126267" ID="ID_1795485970" MODIFIED="1417809149714">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_registers_2.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417809153187" ID="ID_130164222" MODIFIED="1417809161444">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMU_registers_3.png" />
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1417640668582" ID="ID_436765284" MODIFIED="1417762411085" TEXT="&#x4e8b;&#x4ef6;">
<node CREATED="1417641843535" FOLDED="true" ID="ID_275072693" MODIFIED="1417809049550" TEXT="ARM defined event">
<node CREATED="1417641882273" ID="ID_1588797625" MODIFIED="1417641884764" TEXT="0x00">
<node CREATED="1417641900104" ID="ID_413473739" MODIFIED="1417641901555" TEXT="Instruction architecturally executed, condition code check pass, software increment"/>
</node>
<node CREATED="1417641915240" ID="ID_576350656" MODIFIED="1417641915811" TEXT="0x01">
<node CREATED="1417641926857" ID="ID_1591374810" MODIFIED="1417641927616" TEXT="Level 1 instruction cache refill"/>
</node>
<node CREATED="1417641947103" ID="ID_516274482" MODIFIED="1417641948550" TEXT="0x02">
<node CREATED="1417641959783" ID="ID_71464099" MODIFIED="1417641960432" TEXT="Level 1 instruction TLB refill"/>
</node>
<node CREATED="1417641974367" ID="ID_173689787" MODIFIED="1417641976075" TEXT="0x03">
<node CREATED="1417641988529" ID="ID_1280794140" MODIFIED="1417641991106" TEXT="Level 1 data cache refill"/>
</node>
<node CREATED="1417642001487" ID="ID_1342164892" MODIFIED="1417642003895" TEXT="0x04">
<node CREATED="1417642004695" ID="ID_1522957726" MODIFIED="1417642005684" TEXT="Level 1 data cache access"/>
</node>
<node CREATED="1417642016895" ID="ID_1801679373" MODIFIED="1417642018310" TEXT="0x05">
<node CREATED="1417642019185" ID="ID_691813426" MODIFIED="1417642020406" TEXT="Level 1 data TLB refill"/>
</node>
<node CREATED="1417642041447" ID="ID_1088600268" MODIFIED="1417642043214" TEXT="0x06">
<node CREATED="1417642043921" ID="ID_800259121" MODIFIED="1417642046113" TEXT="Instruction architecturally executed, condition code check pass, load"/>
</node>
<node CREATED="1417642054417" ID="ID_1716817329" MODIFIED="1417642056870" TEXT="0x07">
<node CREATED="1417642057304" ID="ID_171068816" MODIFIED="1417642058388" TEXT="Instruction architecturally executed, condition code check pass, store"/>
</node>
<node CREATED="1417642071457" ID="ID_1155044086" MODIFIED="1417642073344" TEXT="0x08">
<node CREATED="1417642074007" ID="ID_1848918598" MODIFIED="1417642074947" TEXT="Instruction architecturally executed"/>
</node>
<node CREATED="1417642087535" ID="ID_914472621" MODIFIED="1417642089481" TEXT="0x09">
<node CREATED="1417642090233" ID="ID_1562315615" MODIFIED="1417642091227" TEXT="Exception taken"/>
</node>
<node CREATED="1417642115474" ID="ID_1890090066" MODIFIED="1417642118764" TEXT="0x0A">
<node CREATED="1417642119273" ID="ID_186076029" MODIFIED="1417642120241" TEXT="Instruction architecturally executed, condition code check pass, exception return"/>
</node>
<node CREATED="1417642131033" ID="ID_1252021549" MODIFIED="1417642134116" TEXT="0x0B">
<node CREATED="1417642134743" ID="ID_1694153865" MODIFIED="1417642136033" TEXT="Instruction architecturally executed, condition code check pass, write to CONTEXTIDR"/>
</node>
<node CREATED="1417642146497" ID="ID_980667077" MODIFIED="1417642149440" TEXT="0x0C">
<node CREATED="1417642150289" ID="ID_1616194707" MODIFIED="1417642151368" TEXT="Instruction architecturally executed, condition code check pass, software change of the PC"/>
</node>
<node CREATED="1417642163346" ID="ID_797919805" MODIFIED="1417642166184" TEXT="0x0D">
<node CREATED="1417642166985" ID="ID_1696266483" MODIFIED="1417642167964" TEXT="Instruction architecturally executed, immediate branch"/>
</node>
<node CREATED="1417642179336" ID="ID_677827631" MODIFIED="1417642181414" TEXT="0x0E">
<node CREATED="1417642182001" ID="ID_847435488" MODIFIED="1417642182868" TEXT="Instruction architecturally executed, condition code check pass, procedure return"/>
</node>
<node CREATED="1417642193991" ID="ID_1114393120" MODIFIED="1417642197347" TEXT="0x0F">
<node CREATED="1417642198271" ID="ID_1919741387" MODIFIED="1417642199276" TEXT="Instruction architecturally executed, condition code check pass, unaligned load or store"/>
</node>
<node CREATED="1417642210961" ID="ID_1468117328" MODIFIED="1417642214038" TEXT="0x10">
<node CREATED="1417642214823" ID="ID_253907450" MODIFIED="1417642215670" TEXT="Mispredicted or not predicted branch speculatively executed"/>
</node>
<node CREATED="1417642228913" ID="ID_1883818575" MODIFIED="1417642231315" TEXT="0x11">
<node CREATED="1417642232679" ID="ID_1405506806" MODIFIED="1417642233800" TEXT="Cycle"/>
</node>
<node CREATED="1417642248015" ID="ID_1782754679" MODIFIED="1417642250276" TEXT="0x12">
<node CREATED="1417642250920" ID="ID_558908689" MODIFIED="1417642251835" TEXT="Predictable branch speculatively executed"/>
</node>
<node CREATED="1417642264407" ID="ID_326988809" MODIFIED="1417642266238" TEXT="0x13">
<node CREATED="1417642267177" ID="ID_741215440" MODIFIED="1417642268036" TEXT="Data memory access"/>
</node>
<node CREATED="1417642279895" ID="ID_1525175475" MODIFIED="1417642281744" TEXT="0x14">
<node CREATED="1417642282538" ID="ID_1057326112" MODIFIED="1417642283388" TEXT="Level 1 instruction cache access"/>
</node>
<node CREATED="1417642295768" ID="ID_1680674954" MODIFIED="1417642298080" TEXT="0x15">
<node CREATED="1417642298872" ID="ID_1228492642" MODIFIED="1417642299789" TEXT="Level 1 data cache write-back"/>
</node>
<node CREATED="1417642311576" ID="ID_300222565" MODIFIED="1417642313910" TEXT="0x16">
<node CREATED="1417642314792" ID="ID_1013270103" MODIFIED="1417642315716" TEXT="Level 2 data cache access"/>
</node>
<node CREATED="1417642328519" ID="ID_405057228" MODIFIED="1417642330868" TEXT="0x17">
<node CREATED="1417642331657" ID="ID_876541582" MODIFIED="1417642332603" TEXT="Level 2 data cache refill"/>
</node>
<node CREATED="1417642344456" ID="ID_1995926705" MODIFIED="1417642346192" TEXT="0x18">
<node CREATED="1417642346977" ID="ID_878847002" MODIFIED="1417642347884" TEXT="Level 2 data cache write-back"/>
</node>
<node CREATED="1417642358552" ID="ID_1046847889" MODIFIED="1417642360245" TEXT="0x19">
<node CREATED="1417642361080" ID="ID_1879510015" MODIFIED="1417642361967" TEXT="Bus access"/>
</node>
<node CREATED="1417642372760" ID="ID_966910360" MODIFIED="1417642375144" TEXT="0x1A">
<node CREATED="1417642375847" ID="ID_198803463" MODIFIED="1417642376724" TEXT="Local memory error"/>
</node>
<node CREATED="1417642390359" ID="ID_397086494" MODIFIED="1417642392196" TEXT="0x1B">
<node CREATED="1417642392985" ID="ID_116910603" MODIFIED="1417642393823" TEXT="Instruction speculatively executed"/>
</node>
<node CREATED="1417642405575" ID="ID_148731979" MODIFIED="1417642407561" TEXT="0x1C">
<node CREATED="1417642408201" ID="ID_1426749377" MODIFIED="1417642409055" TEXT="Instruction architecturally executed, condition code check pass, write to TTBR"/>
</node>
<node CREATED="1417642426257" ID="ID_386394163" MODIFIED="1417642428852" TEXT="0x1D">
<node CREATED="1417642421215" ID="ID_1034331774" MODIFIED="1417642424588" TEXT="Bus cycle"/>
</node>
</node>
<node CREATED="1417642244376" FOLDED="true" ID="ID_897189207" MODIFIED="1417809058841" TEXT="krait defined event">
<node CREATED="1417650991879" ID="ID_1873440259" MODIFIED="1417657332312" TEXT="krait defined event is selected by two register: PMSELR and PMRESR0/1/2">
<node CREATED="1417657857351" FOLDED="true" ID="ID_814091171" MODIFIED="1417809057020" TEXT="PMRESR0">
<node CREATED="1417657860910" ID="ID_1985677076" MODIFIED="1417657867326">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMRESR0_1.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417657871342" ID="ID_933088054" MODIFIED="1417657876263">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMRESR0_2.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417657878613" ID="ID_194787264" MODIFIED="1417657883073">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMRESR0_3.png" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1417657902109" FOLDED="true" ID="ID_692025820" MODIFIED="1417658067936" TEXT="PMRESR1">
<node CREATED="1417658023989" ID="ID_1986891031" MODIFIED="1417658029276">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMRESR1.png" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1417658038846" FOLDED="true" ID="ID_1372423616" MODIFIED="1417658069425" TEXT="PMRESR2">
<node CREATED="1417658042764" ID="ID_583513802" MODIFIED="1417658048624">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMRESR2_1.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1417658051887" ID="ID_1155561304" MODIFIED="1417658056819">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/PMRESR2_2.png" />
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1417650928462" ID="ID_1537235144" MODIFIED="1417650930372" TEXT="0xCC">
<node CREATED="1417650942927" ID="ID_1197500515" MODIFIED="1417650945036" TEXT="PMRESR0 group 0 event"/>
<node CREATED="1417650991879" ID="ID_1262492046" MODIFIED="1417657342112" TEXT="This code selects the implementation-defined event selected by PMRESR0 in the group 0 event column"/>
</node>
<node CREATED="1417657376804" ID="ID_796632217" MODIFIED="1417657378074" TEXT="0xCD">
<node CREATED="1417657389460" ID="ID_1023130839" MODIFIED="1417657391522" TEXT="PMRESR0 group 1 event"/>
</node>
<node CREATED="1417657409246" ID="ID_42329899" MODIFIED="1417657409848" TEXT="0xCE">
<node CREATED="1417657418732" ID="ID_1503165246" MODIFIED="1417657419338" TEXT="PMRESR0 group 2 event"/>
</node>
<node CREATED="1417657430820" ID="ID_998241695" MODIFIED="1417657431529" TEXT="0xCF">
<node CREATED="1417657442422" ID="ID_1957238437" MODIFIED="1417657444537" TEXT="PMRESR0 group 3 event"/>
</node>
<node CREATED="1417657453756" ID="ID_1453434025" MODIFIED="1417657454477" TEXT="0xD0">
<node CREATED="1417657469278" ID="ID_26198744" MODIFIED="1417657469892" TEXT="PMRESR1 group 0 event"/>
</node>
<node CREATED="1417657483853" ID="ID_1091328249" MODIFIED="1417657484788" TEXT="0xD1">
<node CREATED="1417657550023" ID="ID_1762088443" MODIFIED="1417657550705" TEXT="PMRESR1 group 1 event"/>
</node>
<node CREATED="1417657485284" ID="ID_986956962" MODIFIED="1417657492881" TEXT="0xD2">
<node CREATED="1417657554110" ID="ID_304672424" MODIFIED="1417657557157" TEXT="PMRESR1 group 2 event"/>
</node>
<node CREATED="1417657486701" ID="ID_283795064" MODIFIED="1417657498297" TEXT="0xD3">
<node CREATED="1417657559172" ID="ID_1229999276" MODIFIED="1417657562833" TEXT="PMRESR1 group 3 event"/>
</node>
<node CREATED="1417657486701" ID="ID_777859692" MODIFIED="1417657516993" TEXT="0xD4">
<node CREATED="1417657580758" ID="ID_1594805705" MODIFIED="1417657582409" TEXT="PMRESR2 group 0 event"/>
</node>
<node CREATED="1417657486701" ID="ID_637797949" MODIFIED="1417657520026" TEXT="0xD5">
<node CREATED="1417657584972" ID="ID_764406596" MODIFIED="1417657588337" TEXT="PMRESR2 group 1 event"/>
</node>
<node CREATED="1417657486701" ID="ID_1243732806" MODIFIED="1417657524389" TEXT="0xD6">
<node CREATED="1417657589885" ID="ID_408031365" MODIFIED="1417657593237" TEXT="PMRESR2 group 2 event"/>
</node>
<node CREATED="1417657486701" ID="ID_110239018" MODIFIED="1417657527837" TEXT="0xD7">
<node CREATED="1417657595374" ID="ID_1533061620" MODIFIED="1417657598810" TEXT="PMRESR2 group 3 event"/>
</node>
<node CREATED="1417657486701" ID="ID_1975302030" MODIFIED="1417657531361" TEXT="0xD8">
<node CREATED="1417657617317" ID="ID_923844791" MODIFIED="1417657618349" TEXT="VPMRESR0 group 0 event"/>
</node>
<node CREATED="1417657486701" ID="ID_1440807742" MODIFIED="1417657534665" TEXT="0xD9">
<node CREATED="1417657620229" ID="ID_1989684591" MODIFIED="1417657623505" TEXT="VPMRESR0 group 1 event"/>
</node>
<node CREATED="1417657625837" ID="ID_58904718" MODIFIED="1417657629845" TEXT="0xDA">
<node CREATED="1417657630758" ID="ID_431432857" MODIFIED="1417657633769" TEXT="VPMRESR0 group 2 event"/>
</node>
<node CREATED="1417657635564" ID="ID_803913665" MODIFIED="1417657639325" TEXT="0xDB">
<node CREATED="1417657640325" ID="ID_1027301995" MODIFIED="1417657643481" TEXT="VPMRESR0 group 3 event"/>
</node>
</node>
</node>
</node>
<node CREATED="1417561893729" ID="ID_1441249232" MODIFIED="1417658095997" POSITION="left" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1417564876079" FOLDED="true" ID="ID_1072699433" MODIFIED="1417820737767" TEXT="struct arm_pmu">
<node CREATED="1417564932083" FOLDED="true" ID="ID_985795687" MODIFIED="1417820735743" TEXT=" struct pmu pmu">
<node CREATED="1417562084313" ID="ID_1676836714" MODIFIED="1417658505469" TEXT="struct pmu">
<node CREATED="1417562298422" MODIFIED="1417562298422" TEXT=" struct list_head entry"/>
<node CREATED="1417562298422" MODIFIED="1417562298422" TEXT=" struct device *dev"/>
<node CREATED="1417562298422" FOLDED="true" ID="ID_206055933" MODIFIED="1417810783717">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const struct attribute_group **attr_groups
    </p>
    <p>
      &#29992;&#20110;&#25551;&#36848;raw event&#30340;NRCCG&#26684;&#24335;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417760927331" ID="ID_1338042110" MODIFIED="1417760934175" TEXT="const char *name;"/>
<node CREATED="1417760945599" ID="ID_1612956294" MODIFIED="1417760968625">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      umode_t (*is_visible)(struct kobject *, struct attribute *, int);
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417760982896" ID="ID_1626199480" MODIFIED="1417761019413">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct attribute **attrs;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1417562298422" ID="ID_23756417" MODIFIED="1417562298422" TEXT=" char *name"/>
<node CREATED="1417562298422" ID="ID_5074619" MODIFIED="1417562298422" TEXT=" int type"/>
<node CREATED="1417562298422" MODIFIED="1417562298422" TEXT=" int * __percpu pmu_disable_count"/>
<node CREATED="1417562298422" MODIFIED="1417562298422" TEXT=" struct perf_cpu_context * __percpu pmu_cpu_context"/>
<node CREATED="1417562298422" MODIFIED="1417562298422" TEXT=" int task_ctx_nr"/>
<node CREATED="1417562298422" FOLDED="true" ID="ID_958854620" MODIFIED="1417812356120">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*pmu_enable) (struct pmu *pmu)
    </p>
    <p>
      &#21551;&#29992;PMU, &#24182;&#19988;enable&#38656;&#35201;&#32479;&#35745;&#30340;&#20107;&#20214;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417565049872" ID="ID_1447144983" MODIFIED="1417565051001" TEXT="armpmu_enable">
<node CREATED="1417811667931" ID="ID_1388627086" LINK="#ID_1240971005" MODIFIED="1417811907638" TEXT="enable&#x9700;&#x8981;&#x7edf;&#x8ba1;&#x7684;&#x4e8b;&#x4ef6;, &#x6ce8;&#x610f;&#x9700;&#x8981;&#x7edf;&#x8ba1;&#x7684;&#x4e8b;&#x4ef6;&#x7531;&#x8c03;&#x7528;struct arm_pmu-&gt;get_hw_events()&#x83b7;&#x53d6;"/>
<node CREATED="1417811752507" ID="ID_1242870868" LINK="#ID_708104911" MODIFIED="1417811921224" TEXT="&#x542f;&#x7528;PMU: struct arm_pmu-&gt;start()"/>
</node>
</node>
<node CREATED="1417562298422" FOLDED="true" ID="ID_474155422" MODIFIED="1417812355438">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*pmu_disable) (struct pmu *pmu)
    </p>
    <p>
      &#20572;&#27490;PMU, &#20572;&#27490;PMU&#20013;&#25152;&#26377;&#35745;&#25968;&#22120;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417565063316" ID="ID_1437674107" MODIFIED="1417565064486" TEXT="armpmu_disable">
<node CREATED="1417812319334" ID="ID_1844072302" LINK="#ID_1060207351" MODIFIED="1417812352272" TEXT="&#x505c;&#x6b62;PMU: struct arm_pmu-&gt;stop()"/>
</node>
</node>
<node CREATED="1417562298422" ID="ID_310303967" MODIFIED="1417562298422" TEXT=" int (*event_init) (struct perf_event *event)">
<node CREATED="1417565076663" ID="ID_54629977" MODIFIED="1417565077273" TEXT="armpmu_event_init"/>
</node>
<node CREATED="1417562298422" FOLDED="true" ID="ID_1157950209" MODIFIED="1417818237758">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*add) (struct perf_event *event, int flags)
    </p>
    <p>
      &#23558;&#20107;&#20214;&#25918;&#20837;PMU&#30340;hw_events&#21015;&#34920;,&#21363;&#38656;&#35201;&#32479;&#35745;&#30340;&#20107;&#20214;&#21015;&#34920;,&#20294;&#26159;&#24182;&#19981;&#30495;&#27491;&#24320;&#22987;&#32479;&#35745;&#27492;&#20107;&#20214;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417565088845" ID="ID_706226681" MODIFIED="1417565089458" TEXT="armpmu_add">
<node CREATED="1417817527819" ID="ID_1776695336" MODIFIED="1417817535598" TEXT="&#x505c;&#x6b62;PMU"/>
<node CREATED="1417817548178" ID="ID_1424585995" MODIFIED="1417817557674" TEXT="&#x4e3a;&#x4e8b;&#x4ef6;&#x5206;&#x914d;&#x4e00;&#x4e2a;&#x8ba1;&#x6570;&#x5668;"/>
<node CREATED="1417817582392" ID="ID_149977578" MODIFIED="1417817583263" TEXT="&#x5c06;&#x4e8b;&#x4ef6;&#x653e;&#x5165;PMU&#x7684;hw_events&#x5217;&#x8868;,&#x5373;&#x9700;&#x8981;&#x7edf;&#x8ba1;&#x7684;&#x4e8b;&#x4ef6;&#x5217;&#x8868;"/>
<node CREATED="1417817655379" ID="ID_385495824" MODIFIED="1417817866005" TEXT="&#x5982;&#x679c;flags&#x8981;&#x6c42;&#x5f00;&#x59cb;&#x8ba1;&#x6570;,&#x5219;&#x8c03;&#x7528;armpmu_start enable&#x6b64;&#x4e8b;&#x4ef6;"/>
<node CREATED="1417817873688" ID="ID_1708170469" MODIFIED="1417817880979" TEXT="&#x542f;&#x7528;PMU"/>
</node>
</node>
<node CREATED="1417562298423" FOLDED="true" ID="ID_226685743" MODIFIED="1417818905381">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*del) (struct perf_event *event, int flags)
    </p>
    <p>
      &#20572;&#27490;&#20107;&#20214;,&#24182;&#23558;&#20854;&#20174;PMU&#30340;hw_events&#21015;&#34920;,&#21363;&#38656;&#35201;&#32479;&#35745;&#30340;&#20107;&#20214;&#21015;&#34920;&#20013;&#21024;&#38500;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417565099932" ID="ID_1937182001" MODIFIED="1417565100641" TEXT="armpmu_del">
<node CREATED="1417818361833" ID="ID_371861721" MODIFIED="1417818380931" TEXT="&#x505c;&#x6b62;&#x4e8b;&#x4ef6;: armpmu_stop"/>
<node CREATED="1417818395745" ID="ID_1154122814" LINK="#ID_1337665848" MODIFIED="1417818447359">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      hw_events-&gt;events[idx] = NULL
    </p>
    <p>
      &#23558;&#20107;&#20214;&#20174;PMU&#30340;hw_events&#21015;&#34920;&#20013;&#21024;&#38500;
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node CREATED="1417562298423" FOLDED="true" ID="ID_1157333055" MODIFIED="1417818675020">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*start) (struct perf_event *event, int flags)
    </p>
    <p>
      &#30495;&#27491;&#24320;&#22987;&#32479;&#35745;&#25351;&#23450;&#30340;&#20107;&#20214;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417565111783" ID="ID_1246695915" MODIFIED="1417565112408" TEXT="armpmu_start">
<node CREATED="1417818531713" ID="ID_1037866065" LINK="#ID_1832997802" MODIFIED="1417818554933" TEXT="struct arm_pmu-&gt;enable"/>
</node>
</node>
<node CREATED="1417562298423" ID="ID_150118279" MODIFIED="1417819048928">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*stop) (struct perf_event *event, int flags)
    </p>
    <p>
      &#20572;&#27490;&#32479;&#35745;&#25351;&#23450;&#30340;&#20107;&#20214;,&#20294;&#24182;&#19981;&#23558;&#20854;&#20174;PMU&#30340;hw_events&#21015;&#34920;,&#21363;&#38656;&#35201;&#32479;&#35745;&#30340;&#20107;&#20214;&#21015;&#34920;&#20013;&#21024;&#38500;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417565126140" ID="ID_1920330364" MODIFIED="1417565126921" TEXT="armpmu_stop">
<node CREATED="1417818647905" ID="ID_1361555924" LINK="#ID_3788543" MODIFIED="1417818667702" TEXT="struct arm_pmu-&gt;disable"/>
</node>
</node>
<node CREATED="1417562298423" ID="ID_529491384" MODIFIED="1417819607058">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*read) (struct perf_event *event)
    </p>
    <p>
      &#26356;&#26032;&#20107;&#20214;&#30340;&#32479;&#35745;&#20540;, &#21363;&#37325;&#26032;&#35835;&#21462;&#32479;&#35745;&#36825;&#20010;&#20107;&#20214;&#30340;&#35745;&#25968;&#22120;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417565138103" ID="ID_1307850863" MODIFIED="1417565138905" TEXT="armpmu_read">
<node CREATED="1417819609388" ID="ID_627992713" LINK="#ID_788065576" MODIFIED="1417819627117" TEXT="struct arm_pmu-&gt;read_counter"/>
</node>
</node>
<node CREATED="1417562298423" ID="ID_1108161241" MODIFIED="1417562298423" TEXT=" void (*start_txn) (struct pmu *pmu)"/>
<node CREATED="1417562298423" ID="ID_426534803" MODIFIED="1417562298423" TEXT=" int (*commit_txn) (struct pmu *pmu)"/>
<node CREATED="1417562298423" MODIFIED="1417562298423" TEXT=" void (*cancel_txn) (struct pmu *pmu)"/>
<node CREATED="1417562298423" ID="ID_617887260" MODIFIED="1417562298423" TEXT=" int (*event_idx) (struct perf_event *event)"/>
<node CREATED="1417562298423" MODIFIED="1417562298423" TEXT=" void (*flush_branch_stack) (void)"/>
</node>
</node>
<node CREATED="1417564932083" ID="ID_1424317648" MODIFIED="1417564932083" TEXT=" enum arm_perf_pmu_ids id"/>
<node CREATED="1417564932083" FOLDED="true" ID="ID_675476295" MODIFIED="1417819885534" TEXT=" enum arm_pmu_type type">
<node CREATED="1417810403715" ID="ID_1404587826" MODIFIED="1417810404498" TEXT="ARM_PMU_DEVICE_CPU"/>
<node CREATED="1417810422548" ID="ID_612573092" MODIFIED="1417810423300" TEXT="ARM_PMU_DEVICE_L2CC"/>
<node CREATED="1417810433418" ID="ID_885234083" MODIFIED="1417810544308" TEXT="&#x6bcf;&#x4e2a;CPU&#x6709;&#x4e00;&#x4e2a;PMU, &#x82af;&#x7247;&#x5382;&#x5546;&#x4e5f;&#x53ef;&#x4ee5;&#x8bbe;&#x8ba1;&#x72ec;&#x7acb;&#x4e8e;CPU&#x7684;PMU&#x7528;&#x4e8e;&#x7edf;&#x8ba1;&#x5176;&#x5b83;&#x4e8b;&#x4ef6;"/>
</node>
<node CREATED="1417564932083" ID="ID_1049173992" MODIFIED="1417564932083" TEXT=" cpumask_t active_irqs"/>
<node CREATED="1417564932083" FOLDED="true" ID="ID_1019568959" MODIFIED="1417819887190" TEXT=" const char *name">
<node CREATED="1417757230227" ID="ID_1866828923" MODIFIED="1417757251906" TEXT="PMU&#x540d;&#x79f0;&#xff0c;&#x6bd4;&#x5982;&#xff1a;&quot;ARMv7 Krait&quot;"/>
</node>
<node CREATED="1417564932083" FOLDED="true" ID="ID_1423516773" MODIFIED="1417806152986" TEXT=" int num_events">
<node CREATED="1417760304948" ID="ID_1269006008" LINK="#ID_357567649" MODIFIED="1417761973101" TEXT="PMU&#x652f;&#x6301;&#x7684;&#x8ba1;&#x6570;&#x5668;&#x7684;&#x4e2a;&#x6570;&#xff0c;&#x53ef;&#x4ee5;&#x901a;&#x8fc7;&#x8bfb;&#x53d6;PMCR.N&#x5f97;&#x5230;&#xff0c;&#x6ce8;&#x610f;&#x5f97;&#x5230;&#x7684;&#x6570;&#x503c;&#x8fd8;&#x5e94;&#x52a0;1&#xff0c;&#x56e0;&#x4e3a;cycle counter&#x603b;&#x662f;&#x652f;&#x6301;&#x7684;"/>
</node>
<node CREATED="1417564932083" ID="ID_901131478" MODIFIED="1417564932083" TEXT=" atomic_t active_events"/>
<node CREATED="1417564932083" ID="ID_1568899950" MODIFIED="1417564932083" TEXT=" struct mutex reserve_mutex"/>
<node CREATED="1417564932083" ID="ID_1727347447" MODIFIED="1417564932083" TEXT=" u64 max_period"/>
<node CREATED="1417564932083" ID="ID_5679182" MODIFIED="1417564932083" TEXT=" struct platform_device *plat_device"/>
<node CREATED="1417564932084" ID="ID_630685139" MODIFIED="1417564932084" TEXT=" irqreturn_t (*handle_irq)(int irq_num, void *dev)"/>
<node CREATED="1417564932084" ID="ID_1817997069" MODIFIED="1417564932084" TEXT=" int (*request_pmu_irq)(int irq, irq_handler_t *irq_h)"/>
<node CREATED="1417564932084" ID="ID_689523632" MODIFIED="1417564932084" TEXT=" void (*free_pmu_irq)(int irq)"/>
<node CREATED="1417564932084" FOLDED="true" ID="ID_1832997802" MODIFIED="1417819057221">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*enable)(struct hw_perf_event *evt, int idx, int cpu)
    </p>
    <p>
      &#30495;&#27491;&#24320;&#22987;&#32479;&#35745;&#25351;&#23450;&#30340;&#20107;&#20214;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417761547062" ID="ID_1932664285" MODIFIED="1417761548766" TEXT="void krait_pmu_enable_event(struct hw_perf_event *hwc, int idx, int cpu)"/>
<node CREATED="1417761688358" ID="ID_162738767" MODIFIED="1417761755007" TEXT="&#x5728;cpu&#x7684;PMU&#x4e2d;idx&#x5bf9;&#x5e94;&#x7684;counter&#x4e0a;&#x5bf9;&#x4e8b;&#x4ef6;&#x8fdb;&#x884c;hwc&#x8ba1;&#x6570;"/>
<node CREATED="1417761763396" ID="ID_1831552068" MODIFIED="1417761804194" TEXT="enable event&#x6d89;&#x53ca;&#x5230;&#x7684;&#x6b65;&#x594f;&#x5305;&#x62ec;">
<node CREATED="1417761840381" ID="ID_1932771246" MODIFIED="1417762162994" TEXT="&#x9996;&#x5148;disable idx&#x5bf9;&#x5e94;&#x7684;&#x8ba1;&#x6570;&#x5668;&#xff0c; &#x8fd9;&#x53ef;&#x4ee5;&#x901a;&#x8fc7;&#x8bbe;&#x7f6e;PMCNTENCLR.Px&#x6765;&#x8fdb;&#x884c;"/>
<node CREATED="1417762332406" ID="ID_937281458" MODIFIED="1417762373289" TEXT="&#x4e3a;&#x8ba1;&#x6570;&#x5668;&#x9009;&#x62e9;&#x8981;&#x7edf;&#x8ba1;&#x7684;&#x4e8b;&#x4ef6;&#x7c7b;&#x578b;">
<node CREATED="1417763150947" ID="ID_256483784" MODIFIED="1417763250995" TEXT="&#x5982;&#x679c;&#x8981;&#x7edf;&#x8ba1;&#x7684;&#x4e8b;&#x4ef6;&#x662f;cycle, &#x5219;&#x65e0;&#x9700;&#x4e3a;cycle counter&#x8bbe;&#x7f6e;&#x4e8b;&#x4ef6;&#x7c7b;&#x578b;, &#x56e0;&#x4e3a;cycle counter&#x56fa;&#x5b9a;&#x5730;&#x7edf;&#x8ba1;cycle"/>
<node CREATED="1417762377420" ID="ID_104482665" MODIFIED="1417762704232" TEXT="&#x5982;&#x679c;&#x4e8b;&#x4ef6;&#x662f;ARM&#x5b9a;&#x4e49;&#x7684;&#x6807;&#x51c6;&#x4e8b;&#x4ef6;&#xff08;&#x4e8b;&#x4ef6;id&#x5c0f;&#x4e8e;0x40&#xff09;&#xff0c;&#x5219;&#x5148;&#x9009;&#x4e2d;&#x6b64;&#x8ba1;&#x6570;&#x5668;&#xff08;&#x5c06;PMSELR.SEL&#x8bbe;&#x4e3a;idx&#xff09;&#xff0c;&#x518d;&#x5c06;&#x4e8b;&#x4ef6;id&#x5199;&#x5165;PMXEVTYPER"/>
<node CREATED="1417762377420" ID="ID_218337572" LINK="#ID_1873440259" MODIFIED="1417763081669" TEXT="&#x5982;&#x679c;&#x4e8b;&#x4ef6;&#x662f;krait&#x5b9a;&#x4e49;&#x7684;&#x4e8b;&#x4ef6;&#xff08;&#x4e8b;&#x4ef6;id&#x5927;&#x4e8e;0x40&#xff09;&#xff0c;&#x5219;&#x9664;&#x4e86;&#x8bbe;&#x7f6e;&#x4e0a;&#x9762;&#x7684;PMSELR.SEL&#x548c;PMXEVTYPER&#x5916;&#xff0c;&#x8fd8;&#x8981;&#x6839;&#x636e;&#x4e8b;&#x4ef6;id&#x6240;&#x5728;&#x7684;group&#x548c;PMRESRx&#x5728;PMRESRx&#x4e2d;&#x8bbe;&#x7f6e;code"/>
</node>
<node CREATED="1417763342159" ID="ID_1585289576" LINK="#ID_166973490" MODIFIED="1417763461823" TEXT="&#x4e3a;&#x8ba1;&#x6570;&#x5668;&#x5f00;&#x542f;&#x6ea2;&#x51fa;&#x4e2d;&#x65ad;&#xff0c;&#x5373;&#x8ba1;&#x6570;&#x5668;&#x6ea2;&#x51fa;&#x540e;&#x5411;cpu&#x53d1;&#x51fa;&#x4e2d;&#x65ad;&#x4fe1;&#x53f7;&#xff0c;&#x8fd9;&#x53ef;&#x4ee5;&#x901a;&#x8fc7;&#x8bbe;&#x7f6e;PMINTENSET.Px&#x6765;&#x8fdb;&#x884c;"/>
<node CREATED="1417763536515" ID="ID_1516202305" MODIFIED="1417763605930" TEXT="&#x5c06;&#x6b64;&#x4e8b;&#x4ef6;&#x7684;&#x8001;&#x7684;&#x7edf;&#x8ba1;&#x503c;&#x5199;&#x56de;&#x5230;&#x8ba1;&#x6570;&#x5668;">
<node CREATED="1417763614804" ID="ID_398548571" MODIFIED="1417763637789" TEXT="&#x5148;&#x9009;&#x4e2d;&#x8ba1;&#x6570;&#x5668;&#xff08;&#x5c06;PMSELR.SEL&#x8bbe;&#x4e3a;idx&#xff09;"/>
<node CREATED="1417763641631" ID="ID_1835539817" MODIFIED="1417763711138" TEXT="&#x628a;&#x6570;&#x503c;&#x5199;&#x5230;&#x8ba1;&#x6570;&#x5668;&#xff0c;&#x5373;&#x5199;PMXEVCNTR"/>
</node>
<node CREATED="1417761840381" ID="ID_1378635967" MODIFIED="1417763746901" TEXT="&#x9996;&#x5148;enable idx&#x5bf9;&#x5e94;&#x7684;&#x8ba1;&#x6570;&#x5668;&#xff0c; &#x8fd9;&#x53ef;&#x4ee5;&#x901a;&#x8fc7;&#x8bbe;&#x7f6e;PMCNTENCLR.Px&#x6765;&#x8fdb;&#x884c;"/>
</node>
</node>
<node CREATED="1417564932084" FOLDED="true" ID="ID_3788543" MODIFIED="1417819481125">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*disable)(struct hw_perf_event *evt, int idx)
    </p>
    <p>
      &#20572;&#27490;&#32479;&#35745;&#25351;&#23450;&#30340;&#20107;&#20214;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417818802875" ID="ID_1108086395" MODIFIED="1417818892662" TEXT="void krait_pmu_disable_event(struct hw_perf_event *hwc, int idx)">
<node CREATED="1417819102049" ID="ID_1203975457" LINK="#ID_8308007" MODIFIED="1417819231719" TEXT="disable&#x4e8b;&#x4ef6;&#x5173;&#x8054;&#x7684;&#x8ba1;&#x6570;&#x5668;, &#x5373;&#x8bbe;&#x7f6e;PMCNTENCLR.Px"/>
<node CREATED="1417819263026" ID="ID_1516681940" MODIFIED="1417819297717" TEXT="&#x5982;&#x679c;&#x662f;krait&#x5b9a;&#x4e49;&#x7684;&#x4e8b;&#x4ef6;&#x5219;&#x8fd8;&#x8981;&#x6e05;&#x9664;PMRESRx&#x4e2d;&#x7684;code"/>
<node CREATED="1417819322426" ID="ID_1820889062" LINK="#ID_1946855375" MODIFIED="1417819471295" TEXT="&#x505c;&#x6b62;&#x8ba1;&#x6570;&#x5668;&#x5bf9;&#x5e94;&#x7684;&#x4e2d;&#x65ad;, &#x5373;&#x8bbe;&#x7f6e;PMCNTENCLR.Px"/>
</node>
</node>
<node CREATED="1417564932084" FOLDED="true" ID="ID_1951008793" MODIFIED="1417819007494">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*get_event_idx)(struct pmu_hw_events *hw_events, struct hw_perf_event *hwc)
    </p>
    <p>
      &#20026;&#20107;&#20214;&#20998;&#37197;&#19968;&#20010;&#31354;&#38386;&#30340;&#35745;&#25968;&#22120;, &#27880;&#24847;cycle count&#26377;&#22266;&#23450;&#30340;&#35745;&#25968;&#22120;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417817943056" ID="ID_1285362826" MODIFIED="1417818997875">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int armv7pmu_get_event_idx(struct pmu_hw_events *cpuc, struct hw_perf_event *event)
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417818113152" ID="ID_28320513" MODIFIED="1417818217890">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26597;&#25214;PMU&#30340;hw_events, &#20174;&#32780;&#24471;&#21040;&#19968;&#20010;&#31354;&#38386;&#30340;&#35745;&#25968;&#22120;
    </p>
    <p>
      PMU&#30340;hw_events&#36890;&#36807;&#35843;&#29992;struct arm_pmu-&gt;get_hw_events()&#24471;&#21040;
    </p>
  </body>
</html>
</richcontent>
</node>
</node>
</node>
<node CREATED="1417564932084" ID="ID_441927496" MODIFIED="1417564932084" TEXT=" int (*set_event_filter)(struct hw_perf_event *evt, struct perf_event_attr *attr)"/>
<node CREATED="1417564932084" FOLDED="true" ID="ID_788065576" MODIFIED="1417819854933">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;u32 (*read_counter)(int idx)
    </p>
    <p>
      &#35835;&#21462;&#35745;&#25968;&#22120;&#30340;&#20540;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417819675530" ID="ID_1389716601" MODIFIED="1417819676635" TEXT="u32 armv7pmu_read_counter(int idx)">
<node CREATED="1417819700866" ID="ID_1772452758" MODIFIED="1417819734197" TEXT="&#x82e5;&#x4e8b;&#x4ef6;&#x662f;cycle counting&#x5219;&#x8bfb;&#x53d6;PMCCNTR"/>
<node CREATED="1417819738516" ID="ID_183413000" MODIFIED="1417819774796" TEXT="&#x82e5;&#x4e8b;&#x4ef6;&#x4e0d;&#x662f;cycle counting&#x5219;&#x8bfb;&#x53d6;PMXEVCNTR"/>
</node>
</node>
<node CREATED="1417564932084" FOLDED="true" ID="ID_147887358" MODIFIED="1417819855669">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*write_counter)(int idx, u32 val)
    </p>
    <p>
      &#20889;&#35745;&#25968;&#22120;&#30340;&#20540;
    </p>
  </body>
</html>
</richcontent>
<node CREATED="1417819823516" ID="ID_247345063" MODIFIED="1417819824188" TEXT="void armv7pmu_write_counter(int idx, u32 value)">
<node CREATED="1417819700866" ID="ID_360689813" MODIFIED="1417819843042" TEXT="&#x82e5;&#x4e8b;&#x4ef6;&#x662f;cycle counting&#x5219;&#x5199;PMCCNTR"/>
<node CREATED="1417819738516" ID="ID_316650170" MODIFIED="1417819852647" TEXT="&#x82e5;&#x4e8b;&#x4ef6;&#x4e0d;&#x662f;cycle counting&#x5219;&#x5199;PMXEVCNTR"/>
</node>
</node>
<node CREATED="1417564932084" FOLDED="true" ID="ID_708104911" MODIFIED="1417812207398">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*start)(void)
    </p>
    <p>
      enable PMU&#20013;&#30340;&#25152;&#26377;&#35745;&#25968;&#22120;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417811966259" ID="ID_1059110404" MODIFIED="1417811967320" TEXT="armv7pmu_start">
<node CREATED="1417812087459" ID="ID_1036751878" LINK="#ID_1700250965" MODIFIED="1417812119480" TEXT="&#x5c06;PMCR.E&#x8bbe;&#x7f6e;&#x4e3a;1"/>
</node>
</node>
<node CREATED="1417564932084" FOLDED="true" ID="ID_1060207351" MODIFIED="1417812208223">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;void (*stop)(void)
    </p>
    <p>
      disable PMU&#20013;&#30340;&#25152;&#26377;&#35745;&#25968;&#22120;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417812167091" ID="ID_233449661" MODIFIED="1417812168136" TEXT="armv7pmu_stop">
<node CREATED="1417812087459" ID="ID_388029983" LINK="#ID_1700250965" MODIFIED="1417812182948" TEXT="&#x5c06;PMCR.E&#x8bbe;&#x7f6e;&#x4e3a;0"/>
</node>
</node>
<node CREATED="1417564932084" ID="ID_1595076617" MODIFIED="1417564932084" TEXT=" void (*reset)(void *)"/>
<node CREATED="1417564932084" FOLDED="true" ID="ID_160584319" MODIFIED="1417818915662">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;int (*map_event)(struct perf_event *event)
    </p>
    <p>
      &#23558;&#20107;&#20214;id&#20174;perf event subsystem&#23618;&#26144;&#23556;&#21040;PMU&#30828;&#20214;&#23618;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417757479022" ID="ID_761605256" MODIFIED="1417757480484" TEXT="int krait_8960_map_event(struct perf_event *event)">
<node CREATED="1417759666431" ID="ID_1791940554" MODIFIED="1417759753245">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      static int map_cpu_event(struct perf_event *event,
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;const unsigned (*event_map)[PERF_COUNT_HW_MAX],
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;unsigned (*cache_map)
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;[PERF_COUNT_HW_CACHE_MAX]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;[PERF_COUNT_HW_CACHE_OP_MAX]
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;[PERF_COUNT_HW_CACHE_RESULT_MAX],
    </p>
    <p>
      &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;u32 raw_event_mask)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417759842370" ID="ID_102605619" MODIFIED="1417760067847">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#26681;&#25454;&#19981;&#21516;&#30340;&#20107;&#20214;&#31867;&#22411;&#65288;event-&gt;attr.type&#65289;&#37319;&#29992;&#19981;&#21516;&#30340;&#26144;&#23556;&#25968;&#32452;&#26469;&#26144;&#23556;&#65306;
    </p>
    <p>
      1. &#22914;&#26524;&#26159;PERF_TYPE_HARDWARE&#20107;&#20214;&#21017;&#29992;event_map&#25968;&#32452;&#26469;&#26144;&#23556;
    </p>
    <p>
      2. &#22914;&#26524;&#26159;PERF_TYPE_HWCACHE&#20107;&#20214;&#21017;&#29992;cache_map&#25968;&#32452;&#26469;&#26144;&#23556;
    </p>
    <p>
      3. &#22914;&#26524;&#26159;PERF_TYPE_RAW&#20107;&#20214;&#21017;&#34920;&#31034;&#19978;&#23618;&#20256;&#19979;&#26469;&#30452;&#25509;&#23601;&#26159;PMU&#20107;&#20214;id&#65292;&#22240;&#27492;&#19981;&#35201;&#26144;&#23556;&#65292;&#30452;&#25509;&#36820;&#22238;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1417809627553" FOLDED="true" ID="ID_951010153" MODIFIED="1417810018605" TEXT="krait&#x5b9a;&#x4e49;&#x4e86;&#x4e24;&#x4e2a;&#x6620;&#x5c04;&#x6570;&#x7ec4;">
<node CREATED="1417809651793" ID="ID_93930099" MODIFIED="1417809681942" TEXT="armv7_krait_perf_map&#x7528;&#x4e8e;&#x6620;&#x5c04;PERF_TYPE_HARDWARE&#x4e8b;&#x4ef6;"/>
<node CREATED="1417809693001" ID="ID_972950075" MODIFIED="1417809716201" TEXT="armv7_krait_perf_cache_map&#x7528;&#x4e8e;&#x6620;&#x5c04;PERF_TYPE_HWCACHE&#x4e8b;&#x4ef6;">
<node CREATED="1417809781684" ID="ID_1445520993" MODIFIED="1417809852526" TEXT="&#x8bbf;&#x95ee;cache&#x7684;&#x4e8b;&#x4ef6;&#x7531;3&#x4e2a;&#x90e8;&#x5206;&#x5b9a;&#x4e49;: &#x8bbf;&#x95ee;&#x4ec0;&#x4e48;cache, &#x600e;&#x4e48;&#x8bbf;&#x95ee;, &#x8bbf;&#x95ee;&#x7684;&#x7ed3;&#x679c;"/>
<node CREATED="1417809857425" FOLDED="true" ID="ID_1899156737" MODIFIED="1417809968085" TEXT="&#x8bbf;&#x95ee;&#x4ec0;&#x4e48;cache">
<node CREATED="1417809890865" ID="ID_361306404" MODIFIED="1417809900136" TEXT="L1-D"/>
<node CREATED="1417809921580" ID="ID_799230526" MODIFIED="1417809922550" TEXT="L1-I"/>
<node CREATED="1417809932379" ID="ID_1988931705" MODIFIED="1417809934727" TEXT="LLC"/>
<node CREATED="1417809941161" ID="ID_591260268" MODIFIED="1417809941756" TEXT="ITLB"/>
<node CREATED="1417809949250" ID="ID_1562268396" MODIFIED="1417809949796" TEXT="DTLB"/>
<node CREATED="1417809957633" ID="ID_548434507" MODIFIED="1417809958163" TEXT="BPU"/>
<node CREATED="1417809965012" ID="ID_1975756881" MODIFIED="1417809965554" TEXT="NODE"/>
</node>
<node CREATED="1417809869307" FOLDED="true" ID="ID_172262158" MODIFIED="1417809997005" TEXT="&#x600e;&#x4e48;&#x8bbf;&#x95ee;">
<node CREATED="1417809977435" ID="ID_1829598663" MODIFIED="1417809978080" TEXT="read"/>
<node CREATED="1417809985881" ID="ID_943387918" MODIFIED="1417809986442" TEXT="write"/>
<node CREATED="1417809993868" ID="ID_1652117606" MODIFIED="1417809994486" TEXT="prefetch"/>
</node>
<node CREATED="1417809879177" FOLDED="true" ID="ID_1808081735" MODIFIED="1417810016620" TEXT="&#x8bbf;&#x95ee;&#x7684;&#x7ed3;&#x679c;">
<node CREATED="1417810005428" ID="ID_807630416" MODIFIED="1417810006000" TEXT="accesses"/>
<node CREATED="1417810013193" ID="ID_1732246865" MODIFIED="1417810013852" TEXT="misses"/>
</node>
</node>
</node>
</node>
<node CREATED="1417757481271" ID="ID_300379225" MODIFIED="1417759799184" TEXT="&#x5c06;perf event subsystem&#x5c42;&#x7684;&#x4e8b;&#x4ef6;id&#xff08;event-&gt;attr.config&#xff09;&#x6620;&#x5c04;&#x5230;PMU&#x786c;&#x4ef6;&#x5c42;&#x7684;&#x4e8b;&#x4ef6;id"/>
</node>
<node CREATED="1417564932084" FOLDED="true" ID="ID_1240971005" MODIFIED="1417819881493">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct pmu_hw_events *(*get_hw_events)(void)
    </p>
    <p>
      &#33719;&#21462;&#24403;&#21069;&#38656;&#35201;&#32479;&#35745;&#30340;&#20107;&#20214;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417810700098" ID="ID_1072056982" MODIFIED="1417810701687" TEXT="armpmu_get_cpu_events">
<node CREATED="1417811211165" ID="ID_775838568" MODIFIED="1417811236172" TEXT="&#x76f4;&#x63a5;&#x8fd4;&#x56de;&#x5168;&#x5c40;&#x53d8;&#x91cf;struct pmu_hw_events cpu_hw_events"/>
</node>
<node CREATED="1417811268754" ID="ID_1337665848" MODIFIED="1417811479872">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#33719;&#21462;&#20107;&#20214;&#25968;&#32452;struct pmu_hw_events
    </p>
    <p>
      &#25968;&#32452;&#30340;&#19979;&#26631;&#23545;&#24212;&#20102;&#19968;&#20010;&#35745;&#25968;&#22120;, &#25968;&#32452;&#20803;&#32032;&#19981;&#20026;&#31354;,&#34920;&#31034;&#19979;&#26631;&#23545;&#24212;&#30340;&#35745;&#25968;&#22120;&#38656;&#35201;&#32479;&#35745;&#25968;&#32452;&#20803;&#32032;&#23545;&#24212;&#30340;&#20107;&#20214;
    </p>
  </body>
</html></richcontent>
<node CREATED="1417811311394" ID="ID_1933073858" MODIFIED="1417811315636" TEXT="struct perf_event **events;"/>
<node CREATED="1417811329275" ID="ID_93953042" MODIFIED="1417811338507" TEXT="unsigned long *used_mask;"/>
<node CREATED="1417811351589" ID="ID_96210646" MODIFIED="1417811366703" TEXT="raw_spinlock_t pmu_lock;"/>
</node>
</node>
<node CREATED="1417564932084" ID="ID_1173526634" MODIFIED="1417564932084" TEXT=" int (*test_set_event_constraints)(struct perf_event *event)"/>
<node CREATED="1417564932084" ID="ID_319941688" MODIFIED="1417564932084" TEXT=" int (*clear_event_constraints)(struct perf_event *event)"/>
</node>
<node CREATED="1417757868012" FOLDED="true" ID="ID_1287027965" MODIFIED="1417820740661" TEXT="struct perf_event">
<node CREATED="1417759197613" ID="ID_561029070" MODIFIED="1417759197613" TEXT=" struct list_head group_entry"/>
<node CREATED="1417759197613" ID="ID_506081034" MODIFIED="1417759197613" TEXT=" struct list_head event_entry"/>
<node CREATED="1417759197613" ID="ID_1282641048" MODIFIED="1417759197613" TEXT=" struct list_head sibling_list"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct hlist_node hlist_entry"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int nr_siblings"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int group_flags"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct perf_event *group_leader"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct pmu *pmu"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" enum perf_event_active_state state"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" unsigned int attach_state"/>
<node CREATED="1417759197613" ID="ID_864503055" MODIFIED="1417759197613" TEXT=" local64_t count"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" atomic64_t child_count"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" u64 total_time_enabled"/>
<node CREATED="1417759197613" ID="ID_841462393" MODIFIED="1417759197613" TEXT=" u64 total_time_running"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" u64 tstamp_enabled"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" u64 tstamp_running"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" u64 tstamp_stopped"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" u64 shadow_ctx_time"/>
<node CREATED="1417759197613" FOLDED="true" ID="ID_410660223" MODIFIED="1417813736424" TEXT=" struct perf_event_attr attr">
<node CREATED="1417759197613" ID="ID_1185014938" MODIFIED="1417759197613" TEXT=" __u32 type">
<node CREATED="1417759550969" ID="ID_98916327" MODIFIED="1417759553384" TEXT="PERF_TYPE_HARDWARE"/>
<node CREATED="1417759559296" ID="ID_720357840" MODIFIED="1417759559946" TEXT="PERF_TYPE_SOFTWARE"/>
<node CREATED="1417759567670" ID="ID_889792630" MODIFIED="1417759568288" TEXT="PERF_TYPE_TRACEPOINT"/>
<node CREATED="1417759576311" ID="ID_1591134830" MODIFIED="1417759576944" TEXT="PERF_TYPE_HW_CACHE"/>
<node CREATED="1417759584824" ID="ID_1099025087" MODIFIED="1417759587309" TEXT="PERF_TYPE_RAW"/>
<node CREATED="1417759593222" ID="ID_1585225635" MODIFIED="1417759593980" TEXT="PERF_TYPE_BREAKPOINT"/>
</node>
<node CREATED="1417759197613" ID="ID_791010651" MODIFIED="1417759197613" TEXT=" __u32 size"/>
<node CREATED="1417759197613" ID="ID_1630819513" MODIFIED="1417759197613" TEXT=" __u64 config">
<node CREATED="1417759489251" ID="ID_139712" MODIFIED="1417759513674" TEXT="perf event subsystem&#x5c42;&#x7684;event id"/>
</node>
<node CREATED="1417759197613" ID="ID_541153532" MODIFIED="1417759235377" TEXT="union">
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u64 sample_period"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u64 sample_freq"/>
</node>
<node CREATED="1417759197613" ID="ID_18334649" MODIFIED="1417759197613" TEXT=" __u64 sample_type"/>
<node CREATED="1417759197613" ID="ID_792608157" MODIFIED="1417759197613" TEXT=" __u64 read_format"/>
<node CREATED="1417759197613" ID="ID_646346659" MODIFIED="1417759197613" TEXT=" watermark : 1"/>
<node CREATED="1417759264181" FOLDED="true" ID="ID_1326314720" MODIFIED="1417759373056" TEXT="__u64">
<node CREATED="1417759197613" ID="ID_1624278711" MODIFIED="1417759305268" TEXT="disabled : 1"/>
<node CREATED="1417759197613" ID="ID_160978629" MODIFIED="1417759197613" TEXT=" inherit : 1"/>
<node CREATED="1417759197613" ID="ID_104145671" MODIFIED="1417759197613" TEXT=" pinned : 1"/>
<node CREATED="1417759197613" ID="ID_1644349352" MODIFIED="1417759197613" TEXT=" exclusive : 1"/>
<node CREATED="1417759197613" ID="ID_120291704" MODIFIED="1417759197613" TEXT=" exclude_user : 1"/>
<node CREATED="1417759197613" ID="ID_965269058" MODIFIED="1417759197613" TEXT=" exclude_kernel : 1"/>
<node CREATED="1417759197613" ID="ID_250656978" MODIFIED="1417759197613" TEXT=" exclude_hv : 1"/>
<node CREATED="1417759197613" ID="ID_1764031655" MODIFIED="1417759197613" TEXT=" exclude_idle : 1"/>
<node CREATED="1417759197613" ID="ID_1708648989" MODIFIED="1417759197613" TEXT=" mmap : 1"/>
<node CREATED="1417759197613" ID="ID_213045766" MODIFIED="1417759336729" TEXT=" comm : 1"/>
<node CREATED="1417759337742" ID="ID_1370371681" MODIFIED="1417759344384" TEXT="freq : 1"/>
<node CREATED="1417759197613" ID="ID_407449625" MODIFIED="1417759197613" TEXT=" inherit_stat : 1"/>
<node CREATED="1417759197613" ID="ID_748102853" MODIFIED="1417759197613" TEXT=" enable_on_exec : 1"/>
<node CREATED="1417759197613" ID="ID_1021391814" MODIFIED="1417759197613" TEXT=" task : 1"/>
<node CREATED="1417759197613" ID="ID_1196079730" MODIFIED="1417759197613" TEXT=" precise_ip : 2"/>
<node CREATED="1417759197613" ID="ID_605169968" MODIFIED="1417759197613" TEXT=" mmap_data : 1"/>
<node CREATED="1417759197613" ID="ID_323004525" MODIFIED="1417759197613" TEXT=" sample_id_all : 1"/>
<node CREATED="1417759197613" ID="ID_270917308" MODIFIED="1417759197613" TEXT=" exclude_host : 1"/>
<node CREATED="1417759197613" ID="ID_49221165" MODIFIED="1417759197613" TEXT=" exclude_guest : 1"/>
<node CREATED="1417759197613" ID="ID_834065890" MODIFIED="1417759197613" TEXT=" __reserved_1 : 43"/>
</node>
<node CREATED="1417759197613" ID="ID_1067962557" MODIFIED="1417759404811" TEXT="union">
<node CREATED="1417759197613" ID="ID_492339462" MODIFIED="1417759197613" TEXT=" __u32 wakeup_events"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u32 wakeup_watermark"/>
</node>
<node CREATED="1417759197613" ID="ID_51613400" MODIFIED="1417759197613" TEXT=" __u32 bp_type"/>
<node CREATED="1417759197613" ID="ID_559389515" MODIFIED="1417759410013" TEXT="union">
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u64 bp_addr"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u64 config1"/>
</node>
<node CREATED="1417759197613" ID="ID_538515584" MODIFIED="1417759414410" TEXT="union">
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u64 bp_len"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u64 config2"/>
</node>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" __u64 branch_sample_type"/>
</node>
<node CREATED="1417759197613" ID="ID_732073745" MODIFIED="1417759197613" TEXT=" u16 header_size"/>
<node CREATED="1417759197613" ID="ID_1678798254" MODIFIED="1417759197613" TEXT=" u16 id_header_size"/>
<node CREATED="1417759197613" ID="ID_1378149056" MODIFIED="1417759197613" TEXT=" u16 read_size"/>
<node CREATED="1417759197613" FOLDED="true" ID="ID_1124040942" MODIFIED="1417814163178" TEXT=" struct hw_perf_event hw">
<node CREATED="1417814090950" ID="ID_1733178477" MODIFIED="1417814116074" TEXT="union">
<node CREATED="1417814090950" ID="ID_339717887" MODIFIED="1417814132704" TEXT="hardware">
<node CREATED="1417814090950" MODIFIED="1417814090950" TEXT=" u64 config"/>
<node CREATED="1417814090950" MODIFIED="1417814090950" TEXT=" u64 last_tag"/>
<node CREATED="1417814090950" MODIFIED="1417814090950" TEXT=" unsigned long config_base"/>
<node CREATED="1417814090950" MODIFIED="1417814090950" TEXT=" unsigned long event_base"/>
<node CREATED="1417814090950" MODIFIED="1417814090950" TEXT=" int idx"/>
<node CREATED="1417814090950" MODIFIED="1417814090950" TEXT=" int last_cpu"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" struct hw_perf_event_extra extra_reg"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" struct hw_perf_event_extra branch_reg"/>
</node>
<node CREATED="1417814090951" ID="ID_592344610" MODIFIED="1417814142513" TEXT="software">
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" struct hrtimer hrtimer"/>
</node>
<node CREATED="1417814090951" ID="ID_634478201" MODIFIED="1417814154199" TEXT="breakpoint">
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" struct arch_hw_breakpoint info"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" struct list_head bp_list"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" struct task_struct *bp_target"/>
</node>
</node>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" int state"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" local64_t prev_count"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" u64 sample_period"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" u64 last_period"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" local64_t period_left"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" u64 interrupts_seq"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" u64 interrupts"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" u64 freq_time_stamp"/>
<node CREATED="1417814090951" MODIFIED="1417814090951" TEXT=" u64 freq_count_stamp"/>
</node>
<node CREATED="1417759197613" ID="ID_1135151204" MODIFIED="1417759197613" TEXT=" struct perf_event_context *ctx"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" atomic_long_t refcount"/>
<node CREATED="1417759197613" ID="ID_1694457119" MODIFIED="1417759197613" TEXT=" atomic64_t child_total_time_enabled"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" atomic64_t child_total_time_running"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct mutex child_mutex"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct list_head child_list"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct perf_event *parent"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int oncpu"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int cpu"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct list_head owner_entry"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct task_struct *owner"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct mutex mmap_mutex"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" atomic_t mmap_count"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct ring_buffer *rb"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct list_head rb_entry"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" wait_queue_head_t waitq"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct fasync_struct *fasync"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int pending_wakeup"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int pending_kill"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int pending_disable"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct irq_work pending"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" atomic_t event_limit"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" void (*destroy)(struct perf_event *)"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct rcu_head rcu_head"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct pid_namespace *ns"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" u64 id"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" perf_overflow_handler_t overflow_handler"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" void *overflow_handler_context"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct ftrace_event_call *tp_event"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct event_filter *filter"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct ftrace_ops ftrace_ops"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" struct perf_cgroup *cgrp"/>
<node CREATED="1417759197613" MODIFIED="1417759197613" TEXT=" int cgrp_defer_enabled"/>
</node>
</node>
<node CREATED="1417561901827" FOLDED="true" ID="ID_958230560" MODIFIED="1417820743463" POSITION="left" TEXT="API">
<node CREATED="1417562045433" ID="ID_148807620" MODIFIED="1417562046331" TEXT="int perf_pmu_register(struct pmu *pmu, char *name, int type)">
<node CREATED="1417562061940" ID="ID_1747269275" LINK="#ID_985795687" MODIFIED="1417658214160" TEXT="pmu"/>
<node CREATED="1417562066145" ID="ID_1343498470" MODIFIED="1417562067843" TEXT="name"/>
<node CREATED="1417562068649" FOLDED="true" ID="ID_165627933" MODIFIED="1417658499914" TEXT="type">
<node CREATED="1417658429741" ID="ID_864172611" MODIFIED="1417658430642" TEXT="PERF_TYPE_HARDWARE"/>
<node CREATED="1417658439391" ID="ID_706917293" MODIFIED="1417658439945" TEXT="PERF_TYPE_SOFTWARE"/>
<node CREATED="1417658448365" ID="ID_1867735382" MODIFIED="1417658449554" TEXT="PERF_TYPE_TRACEPOINT"/>
<node CREATED="1417658471933" ID="ID_1839986792" MODIFIED="1417658472515" TEXT="PERF_TYPE_HW_CACHE"/>
<node CREATED="1417658483909" ID="ID_1890800444" MODIFIED="1417658484509" TEXT="PERF_TYPE_RAW"/>
<node CREATED="1417658493143" ID="ID_1086529100" MODIFIED="1417658493780" TEXT="PERF_TYPE_BREAKPOINT"/>
</node>
</node>
</node>
<node CREATED="1417820748955" FOLDED="true" ID="ID_1525454351" MODIFIED="1417820834590" POSITION="left" TEXT="&#x539f;&#x7406;">
<node CREATED="1417820758883" ID="ID_630776278" MODIFIED="1417820831885">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/perf_event_framework_1.png" />
  </body>
</html>
</richcontent>
</node>
</node>
</node>
</map>
