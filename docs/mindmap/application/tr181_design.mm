<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1340949197421" ID="ID_1063626722" MODIFIED="1340949206693" TEXT="tr181_design">
<node CREATED="1340949382580" FOLDED="true" ID="ID_1122291648" MODIFIED="1341389550425" POSITION="left" TEXT="introduce">
<node CREATED="1340949406842" FOLDED="true" ID="ID_1872987046" MODIFIED="1341389384746" TEXT="what is tr181 ?">
<node CREATED="1341389311847" ID="ID_47955193" MODIFIED="1341389345281" TEXT="tr181 is another data model which is similar with tr098"/>
</node>
<node CREATED="1340949432558" FOLDED="true" ID="ID_27816898" MODIFIED="1341389538013" TEXT="relationship between tr181 and tr098 ?">
<node CREATED="1341389445875" ID="ID_1636517684" MODIFIED="1341389528434" TEXT="the organization of manageable object is different between tr181 and tr098"/>
</node>
<node CREATED="1340949487195" FOLDED="true" ID="ID_15194991" MODIFIED="1341389548680" TEXT="what is the requirement ?">
<node CREATED="1340957290297" ID="ID_1499605932" MODIFIED="1340957330217" TEXT="we can use tr181 data model to configure device"/>
<node CREATED="1340957290297" ID="ID_1531697278" MODIFIED="1340957343648" TEXT="we can use tr098 data model to configure device"/>
<node CREATED="1340957345270" ID="ID_1690470691" MODIFIED="1340957450350" TEXT="tr181 data model should be in sync with tr098 data model at any time"/>
</node>
</node>
<node CREATED="1340949641845" FOLDED="true" ID="ID_1307920409" MODIFIED="1345171953912" POSITION="left" TEXT="possible solution">
<node CREATED="1340949665973" ID="ID_1605506068" MODIFIED="1340949686743" TEXT="translate mib path"/>
<node CREATED="1340949694164" FOLDED="true" ID="ID_1406381715" MODIFIED="1345171602895" TEXT="map tr181 to tr098">
<node CREATED="1344995700365" ID="ID_495532090" MODIFIED="1344995779560" TEXT="every module has a single file"/>
<node CREATED="1344995787188" ID="ID_966480434" MODIFIED="1344995807488" TEXT="put all change in changefilter hook"/>
<node CREATED="1344995827922" ID="ID_494110314" MODIFIED="1344995898402" TEXT="make hide/unhide automation"/>
</node>
<node CREATED="1340949724794" ID="ID_1996473899" MODIFIED="1340953481005" TEXT="implement tr181 standalone"/>
</node>
<node CREATED="1345170895279" ID="ID_823004781" MODIFIED="1345170898176" POSITION="left" TEXT="task">
<node CREATED="1345170983008" FOLDED="true" ID="ID_832283618" MODIFIED="1345171621323" TEXT="analyse and improve previous design">
<node CREATED="1345171056734" ID="ID_1700569347" MODIFIED="1345171196510" TEXT="add a tr181 map hook after config change filter"/>
<node CREATED="1345171149561" ID="ID_661998191" MODIFIED="1345171281254" TEXT="create tr181 management plugin&#xa;register tr181 mao hook&#xa;do mapping in tr181 map hook"/>
<node CREATED="1345171331870" FOLDED="true" ID="ID_1007835542" MODIFIED="1345171581776" TEXT="divide mibs into modules">
<node CREATED="1345171351326" ID="ID_934467200" MODIFIED="1345171478538" TEXT="common module&#xa;put all common functions in this module"/>
<node CREATED="1345171367949" ID="ID_199875320" MODIFIED="1345171538513" TEXT="mib special module&#xa;create a module for every mib sub tree"/>
</node>
<node CREATED="1344995827922" ID="ID_556115331" MODIFIED="1344995898402" TEXT="make hide/unhide automation"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1537492333" MODIFIED="1345174524899" TEXT="Device.DeviceInfo&#xa;Device.ManagementServer&#xa;Device.GatewayInfo&#xa;Device.Time&#xa;Device.CaptivePortal&#xa;Device.Users">
<node CREATED="1345171790042" ID="ID_1619149683" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_793975106" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_659492348" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_713240554" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_634470421" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1209593939" MODIFIED="1345172399548" TEXT="Device.UserInterface&#xa;(don&apos;t support)">
<node CREATED="1345171790042" ID="ID_446962796" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_149989790" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_736655171" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_1351798331" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_1886417342" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1701519873" MODIFIED="1345172976777" TEXT="Device.DSL&#xa;Device.ATM&#xa;Device.PTM&#xa;Device.USB&#xa;Device.HPNA&#xa;Device.HomePlug&#xa;Device.UPA&#xa;(don&apos;t support)">
<node CREATED="1345171790042" ID="ID_1757308941" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_1281911204" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_414201154" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_1502331244" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_1395939883" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1110812990" MODIFIED="1345174781097" TEXT="Device.InterfaceStack&#xa;Device.Ethernet&#xa;Device.WiFi">
<node CREATED="1345171790042" ID="ID_1295256841" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_1679967286" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_1847669507" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_1369111633" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_371077562" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_869288090" MODIFIED="1345173057234" TEXT="Device.Bridging">
<node CREATED="1345171790042" ID="ID_42775498" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_130557586" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_1007839649" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_1959500723" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_1374580224" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1003621968" MODIFIED="1345174817520" TEXT="Device.PPP&#xa;Device.QoS">
<node CREATED="1345171790042" ID="ID_1844306492" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_509760134" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_1604302515" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_490948045" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_677214151" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_865743544" MODIFIED="1345173200221" TEXT="Device.IP">
<node CREATED="1345171790042" ID="ID_1668370876" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_482826022" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_838201095" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_1098889893" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_455329376" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1356230291" MODIFIED="1345174292349" TEXT="Device.Routing&#xa;Device.NeighborDiscovery&#xa;Device.RouterAdvertisement&#xa;Device.NAT">
<node CREATED="1345171790042" ID="ID_654016884" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_57676807" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_248515958" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_1011853677" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_42410761" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_740095976" MODIFIED="1345173412165" TEXT="Device.IPv6rd&#xa;Device.DSLite&#xa;(don&apos;t support)">
<node CREATED="1345171790042" ID="ID_273231308" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_1072008238" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_640862410" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_136814129" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_945429195" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_813764174" MODIFIED="1345174334014" TEXT="Device.Hosts&#xa;Device.DNS&#xa;Device.DHCPv4&#xa;Device.DHCPv6">
<node CREATED="1345171790042" ID="ID_429632938" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_549703427" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_1259921473" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_626217876" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_955910342" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1465883029" MODIFIED="1345174688459" TEXT="Device.IEEE8021x&#xa;Device.SmartCardReaders&#xa;Device.PeriodicStatistics&#xa;Device.SoftwareModules&#xa;(don&apos;t  support)">
<node CREATED="1345171790042" ID="ID_1821240825" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_102433041" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_1155645335" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_1739387683" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_1456272728" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
<node CREATED="1345171694766" FOLDED="true" ID="ID_1454448235" MODIFIED="1345174738636" TEXT="Device.UPnP&#xa;Device.DLNA&#xa;Device.Firewall">
<node CREATED="1345171790042" ID="ID_1954488103" MODIFIED="1345171804065" TEXT="map design"/>
<node CREATED="1345171834002" ID="ID_941889240" MODIFIED="1345171838218" TEXT="define mib"/>
<node CREATED="1345171839801" ID="ID_1951436553" MODIFIED="1345171928529" TEXT="write unit test case"/>
<node CREATED="1345171872625" ID="ID_974167064" MODIFIED="1345171876055" TEXT="coding"/>
<node CREATED="1345171886085" ID="ID_1227700601" MODIFIED="1345171937306" TEXT=" unit test"/>
</node>
</node>
<node CREATED="1340953520086" ID="ID_1610890440" MODIFIED="1341389651840" POSITION="right" TEXT="map tr181 to tr098">
<node CREATED="1340953612849" FOLDED="true" ID="ID_514185887" MODIFIED="1341389657694" TEXT="where to map ?">
<node CREATED="1340953686974" FOLDED="true" ID="ID_664686065" MODIFIED="1341379490852" TEXT="if there is corresponding mib in tr098">
<node CREATED="1340953779403" ID="ID_1590843897" MODIFIED="1340953785509" TEXT="just map"/>
<node CREATED="1340958562643" ID="ID_1260274466" MODIFIED="1340958662236" TEXT="mib define of two mib must be the same except mib path"/>
</node>
<node CREATED="1340953686974" FOLDED="true" ID="ID_1875201773" MODIFIED="1341379504926" TEXT="if there is no corresponding mib in tr098">
<node CREATED="1340953788335" ID="ID_1903972582" MODIFIED="1340953813278" TEXT="add new mib under tr098, then map tr181 mib to it"/>
<node CREATED="1340958562643" ID="ID_479682284" MODIFIED="1340958662236" TEXT="mib define of two mib must be the same except mib path"/>
</node>
</node>
<node CREATED="1340954150910" FOLDED="true" ID="ID_221200553" MODIFIED="1341389691155" TEXT="basic concept">
<node CREATED="1340954591175" FOLDED="true" ID="ID_171273984" MODIFIED="1341379509102" TEXT="data struct of mib">
<node CREATED="1310815126423" FOLDED="true" ID="ID_286636558" MODIFIED="1340955015473" TEXT="gwmib.amibh&#xa;&#x6b64;&#x6587;&#x4ef6;&#x4e2d;&#x5b9a;&#x4e49;&#x4e86;&#xa;struct gwmibObjectTypeVarStruct&#xa;struct gwmibObjectTypeStruct&#xa;struct gwmibObjectVarStruct&#xa;struct gwmibObjectStruct&#xa;&#x56db;&#x79cd;&#x7ed3;&#x6784;&#x4f53;&#x7ed3;&#x6784;&#x4f53;,&#x5b83;&#x4eec;&#x90fd;&#x63cf;&#x8ff0;&#x4e86;&#x6574;&#x4e2a;mib&#x7684;&#x6811;&#x5f62;&#x7ed3;&#x6784;&#xff1a;">
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
<node CREATED="1310824055680" ID="ID_1748275431" MODIFIED="1340954659027" TEXT="struct gwmibObjectTypeStruct">
<node CREATED="1310815321947" FOLDED="true" ID="ID_687718962" MODIFIED="1340955007525">
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
<node CREATED="1310825119723" FOLDED="true" ID="ID_1862685066" MODIFIED="1340954708178" TEXT="struct mibObjectType&#xa;&#x6b64;&#x7ed3;&#x6784;&#x5305;&#x542b;&#x7684;&#x662f;&#x8282;&#x70b9;&#x7684;&#x7c7b;&#x578b;&#x548c;&#x521d;&#x59cb;&#x503c;">
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
<node CREATED="1310824244079" ID="ID_1622960081" MODIFIED="1340954895366" TEXT="struct gwmibObjectVarStruct">
<node CREATED="1310815321947" FOLDED="true" ID="ID_39412074" MODIFIED="1340955010767">
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
<node CREATED="1310830683741" FOLDED="true" ID="ID_1377982753" MODIFIED="1340954906401" TEXT="struct mibObjectVar&#xa;&#x6b64;&#x7ed3;&#x6784;&#x4e2d;&#x5305;&#x542b;&#x7684;&#x662f;&#x8282;&#x70b9;&#x7684;&#x52a8;&#x6001;&#x72b6;&#x6001;">
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
</node>
<node CREATED="1340957888196" FOLDED="true" ID="ID_1449966244" MODIFIED="1341385907391" TEXT="when to map ?">
<node CREATED="1340958076265" ID="ID_859632766" MODIFIED="1340958162230" TEXT="static map must be finished after first job"/>
<node CREATED="1340958076265" ID="ID_1840841163" MODIFIED="1340958287368" TEXT="static map can&apos;t be unmapped at any time"/>
<node CREATED="1340958166844" ID="ID_1393116301" MODIFIED="1340958208444" TEXT="dynamic map must be finished after addobject job"/>
<node CREATED="1340958166844" ID="ID_1299362428" MODIFIED="1340958315776" TEXT="dynamic map must be unmapped after delobject job"/>
</node>
<node CREATED="1340955102885" FOLDED="true" ID="ID_1556444330" MODIFIED="1341387556898" TEXT="type of map">
<node CREATED="1340955120167" ID="ID_947931502" LINK="#ID_1082195879" MODIFIED="1341385954070" TEXT="map tr181 mib to tr098 mib"/>
<node CREATED="1340955135530" ID="ID_20087695" LINK="#ID_837981116" MODIFIED="1341385982568" TEXT="map tr098 mib to tr098 mib"/>
</node>
<node CREATED="1340955039758" FOLDED="true" ID="ID_1062760953" MODIFIED="1341386035670" TEXT="how to map">
<node CREATED="1340955346532" ID="ID_1082195879" MODIFIED="1340955488600" TEXT="struct mibObject *from_tr181&#xa;struct mibObject *to_tr098&#xa;from_tr181-&gt;VarP = to_tr098-&gt;VarP&#xa;from_tr181-&gt;Type-&gt;VarP-&gt;ServicePlugin = to_tr098-&gt;Type-&gt;VarP-&gt;ServicePlugin"/>
<node CREATED="1340955346532" ID="ID_837981116" MODIFIED="1341386027619" TEXT="struct mibObject *from_tr098&#xa;struct mibObject *to_tr098&#xa;from_tr098-&gt;VarP = to_tr098-&gt;VarP&#xa;to_tr098-&gt;Type-&gt;VarP-&gt;ServicePlugin = from_tr098-&gt;Type-&gt;VarP-&gt;ServicePlugin"/>
</node>
<node CREATED="1340955255604" FOLDED="true" ID="ID_788946174" MODIFIED="1341386044575" TEXT="how to unmap">
<node CREATED="1340955346532" ID="ID_747073920" MODIFIED="1340955625016" TEXT="struct mibObject *from_tr181&#xa;from_tr181-&gt;VarP = mibobj(gwmibObjectVars.from_tr181)&#xa;"/>
</node>
</node>
<node CREATED="1340954185159" FOLDED="true" ID="ID_1248123746" MODIFIED="1341389712435" TEXT="key technology">
<node CREATED="1340955674572" FOLDED="true" ID="ID_1485042523" MODIFIED="1341385686738" TEXT="depend config mib or claim status mib on tr181 mib tree">
<node CREATED="1340955778797" FOLDED="true" ID="ID_1801642417" MODIFIED="1341379980425" TEXT="service plugin is not aware of tr181 tree, &#xa;how to update tr181 tree ?">
<node CREATED="1341379668656" ID="ID_447533663" MODIFIED="1341379977266" TEXT="because mapped tr181 mib and tr098 mib share the same service plugin,&#xa;so any set operation on tr181 mib will be propogated to correct service plugin,&#xa;any get operation on tr181 mib will be updated by correct service plugin"/>
</node>
</node>
<node CREATED="1340955885061" FOLDED="true" ID="ID_1315355657" MODIFIED="1341383464551" TEXT="status update">
<node CREATED="1341381918896" FOLDED="true" ID="ID_943222786" MODIFIED="1341382567508" TEXT="in the status update stage of first job, all status mib was requested to be updated.&#xa;but there is no service plugin claim tr181 status mib at this time because&#xa;all mapping was started in report stage of first job.">
<node CREATED="1341382390716" ID="ID_911103814" MODIFIED="1341382553553" TEXT="all status mibs whose service plugin was empty shouldn&apos;t be updated&#xa;see mibUpdateNeededSet in mib.c"/>
</node>
<node CREATED="1341382618920" FOLDED="true" ID="ID_1492522138" MODIFIED="1341383460344" TEXT="when mib A was mapped mib B, and both mib A, B was requested to be updated,&#xa;the total update count of current job will be added twice, but actually the total update &#xa;count of current job will only be decreased once because mib A,B share the same&#xa;service plugin. a service plugin will only be called once for status update.">
<node CREATED="1341383108750" ID="ID_1591129290" MODIFIED="1341383261263" TEXT="there is a limitation : a user should operate on device based on only one data model.&#xa;a user is aware of only one data model at any time."/>
<node CREATED="1341383317803" ID="ID_662104004" MODIFIED="1341383454646" TEXT="when we map tr098 mib to tr098 mib, these mapped mib should be limited as config mib"/>
</node>
</node>
<node CREATED="1340955952466" FOLDED="true" ID="ID_1148893804" MODIFIED="1341387554737" TEXT="static map and dynamic map">
<node CREATED="1340956087767" FOLDED="true" ID="ID_954746702" MODIFIED="1341380041422" TEXT="static map">
<node CREATED="1340961843882" ID="ID_560837429" MODIFIED="1340961939612" TEXT="only map one time&#xa;no unmap&#xa;map is finished after first job"/>
<node CREATED="1340961725979" ID="ID_1360203148" MODIFIED="1340961807245" TEXT="Device.DeviceInfo&#xa;Device.ManagementServer&#xa;Device.WiFi.Radio&#xa;Device.WiFi.SSID"/>
</node>
<node CREATED="1340956093164" FOLDED="true" ID="ID_1526139457" MODIFIED="1341387553440" TEXT="dynamic map">
<node CREATED="1340962001684" FOLDED="true" ID="ID_956810412" MODIFIED="1341380364680" TEXT="Device.WiFi.AccessPoint">
<node CREATED="1340962116699" FOLDED="true" ID="ID_970616232" MODIFIED="1341380353061" TEXT="by tr181 addobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1101663210" MODIFIED="1341380352125" TEXT="judge condition">
<node CREATED="1340963023744" ID="ID_1652000738" MODIFIED="1340964570210" TEXT="AccessPoint x is unhide and unmapped"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1352027004" MODIFIED="1341380125795" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_474044210" MODIFIED="1340963241570" TEXT="delete AccessPoint x&#xa;add WLANConfiguration.x&#xa;set WLANConfiguration.x.DeviceOperationMode to AP&#xa;change to case &quot;by tr098 addobject operation&quot;"/>
</node>
</node>
<node CREATED="1340962116699" FOLDED="true" ID="ID_860774661" MODIFIED="1341380148452" TEXT="by tr098 addobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1158904632" MODIFIED="1341380147414" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_285169815" MODIFIED="1340963516646" TEXT="WLANConfiguration.x is unhide&#xa;WLANConfiguration.x.DeviceOperationMode is AP&#xa;WLANConfiguration.x is not mapped"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_977445035" MODIFIED="1341380146566" TEXT="action to do">
<node CREATED="1340963532289" ID="ID_923807747" MODIFIED="1340964254287" TEXT="find a unmapped AccessPoint&#xa;map this AccessPoint to WLANConfiguration.x"/>
</node>
</node>
<node CREATED="1340962327067" FOLDED="true" ID="ID_321846725" MODIFIED="1341380178475" TEXT="by change device mode from Station to AP">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1637739921" MODIFIED="1341380176847" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_452417002" MODIFIED="1340963828225" TEXT="WLANConfiguration.x is unhide&#xa;WLANConfiguration.x.DeviceOperationMode is AP&#xa;WLANConfiguration.x is mapped to a EndPoint&#xa;"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1731420059" MODIFIED="1341380175738" TEXT="action to do">
<node CREATED="1340963866972" ID="ID_1968424843" MODIFIED="1340963938204" TEXT="unmap EndPoint to WLANConfiguration.x &#xa;change to case &quot;by tr098 addobject operation&quot;"/>
</node>
</node>
<node CREATED="1340962116699" FOLDED="true" ID="ID_1133203540" MODIFIED="1341380224757" TEXT="by tr181 delobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1273273063" MODIFIED="1341380223639" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_1616756053" MODIFIED="1340964175027" TEXT="WLANConfiguration.x is hide&#xa;WLANConfiguration.x is mapped AccessPoint"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1916376127" MODIFIED="1341380222718" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_234111888" MODIFIED="1340964222612" TEXT="unmap AccessPoint to WLANConfiguration.x "/>
</node>
</node>
<node CREATED="1340962116699" FOLDED="true" ID="ID_658775648" MODIFIED="1341380240327" TEXT="by tr098 delobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_314779316" MODIFIED="1341380239390" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_1590486159" MODIFIED="1340964175027" TEXT="WLANConfiguration.x is hide&#xa;WLANConfiguration.x is mapped AccessPoint"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_457101454" MODIFIED="1341380238739" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_468326046" MODIFIED="1340964222612" TEXT="unmap AccessPoint to WLANConfiguration.x "/>
</node>
</node>
<node CREATED="1340962327067" FOLDED="true" ID="ID_1128105034" MODIFIED="1341380251482" TEXT="by change device mode from AP to Station">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1062436488" MODIFIED="1341380250713" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_698632762" MODIFIED="1340964370143" TEXT="WLANConfiguration.x is unhide&#xa;WLANConfiguration.x.DeviceOperationMode is Station&#xa;WLANConfiguration.x is mapped to a AccessPoint&#xa;"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1134200212" MODIFIED="1341380249979" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_45641117" MODIFIED="1340964222612" TEXT="unmap AccessPoint to WLANConfiguration.x "/>
</node>
</node>
</node>
<node CREATED="1340962001684" FOLDED="true" ID="ID_163111838" MODIFIED="1341380366152" TEXT="Device.WiFi.EndPoint">
<node CREATED="1340962116699" FOLDED="true" ID="ID_923991246" MODIFIED="1341380348029" TEXT="by tr181 addobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1685612061" MODIFIED="1341380347199" TEXT="judge condition">
<node CREATED="1340963023744" ID="ID_1169629287" MODIFIED="1340964557197" TEXT="EndPoint x is unhide and unmapped"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1491077387" MODIFIED="1341380346381" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_258511052" MODIFIED="1340964617864" TEXT="delete EndPoint x&#xa;add WLANConfiguration.x&#xa;set WLANConfiguration.x.DeviceOperationMode to Station&#xa;change to case &quot;by tr098 addobject operation&quot;"/>
</node>
</node>
<node CREATED="1340962116699" FOLDED="true" ID="ID_1170172325" MODIFIED="1341380349357" TEXT="by tr098 addobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1335472327" MODIFIED="1341380345731" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_10933101" MODIFIED="1340964643203" TEXT="WLANConfiguration.x is unhide&#xa;WLANConfiguration.x.DeviceOperationMode is Station&#xa;WLANConfiguration.x is not mapped"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1382818478" MODIFIED="1341380344613" TEXT="action to do">
<node CREATED="1340963532289" ID="ID_1031227682" MODIFIED="1340964664318" TEXT="find a unmapped EndPoint&#xa;map this EndPoint to WLANConfiguration.x"/>
</node>
</node>
<node CREATED="1340962327067" FOLDED="true" ID="ID_1746805038" MODIFIED="1341380343677" TEXT="by change device mode from AP to Station">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1829316574" MODIFIED="1341380342946" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_1418903875" MODIFIED="1340964716960" TEXT="WLANConfiguration.x is unhide&#xa;WLANConfiguration.x.DeviceOperationMode is Station&#xa;WLANConfiguration.x is mapped to a AccessPoint&#xa;"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1906106450" MODIFIED="1341380342090" TEXT="action to do">
<node CREATED="1340963866972" ID="ID_6096338" MODIFIED="1340964756093" TEXT="unmap AccessPoint to WLANConfiguration.x &#xa;change to case &quot;by tr098 addobject operation&quot;"/>
</node>
</node>
<node CREATED="1340962116699" FOLDED="true" ID="ID_594739417" MODIFIED="1341380320799" TEXT="by tr181 delobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_913374968" MODIFIED="1341380319584" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_569680476" MODIFIED="1340964796766" TEXT="WLANConfiguration.x is hide&#xa;WLANConfiguration.x is mapped EndPoint"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_680276300" MODIFIED="1341380318960" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_1611187220" MODIFIED="1340964806918" TEXT="unmap EndPoint to WLANConfiguration.x "/>
</node>
</node>
<node CREATED="1340962116699" FOLDED="true" ID="ID_1072473988" MODIFIED="1341380329675" TEXT="by tr098 delobject operation">
<node CREATED="1340962190519" FOLDED="true" ID="ID_1963450567" MODIFIED="1341380328816" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_367925992" MODIFIED="1340964822738" TEXT="WLANConfiguration.x is hide&#xa;WLANConfiguration.x is mapped EndPoint"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_841516986" MODIFIED="1341380328213" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_615660473" MODIFIED="1340964832269" TEXT="unmap EndPoint to WLANConfiguration.x "/>
</node>
</node>
<node CREATED="1340962327067" FOLDED="true" ID="ID_1484425572" MODIFIED="1341380341173" TEXT="by change device mode from Station to AP">
<node CREATED="1340962190519" FOLDED="true" ID="ID_713805324" MODIFIED="1341380340281" TEXT="judge condition">
<node CREATED="1340963057656" ID="ID_1937740596" MODIFIED="1340964878554" TEXT="WLANConfiguration.x is unhide&#xa;WLANConfiguration.x.DeviceOperationMode is AP&#xa;WLANConfiguration.x is mapped to a EndPoint&#xa;"/>
</node>
<node CREATED="1340962234893" FOLDED="true" ID="ID_1893488324" MODIFIED="1341380339551" TEXT="action to do">
<node CREATED="1340963057656" ID="ID_1981714645" MODIFIED="1340964893480" TEXT="unmap EndPoint to WLANConfiguration.x "/>
</node>
</node>
</node>
<node CREATED="1340962059463" FOLDED="true" ID="ID_1061697571" MODIFIED="1341385830589" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile">
<node CREATED="1341381146615" ID="ID_222078354" MODIFIED="1341381217878" TEXT="Device.WiFi.EndPoint.*.Profile.x was mapped to&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.x"/>
<node CREATED="1341381315658" ID="ID_1388623345" MODIFIED="1341381600280" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.SSID&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.LocationDescription&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Secrity.ModeEnabled&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.WEPKey.a[0].WEPKey&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.PreSharedKey.a[0].PreSharedKey&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.KeyPassphrase&#xa;was mapped to&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.*.SSID&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.*.Location&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.*.Security.ModeEnabled&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.*.Security.WEPKey&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.*.Security.PreSharedKey&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.*.Security.KeyPassphrase"/>
<node CREATED="1341383837877" FOLDED="true" ID="ID_1260425856" MODIFIED="1341384723854" TEXT="when to map ?">
<node CREATED="1341383885468" ID="ID_163582962" MODIFIED="1341384007202" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.DeviceOperationMode is sta&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.* is mapped to a EndPoint&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.ProfileReference is a valid entry&#xa;"/>
<node CREATED="1341383885468" ID="ID_439669178" MODIFIED="1341384124917" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.DeviceOperationMode is sta&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.ProfileReference is a valid entry&#xa;current job is the first job"/>
</node>
<node CREATED="1341383846233" FOLDED="true" ID="ID_346264478" MODIFIED="1341384748896" TEXT="when to unmap ?">
<node CREATED="1341383885468" ID="ID_1683413614" MODIFIED="1341384388806" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.DeviceOperationMode is sta&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.ProfileReference is invalid entry&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile has been mapped"/>
<node CREATED="1341383885468" ID="ID_1175845469" MODIFIED="1341384486110" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.DeviceOperationMode is sta&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.ProfileReference is a valid entry&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.* is not mapped to a EndPoint&#xa;cuurent job is not first job&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile has been mapped"/>
<node CREATED="1341383885468" ID="ID_950627937" MODIFIED="1341384716055" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.DeviceOperationMode is not sta&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile has been mapped"/>
</node>
<node CREATED="1341384763667" FOLDED="true" ID="ID_1309959454" MODIFIED="1341385411320" TEXT="other rule for profile">
<node CREATED="1341385176321" ID="ID_309396209" MODIFIED="1341385305178" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Enable should be false&#xa;when &#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.ProfileReference is Profile x&#xa;and&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile.x.Enable is false"/>
<node CREATED="1341385176321" ID="ID_576290820" MODIFIED="1341385397111" TEXT="InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.Profile should be deleted&#xa;when &#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.*.DeviceOperationMode is not sta&#xa;"/>
</node>
</node>
</node>
</node>
<node CREATED="1340955913118" FOLDED="true" ID="ID_1147652776" MODIFIED="1341385564597" TEXT="hide, unhide">
<node CREATED="1340956233078" FOLDED="true" ID="ID_74005539" MODIFIED="1341380483959" TEXT="map tr181 node to tr098 node">
<node CREATED="1340956297662" ID="ID_314211715" MODIFIED="1340956341476" TEXT="mib both exist in tr181 node and tr098 node, it is unhide"/>
<node CREATED="1340956347923" FOLDED="true" ID="ID_1515751229" MODIFIED="1341380466014" TEXT="mib exist in tr181 node but not exist in tr098 node, it is hide ">
<node CREATED="1340956558437" ID="ID_1461532427" MODIFIED="1340956681306" TEXT="we should unhide all mibs under this mapped  tr181 node&#xa;function &quot;tr181_unhide_object&quot; is used to do this job"/>
</node>
<node CREATED="1340956350169" ID="ID_207083342" MODIFIED="1340956460850" TEXT="mib exist in tr098 node but not exist in  tr181 node, it is unhide "/>
</node>
<node CREATED="1340956233078" FOLDED="true" ID="ID_924269216" MODIFIED="1341380536043" TEXT="unmap tr181 node to tr098 node">
<node CREATED="1340956784743" FOLDED="true" ID="ID_1733005927" MODIFIED="1341380513910" TEXT="by delobject from tr181">
<node CREATED="1340956297662" ID="ID_693483205" MODIFIED="1340956866775" TEXT="mib both exist in tr181 node and tr098 node, it is hide"/>
<node CREATED="1340956347923" ID="ID_1775502272" MODIFIED="1340956871858" TEXT="mib exist in tr181 node but not exist in tr098 node, it is hide "/>
<node CREATED="1340956350169" FOLDED="true" ID="ID_1954752109" MODIFIED="1341380513055" TEXT="mib exist in tr098 node but not exist in  tr181 node, it is unhide ">
<node CREATED="1340956558437" ID="ID_1538910652" MODIFIED="1340956914711" TEXT="we should hide all mibs under this mapped  tr098 node&#xa;function &quot;tr181_hide_object&quot; is used to do this job"/>
</node>
</node>
<node CREATED="1340956784743" FOLDED="true" ID="ID_507763219" MODIFIED="1341380534712" TEXT="by delobject from tr098">
<node CREATED="1340956297662" ID="ID_621970887" MODIFIED="1340956990126" TEXT="mib both exist in tr181 node and tr098 node, it is hide"/>
<node CREATED="1340956347923" FOLDED="true" ID="ID_1351863201" MODIFIED="1341380529695" TEXT="mib exist in tr181 node but not exist in tr098 node, it is unhide ">
<node CREATED="1340956558437" ID="ID_253520490" MODIFIED="1340957081104" TEXT="we should hide all mibs under this mapped  tr181 node&#xa;function &quot;tr181_hide_object&quot; is used to do this job"/>
</node>
<node CREATED="1340956350169" ID="ID_614641676" MODIFIED="1340957047214" TEXT="mib exist in tr098 node but not exist in  tr181 node, it is hide "/>
</node>
</node>
<node CREATED="1340966546043" ID="ID_1461822240" MODIFIED="1340966636720" TEXT="reset is equal to &quot;unmap, then map&quot;&#xa;so problem is the same as &quot;map tr181 node to tr098 node&quot;"/>
</node>
<node CREATED="1340957548592" FOLDED="true" ID="ID_739830202" MODIFIED="1341381079427" TEXT="store and restore">
<node CREATED="1340957558957" FOLDED="true" ID="ID_1677166579" MODIFIED="1341381078043" TEXT="do we need store and restore tr181 tree ?">
<node CREATED="1341380921352" ID="ID_627469197" MODIFIED="1341381075647" TEXT="because tr181 mib has been mapped to tr098 mib, &#xa;so we needn&apos;t store and restore tr181 mib&#xa;see mibNvsSaveWrite and mibDisplaySiblings in file mib.c"/>
</node>
</node>
</node>
<node CREATED="1341457698592" FOLDED="true" ID="ID_1221315934" MODIFIED="1341457983381" TEXT="map_tree">
<node CREATED="1341457698592" FOLDED="true" ID="ID_675517989" MODIFIED="1341457891898" TEXT="Device">
<node CREATED="1341457698593" ID="ID_1851675790" MODIFIED="1341457698593" TEXT="DeviceSummary"/>
<node CREATED="1341457698593" FOLDED="true" ID="ID_847861805" MODIFIED="1341457713909" TEXT="DeviceInfo">
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Manufacturer"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ManufacturerOUI"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ModelName"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Description"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ProductClass"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="SerialNumber"/>
<node CREATED="1341457698593" ID="ID_373016490" MODIFIED="1341457698593" TEXT="HardwareVersion"/>
<node CREATED="1341457698593" ID="ID_1708149151" MODIFIED="1341457698593" TEXT="AdditionalHardwareVersion"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="SoftwareVersion"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="AdditionalSoftwareVersion"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ProvisioningCode"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="UpTime"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="FirstUseDate"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="SupportedDataModelNumberOfEntries"/>
<node CREATED="1341457698593" FOLDED="true" ID="ID_823957414" MODIFIED="1341457712231" TEXT="SupportedDataModel">
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="URL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="URN"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Features"/>
</node>
</node>
<node CREATED="1341457698593" FOLDED="true" ID="ID_1682307612" MODIFIED="1341457716147" TEXT="ManagementServer">
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="URL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Username"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Password"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="PeriodicInformEnable"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="PeriodicInformInterval"/>
<node CREATED="1341457698593" ID="ID_229075559" MODIFIED="1341457698593" TEXT="PeriodicInformTime"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ParameterKey"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ConnectionRequestURL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ConnectionRequestUsername"/>
<node CREATED="1341457698593" ID="ID_563247095" MODIFIED="1341457698593" TEXT="ConnectionRequestPassword"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="UpgradesManaged"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="KickURL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="DownloadProgressURL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="UDPConnectionRequestAddress"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNEnable"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNServerAddress"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNServerPort"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNUsername"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNPassword"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNMaximumKeepAlivePeriod"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNMinimumKeepAlivePeriod"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="NATDetected"/>
</node>
<node CREATED="1341457698593" FOLDED="true" ID="ID_898802798" MODIFIED="1341457857361" TEXT="WiFi">
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="RadioNumberOfEntries"/>
<node CREATED="1341457698593" ID="ID_1811870136" MODIFIED="1341457698593" TEXT="SSIDNumberOfEntries"/>
<node CREATED="1341457698593" ID="ID_351042398" MODIFIED="1341457698593" TEXT="AccessPointNumberOfEntries"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="EndPointNumberOfEntries"/>
<node CREATED="1341457698593" FOLDED="true" ID="ID_1610794129" MODIFIED="1341457722260" TEXT="Radio">
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Enable"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Status"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Alias"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Name"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="LastChange"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="LowerLayers"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Upstream"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="MaxBitRate"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="SupportedFrequencyBands"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="OperatingFrequencyBand"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="SupportedStandards"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="OperatingStandards"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="PossibleChannels"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="ChannelsInUse"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="Channel"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="AutoChannelSupported"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="AutoChannelEnable"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="AutoChannelRefreshPeriod"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="OperatingChannelBandwidth"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="ExtensionChannel"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="GuardInterval"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="MCS"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="TransmitPowerSupported"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="TransmitPower"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="IEEE80211hSupported"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="IEEE80211hEnabled"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="RegulatoryDomain"/>
<node CREATED="1341457698594" FOLDED="true" ID="ID_470620770" MODIFIED="1341457719871" TEXT="Stats">
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="BytesSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="BytesReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="PacketsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="PacketsReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="ErrorsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="ErrorsReceived"/>
<node CREATED="1341457698594" ID="ID_801297131" MODIFIED="1341457698594" TEXT="DiscardPacketsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="DiscardPacketsReceived"/>
</node>
</node>
<node CREATED="1341457698594" FOLDED="true" ID="ID_1326595519" MODIFIED="1341457726684" TEXT="SSID">
<node CREATED="1341457698594" ID="ID_702578152" MODIFIED="1341457698594" TEXT="Enable"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="Status"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="Alias"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="Name"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="LastChange"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="LowerLayers"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="BSSID"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="MACAddress"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="SSID"/>
<node CREATED="1341457698594" FOLDED="true" ID="ID_732984044" MODIFIED="1341457725278" TEXT="Stats">
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="BytesSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="BytesReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="PacketsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="PacketsReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="ErrorsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="ErrorsReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="UnicastPacketsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="UnicastPacketsReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="DiscardPacketsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="DiscardPacketsReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="MulticastPacketsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="MulticastPacketsReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="BroadcastPacketsSent"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="BroadcastPacketsReceived"/>
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="UnknownProtoPacketsReceived"/>
</node>
</node>
<node CREATED="1341457698594" FOLDED="true" ID="ID_1697614599" MODIFIED="1341457732626" TEXT="AccessPoint">
<node CREATED="1341457698594" MODIFIED="1341457698594" TEXT="Enable"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Status"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Alias"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="SSIDReference"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="SSIDAdvertisementEnabled"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="RetryLimit"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="WMMCapability"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="UAPSDCapability"/>
<node CREATED="1341457698595" ID="ID_1869115143" MODIFIED="1341457698595" TEXT="WMMEnable"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="UAPSDEnable"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="AssociatedDeviceNumberOfEntries"/>
<node CREATED="1341457698595" FOLDED="true" ID="ID_684917458" MODIFIED="1341457728542" TEXT="Security">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ModesSupported"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ModeEnabled"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="WEPKey"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="PreSharedKey"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="KeyPassphrase"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="RekeyingInterval"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="RadiusServerIPAddr"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="RadiusServerPort"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="RadiusSecret"/>
</node>
<node CREATED="1341457698595" FOLDED="true" ID="ID_148272108" MODIFIED="1341457729963" TEXT="WPS">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Enable"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ConfigMethodsSupported"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ConfigMethodsEnabled"/>
</node>
<node CREATED="1341457698595" FOLDED="true" ID="ID_209140563" MODIFIED="1341457731314" TEXT="AssociatedDevice">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="MACAddress"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="AuthenticationState"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="LastDataDownlinkRate"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="LastDataUplinkRate"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="SignalStrength"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Retransmissions"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Active"/>
</node>
</node>
<node CREATED="1341457698595" FOLDED="true" ID="ID_380689202" MODIFIED="1341457752042" TEXT="EndPoint">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Enable"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Status"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Alias"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ProfileReference"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="SSIDReference"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ProfileNumberOfEntries"/>
<node CREATED="1341457698595" FOLDED="true" ID="ID_235312139" MODIFIED="1341457734874" TEXT="Stats">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="LastDataDownlinkRate"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="LastDataUplinkRate"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="SignalStrength"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Retransmissions"/>
</node>
<node CREATED="1341457698595" FOLDED="true" ID="ID_119299428" MODIFIED="1341457736037" TEXT="Security">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ModesSupported"/>
</node>
<node CREATED="1341457698595" FOLDED="true" ID="ID_913838231" MODIFIED="1341457739026" TEXT="Profile">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Enable"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Status"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Alias"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="SSID"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Location"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="Priority"/>
<node CREATED="1341457698595" FOLDED="true" ID="ID_1486883965" MODIFIED="1341457738051" TEXT="Security">
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="ModeEnabled"/>
<node CREATED="1341457698595" MODIFIED="1341457698595" TEXT="WEPKey"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="PreSharedKey"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="KeyPassphrase"/>
</node>
</node>
<node CREATED="1341457698596" FOLDED="true" ID="ID_1297472582" MODIFIED="1341457740603" TEXT="WPS">
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="Enable"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="ConfigMethodsSupported"/>
</node>
</node>
</node>
</node>
<node CREATED="1341457698596" FOLDED="true" ID="ID_1045616055" MODIFIED="1341457890942" TEXT="InternetGatewayDevice">
<node CREATED="1341457698593" ID="ID_1440542150" MODIFIED="1341457698593" TEXT="DeviceSummary"/>
<node CREATED="1341457698593" FOLDED="true" ID="ID_1375199702" MODIFIED="1341457829739" TEXT="DeviceInfo">
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Manufacturer"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ManufacturerOUI"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ModelName"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Description"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ProductClass"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="SerialNumber"/>
<node CREATED="1341457698593" ID="ID_1338589200" MODIFIED="1341457698593" TEXT="HardwareVersion"/>
<node CREATED="1341457698593" ID="ID_953254475" MODIFIED="1341457698593" TEXT="AdditionalHardwareVersion"/>
<node CREATED="1341457698593" ID="ID_403671424" MODIFIED="1341457698593" TEXT="SoftwareVersion"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="AdditionalSoftwareVersion"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ProvisioningCode"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="UpTime"/>
<node CREATED="1341457698593" ID="ID_136486687" MODIFIED="1341457698593" TEXT="FirstUseDate"/>
</node>
<node CREATED="1341457698593" FOLDED="true" ID="ID_46481568" MODIFIED="1341457847982" TEXT="ManagementServer">
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="URL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Username"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="Password"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="PeriodicInformEnable"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="PeriodicInformInterval"/>
<node CREATED="1341457698593" ID="ID_1731282843" MODIFIED="1341457698593" TEXT="PeriodicInformTime"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ParameterKey"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ConnectionRequestURL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="ConnectionRequestUsername"/>
<node CREATED="1341457698593" ID="ID_1479621660" MODIFIED="1341457698593" TEXT="ConnectionRequestPassword"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="UpgradesManaged"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="KickURL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="DownloadProgressURL"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="UDPConnectionRequestAddress"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNEnable"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNServerAddress"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNServerPort"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNUsername"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNPassword"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNMaximumKeepAlivePeriod"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="STUNMinimumKeepAlivePeriod"/>
<node CREATED="1341457698593" MODIFIED="1341457698593" TEXT="NATDetected"/>
</node>
<node CREATED="1341457698596" FOLDED="true" ID="ID_1001395148" MODIFIED="1341457889946" TEXT="LANDevice">
<node CREATED="1341457698596" FOLDED="true" ID="ID_1709540065" MODIFIED="1341457888675" TEXT="WLANConfiguration">
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="Enable"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_11NRates"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_11NRetries"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_RadioIndex"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="Status"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="BSSID"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="MaxBitRate"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="SSID"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="BeaconType"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="MACAddressControlEnabled"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="Standard"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="WEPKeyIndex"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="KeyPassphrase"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="WEPEncryptionLevel"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="BasicEncryptionModes"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="BasicAuthenticationMode"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="WPAEncryptionModes"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="WPAAuthenticationMode"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="IEEE11iEncryptionModes"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="IEEE11iAuthenticationMode"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_GroupRekeyPeriod"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="PossibleChannels"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="BasicDataTransmitRates"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="OperationalDataTransmitRates"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="PossibleDataTransmitRates"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="InsecureOOBAccessEnabled"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="BeaconAdvertisementEnabled"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="AutoRateFallBackEnabled"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="LocationDescription"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="TotalPSKFailures"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="TotalIntegrityFailures"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="ChannelsInUse"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="DeviceOperationMode"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="RTS"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="Fragmentation"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="StaForward"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="VAPIndependent"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="DistanceFromRoot"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="PeerBSSID"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="AuthenticationServiceMode"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_EAPMode"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_CACert"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_8021XPhase2"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_8021XIdentity"/>
<node CREATED="1341457698596" MODIFIED="1341457698596" TEXT="X_ATH-COM_8021XPassword"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_EAPPrivateKeyFile"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_EAPPrivateKeyPassword"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_EAPReauthPeriod"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_WEPRekeyPeriod"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_8021XWEPBcastKeyLen"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_8021XWEPUcastKeyLen"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_AuthServerAddr"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_AuthServerPort"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_AuthServerSecret"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_PureG"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_PureN"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_RSNPreAuth"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalBytesSent"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalBytesReceived"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalPacketsSent"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalPacketsReceived"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalReceivedDrops"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalReceivedErrors"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalSentDrops"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalSentErrors"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="TotalAssociations"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_SSIDHide"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_PowerValue"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_APModuleEnable"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_WPSPin"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_VapIfname"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_ChannelInUse"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_WPSConfigured"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_TxQLength"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_ShortGI"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_Doth"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_CWMEnable"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_BgScan"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_Extprotspac"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_HTdupieEnable"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_WMM"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_HT40Coexist"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_HBREnable"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_HBRPERLow"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_HBRPERHigh"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_MEMode"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_MELength"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_METimer"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_METimeout"/>
<node CREATED="1341457698597" MODIFIED="1341457698597" TEXT="X_ATH-COM_MEDropMcast"/>
<node CREATED="1341457698598" FOLDED="true" ID="ID_315558897" MODIFIED="1341457779834" TEXT="AssociatedDevice">
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="AssociatedDeviceMACAddress"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="AssociatedDeviceIPAddress"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="AssociatedDeviceAuthenticationState"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastRequestedUnicastCipher"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastRequestedMulticastCipher"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastPMKId"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastDataDownlinkRate"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastDataUplinkRate"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="SignalStrength"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Retransmissions"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Active"/>
</node>
<node CREATED="1341457698598" FOLDED="true" ID="ID_1215707876" MODIFIED="1341457774179" TEXT="WEPKey">
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="WEPKey"/>
</node>
<node CREATED="1341457698598" FOLDED="true" ID="ID_687443933" MODIFIED="1341457772992" TEXT="PreSharedKey">
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="PreSharedKey"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="KeyPassphrase"/>
<node CREATED="1341457698598" ID="ID_1144910561" MODIFIED="1341457698598" TEXT="AssociatedDeviceMACAddress"/>
</node>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Channel"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="RadioEnabled"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="X_ATH-COM_WPSKeyWord"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="X_ATH-COM_Powerlevel"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Alias"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastChange"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LowerLayers"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="ProfileReference"/>
<node CREATED="1341457698598" FOLDED="true" ID="ID_745119925" MODIFIED="1341457768159" TEXT="Stats">
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="UnicastPacketsSent"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="UnicastPacketsReceived"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="MulticastPacketsSent"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="MulticastPacketsReceived"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="BroadcastPacketsSent"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="BroadcastPacketsReceived"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="UnknownProtoPacketsReceived"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastDataDownlinkRate"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="LastDataUplinkRate"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="SignalStrength"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Retransmissions"/>
</node>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="SSIDAdvertisementEnabled"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="RetryLimit"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="WMMCapability"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="UAPSDCapability"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="UAPSDEnable"/>
<node CREATED="1341457698598" FOLDED="true" ID="ID_1454156559" MODIFIED="1341457764498" TEXT="Security">
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="ModesSupported"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="ModeEnabled"/>
</node>
<node CREATED="1341457698598" FOLDED="true" ID="ID_1650434562" MODIFIED="1341457763384" TEXT="WPS">
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="ConfigMethodsSupported"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="ConfigMethodsEnabled"/>
</node>
<node CREATED="1341457698598" FOLDED="true" ID="ID_576479698" MODIFIED="1341457761952" TEXT="Profile">
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Enable"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Status"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Alias"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="SSID"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Location"/>
<node CREATED="1341457698598" MODIFIED="1341457698598" TEXT="Priority"/>
<node CREATED="1341457698599" FOLDED="true" ID="ID_1000862023" MODIFIED="1341457760668" TEXT="Security">
<node CREATED="1341457698599" MODIFIED="1341457698599" TEXT="ModeEnabled"/>
<node CREATED="1341457698599" MODIFIED="1341457698599" TEXT="WEPKey"/>
<node CREATED="1341457698599" MODIFIED="1341457698599" TEXT="PreSharedKey"/>
<node CREATED="1341457698599" MODIFIED="1341457698599" TEXT="KeyPassphrase"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1340953859728" FOLDED="true" ID="ID_1678119403" MODIFIED="1341389216713" TEXT="affect on mib operation">
<node CREATED="1340953882047" FOLDED="true" ID="ID_1526601045" MODIFIED="1341389212975" TEXT="get">
<node CREATED="1341388908387" ID="ID_1976352506" MODIFIED="1341388948760" TEXT="&quot;get&quot; means get tr098 mib tree&#xa;&quot;get Device&quot; means get tr181 mib tree"/>
</node>
<node CREATED="1340953885862" ID="ID_309659868" MODIFIED="1340953887807" TEXT="set"/>
<node CREATED="1340953888900" ID="ID_1541849475" MODIFIED="1340953893568" TEXT="addobject"/>
<node CREATED="1340953894107" ID="ID_758865899" MODIFIED="1340953899196" TEXT="delobject"/>
<node CREATED="1340953900096" ID="ID_1538260827" MODIFIED="1340953903240" TEXT="reset"/>
<node CREATED="1340954049366" FOLDED="true" ID="ID_1893206482" MODIFIED="1341388978223" TEXT="save">
<node CREATED="1341388723746" ID="ID_1140227371" MODIFIED="1341388747498" TEXT="don&apos;t save tr181 mib tree"/>
</node>
<node CREATED="1340953932959" ID="ID_627750973" MODIFIED="1340953944763" TEXT="restore"/>
<node CREATED="1341388559947" ID="ID_1893593526" MODIFIED="1341388562498" TEXT="FileXfer"/>
<node CREATED="1341388704667" ID="ID_865002135" MODIFIED="1341388706999" TEXT="reboot"/>
<node CREATED="1340954111223" FOLDED="true" ID="ID_1462876326" MODIFIED="1341389210720" TEXT="tr069">
<node CREATED="1340954120177" FOLDED="true" ID="ID_1595676375" MODIFIED="1341389192791" TEXT="inform">
<node CREATED="1341389115656" ID="ID_1374811823" MODIFIED="1341389188302" TEXT="when mib currentDataModel is &quot;InternetGatewayDevice&quot;, inform only report tr098 mib tree&#xa;when mib currentDataModel is &quot;Device&quot;, inform only report tr181 mib tree"/>
</node>
<node CREATED="1341388490243" ID="ID_36451746" MODIFIED="1341388493011" TEXT="SetAttr"/>
</node>
</node>
<node CREATED="1340954392481" FOLDED="true" ID="ID_1577006292" MODIFIED="1341387521034" TEXT="special case">
<node CREATED="1340958898413" ID="ID_1840319401" MODIFIED="1340958938834" TEXT="mib node itself is also need mapped"/>
<node CREATED="1340960162140" FOLDED="true" ID="ID_528107406" MODIFIED="1341387490282" TEXT="how to map &quot;ModeEnabled&quot; to atheros wlan secrity method">
<node CREATED="1341386467724" FOLDED="true" ID="ID_1560616585" MODIFIED="1341386776425" TEXT="None">
<node CREATED="1341386592051" ID="ID_261314" MODIFIED="1341386774875" TEXT="BeaconType = None"/>
</node>
<node CREATED="1341386482814" FOLDED="true" ID="ID_8344737" MODIFIED="1341386929939" TEXT="WEP_64">
<node CREATED="1341386592051" ID="ID_732962333" MODIFIED="1341386908953" TEXT="BeaconType = Basic&#xa;AuthenticationServiceMode = None&#xa;WEPKeyIndex  = 1&#xa;BasicAuthenticationMode = None"/>
</node>
<node CREATED="1341386494374" FOLDED="true" ID="ID_1833548963" MODIFIED="1341386930900" TEXT="WEP_128">
<node CREATED="1341386592051" ID="ID_486638500" MODIFIED="1341386908953" TEXT="BeaconType = Basic&#xa;AuthenticationServiceMode = None&#xa;WEPKeyIndex  = 1&#xa;BasicAuthenticationMode = None"/>
</node>
<node CREATED="1341386506782" FOLDED="true" ID="ID_164371523" MODIFIED="1341387356183" TEXT="WPA_WPA2_Personal">
<node CREATED="1341386592051" ID="ID_1008498263" MODIFIED="1341387033407" TEXT="BeaconType = WPAand11i&#xa;IEEE11iEncryptionModes = AESEncryption&#xa;IEEE11iAuthenticationMode = PSKAuthentication&#xa;AuthenticationServiceMode = None&#xa;XATHCOMRSNPreAuth = 0"/>
</node>
<node CREATED="1341386516298" FOLDED="true" ID="ID_1772846997" MODIFIED="1341387257537" TEXT="WPA2_Personal">
<node CREATED="1341386592051" ID="ID_788920438" MODIFIED="1341387255078" TEXT="BeaconType = 11i&#xa;IEEE11iEncryptionModes = AESEncryption&#xa;IEEE11iAuthenticationMode = PSKAuthentication&#xa;AuthenticationServiceMode = None&#xa;XATHCOMRSNPreAuth = 0"/>
</node>
<node CREATED="1341386526705" FOLDED="true" ID="ID_986241032" MODIFIED="1341387258697" TEXT="WPA_Personal">
<node CREATED="1341386592051" ID="ID_1040940925" MODIFIED="1341387120442" TEXT="BeaconType = WPA&#xa;WPAEncryptionModes = TKIPEncryption&#xa;WPAAuthenticationMode = PSKAuthentication&#xa;AuthenticationServiceMode = None&#xa;XATHCOMRSNPreAuth = 0"/>
</node>
<node CREATED="1341386539143" FOLDED="true" ID="ID_1793873628" MODIFIED="1341387417017" TEXT="WPA_WPA2_Enterprise">
<node CREATED="1341386592051" ID="ID_344115947" MODIFIED="1341387353878" TEXT="BeaconType = WPAand11i&#xa;IEEE11iEncryptionModes = AESEncryption&#xa;IEEE11iAuthenticationMode = EAPAuthentication&#xa;AuthenticationServiceMode = RadiusClient&#xa;XATHCOMRSNPreAuth = 0"/>
</node>
<node CREATED="1341386548864" FOLDED="true" ID="ID_1485392049" MODIFIED="1341387418368" TEXT="WPA2_Enterprise">
<node CREATED="1341386592051" ID="ID_1179568901" MODIFIED="1341387412799" TEXT="BeaconType = 11i&#xa;IEEE11iEncryptionModes = AESEncryption&#xa;IEEE11iAuthenticationMode = EAPAuthentication&#xa;AuthenticationServiceMode = RadiusClient&#xa;XATHCOMRSNPreAuth = 0"/>
</node>
<node CREATED="1341386559523" FOLDED="true" ID="ID_1864947984" MODIFIED="1341387485769" TEXT="WPA_Enterprise">
<node CREATED="1341386592051" ID="ID_385400718" MODIFIED="1341387484162" TEXT="BeaconType =WPA&#xa;WPAEncryptionModes = TKIPEncryption&#xa;WPAAuthenticationMode = EAPAuthentication&#xa;AuthenticationServiceMode = RadiusClient&#xa;XATHCOMRSNPreAuth = 0"/>
</node>
</node>
<node CREATED="1340960783960" FOLDED="true" ID="ID_370083727" MODIFIED="1341386336149" TEXT="how to use profile of endpoint">
<node CREATED="1340961254571" FOLDED="true" ID="ID_268538011" MODIFIED="1341386330569" TEXT="map secrity parameter under WLANConfiguration to secrity parameter under WLANConfiguration.Profile.x when WLANConfiguration.*.ProfileReference is set&#xa;to Device.WiFi.EndPoint.*.Profile.x">
<node CREATED="1340961515949" ID="ID_860732280" LINK="#ID_1388623345" MODIFIED="1341385825274" TEXT="map secrity parameter"/>
<node CREATED="1340961529526" FOLDED="true" ID="ID_1608156788" MODIFIED="1341386329557" TEXT="map service plugin">
<node CREATED="1341385898525" ID="ID_989604699" MODIFIED="1341386327297" TEXT="use type of map : &quot;map tr098 mib to tr098 mib&quot;&#xa;because service plugin is not aware of profile, service plugin just know&#xa;secrity parameters under InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.&#xa;so we should map service plugin of profile to service plugin of secrity parameters under InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.&#xa;then service plugin will be notified when profile was chenged."/>
</node>
</node>
</node>
</node>
<node CREATED="1340959019960" FOLDED="true" ID="ID_415137701" MODIFIED="1341385757393" TEXT="remain issues">
<node CREATED="1340959030103" FOLDED="true" ID="ID_771603970" MODIFIED="1341385724292" TEXT="mib alias">
<node CREATED="1340959043926" ID="ID_1450236751" MODIFIED="1340959132698" TEXT="which way will ACS server use mib alias in ?"/>
</node>
<node CREATED="1340959142509" ID="ID_1911672735" MODIFIED="1340959148753" TEXT="interface stack"/>
<node CREATED="1340959189101" FOLDED="true" ID="ID_1677798816" MODIFIED="1341385727913" TEXT="AssociatedDevice">
<node CREATED="1340959221536" ID="ID_1281697272" MODIFIED="1340959341392" TEXT="according to cdrouter test, AssociatedDevice should be added dynamicly&#xa;but we don&apos;t allow this operation, we just list all active and none active entries"/>
<node CREATED="1340960592524" ID="ID_399622506" MODIFIED="1340960634907" TEXT="some information about AssociatedDevice is not correct"/>
</node>
<node CREATED="1340959350930" FOLDED="true" ID="ID_177544478" MODIFIED="1341385731307" TEXT="how to tell ACS server we support both tr181 and tr098 data model">
<node CREATED="1340959424159" FOLDED="true" ID="ID_564897690" MODIFIED="1341379409688" TEXT="according to cdrouter, ACS server will search string &quot;DeviceSummary&quot; in inform message.&#xa;but this string can only carry one data model description.&#xa;InternetGatewayDevice:1.1[](Baseline:1, EthernetLAN:1, WiFiLAN:1, EthernetWAN:1)&#xa;or&#xa;Device:2.0[](Baseline:1, WiFiRadio:1, WiFiSSID:1, WiFiAccessPoint:1, WiFiEndPoint:1)">
<node CREATED="1340959671536" ID="ID_1665753208" MODIFIED="1340959992813" TEXT="we have added a mib &quot;InternetGatewayDevice.X_ATH_COM-Internal.currentDataModel&quot;&#xa;to designate which data model should be included in inform message.&#xa;manager plugin tr069sh will use this mib to filter mib parameter in &quot;tr069shQOutputInform&quot;"/>
</node>
</node>
<node CREATED="1341303355634" ID="ID_259701311" MODIFIED="1341385750521" TEXT="make tr181 enable/disable configurable in openwrt"/>
<node CREATED="1341303390349" ID="ID_1181617549" MODIFIED="1341303409769" TEXT="move modeEnable from wlansec to tr181"/>
</node>
<node CREATED="1340960443604" FOLDED="true" ID="ID_831041975" MODIFIED="1341385713190" TEXT="test need to do">
<node CREATED="1340960460670" ID="ID_1463852854" MODIFIED="1340960492730" TEXT="wlan station function"/>
<node CREATED="1340960496438" ID="ID_888371868" MODIFIED="1340960505894" TEXT="multi vap"/>
</node>
</node>
</node>
</map>
