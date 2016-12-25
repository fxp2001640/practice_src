<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1389247016681" ID="ID_280815202" MODIFIED="1389247034072" TEXT="linux device driver model">
<node CREATED="1389247112145" FOLDED="true" ID="ID_1531911253" MODIFIED="1392017443539" POSITION="right" TEXT="Platform Devices and Drivers">
<node CREATED="1389247198335" FOLDED="true" ID="ID_390008935" MODIFIED="1389603734272" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1389247212513" ID="ID_1955451633" MODIFIED="1389247509292">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#33324;&#30340;&#23884;&#20837;&#24335;SOC&#37117;&#20250;&#38598;&#25104;&#24456;&#22810;device controller,CPU&#21487;&#20197;&#30452;&#25509;&#35775;&#38382;&#36825;&#20123;device controller&#32780;&#19981;&#38656;&#35201;&#36890;&#36807;bus,&#20026;&#20102;&#23558;&#36825;&#26679;&#30340;device&#25972;&#21512;&#21040;linux&#39537;&#21160;&#27169;&#22411;&#20013;&#21435;,linux&#20551;&#35774;&#20102;&#19968;&#20010;&#34394;&#25311;&#30340;bus&#21363;platform bus,&#25152;&#26377;&#36825;&#20123;cpu&#30452;&#25509;&#33021;&#35775;&#38382;&#30340;&#35774;&#22791;&#37117;&#25346;&#22312;&#36825;&#20010;&#34394;&#25311;&#30340;platform bus&#19978;.
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389256086373" ID="ID_1299869457" MODIFIED="1389256197431" TEXT="&#x5728;Linux 2.6&#x7684;&#x8bbe;&#x5907;&#x9a71;&#x52a8;&#x6a21;&#x578b;&#x4e2d;&#xff0c;&#x5173;&#x5fc3;&#x603b;&#x7ebf;&#x3001;&#x8bbe;&#x5907;&#x548c;&#x9a71;&#x52a8;&#x8fd9;3&#x4e2a;&#x5b9e;&#x4f53;&#xff0c;&#x603b;&#x7ebf;&#x5c06;&#x8bbe;&#x5907;&#x548c;&#x9a71;&#x52a8;&#x7ed1;&#x5b9a;&#x3002;&#x5728;&#x7cfb;&#x7edf;&#x6bcf;&#x6ce8;&#x518c;&#x4e00;&#x4e2a;&#x8bbe;&#x5907;&#x7684;&#x65f6;&#x5019;&#xff0c;&#x4f1a;&#x5bfb;&#x627e;&#x4e0e;&#x4e4b;&#x5339;&#x914d;&#x7684;&#x9a71;&#x52a8;&#xff1b;&#x76f8;&#x53cd;&#x7684;&#xff0c;&#x5728;&#x7cfb;&#x7edf;&#x6bcf;&#x6ce8;&#x518c;&#x4e00;&#x4e2a;&#x9a71;&#x52a8;&#x7684;&#x65f6;&#x5019;&#xff0c;&#x4f1a;&#x5bfb;&#x627e;&#x4e0e;&#x4e4b;&#x5339;&#x914d;&#x7684;&#x8bbe;&#x5907;&#xff0c;&#x800c;&#x5339;&#x914d;&#x7531;&#x603b;&#x7ebf;&#x5b8c;&#x6210;&#x3002;&#x4e00;&#x4e2a;&#x73b0;&#x5b9e;&#x7684;Linux&#x8bbe;&#x5907;&#x548c;&#x9a71;&#x52a8;&#x901a;&#x5e38;&#x90fd;&#x9700;&#x8981;&#x6302;&#x63a5;&#x5728;&#x4e00;&#x79cd;&#x603b;&#x7ebf;&#x4e0a;&#xff0c;&#x5bf9;&#x4e8e;&#x672c;&#x8eab;&#x4f9d;&#x9644;&#x4e8e;PCI&#x3001;USB&#x3001;I2 C&#x3001;SPI&#x7b49;&#x7684;&#x8bbe;&#x5907;&#x800c;&#x8a00;&#xff0c;&#x8fd9;&#x81ea;&#x7136;&#x4e0d;&#x662f;&#x95ee;&#x9898;&#xff0c;&#x4f46;&#x662f;&#x5728;&#x5d4c;&#x5165;&#x5f0f;&#x7cfb;&#x7edf;&#x91cc;&#x9762;&#xff0c;SoC&#x7cfb;&#x7edf;&#x4e2d;&#x96c6;&#x6210;&#x7684;&#x72ec;&#x7acb;&#x7684;&#x5916;&#x8bbe;&#x63a7;&#x5236;&#x5668;&#x3001;&#x6302;&#x63a5;&#x5728;SoC&#x5185;&#x5b58;&#x7a7a;&#x95f4;&#x7684;&#x5916;&#x8bbe;&#x7b49;&#x5374;&#x4e0d;&#x4f9d;&#x9644;&#x4e8e;&#x6b64;&#x7c7b;&#x603b;&#x7ebf;&#x3002;&#x57fa;&#x4e8e;&#x8fd9;&#x4e00;&#x80cc;&#x666f;&#xff0c;Linux&#x53d1;&#x660e;&#x4e86;&#x4e00;&#x79cd;&#x865a;&#x62df;&#x7684;&#x603b;&#x7ebf;&#xff0c;&#x79f0;&#x4e3a;platform&#x603b;&#x7ebf;&#xff0c;&#x76f8;&#x5e94;&#x7684;&#x8bbe;&#x5907;&#x79f0;&#x4e3a;platform_device&#xff0c;&#x800c;&#x9a71;&#x52a8;&#x6210;&#x4e3a;platform_driver&#x3002;"/>
</node>
<node CREATED="1389247626547" ID="ID_1808787041" MODIFIED="1389342228351" TEXT="Platform devices">
<node CREATED="1389248671897" ID="ID_1040205783" MODIFIED="1389248673317" TEXT="struct platform_device">
<node CREATED="1389248787929" ID="ID_803501698" MODIFIED="1389248787929" TEXT=" const char * name">
<node CREATED="1389249492732" ID="ID_1760101553" MODIFIED="1389249636735" TEXT="&#x9a71;&#x52a8;&#x540d;&#x79f0;,&#x9700;&#x4e0e;&#x5bf9;&#x5e94;&#x7684;&#x9a71;&#x52a8;struct platform_driver.driver.name&#x76f8;&#x540c;"/>
<node CREATED="1389249843380" ID="ID_1877728918" MODIFIED="1389249863002" TEXT="&#x9700;&#x8981;&#x5728;&#x6dfb;&#x52a0;&#x8bbe;&#x5907;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389248787929" ID="ID_29530309" MODIFIED="1389248787929" TEXT=" int id">
<node CREATED="1389249780010" ID="ID_1395479869" MODIFIED="1389253006215" TEXT="&#x540c;&#x7c7b;&#x578b;&#x8bbe;&#x5907;&#x7684;&#x7f16;&#x53f7;, -1&#x8868;&#x793a;&#x6b64;&#x7c7b;&#x578b;&#x8bbe;&#x5907;&#x53ea;&#x6709;&#x4e00;&#x4e2a;,&#x65e0;&#x987b;&#x7f16;&#x53f7;"/>
<node CREATED="1389249843380" ID="ID_1318011387" MODIFIED="1389249863002" TEXT="&#x9700;&#x8981;&#x5728;&#x6dfb;&#x52a0;&#x8bbe;&#x5907;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389248787929" FOLDED="true" ID="ID_54791166" MODIFIED="1389342237214">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device dev
    </p>
    <p>
      platform_device&#26159;device&#30340;&#19968;&#20010;&#23376;&#31867;,&#22240;&#27492;&#36825;&#37324;dev&#20195;&#34920;&#29238;&#31867;
    </p>
    <p>
      &#26681;&#25454;&#38656;&#35201;&#21487;&#21021;&#22987;&#21270;&#27492;&#32467;&#26500;&#20307;&#20869;&#30340;&#37096;&#20998;&#25104;&#21592;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct device *parent"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct device_private *p"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct kobject kobj"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" const char *init_name"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" const struct device_type *type"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct mutex mutex"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct bus_type *bus"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct device_driver *driver"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct list_head deferred_probe"/>
<node CREATED="1389250082780" ID="ID_867236278" MODIFIED="1389250082780" TEXT=" void *platform_data">
<node CREATED="1389250558006" ID="ID_1564423792" MODIFIED="1389259519756">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#33324;&#26469;&#35828;,&#39537;&#21160;&#38656;&#35201;&#26576;&#20123;&#20851;&#20110;&#27492;device&#30340;&#20449;&#24687;&#25165;&#33021;&#39537;&#21160;&#27492;device,
    </p>
    <p>
      &#28155;&#21152;&#35774;&#22791;&#26102;&#21487;&#20197;&#26377;2&#31181;&#21150;&#27861;&#23558;&#36825;&#20123;device&#29305;&#23450;&#20449;&#24687;&#20256;&#36882;&#32473;driver :
    </p>
    <p>
      1, &#36890;&#36807;struct platform_device.resource
    </p>
    <p>
      2, &#36890;&#36807;struct platform_device.dev.platform_data,&#20854;&#26684;&#24335;&#26159;&#33258;&#23450;&#20041;&#30340;,&#20294;&#24212;&#22312;device&#21644;driver&#38388;&#21462;&#24471;&#20849;&#35782;
    </p>
    <p>
      resource&#30340;&#26041;&#24335;&#19968;&#33324;&#20256;&#36882;&#27604;&#36739;&#31616;&#21333;&#30340;&#20449;&#24687;,&#32780;platform_data&#21017;&#29992;&#20110;&#20256;&#36882;&#27604;&#36739;&#22797;&#26434;&#30340;&#20449;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct dev_pm_info power"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct dev_pm_domain *pm_domain"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" int numa_node"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" u64 *dma_mask"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" u64 coherent_dma_mask"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct device_dma_parameters *dma_parms"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct list_head dma_pools"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct dma_coherent_mem *dma_mem"/>
<node CREATED="1389250082781" ID="ID_197879447" MODIFIED="1389250082781" TEXT=" struct dev_archdata archdata"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct device_node *of_node"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" dev_t devt"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" u32 id"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" spinlock_t devres_lock"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct list_head devres_head"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct klist_node knode_class"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct class *class"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" const struct attribute_group **groups"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" void (*release)(struct device *dev)"/>
</node>
<node CREATED="1389248787930" FOLDED="true" ID="ID_951473246" MODIFIED="1389259546356">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;u32 num_resources
    </p>
    <p>
      &#38656;&#35201;&#22312;&#28155;&#21152;&#35774;&#22791;&#21069;&#34987;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389250558006" ID="ID_590533440" MODIFIED="1389259511331">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#33324;&#26469;&#35828;,&#39537;&#21160;&#38656;&#35201;&#26576;&#20123;&#20851;&#20110;&#27492;device&#30340;&#20449;&#24687;&#25165;&#33021;&#39537;&#21160;&#27492;device,
    </p>
    <p>
      &#28155;&#21152;&#35774;&#22791;&#26102;&#21487;&#20197;&#26377;2&#31181;&#21150;&#27861;&#23558;&#36825;&#20123;device&#29305;&#23450;&#20449;&#24687;&#20256;&#36882;&#32473;driver :
    </p>
    <p>
      1, &#36890;&#36807;struct platform_device.resource
    </p>
    <p>
      2, &#36890;&#36807;struct platform_device.dev.platform_data,&#20854;&#26684;&#24335;&#26159;&#33258;&#23450;&#20041;&#30340;,&#20294;&#24212;&#22312;device&#21644;driver&#38388;&#21462;&#24471;&#20849;&#35782;
    </p>
    <p>
      resource&#30340;&#26041;&#24335;&#19968;&#33324;&#20256;&#36882;&#27604;&#36739;&#31616;&#21333;&#30340;&#20449;&#24687;,&#32780;platform_data&#21017;&#29992;&#20110;&#20256;&#36882;&#27604;&#36739;&#22797;&#26434;&#30340;&#20449;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389251162966" ID="ID_1393395538" MODIFIED="1389251182533" TEXT="&#x6307;&#x5b9a;&#x4e86;&#x4e0b;&#x9762;resource&#x6570;&#x7ec4;&#x7684;&#x5143;&#x7d20;&#x4e2a;&#x6570;"/>
</node>
<node CREATED="1389248787930" FOLDED="true" ID="ID_1566180219" MODIFIED="1389258164705">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct resource * resource
    </p>
    <p>
      &#36164;&#28304;&#19968;&#33324;&#29992;&#20110;&#25551;&#36848;&#35774;&#22791;IO&#31471;&#21475;&#36215;&#27490;&#33539;&#22260;,&#35774;&#22791;&#20869;&#23384;&#22320;&#22336;&#33539;&#22260;,
    </p>
    <p>
      &#35774;&#22791;&#20013;&#26029;&#21495;,&#35774;&#22791;DMA&#22320;&#22336;&#33539;&#22260;,&#35774;&#22791;&#23492;&#23384;&#22120;&#26144;&#23556;&#33539;&#22260;,&#35774;&#22791;bus
    </p>
    <p>
      &#24403;&#28982;&#20063;&#21487;&#20197;&#20256;&#36882;&#20854;&#20182;&#20449;&#24687;,&#21482;&#35201;device&#21644;driver&#36798;&#25104;&#19968;&#33268;&#21363;&#21487;
    </p>
    <p>
      &#38656;&#35201;&#22312;&#28155;&#21152;&#35774;&#22791;&#21069;&#34987;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389251322767" ID="ID_538657510" MODIFIED="1389256520581">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      resource_size_t start
    </p>
    <p>
      &#24517;&#39035;&#22312;&#28155;&#21152;&#35774;&#22791;&#21069;&#34987;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389251951411" ID="ID_1621814088" MODIFIED="1389251969858" TEXT="&#x6839;&#x636e;name&#x548c;flags&#x6709;&#x4e0d;&#x540c;&#x7684;&#x542b;&#x4e49;"/>
</node>
<node CREATED="1389251334513" ID="ID_837581414" MODIFIED="1389256526374">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      resource_size_t end
    </p>
    <p>
      &#24517;&#39035;&#22312;&#28155;&#21152;&#35774;&#22791;&#21069;&#34987;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389251951411" ID="ID_1727752097" MODIFIED="1389251969858" TEXT="&#x6839;&#x636e;name&#x548c;flags&#x6709;&#x4e0d;&#x540c;&#x7684;&#x542b;&#x4e49;"/>
</node>
<node CREATED="1389251343987" FOLDED="true" ID="ID_886616695" MODIFIED="1389256754296">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      const char *name
    </p>
    <p>
      &#20854;&#21021;&#22987;&#21270;&#26159;&#21487;&#36873;&#30340;,&#33509;&#28155;&#21152;&#35774;&#22791;&#21069;&#26410;&#21021;&#22987;&#21270;,&#21017;&#31995;&#32479;&#20250;&#23558;&#20854;&#21021;&#22987;&#21270;&#20026;
    </p>
    <p>
      struct platform_device.dev.name,&#19968;&#33324;&#20026;&quot;name.id&quot;&#24418;&#24335;,&#20854;&#20013;
    </p>
    <p>
      name&#20026;struct platform_device.name,id&#20026;struct platform_device.id
    </p>
  </body>
</html></richcontent>
<node CREATED="1389252025392" ID="ID_1481298489" MODIFIED="1389252144798" TEXT="registers : start&#x548c;end&#x8868;&#x793a;&#x8bbe;&#x5907;&#x5185;&#x90e8;&#x5bc4;&#x5b58;&#x5668;&#x6620;&#x5c04;&#x5230;cpu&#x5730;&#x5740;&#x7a7a;&#x95f4;&#x7684;&#x8d77;&#x6b62;&#x8303;&#x56f4;"/>
<node CREATED="1389252035697" ID="ID_289719285" MODIFIED="1389252079043" TEXT="irq : start&#x548c;end&#x8868;&#x793a;&#x8bbe;&#x5907;&#x6240;&#x4f7f;&#x7528;&#x7684;&#x4e2d;&#x65ad;&#x53f7;"/>
<node CREATED="1389252382585" ID="ID_1006737181" MODIFIED="1389252417113" TEXT="memory : start&#x548c;end&#x8868;&#x793a;&#x8bbe;&#x5907;&#x5185;&#x90e8;&#x5185;&#x5b58;&#x7684;&#x8d77;&#x6b62;&#x8303;&#x56f4;"/>
</node>
<node CREATED="1389251353620" FOLDED="true" ID="ID_1711480460" MODIFIED="1389256757072">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      unsigned long flags
    </p>
    <p>
      &#24517;&#39035;&#22312;&#28155;&#21152;&#35774;&#22791;&#21069;&#34987;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389252174455" ID="ID_701347088" MODIFIED="1389252175635" TEXT="IORESOURCE_IO"/>
<node CREATED="1389252185913" ID="ID_295035329" MODIFIED="1389252186965" TEXT="IORESOURCE_MEM"/>
<node CREATED="1389252194235" ID="ID_1138073001" MODIFIED="1389252195304" TEXT="IORESOURCE_IRQ"/>
<node CREATED="1389252202460" ID="ID_588325521" MODIFIED="1389252203416" TEXT="IORESOURCE_DMA"/>
<node CREATED="1389252211613" ID="ID_1915328239" MODIFIED="1389252212649" TEXT="IORESOURCE_BUS"/>
</node>
<node CREATED="1389251363670" ID="ID_85964051" MODIFIED="1389251375920" TEXT="struct resource *parent">
<node CREATED="1389251395899" ID="ID_1556650407" MODIFIED="1389251422699" TEXT="&#x7528;&#x4e8e;&#x7ef4;&#x62a4;&#x5185;&#x90e8;&#x7ed3;&#x6784;,&#x65e0;&#x987b;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389251363670" ID="ID_870017475" MODIFIED="1389251383996" TEXT="struct resource *sibling">
<node CREATED="1389251395899" ID="ID_1250353436" MODIFIED="1389251422699" TEXT="&#x7528;&#x4e8e;&#x7ef4;&#x62a4;&#x5185;&#x90e8;&#x7ed3;&#x6784;,&#x65e0;&#x987b;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389251363670" ID="ID_1098154740" MODIFIED="1389251391924" TEXT="struct resource *child">
<node CREATED="1389251395899" ID="ID_1886655383" MODIFIED="1389251422699" TEXT="&#x7528;&#x4e8e;&#x7ef4;&#x62a4;&#x5185;&#x90e8;&#x7ed3;&#x6784;,&#x65e0;&#x987b;&#x521d;&#x59cb;&#x5316;"/>
</node>
</node>
<node CREATED="1389248787930" ID="ID_569587907" MODIFIED="1389248787930" TEXT=" const struct platform_device_id *id_entry">
<node CREATED="1389255869379" ID="ID_659158889" LINK="#ID_1949936314" MODIFIED="1389255914555" TEXT="&#x6240;&#x5339;&#x914d;&#x7684;&#x5b50;&#x9a71;&#x52a8;"/>
<node CREATED="1389255926604" ID="ID_1221954903" MODIFIED="1389255935801" TEXT="&#x65e0;&#x987b;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389248787930" ID="ID_1038103598" MODIFIED="1389248787930" TEXT=" struct mfd_cell *mfd_cell"/>
<node CREATED="1389248787930" ID="ID_1278021487" MODIFIED="1389248787930" TEXT=" struct pdev_archdata archdata"/>
</node>
<node CREATED="1389247933300" ID="ID_1761121097" MODIFIED="1389247948290" TEXT="&#x6dfb;&#x52a0;&#x8bbe;&#x5907;">
<node CREATED="1389248274378" ID="ID_56953112" MODIFIED="1389248668937" TEXT="int platform_device_register(struct platform_device *pdev)">
<node CREATED="1389248551014" ID="ID_1408279284" MODIFIED="1389248566052" TEXT="&#x6dfb;&#x52a0;&#x4e00;&#x4e2a;platform device"/>
</node>
<node CREATED="1389248286188" ID="ID_1790143344" MODIFIED="1389248287288" TEXT="int platform_add_devices(struct platform_device **pdevs, int ndev)">
<node CREATED="1389248551014" ID="ID_1218311628" MODIFIED="1389248577046" TEXT="&#x6dfb;&#x52a0;&#x591a;&#x4e2a;platform device"/>
</node>
</node>
<node CREATED="1389247958328" ID="ID_1980688086" MODIFIED="1389248244826" TEXT="&#x53d1;&#x73b0;&#x8bbe;&#x5907;">
<node CREATED="1389260241083" ID="ID_1310165159" MODIFIED="1389260482011">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#20309;&#30830;&#23450;&#19968;&#20010;&#35774;&#22791;&#26159;&#21542;&#23384;&#22312;,&#20174;&#32780;&#20915;&#23450;&#26159;&#21542;&#28155;&#21152;&#35774;&#22791;&#26377;&#20960;&#31181;&#26041;&#27861;,
    </p>
  </body>
</html></richcontent>
<node CREATED="1389260483425" ID="ID_1856791471" MODIFIED="1389260609621" TEXT="&#x4e00;&#x79cd;&#x662f;&#x9759;&#x6001;&#x7f16;&#x8bd1;&#x7684;&#x65b9;&#x6cd5;,&#x5373;&#x5728;&#x7279;&#x5b9a;board&#x7684;&#x521d;&#x59cb;&#x5316;&#x4ee3;&#x7801;(arch/xxx/mach-xxx/board-xxx.c)&#x4e2d;&#x9759;&#x6001;&#x5730;&#x8c03;&#x7528;platform_device_register&#x4ee5;&#x6dfb;&#x52a0;&#x8bbe;&#x5907;,&#x56e0;&#x4e3a;&#x77e5;&#x9053;&#x4e86;board&#x7c7b;&#x578b;&#x4e5f;&#x5c31;&#x77e5;&#x9053;&#x4e86;board&#x4e0a;&#x5b58;&#x5728;&#x7684;&#x8bbe;&#x5907;"/>
<node CREATED="1389260621703" ID="ID_1151466315" MODIFIED="1389260651576" TEXT="&#x4e00;&#x79cd;&#x662f;&#x4f7f;&#x7528;device tree&#x6587;&#x4ef6;&#x52a8;&#x6001;&#x5730;&#x52a0;&#x8f7d;&#x8bbe;&#x5907;"/>
<node CREATED="1389260652604" ID="ID_138470032" MODIFIED="1389260770923" TEXT="&#x4e00;&#x79cd;&#x662f;&#x901a;&#x8fc7;uboot&#x4f20;&#x9012;&#x7ed9;&#x5185;&#x6838;&#x7684;bootargs&#x53c2;&#x6570;&#x6765;&#x6307;&#x5b9a;&#x9700;&#x8981;&#x52a0;&#x8f7d;&#x7684;&#x8bbe;&#x5907;"/>
</node>
</node>
<node CREATED="1389257825386" ID="ID_1936679337" MODIFIED="1389257838376" TEXT="&#x8f85;&#x52a9;&#x51fd;&#x6570;">
<node CREATED="1389257839468" FOLDED="true" ID="ID_1647120376" MODIFIED="1389258315704" TEXT="&#x5728;platform_device&#x4e2d;&#x67e5;&#x627e;resource">
<node CREATED="1389257878050" FOLDED="true" ID="ID_357546727" MODIFIED="1389258313992" TEXT="struct resource *&#xa;platform_get_resource(struct platform_device *dev, unsigned int type, unsigned int num)&#xa;&#x5728;&#x8bbe;&#x5907;&#x4e2d;&#x67e5;&#x627e;&#x7b2c;num&#x4e2a;&#x6307;&#x5b9a;&#x7c7b;&#x578b;&#x7684;&#x8d44;&#x6e90;">
<node CREATED="1389257988036" ID="ID_1272517719" LINK="#ID_1711480460" MODIFIED="1389258162576" TEXT="type : &#x8d44;&#x6e90;&#x7c7b;&#x578b;"/>
<node CREATED="1389258014648" ID="ID_121733135" MODIFIED="1389258148758" TEXT="num : &#x7b2c;num&#x4e2a;&#x6307;&#x5b9a;&#x7c7b;&#x578b;&#x7684;&#x8d44;&#x6e90;"/>
</node>
<node CREATED="1389258197557" FOLDED="true" ID="ID_1701487002" MODIFIED="1389258313184" TEXT="struct resource *&#xa;platform_get_resource_byname(struct platform_device *dev, &#xa;                                                  unsigned int type, &#xa;                                                  const char *name)&#xa;&#x5728;&#x8bbe;&#x5907;&#x4e2d;&#x67e5;&#x627e;&#x6307;&#x5b9a;&#x540d;&#x79f0;&#x6307;&#x5b9a;&#x7c7b;&#x578b;&#x7684;&#x8d44;&#x6e90;">
<node CREATED="1389257988036" ID="ID_650447653" LINK="#ID_1711480460" MODIFIED="1389258162576" TEXT="type : &#x8d44;&#x6e90;&#x7c7b;&#x578b;"/>
<node CREATED="1389258244685" ID="ID_1397394107" MODIFIED="1389258253114" TEXT="name : &#x8d44;&#x6e90;&#x540d;&#x79f0;"/>
</node>
</node>
</node>
</node>
<node CREATED="1389247637621" ID="ID_323621690" MODIFIED="1389340982162" TEXT="Platform drivers">
<node CREATED="1389249006051" ID="ID_1184250556" MODIFIED="1389249007307" TEXT="struct platform_driver">
<node CREATED="1389249333358" ID="ID_1427069293" MODIFIED="1389249333358" TEXT=" int (*probe)(struct platform_device *)">
<node CREATED="1389257105944" ID="ID_1212329147" MODIFIED="1389257172382" TEXT="&#x63a2;&#x6d4b;&#x4e00;&#x4e2a;&#x5339;&#x914d;&#x7684;&#x8bbe;&#x5907;&#x662f;&#x5426;&#x771f;&#x7684;&#x5b58;&#x5728;,&#x82e5;&#x5b58;&#x5728;&#x5219;&#x505a;&#x4e00;&#x4e9b;&#x5fc5;&#x8981;&#x7684;&#x521d;&#x59cb;&#x5316;&#x7136;&#x540e;&#x542f;&#x7528;&#x6b64;&#x8bbe;&#x5907;"/>
<node CREATED="1389257075091" ID="ID_663082945" MODIFIED="1389257092764" TEXT="&#x5fc5;&#x987b;&#x5728;&#x9a71;&#x52a8;&#x6ce8;&#x518c;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389249333358" ID="ID_810197524" MODIFIED="1389249333358" TEXT=" int (*remove)(struct platform_device *)">
<node CREATED="1389257183316" ID="ID_1988675999" MODIFIED="1389257200611" TEXT="&#x5220;&#x9664;&#x6307;&#x5b9a;&#x8bbe;&#x5907;"/>
<node CREATED="1389257075091" ID="ID_1985543768" MODIFIED="1389257092764" TEXT="&#x5fc5;&#x987b;&#x5728;&#x9a71;&#x52a8;&#x6ce8;&#x518c;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389249333358" FOLDED="true" ID="ID_705948279" MODIFIED="1389257356255" TEXT=" void (*shutdown)(struct platform_device *)">
<node CREATED="1389257284276" ID="ID_1320698148" MODIFIED="1389257300354" TEXT="&#x6682;&#x65f6;&#x5173;&#x95ed;&#x6b64;&#x8bbe;&#x5907;"/>
<node CREATED="1389257222650" ID="ID_546907017" MODIFIED="1389257272446" TEXT="&#x53ef;&#x9009;,&#x5f53;&#x9700;&#x8981;&#x5728;&#x6b64;&#x8bbe;&#x5907;&#x4e0a;&#x5f00;&#x542f;&#x7535;&#x6e90;&#x7ba1;&#x7406;&#x65f6;&#x5e94;&#x521d;&#x59cb;&#x5316;&#x6b64;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1389249333358" FOLDED="true" ID="ID_1246555724" MODIFIED="1389257355463" TEXT=" int (*suspend)(struct platform_device *, pm_message_t state)">
<node CREATED="1389257284276" ID="ID_1928146199" MODIFIED="1389257344500" TEXT="&#x6682;&#x505c;&#x6b64;&#x8bbe;&#x5907;"/>
<node CREATED="1389257222650" ID="ID_1745874400" MODIFIED="1389257272446" TEXT="&#x53ef;&#x9009;,&#x5f53;&#x9700;&#x8981;&#x5728;&#x6b64;&#x8bbe;&#x5907;&#x4e0a;&#x5f00;&#x542f;&#x7535;&#x6e90;&#x7ba1;&#x7406;&#x65f6;&#x5e94;&#x521d;&#x59cb;&#x5316;&#x6b64;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1389249333358" FOLDED="true" ID="ID_1298070240" MODIFIED="1389257357464" TEXT=" int (*resume)(struct platform_device *)">
<node CREATED="1389257284276" ID="ID_1574474735" MODIFIED="1389257351770" TEXT="&#x6062;&#x590d;&#x6b64;&#x8bbe;&#x5907;"/>
<node CREATED="1389257222650" ID="ID_1280917999" MODIFIED="1389257272446" TEXT="&#x53ef;&#x9009;,&#x5f53;&#x9700;&#x8981;&#x5728;&#x6b64;&#x8bbe;&#x5907;&#x4e0a;&#x5f00;&#x542f;&#x7535;&#x6e90;&#x7ba1;&#x7406;&#x65f6;&#x5e94;&#x521d;&#x59cb;&#x5316;&#x6b64;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1389249333358" FOLDED="true" ID="ID_375345111" MODIFIED="1389343851638">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device_driver driver
    </p>
    <p>
      &#19968;&#33324;name&#21644;owner&#25104;&#21592;&#24517;&#39035;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389249333358" FOLDED="true" ID="ID_1177422132" MODIFIED="1389259802765" TEXT=" const char *name">
<node CREATED="1389256282341" ID="ID_1146203026" MODIFIED="1389256313381" TEXT="&#x9a71;&#x52a8;&#x540d;&#x79f0;,&#x8868;&#x793a;&#x9a71;&#x52a8;&#x7c7b;&#x578b;,&#x7528;&#x4e8e;&#x5339;&#x914d;&#x8bbe;&#x5907;"/>
<node CREATED="1389257075091" ID="ID_820930360" MODIFIED="1389257092764" TEXT="&#x5fc5;&#x987b;&#x5728;&#x9a71;&#x52a8;&#x6ce8;&#x518c;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389249333358" FOLDED="true" ID="ID_1026434448" MODIFIED="1389341052929" TEXT=" struct bus_type *bus">
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" const char *name"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" const char *dev_name"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" struct device *dev_root"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" struct bus_attribute *bus_attrs"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" struct device_attribute *dev_attrs"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" struct driver_attribute *drv_attrs"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" int (*match)(struct device *dev, struct device_driver *drv)"/>
<node CREATED="1389249333359" ID="ID_450591845" MODIFIED="1389249333359" TEXT=" int (*uevent)(struct device *dev, struct kobj_uevent_env *env)"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" int (*probe)(struct device *dev)"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" int (*remove)(struct device *dev)"/>
<node CREATED="1389249333359" ID="ID_1083183234" MODIFIED="1389249333359" TEXT=" void (*shutdown)(struct device *dev)"/>
<node CREATED="1389249333359" MODIFIED="1389249333359" TEXT=" int (*suspend)(struct device *dev, pm_message_t state)"/>
<node CREATED="1389249333359" ID="ID_625267126" MODIFIED="1389249333359" TEXT=" int (*resume)(struct device *dev)"/>
<node CREATED="1389249333359" FOLDED="true" ID="ID_1077634871" MODIFIED="1389341051465" TEXT=" const struct dev_pm_ops *pm">
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*prepare)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" void (*complete)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*suspend)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*resume)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*freeze)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*thaw)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*poweroff)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*restore)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*suspend_late)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*resume_early)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*freeze_late)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*thaw_early)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*poweroff_late)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*restore_early)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*suspend_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*resume_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" ID="ID_1097682990" MODIFIED="1389249333361" TEXT=" int (*freeze_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*thaw_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*poweroff_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*restore_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*runtime_suspend)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*runtime_resume)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*runtime_idle)(struct device *dev)"/>
</node>
<node CREATED="1389249333361" ID="ID_1068553261" MODIFIED="1389249333361" TEXT=" struct iommu_ops *iommu_ops"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" struct subsys_private *p"/>
</node>
<node CREATED="1389249333361" FOLDED="true" ID="ID_1414899821" MODIFIED="1389259804645" TEXT=" struct module *owner">
<node CREATED="1389257389413" ID="ID_1263193126" MODIFIED="1389257404995" TEXT="&#x6240;&#x5c5e;&#x7684;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
<node CREATED="1389257075091" ID="ID_957746523" MODIFIED="1389257092764" TEXT="&#x5fc5;&#x987b;&#x5728;&#x9a71;&#x52a8;&#x6ce8;&#x518c;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" const char *mod_name"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" bool suppress_bind_attrs"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" const struct of_device_id *of_match_table"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" int (*probe) (struct device *dev)"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" int (*remove) (struct device *dev)"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" void (*shutdown) (struct device *dev)"/>
<node CREATED="1389249333362" ID="ID_1982147434" MODIFIED="1389249333362" TEXT=" int (*suspend) (struct device *dev, pm_message_t state)"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" int (*resume) (struct device *dev)"/>
<node CREATED="1389249333362" ID="ID_1521330167" MODIFIED="1389249333362" TEXT=" const struct attribute_group **groups"/>
<node CREATED="1389249333362" ID="ID_788490617" LINK="#ID_1077634871" MODIFIED="1389249403863" TEXT=" const struct dev_pm_ops *pm"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" struct driver_private *p"/>
</node>
<node CREATED="1389249333362" ID="ID_1415428272" MODIFIED="1389255422124" TEXT=" const struct platform_device_id *id_table">
<node CREATED="1389258778930" ID="ID_75860135" MODIFIED="1389258785249" TEXT="&#x6982;&#x5ff5;">
<node CREATED="1389258790484" ID="ID_825053340" MODIFIED="1389259357090">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#31181;&#21487;&#33021;&#30340;&#24773;&#20917;&#26159;,&#19968;&#31181;&#36890;&#29992;&#30340;&#39537;&#21160;&#21487;&#20197;&#39537;&#21160;&#20960;&#31181;&#19981;&#21516;&#23376;&#31867;&#22411;&#30340;&#35774;&#22791;,&#36825;&#26102;&#23601;&#38656;&#35201;&#29992;id_table&#26469;&#34920;&#31034;&#27492;&#36890;&#29992;&#39537;&#21160;&#20860;&#23481;&#30340;&#20960;&#31181;&#23376;&#31867;&#22411;&#39537;&#21160;.&#33509;&#19968;&#20010;&#36890;&#29992;&#39537;&#21160;&#33021;&#20860;&#23481;&#20960;&#31181;&#23376;&#31867;&#22411;&#39537;&#21160;,&#21017;&#22312;&#21305;&#37197;&#35774;&#22791;&#21644;&#39537;&#21160;&#26102;,&#27604;&#36739;&#35774;&#22791;&#30340;&#21517;&#31216;&#21644;&#23376;&#39537;&#21160;&#30340;&#21517;&#31216;&#20197;&#21028;&#26029;&#27492;&#36890;&#29992;&#39537;&#21160;&#26159;&#21542;&#20860;&#23481;&#27492;&#35774;&#22791;,&#33509;&#20860;&#23481;&#21017;&#23558;&#21305;&#37197;&#30340;&#23376;&#31867;&#22411;&#39537;&#21160;&#20445;&#23384;&#22312;struct platform_device.id_entry&#20013;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389249421506" ID="ID_1938510451" MODIFIED="1389249422573" TEXT="char name[PLATFORM_NAME_SIZE]">
<node CREATED="1389259062511" ID="ID_1771978626" MODIFIED="1389259092702" TEXT="&#x5b50;&#x7c7b;&#x578b;&#x9a71;&#x52a8;&#x540d;&#x79f0;"/>
</node>
<node CREATED="1389249450614" ID="ID_124729414" MODIFIED="1389249451569" TEXT="kernel_ulong_t driver_data">
<node CREATED="1389259099525" ID="ID_1855655627" MODIFIED="1389259113491" TEXT="&#x5b50;&#x7c7b;&#x578b;&#x9a71;&#x52a8;&#x7684;&#x6807;&#x8bc6;"/>
</node>
</node>
</node>
<node CREATED="1389257559984" ID="ID_289263830" MODIFIED="1389257566989" TEXT="&#x6ce8;&#x518c;&#x9a71;&#x52a8;">
<node CREATED="1389257568049" ID="ID_1601408512" MODIFIED="1389260197942">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int platform_driver_register(struct platform_driver *drv)
    </p>
    <p>
      &#19968;&#33324;&#22312;&#39537;&#21160;&#23545;&#24212;&#30340;&#20869;&#26680;&#27169;&#22359;&#21152;&#36733;&#26102;&#27880;&#20876;&#39537;&#21160;
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1389253468933" FOLDED="true" ID="ID_54718146" MODIFIED="1389263368804" TEXT="device&#x548c;driver&#x7684;&#x7ed1;&#x5b9a;">
<node CREATED="1389253567012" ID="ID_1820525328" MODIFIED="1389253713983">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#28155;&#21152;&#19968;&#20010;&#35774;&#22791;&#26102;,&#20250;&#29992;&#36825;&#20010;&#35774;&#22791;&#21435;&#21305;&#37197;&#25152;&#26377;&#24050;&#27880;&#20876;&#30340;&#39537;&#21160;
    </p>
    <p>
      &#27880;&#20876;&#19968;&#20010;&#39537;&#21160;&#26102;,&#20250;&#29992;&#25152;&#26377;&#26410;&#32465;&#23450;&#30340;&#35774;&#22791;&#26469;&#21305;&#37197;&#36825;&#20010;&#39537;&#21160;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389258476210" ID="ID_567763338" LINK="#ID_1427069293" MODIFIED="1389258557175" TEXT="&#x4e00;&#x65e6;&#x4e00;&#x4e2a;&#x9a71;&#x52a8;&#x5339;&#x914d;&#x5230;&#x4e00;&#x4e2a;&#x8bbe;&#x5907;&#x5219;&#x4f1a;&#x7528;&#x8fd9;&#x4e2a;&#x8bbe;&#x5907;&#x4f5c;&#x4e3a;&#x53c2;&#x6570;&#x8c03;&#x7528;&#x9a71;&#x52a8;&#x7684;probe&#x51fd;&#x6570;"/>
</node>
<node CREATED="1389255331677" ID="ID_104140694" MODIFIED="1389255349703" TEXT="int platform_match(struct device *dev, struct device_driver *drv)">
<node CREATED="1389255427997" ID="ID_1949936314" MODIFIED="1389255782805" TEXT="&#x5f53;struct platform_driver.id_table&#x4e0d;&#x4e3a;&#x7a7a;&#x65f6;,&#x7528;struct platform_device.name&#x53bb;&#x5339;&#x914d;struct platform_driver.id_table[x].name,&#x5339;&#x914d;&#x540e;&#x5c06;struct platform_driver.id_table[x]&#x7684;&#x5730;&#x5740;&#x4fdd;&#x5b58;&#x5728;&#xa;struct platform_device.id_entry&#x4e2d;,&#x8fd9;&#x6837;&#x5728;&#x9a71;&#x52a8;&#x7684;probe&#x51fd;&#x6570;&#x4e2d;&#x5c31;&#x53ef;&#x4ee5;&#x901a;&#x8fc7;&#xa;platform_get_device_id(pdev)-&gt;driver_data&#x6765;&#x786e;&#x5b9a;&#x5339;&#x914d;&#x7684;&#x5230;&#x5e95;&#x662f;&#x54ea;&#x4e00;&#x79cd;&#x7c7b;&#x578b;&#x7684;&#x9a71;&#x52a8;&#x4e86;"/>
<node CREATED="1389255427997" ID="ID_1526192550" MODIFIED="1389255855152" TEXT="&#x5f53;struct platform_driver.id_table&#x4e3a;&#x7a7a;&#x65f6;,&#x7528;struct platform_device.name&#x53bb;&#x5339;&#x914d;&#xa;struct platform_driver.driver.name"/>
</node>
</node>
<node CREATED="1389263370541" ID="ID_1023159228" MODIFIED="1389263404468">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Early Platform Devices and Drivers
    </p>
    <p>
      Documentation/driver-model/platform.txt
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389262377871" ID="ID_1255102687" MODIFIED="1389262383403" POSITION="left" TEXT="device table file"/>
<node CREATED="1389337901816" ID="ID_780054493" MODIFIED="1389337908511" POSITION="left" TEXT="device driver model">
<node CREATED="1389603604792" FOLDED="true" ID="ID_764239472" MODIFIED="1392017434711" TEXT="&#x57fa;&#x672c;&#x6982;&#x5ff5;">
<node CREATED="1389603620968" ID="ID_1611715434" MODIFIED="1389603662096">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bus_driver_device_1.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1389603667752" ID="ID_414739095" MODIFIED="1389604073112" TEXT="&#x5728;linux&#x8bbe;&#x5907;&#x9a71;&#x52a8;&#x6a21;&#x578b;&#x4e2d;,&#x6bcf;&#x4e00;&#x4e2a;&#x8bbe;&#x5907;&#x90fd;&#x6302;&#x8f7d;&#x6302;&#x5230;&#x67d0;&#x4e00;&#x79cd;&#x7279;&#x5b9a;&#x7684;bus&#x4e0a;,&#x5982;pci bus, usb bus, platform bus,&#x800c;&#x6bcf;&#x4e00;&#x4e2a;&#x8bbe;&#x5907;&#x9a71;&#x52a8;&#x4e5f;&#x8981;&#x6ce8;&#x518c;&#x5230;&#x67d0;&#x4e00;&#x4e2a;&#x7279;&#x5b9a;&#x7684;bus&#x4e0a;.&#x6bcf;&#x4e00;&#x79cd;bus&#x8d1f;&#x8d23;&#x5339;&#x914d;&#x5b83;&#x4e0a;&#x9762;&#x7684;&#x8bbe;&#x5907;&#x548c;&#x9a71;&#x52a8;,&#x5e76;&#x5c06;&#x5b83;&#x4eec;&#x7ed1;&#x5b9a;."/>
<node CREATED="1392017365453" FOLDED="true" ID="ID_1292449574" MODIFIED="1392017430247" TEXT="&#x57fa;&#x672c;&#x6d41;&#x7a0b;">
<node CREATED="1392017383860" ID="ID_468179184" MODIFIED="1392017418903">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/device_model_overview.jpg" />
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1389606914492" ID="ID_380487135" MODIFIED="1389607400433">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22312;&#38754;&#21521;&#23545;&#35937;&#30340;&#20307;&#31995;&#32467;&#26500;&#20013;,&#20219;&#20309;&#20107;&#29289;&#37117;&#26159;&#23545;&#35937;,&#27599;&#19968;&#20010;&#23545;&#35937;&#37117;&#26377;2&#20010;&#23646;&#24615;:
    </p>
    <p>
      &#19968;&#26159;&#23427;&#30340;&#29238;&#20146;&#26159;&#35841;
    </p>
    <p>
      &#20108;&#26159;&#23427;&#30340;&#31867;&#26159;&#20160;&#20040;
    </p>
    <p>
      &#36890;&#36807;&#36861;&#28335;&#36825;2&#20010;&#23646;&#24615;&#23601;&#26500;&#25104;&#20102;&#20004;&#20010;&#26641;&#24418;&#32467;&#26500;:
    </p>
    <p>
      &#19968;,&#23545;&#35937;&#30340;&#29238;&#20146;,&#29238;&#20146;&#30340;&#29238;&#20146;,&#31561;,&#21363;&#34880;&#32536;&#20851;&#31995;&#26641;
    </p>
    <p>
      &#20108;,&#23545;&#35937;&#30340;&#31867;,&#31867;&#30340;&#31867;,&#31561;,&#21363;&#31867;&#32487;&#25215;&#26641;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389602546112" FOLDED="true" ID="ID_1479781415" MODIFIED="1389868063605" TEXT="&#x6811;&#x5f62;&#x76ee;&#x5f55;&#x7ed3;&#x6784;&#x652f;&#x6301;&#x7cfb;&#x7edf;">
<node CREATED="1389602629495" ID="ID_570983232" MODIFIED="1389604569558" TEXT="&#x65e0;&#x8bba;&#x662f;bus, device&#x8fd8;&#x662f;driver,&#x5b83;&#x4eec;&#x90fd;&#x88ab;&#x7ec4;&#x7ec7;&#x6210;&#x6811;&#x5f62;&#x7ed3;&#x6784;,kobject, kset&#x88ab;&#x7528;&#x4e8e;&#x7ec4;&#x7ec7;&#x8fd9;&#x79cd;&#x6811;&#x5f62;&#x7ed3;&#x6784;"/>
<node CREATED="1389604598234" ID="ID_1479050039" MODIFIED="1389604604565" TEXT="&#x4f8b;&#x5b50;"/>
<node CREATED="1389604626409" FOLDED="true" ID="ID_191181847" MODIFIED="1389868062777" TEXT="kobject">
<node CREATED="1389604641321" ID="ID_154057629" MODIFIED="1389677768089" TEXT="&#x4f5c;&#x7528;">
<node CREATED="1389604786538" FOLDED="true" ID="ID_1964033925" MODIFIED="1389678262790">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      kobject&#19968;&#33324;&#34987;&#23884;&#20837;&#21040;&#20869;&#26680;&#23545;&#35937;&#22914;bus, device, driver&#20013;,&#29992;&#20110;&#23558;&#36825;&#20123;&#20869;&#26680;&#23545;&#35937;&#32452;&#32455;&#25104;&#26641;&#24418;&#32467;&#26500;
    </p>
    <p>
      &#21487;&#20197;&#23558;kobject&#30475;&#20316;&#26159;&#25152;&#26377;&#20869;&#26680;&#23545;&#35937;&#30340;&#22522;&#31867;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389677795189" ID="ID_276946706" MODIFIED="1389677872770" TEXT="struct kobject.parent&#x6307;&#x5411;&#x53e6;&#x4e00;&#x4e2a;kobject&#x7ed3;&#x6784;,&#x5b83;&#x8868;&#x793a;&#x6811;&#x5f62;&#x7ed3;&#x6784;&#x7684;&#x4e0a;&#x4e00;&#x5c42;&#x8282;&#x70b9;"/>
<node CREATED="1389677795189" ID="ID_1370865878" MODIFIED="1389678085428">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct kobject.kset&#25351;&#21521;&#19968;&#20010;kset&#32467;&#26500;,&#23427;&#34920;&#31034;&#23481;&#32435;&#27492;kobject&#30340;&#23481;&#22120;
    </p>
    <p>
      &#22312;sysfs&#25991;&#20214;&#31995;&#32479;&#20013;,struct kobject.kset&#34920;&#31034;kobject&#30340;&#19978;&#19968;&#32423;&#30446;&#24405;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389677885190" ID="ID_1419229324" MODIFIED="1389678255862" TEXT="&#x4e00;&#x822c;&#x6765;&#x8bf4;struct kobject.parent&#x548c;struct kobject.kset&#x6307;&#x5411;&#x76f8;&#x540c;&#x7684;&#x5730;&#x65b9;(&#x6ce8;&#x610f;kset&#x672c;&#x8eab;&#x4e5f;&#x662f;&#x4e00;&#x4e2a;kobject),&#xa;&#x4f46;&#x662f;&#x4e5f;&#x6709;&#x4f8b;&#x5916;"/>
</node>
<node CREATED="1389605061034" ID="ID_409098541" MODIFIED="1389605181078" TEXT="&#x63d0;&#x4f9b;&#x5f15;&#x7528;&#x8ba1;&#x6570;&#x529f;&#x80fd;,&#x5f53;&#x8ba1;&#x6570;&#x4e3a;0&#x65f6;&#x8868;&#x793a;&#x5185;&#x6838;&#x4ee3;&#x7801;&#x4e0d;&#x518d;&#x5f15;&#x7528;&#x8be5;&#x5185;&#x6838;&#x5bf9;&#x8c61;,&#x6545;&#x800c;&#x53ef;&#x4ee5;&#x5b89;&#x5168;&#x5730;&#x5220;&#x9664;&#x8be5;&#x5bf9;&#x8c61;"/>
<node CREATED="1389605213386" ID="ID_328617655" MODIFIED="1389605316358" TEXT="&#x88ab;&#x7528;&#x4e8e;&#x7ec4;&#x7ec7;sysfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;,&#x6bcf;&#x4e00;&#x4e2a;kobject&#x4ee3;&#x8868;/sys&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x4e00;&#x4e2a;&#x76ee;&#x5f55;"/>
<node CREATED="1389605542811" ID="ID_566545578" MODIFIED="1389605588215" TEXT="&#x6bcf;&#x4e00;&#x4e2a;kobject&#x6dfb;&#x52a0;&#x5220;&#x9664;&#x65f6;&#x90fd;&#x4f1a;&#x4ea7;&#x751f;hotplug&#x6d88;&#x606f;&#x4ee5;&#x901a;&#x77e5;&#x7528;&#x6237;&#x5c42;"/>
</node>
<node CREATED="1389337918165" ID="ID_1909063481" MODIFIED="1389606001334" TEXT="struct kobject">
<node CREATED="1389338540337" ID="ID_821223853" MODIFIED="1389338540337" TEXT=" const char *name">
<node CREATED="1389608500142" ID="ID_318082124" MODIFIED="1389608516621" TEXT="&#x5728;sysfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;&#x540d;&#x5b57;"/>
</node>
<node CREATED="1389338540337" ID="ID_321722794" MODIFIED="1389338540337" TEXT=" struct list_head entry">
<node CREATED="1389679666360" ID="ID_1155190616" MODIFIED="1389679701939" TEXT="&#x7528;&#x4e8e;&#x5c06;&#x6b64;kobject&#x94fe;&#x5165;&#x4e0b;&#x9762;kset&#x7684;&#x5185;&#x90e8;&#x94fe;&#x8868;&#x4e2d;"/>
</node>
<node CREATED="1389338540337" ID="ID_289167271" MODIFIED="1389338540337" TEXT=" struct kobject *parent">
<node CREATED="1389608527726" ID="ID_1919118970" MODIFIED="1389608543626" TEXT="&#x8840;&#x7f18;&#x5173;&#x7cfb;&#x6811;&#x4e0a;&#x7684;&#x7236;&#x4eb2;"/>
</node>
<node CREATED="1389338540337" ID="ID_496762517" MODIFIED="1389338540337" TEXT=" struct kset *kset">
<node CREATED="1389608556702" ID="ID_97343101" MODIFIED="1389608576714" TEXT="&#x5305;&#x542b;&#x6b64;kobject&#x7684;&#x4e0a;&#x7ea7;&#x76ee;&#x5f55;"/>
</node>
<node CREATED="1389338540337" ID="ID_1547540571" LINK="#ID_148333375" MODIFIED="1389606414724" TEXT=" struct kobj_type *ktype">
<node CREATED="1389608581806" ID="ID_834740604" MODIFIED="1389608603978" TEXT="&#x7c7b;&#x7ee7;&#x627f;&#x6811;&#x4e0a;&#x6240;&#x5c5e;&#x7684;&#x7c7b;"/>
</node>
<node CREATED="1389338540337" ID="ID_1147523338" MODIFIED="1389338540337" TEXT=" struct sysfs_dirent *sd"/>
<node CREATED="1389338540338" ID="ID_1119745679" MODIFIED="1389338540338" TEXT=" struct kref kref">
<node CREATED="1389608609822" ID="ID_1001650521" MODIFIED="1389608621962" TEXT="&#x5f15;&#x7528;&#x8ba1;&#x6570;"/>
</node>
<node CREATED="1389338540338" ID="ID_502935946" MODIFIED="1389338540338" TEXT=" unsigned int state_initialized:1">
<node CREATED="1389609841520" ID="ID_1567297825" MODIFIED="1389609878188" TEXT="kobject&#x72b6;&#x6001;&#x673a; : &#x5df2;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389338540338" ID="ID_1831317944" MODIFIED="1389338540338" TEXT=" unsigned int state_in_sysfs:1">
<node CREATED="1389679053095" ID="ID_1676845365" MODIFIED="1389679092899" TEXT="&#x662f;&#x5426;&#x5df2;&#x5728;sysfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x4e2d;&#x521b;&#x5efa;&#x6b64;kobject&#x5bf9;&#x5e94;&#x7684;&#x76ee;&#x5f55;"/>
</node>
<node CREATED="1389338540338" ID="ID_1972464219" MODIFIED="1389338540338" TEXT=" unsigned int state_add_uevent_sent:1">
<node CREATED="1389679563576" ID="ID_1919163768" MODIFIED="1389679598964" TEXT="&#x662f;&#x5426;&#x5df2;&#x53d1;&#x9001;add&#x7684;hotplug&#x6d88;&#x606f;"/>
</node>
<node CREATED="1389338540338" ID="ID_584991164" MODIFIED="1389338540338" TEXT=" unsigned int state_remove_uevent_sent:1">
<node CREATED="1389679563576" ID="ID_1681395778" MODIFIED="1389679628003" TEXT="&#x662f;&#x5426;&#x5df2;&#x53d1;&#x9001;delete&#x7684;hotplug&#x6d88;&#x606f;"/>
</node>
<node CREATED="1389338540338" ID="ID_1564759193" MODIFIED="1389338540338" TEXT=" unsigned int uevent_suppress:1">
<node CREATED="1389679981288" ID="ID_1942457240" MODIFIED="1389680018628" TEXT="&#x6291;&#x5236;hotplug&#x6d88;&#x606f;,&#x5373;add/delete&#x65f6;&#x4e0d;&#x53d1;&#x9001;hotplug&#x6d88;&#x606f;"/>
</node>
</node>
<node CREATED="1389606602060" FOLDED="true" ID="ID_594983406" MODIFIED="1389690493190" TEXT="kobj_type">
<node CREATED="1389606700060" ID="ID_138778889" MODIFIED="1389607479869" TEXT="&#x591a;&#x4e2a;kobject&#x53ef;&#x80fd;&#x6709;&#x4e00;&#x4e9b;&#x76f8;&#x540c;&#x7684;&#x5c5e;&#x6027;,&#x4ee5;&#x53ca;&#x76f8;&#x540c;&#x7684;&#x64cd;&#x4f5c;&#x63a5;&#x53e3;,&#x6bd4;&#x5982;&#x5220;&#x9664;,&#x56e0;&#x6b64;&#x8fd9;&#x91cc;&#x7684;kobj_type&#x4ee3;&#x8868;&#x4e86;kobject&#x7684;&#x7c7b;.&#xa;&#x7528;&#x9762;&#x5411;&#x5bf9;&#x8c61;&#x7684;&#x8bdd;&#x6765;&#x8bf4;,kobject&#x4ee3;&#x8868;&#x4e86;&#x4e00;&#x4e2a;&#x5177;&#x4f53;&#x7684;&#x5bf9;&#x8c61;,&#x800c;kobj_type&#x4ee3;&#x8868;&#x4e86;&#x5b83;&#x7684;&#x7c7b;."/>
<node CREATED="1389338540337" ID="ID_148333375" MODIFIED="1389606404132" TEXT=" struct kobj_type">
<node CREATED="1389606253083" ID="ID_1473267838" MODIFIED="1389606254327" TEXT="void (*release)(struct kobject *kobj)">
<node CREATED="1389677548373" ID="ID_1398923828" MODIFIED="1389677592139" TEXT="&#x5982;&#x4f55;&#x91ca;&#x653e;&#x6b64;&#x7c7b;&#x7684;kobject"/>
</node>
<node CREATED="1389606263275" FOLDED="true" ID="ID_1703058265" MODIFIED="1389685594359">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      const struct sysfs_ops *sysfs_ops
    </p>
    <p>
      &#29992;&#20110;&#35835;&#20889;&#23646;&#24615;&#30340;&#25805;&#20316;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389685491168" ID="ID_1227437700" MODIFIED="1389685492731" TEXT="ssize_t&#x9;(*show)(struct kobject *, struct attribute *,char *)"/>
<node CREATED="1389685503856" ID="ID_20997735" MODIFIED="1389685504715" TEXT="ssize_t&#x9;(*store)(struct kobject *,struct attribute *,const char *, size_t)"/>
<node CREATED="1389685513376" ID="ID_1149560298" MODIFIED="1389685514331" TEXT="const void *(*namespace)(struct kobject *, const struct attribute *)"/>
</node>
<node CREATED="1389606271403" FOLDED="true" ID="ID_1019703096" MODIFIED="1389690087885">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct attribute **default_attrs
    </p>
    <p>
      &#27492;&#31867;kobject&#37117;&#20855;&#26377;&#30340;&#40664;&#35748;&#23646;&#24615;&#25968;&#32452;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389341915474" ID="ID_519162520" MODIFIED="1389341922985" TEXT="const char *name">
<node CREATED="1389685215871" ID="ID_1539746734" MODIFIED="1389685249418" TEXT="&#x5c5e;&#x6027;&#x540d;,&#x5bf9;&#x5e94;&#x4e86;kobject&#x76ee;&#x5f55;&#x4e0b;&#x7684;&#x4e00;&#x4e2a;&#x6587;&#x4ef6;"/>
</node>
<node CREATED="1389341932804" ID="ID_1939315342" MODIFIED="1389341939012" TEXT="umode_t mode">
<node CREATED="1389685257231" ID="ID_1562476615" MODIFIED="1389685278043" TEXT="&#x5c5e;&#x6027;&#x6240;&#x4ee3;&#x8868;&#x7684;&#x6587;&#x4ef6;&#x7684;&#x8bbf;&#x95ee;&#x6743;&#x9650;"/>
</node>
<node CREATED="1389341949127" ID="ID_270353550" MODIFIED="1389341954835" TEXT="struct lock_class_key *key"/>
<node CREATED="1389341964362" ID="ID_1475566455" MODIFIED="1389341969014" TEXT="struct lock_class_key skey"/>
</node>
<node CREATED="1389606282795" ID="ID_1795427048" MODIFIED="1389606283367" TEXT="const struct kobj_ns_type_operations *(*child_ns_type)(struct kobject *kobj)"/>
<node CREATED="1389606291835" ID="ID_335197723" MODIFIED="1389606293207" TEXT="const void *(*namespace)(struct kobject *kobj)"/>
</node>
<node CREATED="1389607525741" ID="ID_466095742" LINK="#ID_19289540" MODIFIED="1389607838401">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      kobj_type&#19968;&#33324;&#21333;&#29420;&#23450;&#20041;,&#28982;&#21518;&#22312;kobject&#21021;&#22987;&#21270;&#26102;&#23558;kobject&#25351;&#21521;&#23427;
    </p>
    <p>
      &#24403;&#21069;&#31995;&#32479;&#20013;&#23450;&#20041;&#30340;&#20960;&#20010;&#20856;&#22411;&#30340;kobj_type&#20026;:
    </p>
    <p>
      struct kobj_type bus_ktype : drivers/base/bus.c
    </p>
    <p>
      struct kobj_type device_ktype : drivers/base/core.c
    </p>
    <p>
      struct kobj_type driver_ktype : drivers/base/bus.c
    </p>
    <p>
      struct kobj_type class_ktype : drivers/base/class.c
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389606004348" ID="ID_1026188123" MODIFIED="1389690754700" TEXT="&#x5982;&#x4f55;&#x4f7f;&#x7528;kobject">
<node CREATED="1389606021883" ID="ID_1730500532" MODIFIED="1389678639692" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1389606087691" ID="ID_19289540" MODIFIED="1389609335227">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;&#19979;&#38754;&#30340;API&#21021;&#22987;&#21270;kobject
    </p>
    <p>
      void kobject_init(struct kobject *kobj, struct kobj_type *ktype)
    </p>
    <p>
      &#27880;&#24847;&#32463;&#36807;&#36825;&#19968;&#27493;&#21518;,kobject&#30340;&#24341;&#29992;&#35745;&#25968;&#24050;&#32463;&#21152;1,&#21363;&#21021;&#22987;&#20540;&#21464;&#20026;1,
    </p>
    <p>
      &#35843;&#29992;&#32773;&#24517;&#39035;&#35843;&#29992;&#20989;&#25968;kobject_put()&#26469;&#37322;&#25918;&#35745;&#25968;&#20197;&#20415;&#37322;&#25918;&#27492;kobject
    </p>
    <p>
      &#36825;&#19968;&#27493;&#24050;&#32463;&#21021;&#22987;&#21270;&#20102;struct kobject.ktype,&#27880;&#24847;&#21442;&#25968;ktype&#24517;&#39035;&#25351;&#23450;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389608226158" ID="ID_365195932" MODIFIED="1389608314102" TEXT="&#x56e0;&#x4e3a;kobject&#x4ee3;&#x8868;&#x4e86;sysfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;&#x4e00;&#x4e2a;&#x76ee;&#x5f55;,&#x6240;&#x4ee5;&#x5b83;&#x9700;&#x8981;&#x4e00;&#x4e2a;&#x540d;&#x5b57;,&#x4e0b;&#x9762;&#x7684;API&#x7528;&#x4e8e;&#x8bbe;&#x7f6e;&#x5b83;&#x7684;&#x540d;&#x5b57;&#xa;int kobject_set_name(struct kobject *kobj, const char *fmt, ...)"/>
</node>
<node CREATED="1389678409254" ID="ID_1810894050" MODIFIED="1389678433442" TEXT="&#x5c06;kobject&#x52a0;&#x5165;&#x6811;&#x5f62;&#x7ed3;&#x6784;">
<node CREATED="1389608701918" ID="ID_1263069985" MODIFIED="1389609639530">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;kobject&#34880;&#32536;&#20851;&#31995;&#26641;&#19978;&#30340;&#29238;&#20146;&#21363;struct kobject.parent,&#36825;&#19968;&#27493;&#26159;&#21487;&#36873;&#30340;
    </p>
    <p>
      &#33509;&#19981;&#35774;&#32622;&#21017;kobject&#30340;&#29238;&#20146;&#34987;&#25351;&#23450;&#20026;struct kobject.kset&#25152;&#20195;&#34920;&#30340;kobject(kset&#20063;&#26159;kobject)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389609380543" ID="ID_750456366" MODIFIED="1389609495099" TEXT="&#x8bbe;&#x7f6e;kobject&#x5728;sysfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x4e2d;&#x7684;&#x4e0a;&#x7ea7;&#x76ee;&#x5f55;&#x5373;struct kobject.kset,&#x8fd9;&#x4e00;&#x6b65;&#x662f;&#x5fc5;&#x987b;&#x7684;"/>
<node CREATED="1389609130591" ID="ID_447146243" MODIFIED="1389678560777">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#28155;&#21152;kobject,&#21487;&#20197;&#22312;&#28155;&#21152;&#26102;&#25351;&#23450;kobject&#30340;&#29238;&#20146;&#21644;&#21517;&#23383;(&#24403;&#28982;&#20063;&#21487;&#20197;&#21333;&#29420;&#25351;&#23450;&#32780;&#19981;&#29992;&#27492;API&#25351;&#23450;)
    </p>
    <p>
      int kobject_add(struct kobject *kobj, struct kobject *parent, const char *fmt, ...)
    </p>
    <p>
      &#27492;&#19968;&#27493;&#20250;&#23558;kobject&#21152;&#20837;&#21040;kset&#20013;,&#36825;&#26679;kobject&#19982;kset&#30340;&#21452;&#21521;&#24341;&#29992;&#23601;&#24314;&#31435;&#20102;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389678734279" ID="ID_862125125" MODIFIED="1389678734978" TEXT="kobject_add_varg">
<node CREATED="1389678742631" ID="ID_1782430586" MODIFIED="1389678743170" TEXT="kobject_add_internal">
<node CREATED="1389608701918" ID="ID_902550721" MODIFIED="1389678909265">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#33509;kobject&#30340;&#29238;&#20146;struct kobject.parent&#27809;&#26377;&#35774;&#32622;&#21017;&#23558;kobject&#30340;&#29238;&#20146;&#25351;&#23450;&#20026;
    </p>
    <p>
      struct kobject.kset&#25152;&#20195;&#34920;&#30340;kobject(kset&#20063;&#26159;kobject)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389678931207" ID="ID_1305263066" MODIFIED="1389678976355" TEXT="&#x8c03;&#x7528;kobj_kset_join&#x5c06;kobject&#x52a0;&#x5165;&#x5230;struct kobject.kset&#x6240;&#x4ee3;&#x8868;&#x7684;kset&#x5185;&#x90e8;&#x7684;&#x94fe;&#x8868;&#x4e2d;&#x53bb;"/>
<node CREATED="1389679019975" ID="ID_1910056142" MODIFIED="1389679041267" TEXT="&#x5728;sysfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x4e2d;&#x6dfb;&#x52a0;&#x76f8;&#x5e94;&#x7684;&#x76ee;&#x5f55;"/>
</node>
</node>
</node>
</node>
<node CREATED="1389682137963" ID="ID_333037770" MODIFIED="1389682224347" TEXT="&#x53ef;&#x4ee5;&#x7528;&#x4ee5;&#x4e0b;&#x4e00;&#x4e2a;API&#x6765;&#x4ee3;&#x66ff;&#x4e0a;&#x9762;&#x7684;&#x521d;&#x59cb;&#x5316;&#x548c;&#x52a0;&#x5165;&#x6811;&#x5f62;&#x7ed3;&#x6784;2&#x4e2a;&#x6b65;&#x9aa4;&#xa;int kobject_init_and_add(struct kobject *kobj, &#xa;                                       struct kobj_type *ktype,&#xa;                                       struct kobject *parent, &#xa;                                       const char *fmt, ...)"/>
<node CREATED="1389610620785" ID="ID_883116898" MODIFIED="1389684016949" TEXT="&#x5220;&#x9664;">
<node CREATED="1389610636817" ID="ID_1433200069" MODIFIED="1389610678509" TEXT="&#x8bf7;&#x59cb;&#x7ec8;&#x4f7f;&#x7528;kobject_put&#x51fd;&#x6570;&#x6765;&#x91ca;&#x653e;kobject"/>
</node>
<node CREATED="1389609893088" ID="ID_1405658699" MODIFIED="1389678690832" TEXT="&#x5f15;&#x7528;&#x8ba1;&#x6570;&#x64cd;&#x4f5c;">
<node CREATED="1389609922592" ID="ID_1215830050" MODIFIED="1389610110931">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22686;&#21152;&#24341;&#29992;&#35745;&#25968;
    </p>
    <p>
      struct kobject *kobject_get(struct kobject *kobj)
    </p>
    <p>
      &#24403;kobject&#27491;&#22788;&#20110;&#38144;&#27585;&#36807;&#31243;&#20013;&#26102;&#27492;&#20989;&#25968;&#20250;&#22833;&#36133;,&#27492;&#26102;&#36820;&#22238;&#20540;&#20026;NULL
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389609922592" ID="ID_1671515184" MODIFIED="1389690766216">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20943;&#23569;&#24341;&#29992;&#35745;&#25968;
    </p>
    <p>
      struct kobject *kobject_put(struct kobject *kobj)
    </p>
    <p>
      &#24403;&#24341;&#29992;&#35745;&#25968;&#21464;&#20026;0&#26102;&#20250;&#37322;&#25918;&#27492;kobject :
    </p>
    <p>
      &#39318;&#20808;&#20250;&#21457;&#20986;hotplug&#28040;&#24687;,
    </p>
    <p>
      &#28982;&#21518;&#20174;sysfs&#25991;&#20214;&#31995;&#32479;&#20013;&#21024;&#38500;&#27492;kobject,
    </p>
    <p>
      &#26368;&#21518;&#35843;&#29992;&#27492;kobject&#30340;&#31867;&#30340;release&#20989;&#25968;&#21363;struct kobject.ktype.release
    </p>
  </body>
</html></richcontent>
<node CREATED="1389677382117" ID="ID_882444176" MODIFIED="1389677383217" TEXT="kref_put">
<node CREATED="1389677396677" ID="ID_404385789" MODIFIED="1389677397633" TEXT="kobject_release">
<node CREATED="1389677410037" ID="ID_183185348" MODIFIED="1389677410961" TEXT="kobject_cleanup">
<node CREATED="1389677426629" ID="ID_1844807048" MODIFIED="1389677427553" TEXT="kobject_uevent"/>
<node CREATED="1389677437829" ID="ID_1173727932" MODIFIED="1389677439057" TEXT="kobject_del">
<node CREATED="1389679205191" ID="ID_929027274" MODIFIED="1389679233779" TEXT="&#x5220;&#x9664;sysfs&#x4e2d;&#x6b64;kobject&#x5bf9;&#x5e94;&#x7684;&#x76ee;&#x5f55;"/>
<node CREATED="1389678931207" ID="ID_400477116" MODIFIED="1389679306483" TEXT="&#x8c03;&#x7528;kobj_kset_leave&#x5c06;kobject&#x4ece;struct kobject.kset&#x6240;&#x4ee3;&#x8868;&#x7684;kset&#x5185;&#x90e8;&#x7684;&#x94fe;&#x8868;&#x4e2d;&#x5220;&#x9664;"/>
<node CREATED="1389679446407" ID="ID_117594314" MODIFIED="1389679457971" TEXT="&#x6e05;&#x9664;&#x5bf9;kobject&#x7684;&#x7236;&#x4eb2;struct kobject.parent&#x7684;&#x5f15;&#x7528;"/>
</node>
<node CREATED="1389677462789" ID="ID_1509126720" MODIFIED="1389677465009" TEXT="struct kobject.ktype.release"/>
<node CREATED="1389677482661" ID="ID_201722339" MODIFIED="1389677524785" TEXT="kfree(struct kobject.name)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1389685878096" ID="ID_963360791" MODIFIED="1389690234791">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23646;&#24615;&#25805;&#20316;
    </p>
    <p>
      &#27880;&#24847;&#35835;&#20889;&#23646;&#24615;&#30340;&#20855;&#20307;&#20989;&#25968;&#22312;struct kobject.ktype.sysfs_ops&#20013;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389685926016" ID="ID_366747835" MODIFIED="1389685932124" TEXT="&#x6dfb;&#x52a0;&#x5c5e;&#x6027;">
<node CREATED="1389690060245" ID="ID_1501529846" MODIFIED="1389690061473" TEXT="int sysfs_create_file(struct kobject * kobj, const struct attribute * attr)"/>
<node CREATED="1389690323685" ID="ID_1255984881" MODIFIED="1389690334783">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int sysfs_create_bin_file(struct kobject *kobj, const struct bin_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389685932560" ID="ID_458602100" MODIFIED="1389685938235" TEXT="&#x5220;&#x9664;&#x5c5e;&#x6027;">
<node CREATED="1389690138325" ID="ID_131974031" MODIFIED="1389690139057" TEXT="void sysfs_remove_file(struct kobject * kobj, const struct attribute * attr)"/>
<node CREATED="1389690323685" ID="ID_167285839" MODIFIED="1389690357967">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int sysfs_remove_bin_file(struct kobject *kobj, const struct bin_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1389680728217" FOLDED="true" ID="ID_976477282" MODIFIED="1389692011529" TEXT="kset">
<node CREATED="1389681214586" ID="ID_1762535030" MODIFIED="1389690395414" TEXT="&#x4f5c;&#x7528;">
<node CREATED="1389681223850" ID="ID_1764360034" MODIFIED="1389681229695">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="pic/bus_driver_device_2.png" />
  </body>
</html></richcontent>
</node>
<node CREATED="1389681266954" ID="ID_1371063777" MODIFIED="1389681629205">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      kset&#20027;&#35201;&#20316;&#20026;&#19968;&#20010;&#23481;&#22120;&#23481;&#32435;kobject,&#22312;sysfs&#25991;&#20214;&#31995;&#32479;&#20013;&#23427;&#20195;&#34920;kobject&#30340;&#19978;&#19968;&#32423;&#30446;&#24405;
    </p>
    <p>
      &#38500;&#20102;&#20316;&#20026;&#23481;&#22120;&#22806;,&#36824;&#29992;&#20110;&#25511;&#21046;kset&#20869;&#30340;kobject&#25152;&#20135;&#29983;&#30340;hotplug&#28040;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389337914292" ID="ID_1600308874" MODIFIED="1389691416800" TEXT="struct kset">
<node CREATED="1389338540337" ID="ID_1456516125" MODIFIED="1389338540337" TEXT=" struct list_head list">
<node CREATED="1389681465130" ID="ID_1663337978" MODIFIED="1389681500262" TEXT="&#x6240;&#x6709;struct kobject.kset&#x76f8;&#x540c;&#x7684;kobject&#x90fd;&#x88ab;&#x653e;&#x5728;&#x8fd9;&#x4e2a;&#x94fe;&#x8868;&#x91cc;"/>
</node>
<node CREATED="1389338540337" MODIFIED="1389338540337" TEXT=" spinlock_t list_lock"/>
<node CREATED="1389338540337" ID="ID_1920264318" MODIFIED="1389338540337" TEXT=" struct kobject kobj">
<node CREATED="1389681527146" ID="ID_969880103" MODIFIED="1389681556998" TEXT="&#x4f5c;&#x4e3a;sysfs&#x6587;&#x4ef6;&#x7cfb;&#x7edf;&#x91cc;&#x7684;&#x4e00;&#x4e2a;&#x76ee;&#x5f55;,kset&#x672c;&#x8eab;&#x4e5f;&#x662f;&#x4e00;&#x4e2a;kobject"/>
</node>
<node CREATED="1389338540337" ID="ID_1724936228" LINK="#ID_253314189" MODIFIED="1389691399043">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const struct kset_uevent_ops *uevent_ops
    </p>
    <p>
      &#29992;&#20110;&#25511;&#21046;kset&#20869;&#30340;kobject&#25152;&#20135;&#29983;&#30340;hotplug&#28040;&#24687;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389338540337" ID="ID_65872610" MODIFIED="1389338540337" TEXT=" int (* const filter)(struct kset *kset, struct kobject *kobj)">
<node CREATED="1389338842574" ID="ID_154696967" MODIFIED="1389338906142" TEXT="&#x662f;&#x5426;&#x5141;&#x8bb8;kset&#x4e0b;&#x7684;kobj&#x4ea7;&#x751f;hotplug&#x4e8b;&#x4ef6;,&#x8fd4;&#x56de;&#x503c;1&#x8868;&#x793a;&#x5141;&#x8bb8;&#x4ea7;&#x751f;,0&#x8868;&#x793a;&#x4e0d;&#x5141;&#x8bb8;&#x4ea7;&#x751f;"/>
</node>
<node CREATED="1389338540337" ID="ID_1880029723" MODIFIED="1389338540337" TEXT=" const char *(* const name)(struct kset *kset, struct kobject *kobj)">
<node CREATED="1389339047865" ID="ID_1477727627" MODIFIED="1389339163443" TEXT="&#x5728;&#x8c03;&#x7528;&#x7528;&#x6237;&#x7a7a;&#x95f4;&#x7684;hotplug&#x811a;&#x672c;&#x65f6;,&#x76f8;&#x5173;&#x5b50;&#x7cfb;&#x7edf;&#x7684;&#x540d;&#x5b57;&#x5c06;&#x4f5c;&#x4e3a;&#x552f;&#x4e00;&#x7684;&#x53c2;&#x6570;&#x4f20;&#x9012;&#x7ed9;hotplug&#x811a;&#x672c;,&#xa;&#x800c;&#x672c;&#x51fd;&#x6570;&#x5219;&#x8d1f;&#x8d23;&#x63d0;&#x4f9b;&#x6b64;&#x540d;&#x5b57;"/>
</node>
<node CREATED="1389338540337" ID="ID_1604355373" MODIFIED="1389338540337" TEXT=" int (* const uevent)(struct kset *kset, struct kobject *kobj, struct kobj_uevent_env *env)">
<node CREATED="1389339331430" FOLDED="true" ID="ID_1641685205" MODIFIED="1389339710412" TEXT="struct kobj_uevent_env">
<node CREATED="1389339342919" ID="ID_658034286" MODIFIED="1389339343731" TEXT="char *envp[UEVENT_NUM_ENVP]"/>
<node CREATED="1389339352505" ID="ID_1821758031" MODIFIED="1389339353509" TEXT="int envp_idx"/>
<node CREATED="1389339361659" ID="ID_1057939632" MODIFIED="1389339363668" TEXT="char buf[UEVENT_BUFFER_SIZE]"/>
<node CREATED="1389339369084" ID="ID_1070557705" MODIFIED="1389339370057" TEXT="int buflen"/>
</node>
<node CREATED="1389339573948" ID="ID_267583811" MODIFIED="1389339701814" TEXT="&#x4efb;&#x4f55;hotplug&#x811a;&#x672c;&#x9700;&#x8981;&#x7684;&#x4fe1;&#x606f;&#x90fd;&#x5c06;&#x901a;&#x8fc7;&#x73af;&#x5883;&#x53d8;&#x91cf;&#x4f20;&#x9012;,&#x672c;&#x51fd;&#x6570;&#x5c31;&#x662f;&#x7528;&#x4e8e;&#x63d0;&#x4f9b;&#x8fd9;&#x4e9b;&#x73af;&#x5883;&#x53d8;&#x91cf;,&#xa;&#x672c;&#x51fd;&#x6570;&#x901a;&#x5e38;&#x5e94;&#x8be5;&#x8fd4;&#x56de;0,&#x5426;&#x5219;&#x5c06;&#x7981;&#x6b62;hotplug&#x4e8b;&#x4ef6;"/>
</node>
</node>
</node>
<node CREATED="1389682253499" ID="ID_490290426" MODIFIED="1389682261879" TEXT="&#x5982;&#x4f55;&#x4f7f;&#x7528;kset">
<node CREATED="1389682335483" ID="ID_355554696" MODIFIED="1389682544835" TEXT="&#x521b;&#x5efa;&#x5e76;&#x6dfb;&#x52a0;kset&#xa;struct kset *kset_create_and_add(const char *name,&#xa;                                                      const struct kset_uevent_ops *uevent_ops,&#xa;                                                      struct kobject *parent_kobj)&#xa;name : kset&#x4e2d;kobject&#x7684;&#x540d;&#x79f0;,&#x5373;&#x5728;sysfs&#x4e2d;&#x7684;&#x76ee;&#x5f55;&#x540d;&#x5b57;&#xa;uevent_ops : &#x5982;&#x4f55;&#x63a7;&#x5236;kset&#x5185;&#x7684;kobject&#x6240;&#x4ea7;&#x751f;&#x7684;hotplug&#x6d88;&#x606f;&#xa;parent_kobj : kset&#x4e2d;kobject&#x7684;&#x7236;&#x8282;&#x70b9;,&#x5373;sysfs&#x4e2d;&#x6b64;kset&#x7684;&#x4e0a;&#x4e00;&#x7ea7;&#x76ee;&#x5f55;">
<node CREATED="1389682580731" ID="ID_789406264" MODIFIED="1389683288228" TEXT="struct kset *kset_create(const char *name,&#xa;                                       const struct kset_uevent_ops *uevent_ops,&#xa;                                       struct kobject *parent_kobj)&#xa;&#x521b;&#x5efa;&#x5e76;&#x521d;&#x59cb;&#x5316;kset&#x5185;&#x90e8;&#x5404;&#x6210;&#x5458;,&#xa;&#x6ce8;&#x610f;&#x8fd9;&#x4e00;&#x6b65;&#x4ee5;&#x540e;kset&#x6240;&#x4ee3;&#x8868;&#x7684;kobject&#x4e2d;&#x7684;ktype&#x88ab;&#x521d;&#x59cb;&#x5316;&#x4e3a;kset_ktype(lib/kobject.c)"/>
<node CREATED="1389682724572" ID="ID_717225622" MODIFIED="1389682726889" TEXT="int kset_register(struct kset *k)">
<node CREATED="1389682768140" ID="ID_150324409" MODIFIED="1389682769575" TEXT="void kset_init(struct kset *k)">
<node CREATED="1389682789628" ID="ID_1281362076" LINK="#ID_19289540" MODIFIED="1389682980260" TEXT="&#x521d;&#x59cb;&#x5316;kset&#x6240;&#x4ee3;&#x8868;&#x7684;kobject"/>
<node CREATED="1389682804284" ID="ID_1434278580" MODIFIED="1389682838903" TEXT="&#x521d;&#x59cb;&#x5316;kset&#x5185;&#x7528;&#x4e8e;&#x5bb9;&#x7eb3;kobject&#x7684;&#x94fe;&#x8868;"/>
<node CREATED="1389682850700" ID="ID_1614609847" MODIFIED="1389682876327" TEXT="&#x521d;&#x59cb;&#x5316;&#x7528;&#x4e8e;&#x63a7;&#x5236;&#x8bbf;&#x95ee;kset&#x5185;kobject&#x7684;&#x9501;"/>
</node>
<node CREATED="1389683340460" ID="ID_495397270" LINK="#ID_1782430586" MODIFIED="1389683373301" TEXT="kobject_add_internal"/>
<node CREATED="1389683393484" ID="ID_679949255" MODIFIED="1389683410824" TEXT="kobject_uevent&#x53d1;&#x9001;add&#x7684;hotplug&#x6d88;&#x606f;"/>
</node>
</node>
<node CREATED="1389684005005" ID="ID_1513408652" MODIFIED="1389684060727">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21024;&#38500; : &#35831;&#22987;&#32456;&#20351;&#29992;kset_put&#20989;&#25968;&#26469;&#37322;&#25918;kset
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389683732109" ID="ID_1379139456" MODIFIED="1389683750873" TEXT="&#x5f15;&#x7528;&#x8ba1;&#x6570;&#x64cd;&#x4f5c;">
<node CREATED="1389683752509" ID="ID_1034889656" MODIFIED="1389683790231">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22686;&#21152;&#24341;&#29992;&#35745;&#25968;
    </p>
    <p>
      struct kset *kset_get(struct kset *k)
    </p>
  </body>
</html></richcontent>
<node CREATED="1389683821805" ID="ID_1951137998" LINK="#ID_1215830050" MODIFIED="1389683858597" TEXT="kobject_get"/>
</node>
<node CREATED="1389683752509" ID="ID_1707166365" MODIFIED="1389683808311">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#20943;&#23569;&#24341;&#29992;&#35745;&#25968;
    </p>
    <p>
      struct kset *kset_put(struct kset *k)
    </p>
  </body>
</html></richcontent>
<node CREATED="1389683830781" ID="ID_636900129" LINK="#ID_1671515184" MODIFIED="1389683872373" TEXT="kobject_put"/>
</node>
</node>
</node>
</node>
<node CREATED="1389690668214" FOLDED="true" ID="ID_1798877591" MODIFIED="1389691420047" TEXT="hotplug&#x6d88;&#x606f;">
<node CREATED="1389690682662" ID="ID_68904247" MODIFIED="1389690741592">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      add
    </p>
    <p>
      device&#25346;&#36733;&#21040;&#24635;&#32447;&#19978;&#26102;&#30001;&#24635;&#32447;&#36923;&#36753;&#36127;&#36131;&#20135;&#29983;add hotplug&#28040;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389690688213" ID="ID_892350637" LINK="#ID_183185348" MODIFIED="1389690850870">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      remove
    </p>
    <p>
      kobject&#34987;&#21024;&#38500;&#26102;&#30001;kobject&#26680;&#24515;&#27169;&#22359;&#20135;&#29983;,&#35265;kobject_put
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389690978534" FOLDED="true" ID="ID_1217135343" MODIFIED="1389691405127" TEXT="int kobject_uevent(struct kobject *kobj, enum kobject_action action)">
<node CREATED="1389691032054" ID="ID_253314189" MODIFIED="1389691033218" TEXT="kobject_uevent_env">
<node CREATED="1389691049094" ID="ID_863175289" MODIFIED="1389691109488">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#22914;&#26524;kobj-&gt;uevent_suppress&#32622;1&#34920;&#31034;&#38656;&#35201;&#25233;&#21046;&#27492;kobject&#30340;hotplug&#28040;&#24687;,
    </p>
    <p>
      &#25925;&#32780;&#19981;&#20135;&#29983;hotplug&#28040;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389691129654" ID="ID_1433565807" MODIFIED="1389691195602" TEXT="&#x8c03;&#x7528;struct kobject.kset.uevent_ops-&gt;filter()&#x5224;&#x65ad;&#x662f;&#x5426;&#x9700;&#x8981;&#x8fc7;&#x6ee4;&#x6b64;hotplug&#x6d88;&#x606f;"/>
<node CREATED="1389691129654" ID="ID_1911178662" MODIFIED="1389691249410" TEXT="&#x8c03;&#x7528;struct kobject.kset.uevent_ops-&gt;name()&#x751f;&#x6210;hotplug&#x6d88;&#x606f;&#x7684;&#x5b50;&#x7cfb;&#x7edf;&#x540d;&#x79f0;"/>
<node CREATED="1389691322118" ID="ID_12045185" MODIFIED="1389691362322" TEXT="&#x751f;&#x6210;ACTION,DEVPATH,SUBSYSTEM&#x4e09;&#x4e2a;&#x73af;&#x5883;&#x53d8;&#x91cf;"/>
<node CREATED="1389691129654" ID="ID_428075005" MODIFIED="1389691307922" TEXT="&#x8c03;&#x7528;struct kobject.kset.uevent_ops-&gt;uevent()&#x751f;&#x6210;hotplug&#x6d88;&#x606f;&#x7684;&#x5176;&#x4ed6;&#x73af;&#x5883;&#x53d8;&#x91cf;"/>
</node>
</node>
</node>
</node>
<node CREATED="1389604174537" FOLDED="true" ID="ID_1247880276" MODIFIED="1390442292430" TEXT="bus">
<node CREATED="1389340011410" ID="ID_205083556" MODIFIED="1389691948860" TEXT="struct bus_type">
<node CREATED="1389340573643" ID="ID_387179304" MODIFIED="1389696386736">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const char *name
    </p>
    <p>
      &#23545;&#24212;&#20102;&#27492;bus&#22312;/sys/bus&#19979;&#30340;&#30446;&#24405;&#21517;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389340573644" ID="ID_1227043817" MODIFIED="1389696441375">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;const char *dev_name
    </p>
    <p>
      &#23545;&#24212;&#20102;&#27492;bus&#25152;&#20195;&#34920;&#30340;device&#22312;/sys/devices&#19979;&#30340;&#30446;&#24405;&#21517;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389340573644" ID="ID_560386670" MODIFIED="1389340573644" TEXT=" struct device *dev_root"/>
<node CREATED="1389340573644" FOLDED="true" ID="ID_374848100" MODIFIED="1389695505148">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct bus_attribute *bus_attrs
    </p>
    <p>
      bus&#30340;&#40664;&#35748;&#23646;&#24615;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389340573644" ID="ID_207680407" MODIFIED="1389340573644" TEXT=" struct attribute attr">
<node CREATED="1389693560394" ID="ID_1432930022" MODIFIED="1389693579148" TEXT="&#x5c5e;&#x6027;&#x540d;&#x53ca;&#x8bbf;&#x95ee;&#x6743;&#x9650;"/>
</node>
<node CREATED="1389340573644" ID="ID_1977564082" MODIFIED="1389340573644" TEXT=" ssize_t (*show)(struct bus_type *bus, char *buf)">
<node CREATED="1389693581402" ID="ID_1206613268" MODIFIED="1389693595681" TEXT="&#x8bfb;&#x5c5e;&#x6027;&#x7684;&#x51fd;&#x6570;"/>
</node>
<node CREATED="1389340573644" ID="ID_122136622" MODIFIED="1389340573644" TEXT=" ssize_t (*store)(struct bus_type *bus, const char *buf, size_t count)">
<node CREATED="1389693581402" ID="ID_1460652449" MODIFIED="1389693603973" TEXT="&#x5199;&#x5c5e;&#x6027;&#x7684;&#x51fd;&#x6570;"/>
</node>
</node>
<node CREATED="1389340573644" FOLDED="true" ID="ID_945605374" MODIFIED="1389696338957">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device_attribute *dev_attrs
    </p>
    <p>
      &#25346;&#36733;&#21040;&#27492;bus&#19978;&#30340;&#25152;&#26377;device&#37117;&#20855;&#26377;&#30340;&#23646;&#24615;,&#22312;&#35774;&#22791;&#25346;&#36733;&#26102;&#28155;&#21152;&#21040;&#35774;&#22791;&#19978;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389340573644" MODIFIED="1389340573644" TEXT=" struct attribute attr"/>
<node CREATED="1389340573644" MODIFIED="1389340573644" TEXT=" ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf)"/>
<node CREATED="1389340573644" MODIFIED="1389340573644" TEXT=" ssize_t (*store)(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)"/>
</node>
<node CREATED="1389340573644" FOLDED="true" ID="ID_925442091" MODIFIED="1389696337845">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct driver_attribute *drv_attrs
    </p>
    <p>
      &#27880;&#20876;&#21040;&#27492;bus&#19978;&#30340;&#25152;&#26377;driver&#37117;&#20855;&#26377;&#30340;&#23646;&#24615;,&#22312;&#39537;&#21160;&#27880;&#20876;&#26102;&#28155;&#21152;&#21040;&#39537;&#21160;&#19978;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389340573644" MODIFIED="1389340573644" TEXT=" struct attribute attr"/>
<node CREATED="1389340573644" MODIFIED="1389340573644" TEXT=" ssize_t (*show)(struct device_driver *driver, char *buf)"/>
<node CREATED="1389340573644" MODIFIED="1389340573644" TEXT=" ssize_t (*store)(struct device_driver *driver, const char *buf, size_t count)"/>
</node>
<node CREATED="1389340573644" FOLDED="true" ID="ID_1878821583" MODIFIED="1389696449045" TEXT=" int (*match)(struct device *dev, struct device_driver *drv)">
<node CREATED="1389341220435" ID="ID_484545528" MODIFIED="1389341363081">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;&#22312;&#27492;&#31867;&#22411;&#30340;bus&#19978;&#28155;&#21152;&#26032;&#35774;&#22791;&#25110;&#26032;&#39537;&#21160;&#26102;&#35843;&#29992;&#27492;&#20989;&#25968;&#21305;&#37197;&#39537;&#21160;&#21644;&#35774;&#22791;
    </p>
    <p>
      &#36820;&#22238;&#20540;1&#34920;&#31034;&#21305;&#37197;,&#36820;&#22238;&#20540;0&#34920;&#31034;&#19981;&#21305;&#37197;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389340573644" FOLDED="true" ID="ID_316485597" MODIFIED="1389692770304" TEXT=" int (*uevent)(struct device *dev, struct kobj_uevent_env *env)">
<node CREATED="1389341377308" ID="ID_1076219675" MODIFIED="1389341478968" TEXT="&#x6dfb;&#x52a0;/&#x5220;&#x9664;&#x8bbe;&#x5907;/&#x9a71;&#x52a8;&#x65f6;&#x4f1a;&#x4ea7;&#x751f;hotplug&#x4e8b;&#x4ef6;&#x901a;&#x77e5;&#x7528;&#x6237;,&#x672c;&#x51fd;&#x6570;&#x5141;&#x8bb8;&#x6dfb;&#x52a0;&#x4f20;&#x9012;&#x7ed9;&#x7528;&#x6237;&#x7684;&#x73af;&#x5883;&#x53d8;&#x91cf;"/>
</node>
<node CREATED="1389340573644" ID="ID_1435322949" MODIFIED="1389340573644" TEXT=" int (*probe)(struct device *dev)"/>
<node CREATED="1389340573645" ID="ID_179600973" MODIFIED="1389340573645" TEXT=" int (*remove)(struct device *dev)"/>
<node CREATED="1389340573645" ID="ID_1853539001" MODIFIED="1389340573645" TEXT=" void (*shutdown)(struct device *dev)"/>
<node CREATED="1389340573645" MODIFIED="1389340573645" TEXT=" int (*suspend)(struct device *dev, pm_message_t state)"/>
<node CREATED="1389340573645" ID="ID_321863621" MODIFIED="1389340573645" TEXT=" int (*resume)(struct device *dev)"/>
<node CREATED="1389249333359" FOLDED="true" ID="ID_1573999448" MODIFIED="1389341032286" TEXT=" const struct dev_pm_ops *pm">
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*prepare)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" void (*complete)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*suspend)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*resume)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*freeze)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*thaw)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*poweroff)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*restore)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*suspend_late)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*resume_early)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*freeze_late)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*thaw_early)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*poweroff_late)(struct device *dev)"/>
<node CREATED="1389249333360" MODIFIED="1389249333360" TEXT=" int (*restore_early)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*suspend_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*resume_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*freeze_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*thaw_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*poweroff_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*restore_noirq)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*runtime_suspend)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*runtime_resume)(struct device *dev)"/>
<node CREATED="1389249333361" MODIFIED="1389249333361" TEXT=" int (*runtime_idle)(struct device *dev)"/>
</node>
<node CREATED="1389340573645" ID="ID_560686938" MODIFIED="1389340573645" TEXT=" struct iommu_ops *iommu_ops"/>
<node CREATED="1389340573645" FOLDED="true" ID="ID_650391818" MODIFIED="1390442291173">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct subsys_private *p
    </p>
    <p>
      &#19968;&#20010;bus&#23601;&#26159;&#19968;&#20010;&#23376;&#31995;&#32479;,&#27880;&#20876;bus&#26102;&#20250;&#20135;&#29983;&#19968;&#20010;&#23376;&#31995;&#32479;
    </p>
    <p>
      &#23427;&#21253;&#21547;&#25152;&#26377;&#25346;&#36733;&#21040;&#23427;&#19978;&#38754;&#30340;device&#21644;&#27880;&#20876;&#21040;&#23427;&#19978;&#38754;&#30340;driver
    </p>
    <p>
      &#23376;&#31995;&#32479;&#20027;&#35201;&#29992;&#20110;&#32452;&#32455;&#25346;&#36733;&#30340;device&#21644;&#27880;&#20876;&#30340;drivers&#20197;&#21450;&#22312;sysfs&#20013;&#30340;&#30446;&#24405;&#32467;&#26500;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389692303207" ID="ID_454415115" MODIFIED="1389694640205">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct kset subsys
    </p>
    <p>
      &#23545;&#24212;&#20102;&#27492;bus&#22312;/sys/bus&#19979;&#30340;&#19968;&#20010;&#30446;&#24405;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389692303207" ID="ID_1864844649" MODIFIED="1389692303207" TEXT=" struct kset *devices_kset">
<node CREATED="1389695660748" ID="ID_635713038" MODIFIED="1389696008792">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#24212;&#20102;&#27492;bus&#30446;&#24405;&#19979;&#30340;devices&#23376;&#30446;&#24405;
    </p>
    <p>
      devices&#23376;&#30446;&#24405;&#20013;&#21253;&#21547;&#20102;&#25351;&#21521;/sys/devices/bus_device/device&#30340;&#31526;&#21495;&#38142;&#25509;
    </p>
    <p>
      &#31526;&#21495;&#38142;&#25509;&#20063;&#26159;kobject,&#20063;&#38656;&#35201;&#25918;&#22312;kset&#20013;,&#22240;&#27492;&#36825;&#37324;&#19987;&#38376;&#21019;&#20102;&#19968;&#20010;&#21517;&#20026;devices&#30340;kset&#26469;&#23384;&#25918;&#36825;&#20123;&#31526;&#21495;&#38142;&#25509;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389692303207" ID="ID_1948875178" MODIFIED="1389692303207" TEXT=" struct list_head interfaces"/>
<node CREATED="1389692303207" ID="ID_1716048273" MODIFIED="1389692303207" TEXT=" struct mutex mutex"/>
<node CREATED="1389692303207" ID="ID_1305108047" MODIFIED="1389692303207" TEXT=" struct kset *drivers_kset">
<node CREATED="1389695660748" ID="ID_317334820" MODIFIED="1389696089487">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#23545;&#24212;&#20102;&#27492;bus&#30446;&#24405;&#19979;&#30340;drivers&#23376;&#30446;&#24405;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389692303207" ID="ID_140443686" LINK="#ID_233235845" MODIFIED="1390442243140" TEXT=" struct klist klist_devices">
<node CREATED="1389695390028" ID="ID_546444768" MODIFIED="1389695420615" TEXT="&#x6302;&#x8f7d;&#x5230;&#x6b64;bus&#x7684;&#x6240;&#x6709;&#x8bbe;&#x5907;"/>
</node>
<node CREATED="1389692303207" ID="ID_454823893" MODIFIED="1389692303207" TEXT=" struct klist klist_drivers">
<node CREATED="1389695390028" ID="ID_1090035173" MODIFIED="1389695436407" TEXT="&#x6ce8;&#x518c;&#x5230;&#x6b64;bus&#x7684;&#x6240;&#x6709;&#x9a71;&#x52a8;"/>
</node>
<node CREATED="1389692303207" ID="ID_1658600181" MODIFIED="1389692303207" TEXT=" struct blocking_notifier_head bus_notifier"/>
<node CREATED="1389692303207" ID="ID_172538493" MODIFIED="1389692303207" TEXT=" unsigned int drivers_autoprobe:1"/>
<node CREATED="1389692303207" ID="ID_1601149991" MODIFIED="1389694420733">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct bus_type *bus
    </p>
    <p>
      &#19982;&#23376;&#31995;&#32479;&#23545;&#24212;&#30340;bus
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389692303207" ID="ID_1436311804" MODIFIED="1389692303207" TEXT=" struct kset glue_dirs"/>
<node CREATED="1389692303207" ID="ID_470705212" MODIFIED="1389692303207" TEXT=" struct class *class"/>
</node>
</node>
<node CREATED="1389691772919" ID="ID_1355458659" MODIFIED="1389691780883" TEXT="&#x5982;&#x4f55;&#x4f7f;&#x7528;bus">
<node CREATED="1389691787191" ID="ID_1145597400" MODIFIED="1389691793155" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1389692442525" ID="ID_1967460840" MODIFIED="1389692493347" TEXT="&#x4e00;&#x4e2a;bus&#x672c;&#x8eab;&#x4e5f;&#x662f;&#x4e00;&#x4e2a;device,&#x56e0;&#x6b64;&#x9700;&#x8981;&#x521b;&#x5efa;&#x4e00;&#x4e2a;&#x4e0e;&#x8fd9;&#x4e2a;bus&#x5bf9;&#x5e94;&#x7684;device"/>
<node CREATED="1389692556728" ID="ID_697715777" MODIFIED="1389692670984">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21021;&#22987;&#21270;struct bus_type&#32467;&#26500;
    </p>
    <p>
      &#24517;&#39035;&#21021;&#22987;&#21270;&#30340;&#25104;&#21592; : name, match
    </p>
    <p>
      &#21487;&#36873;&#21021;&#22987;&#21270;&#30340;&#25104;&#21592; : dev_attrs, uevent, pm
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389691797319" ID="ID_968487155" MODIFIED="1389691801107" TEXT="&#x6ce8;&#x518c;">
<node CREATED="1389691899847" FOLDED="true" ID="ID_1542281423" MODIFIED="1389695591996" TEXT="int bus_register(struct bus_type *bus)">
<node CREATED="1389695096108" ID="ID_860509201" MODIFIED="1389695111335" TEXT="&#x521b;&#x5efa;&#x4e00;&#x4e2a;&#x4e0e;bus&#x5bf9;&#x5e94;&#x7684;&#x5b50;&#x7cfb;&#x7edf;"/>
<node CREATED="1389695160539" ID="ID_1518436908" MODIFIED="1389695195447" TEXT="&#x5c06;&#x6b64;bus&#x6ce8;&#x518c;&#x4e3a;/sys/bus&#x4e0b;&#x7684;&#x4e00;&#x4e2a;&#x76ee;&#x5f55;"/>
<node CREATED="1389695209275" ID="ID_232317712" MODIFIED="1389695224407" TEXT="&#x5728;&#x6b64;bus&#x4e0b;&#x6dfb;&#x52a0;uevent&#x5c5e;&#x6027;"/>
<node CREATED="1389695267723" ID="ID_572460413" MODIFIED="1389695354743" TEXT="&#x5728;&#x6b64;bus&#x5bf9;&#x5e94;&#x7684;&#x76ee;&#x5f55;&#x4e0b;&#x6dfb;&#x52a0;&#x4e00;&#x4e2a;devices&#x76ee;&#x5f55;,&#x5373;&#x4ee5;struct bus_type.p.subsys&#x4e3a;parent&#x7684;&#x53e6;&#x4e00;&#x4e2a;kset"/>
<node CREATED="1389695524972" ID="ID_289671710" MODIFIED="1389695571784" TEXT="&#x6dfb;&#x52a0;&#x6b64;bus&#x7684;&#x6240;&#x6709;&#x9ed8;&#x8ba4;&#x5c5e;&#x6027;,&#x5373;struct bus_type.bus_attrs"/>
</node>
</node>
<node CREATED="1389691801799" ID="ID_150575349" MODIFIED="1389691809171" TEXT="&#x6ce8;&#x6d88;">
<node CREATED="1389691899847" ID="ID_475058616" MODIFIED="1389692735702" TEXT="int bus_unregister(struct bus_type *bus)"/>
</node>
<node CREATED="1389692874152" FOLDED="true" ID="ID_1178290584" MODIFIED="1389693610481">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#36741;&#21161;&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389692897704" ID="ID_431080999" MODIFIED="1389693115713" TEXT="&#x904d;&#x5386;bus&#x4e0a;&#x7684;&#x6bcf;&#x4e00;&#x4e2a;device,&#x5e76;&#x7528;device&#x548c;&#x53c2;&#x6570;data&#x8c03;&#x7528;&#x51fd;&#x6570;fn, fn&#x7684;&#x975e;0&#x8fd4;&#x56de;&#x503c;&#x5c06;&#x505c;&#x6b62;&#x904d;&#x5386;&#xa;int bus_for_each_dev(struct bus_type *bus, &#xa;                                  struct device *start, void *data,&#xa;                                  int (*fn)(struct device *dev, void *data))"/>
<node CREATED="1389692977640" ID="ID_1873665978" MODIFIED="1389693122872" TEXT="&#x904d;&#x5386;bus&#x4e0a;&#x7684;&#x6bcf;&#x4e00;&#x4e2a;driver,&#x5e76;&#x7528;driver&#x548c;&#x53c2;&#x6570;data&#x8c03;&#x7528;&#x51fd;&#x6570;fn, fn&#x7684;&#x975e;0&#x8fd4;&#x56de;&#x503c;&#x5c06;&#x505c;&#x6b62;&#x904d;&#x5386;&#xa;int bus_for_each_drv(struct bus_type *bus,&#xa;                                 struct device_driver *start, void *data, &#xa;                                 int (*fn)(struct device_driver *, void *))"/>
</node>
<node CREATED="1389693649433" FOLDED="true" ID="ID_68791266" MODIFIED="1389693761394" TEXT="&#x5c5e;&#x6027;&#x64cd;&#x4f5c;">
<node CREATED="1389693704025" ID="ID_1910879054" MODIFIED="1389693749189" TEXT="&#x9ed8;&#x8ba4;&#x5c5e;&#x6027;&#x53ef;&#x4ee5;&#x5728;&#x6ce8;&#x518c;bus&#x65f6;&#x5728;struct bus_type.bus_attrs&#x4e2d;&#x6307;&#x5b9a;"/>
<node CREATED="1389693665593" ID="ID_1613438535" MODIFIED="1389693679716">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#28155;&#21152;&#23646;&#24615;
    </p>
    <p>
      int bus_create_file(struct bus_type *bus, struct bus_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389693665593" ID="ID_277022848" MODIFIED="1389693700348">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21024;&#38500;&#23646;&#24615;
    </p>
    <p>
      int bus_remove_file(struct bus_type *bus, struct bus_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1389604181641" FOLDED="true" ID="ID_406643678" MODIFIED="1390442299639" TEXT="device">
<node CREATED="1389869551719" ID="ID_1143849462" MODIFIED="1389869558938" TEXT="&#x6982;&#x5ff5;">
<node CREATED="1389869574295" ID="ID_1110447463" MODIFIED="1389869646691" TEXT="struct device&#x4e00;&#x822c;&#x88ab;&#x5d4c;&#x5165;&#x5230;&#x8bbe;&#x5907;&#x7684;&#x66f4;&#x9ad8;&#x5c42;&#x62bd;&#x8c61;&#x4e2d;,&#x6bd4;&#x5982;struct platform_device"/>
</node>
<node CREATED="1389248787929" ID="ID_1465709175" MODIFIED="1390441846442">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device dev
    </p>
  </body>
</html></richcontent>
<node CREATED="1389250082780" ID="ID_594523938" MODIFIED="1389250082780" TEXT=" struct device *parent">
<node CREATED="1389783542218" ID="ID_826090677" MODIFIED="1389783559506" TEXT="&#x7236;&#x8bbe;&#x5907;"/>
</node>
<node CREATED="1389250082780" FOLDED="true" ID="ID_115578405" MODIFIED="1390442297589" TEXT=" struct device_private *p">
<node CREATED="1390441917313" ID="ID_1736266184" MODIFIED="1390441918253" TEXT="struct klist klist_children">
<node CREATED="1390441989250" ID="ID_171646630" MODIFIED="1390441999779" TEXT="&#x6b64;&#x8bbe;&#x5907;&#x7684;&#x5b50;&#x8bbe;&#x5907;"/>
</node>
<node CREATED="1390441930385" ID="ID_1128842796" MODIFIED="1390441931357" TEXT="struct klist_node knode_parent">
<node CREATED="1390442002370" ID="ID_492239711" MODIFIED="1390442028565" TEXT="&#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x6b64;&#x8bbe;&#x5907;&#x7684;&#x7236;&#x8bbe;&#x5907;,&#x5373;&#x4e0a;&#x9762;&#x7684;&#x94fe;&#x8868;&#x4e2d;"/>
</node>
<node CREATED="1390441940353" ID="ID_574351709" LINK="#ID_72320691" MODIFIED="1390442110619" TEXT="struct klist_node knode_driver">
<node CREATED="1390442056019" ID="ID_255454126" MODIFIED="1390442071020" TEXT="&#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x6240;&#x7ed1;&#x5b9a;&#x7684;&#x9a71;&#x52a8;&#x4e2d;"/>
</node>
<node CREATED="1390441950273" ID="ID_233235845" LINK="#ID_140443686" MODIFIED="1390442229748" TEXT="struct klist_node knode_bus">
<node CREATED="1390442138723" ID="ID_1863326680" MODIFIED="1390442196897" TEXT="&#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x6240;&#x6302;&#x8f7d;&#x7684;bus&#x4e0a;"/>
</node>
<node CREATED="1390441959841" ID="ID_406854393" MODIFIED="1390441960541" TEXT="struct list_head deferred_probe"/>
<node CREATED="1390441968801" ID="ID_1499189150" MODIFIED="1390441969773" TEXT="void *driver_data"/>
<node CREATED="1390441978578" ID="ID_1005570298" MODIFIED="1390441979341" TEXT="struct device *device">
<node CREATED="1390442259028" ID="ID_1606486416" MODIFIED="1390442282544" TEXT="&#x5173;&#x8054;&#x7684;struct device&#x7ed3;&#x6784;"/>
</node>
</node>
<node CREATED="1389250082780" ID="ID_396354253" MODIFIED="1389250082780" TEXT=" struct kobject kobj">
<node CREATED="1389867750325" ID="ID_1520430636" MODIFIED="1389867794704" TEXT="&#x4ee3;&#x8868;&#x6b64;device&#x7684;&#x5185;&#x6838;&#x5bf9;&#x8c61;,&#x7528;&#x4e8e;&#x5c06;device&#x94fe;&#x63a5;&#x5230;device&#x6811;&#x5f62;&#x7ed3;&#x6784;&#x4e0a;"/>
</node>
<node CREATED="1389250082780" ID="ID_330035896" MODIFIED="1389250082780" TEXT=" const char *init_name"/>
<node CREATED="1389250082780" ID="ID_572934510" MODIFIED="1389250082780" TEXT=" const struct device_type *type"/>
<node CREATED="1389250082780" ID="ID_1089156542" MODIFIED="1389250082780" TEXT=" struct mutex mutex"/>
<node CREATED="1389250082780" ID="ID_182995208" MODIFIED="1389250082780" TEXT=" struct bus_type *bus">
<node CREATED="1389342467625" ID="ID_1002003863" MODIFIED="1389342499706" TEXT="&#x8be5;&#x8bbe;&#x5907;&#x6302;&#x63a5;&#x5728;&#x4f55;&#x79cd;&#x7c7b;&#x578b;&#x7684;&#x603b;&#x7ebf;&#x4e0a;"/>
</node>
<node CREATED="1389250082780" ID="ID_1030060405" MODIFIED="1389250082780" TEXT=" struct device_driver *driver">
<node CREATED="1389342704222" ID="ID_1566524606" MODIFIED="1389342820205" TEXT="&#x7ba1;&#x7406;&#x8be5;&#x8bbe;&#x5907;&#x7684;&#x9a71;&#x52a8;&#x7a0b;&#x5e8f;,&#x5f53;&#x8bbe;&#x5907;&#x5339;&#x914d;&#x5230;&#x9a71;&#x52a8;&#x540e;&#x7531;bus core&#x8bbe;&#x7f6e;,&#x5b9e;&#x9645;&#x4e0a;&#x5efa;&#x7acb;&#x4e86;&#x9a71;&#x52a8;&#x4e0e;&#x8bbe;&#x5907;&#x7684;&#x7ed1;&#x5b9a;"/>
</node>
<node CREATED="1389250082780" ID="ID_1109550195" MODIFIED="1389250082780" TEXT=" struct list_head deferred_probe"/>
<node CREATED="1389250082780" ID="ID_919640521" MODIFIED="1389250082780" TEXT=" void *platform_data">
<node CREATED="1389250558006" ID="ID_466432713" MODIFIED="1389259519756">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#19968;&#33324;&#26469;&#35828;,&#39537;&#21160;&#38656;&#35201;&#26576;&#20123;&#20851;&#20110;&#27492;device&#30340;&#20449;&#24687;&#25165;&#33021;&#39537;&#21160;&#27492;device,
    </p>
    <p>
      &#28155;&#21152;&#35774;&#22791;&#26102;&#21487;&#20197;&#26377;2&#31181;&#21150;&#27861;&#23558;&#36825;&#20123;device&#29305;&#23450;&#20449;&#24687;&#20256;&#36882;&#32473;driver :
    </p>
    <p>
      1, &#36890;&#36807;struct platform_device.resource
    </p>
    <p>
      2, &#36890;&#36807;struct platform_device.dev.platform_data,&#20854;&#26684;&#24335;&#26159;&#33258;&#23450;&#20041;&#30340;,&#20294;&#24212;&#22312;device&#21644;driver&#38388;&#21462;&#24471;&#20849;&#35782;
    </p>
    <p>
      resource&#30340;&#26041;&#24335;&#19968;&#33324;&#20256;&#36882;&#27604;&#36739;&#31616;&#21333;&#30340;&#20449;&#24687;,&#32780;platform_data&#21017;&#29992;&#20110;&#20256;&#36882;&#27604;&#36739;&#22797;&#26434;&#30340;&#20449;&#24687;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" struct dev_pm_info power"/>
<node CREATED="1389250082780" ID="ID_60929884" MODIFIED="1389250082780" TEXT=" struct dev_pm_domain *pm_domain"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" int numa_node"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" u64 *dma_mask"/>
<node CREATED="1389250082780" MODIFIED="1389250082780" TEXT=" u64 coherent_dma_mask"/>
<node CREATED="1389250082781" ID="ID_1196312152" MODIFIED="1389250082781" TEXT=" struct device_dma_parameters *dma_parms"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct list_head dma_pools"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct dma_coherent_mem *dma_mem"/>
<node CREATED="1389250082781" ID="ID_1109841989" MODIFIED="1389250082781" TEXT=" struct dev_archdata archdata"/>
<node CREATED="1389250082781" ID="ID_1894384204" MODIFIED="1389250082781" TEXT=" struct device_node *of_node"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" dev_t devt"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" u32 id"/>
<node CREATED="1389250082781" ID="ID_1918661140" MODIFIED="1389250082781" TEXT=" spinlock_t devres_lock"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct list_head devres_head"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" struct klist_node knode_class"/>
<node CREATED="1389250082781" ID="ID_842972903" MODIFIED="1389250082781" TEXT=" struct class *class"/>
<node CREATED="1389250082781" MODIFIED="1389250082781" TEXT=" const struct attribute_group **groups"/>
<node CREATED="1389250082781" ID="ID_705503907" MODIFIED="1389250082781" TEXT=" void (*release)(struct device *dev)">
<node CREATED="1389868363589" ID="ID_796251189" MODIFIED="1389868628018">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;device&#20013;&#30340;kobject&#24341;&#29992;&#35745;&#25968;&#20026;0&#26102;,&#23558;&#35843;&#29992;&#27492;&#20989;&#25968;&#37322;&#25918;device
    </p>
    <p>
      &#27880;&#24847;struct device.kobj.ktype&#22312;device_initialize&#20013;&#34987;&#21021;&#22987;&#21270;&#20026;device_ktype
    </p>
    <p>
      &#25152;&#20197;kobj-&gt;ktype-&gt;release() &#21363; device_release,&#23427;&#21448;&#20250;&#35843;&#29992;struct device.release
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1389696742317" FOLDED="true" ID="ID_943144454" MODIFIED="1389869548615" TEXT="&#x5982;&#x4f55;&#x4f7f;&#x7528;device">
<node CREATED="1389696753213" ID="ID_168036845" MODIFIED="1389696757673" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1389696815405" ID="ID_1313326186" MODIFIED="1389696906288">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#32622;struct device.parent,&#34920;&#31034;&#35774;&#22791;&#30340;&#29238;&#35774;&#22791;,
    </p>
    <p>
      &#33509;&#19981;&#35774;&#32622;&#21017;&#29238;&#35774;&#22791;&#20250;&#34987;&#35774;&#32622;&#20026;&#25346;&#36733;&#30340;bus&#25152;&#20195;&#34920;&#30340;device
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389696940814" ID="ID_1704687229" MODIFIED="1389696981211" TEXT="&#x5fc5;&#x987b;&#x8bbe;&#x7f6e;&#x6b64;&#x8bbe;&#x5907;&#x6240;&#x6302;&#x8f7d;&#x7684;bus,&#x5373;struct device.bus"/>
<node CREATED="1389697009070" ID="ID_840139229" MODIFIED="1389697067497" TEXT="&#x5fc5;&#x987b;&#x8bbe;&#x7f6e;&#x6b64;device&#x7684;&#x540d;&#x79f0;struct device.kobj.name"/>
<node CREATED="1389782819444" ID="ID_1119145850" MODIFIED="1389782862201">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35843;&#29992;&#20197;&#19979;API&#20570;&#36890;&#29992;&#30340;&#21021;&#22987;&#21270;
    </p>
    <p>
      void device_initialize(struct device *dev)
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389782935130" ID="ID_1264414312" MODIFIED="1389782943302" TEXT="&#x6dfb;&#x52a0;&#x8bbe;&#x5907;">
<node CREATED="1389782946378" ID="ID_215402955" MODIFIED="1389782947414" TEXT="int device_add(struct device *dev)"/>
</node>
<node CREATED="1389783096650" ID="ID_1154775313" MODIFIED="1389783199501">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#35774;&#22791;&#21021;&#22987;&#21270;&#21450;&#28155;&#21152;&#21487;&#20197;&#21512;&#24182;&#20026;&#19968;&#20010;API
    </p>
    <p>
      int device_register(struct device *dev)
    </p>
    <p>
      &#22312;&#35843;&#29992;&#27492;API&#20043;&#21069;,parent, bus, name&#36824;&#26159;&#35201;&#21021;&#22987;&#21270;&#30340;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1389783402650" ID="ID_1900192717" MODIFIED="1389783408630" TEXT="&#x5c5e;&#x6027;&#x64cd;&#x4f5c;">
<node CREATED="1389783501434" ID="ID_1375730510" MODIFIED="1389783523302" TEXT="&#x5c5e;&#x6027;&#x5373;&#x4e00;&#x4e2a;&#x53ef;&#x7528;&#x4e8e;&#x63a7;&#x5236;&#x8bbe;&#x5907;&#x7684;&#x9009;&#x9879;"/>
<node CREATED="1389783409643" ID="ID_204373497" MODIFIED="1389783414374" TEXT="&#x6dfb;&#x52a0;&#x5c5e;&#x6027;">
<node CREATED="1389783415131" ID="ID_1977638767" MODIFIED="1389783450316">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int device_create_file(struct device *dev, const struct device_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389783409643" ID="ID_1327528427" MODIFIED="1389783431654" TEXT="&#x5220;&#x9664;&#x5c5e;&#x6027;">
<node CREATED="1389783415131" ID="ID_1143100868" MODIFIED="1389783478204">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      int device_remove_file(struct device *dev, const struct device_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1389604185049" FOLDED="true" ID="ID_1415498767" MODIFIED="1390443802044" TEXT="driver">
<node CREATED="1389249333358" ID="ID_240668604" MODIFIED="1389929163333">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#160;struct device_driver driver
    </p>
    <p>
      &#19968;&#33324;name&#21644;owner&#25104;&#21592;&#24517;&#39035;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1389249333358" FOLDED="true" ID="ID_1411064280" MODIFIED="1390441193835" TEXT=" const char *name">
<node CREATED="1389256282341" ID="ID_1996886661" MODIFIED="1389256313381" TEXT="&#x9a71;&#x52a8;&#x540d;&#x79f0;,&#x8868;&#x793a;&#x9a71;&#x52a8;&#x7c7b;&#x578b;,&#x7528;&#x4e8e;&#x5339;&#x914d;&#x8bbe;&#x5907;"/>
<node CREATED="1389257075091" ID="ID_746848371" MODIFIED="1389257092764" TEXT="&#x5fc5;&#x987b;&#x5728;&#x9a71;&#x52a8;&#x6ce8;&#x518c;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389249333358" FOLDED="true" ID="ID_709093762" MODIFIED="1390441194755" TEXT=" struct bus_type *bus">
<node CREATED="1389342467625" ID="ID_1327916480" MODIFIED="1389344009882" TEXT="&#x8be5;&#x9a71;&#x52a8;&#x6302;&#x63a5;&#x5728;&#x4f55;&#x79cd;&#x7c7b;&#x578b;&#x7684;&#x603b;&#x7ebf;&#x4e0a;"/>
<node CREATED="1389257075091" ID="ID_929552587" MODIFIED="1389257092764" TEXT="&#x5fc5;&#x987b;&#x5728;&#x9a71;&#x52a8;&#x6ce8;&#x518c;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389249333361" FOLDED="true" ID="ID_436402304" MODIFIED="1390441195515" TEXT=" struct module *owner">
<node CREATED="1389257389413" ID="ID_1611094021" MODIFIED="1389257404995" TEXT="&#x6240;&#x5c5e;&#x7684;&#x5185;&#x6838;&#x6a21;&#x5757;"/>
<node CREATED="1389257075091" ID="ID_364021204" MODIFIED="1389257092764" TEXT="&#x5fc5;&#x987b;&#x5728;&#x9a71;&#x52a8;&#x6ce8;&#x518c;&#x524d;&#x88ab;&#x521d;&#x59cb;&#x5316;"/>
</node>
<node CREATED="1389249333361" ID="ID_1520165276" MODIFIED="1389249333361" TEXT=" const char *mod_name"/>
<node CREATED="1389249333361" ID="ID_1827845784" MODIFIED="1389249333361" TEXT=" bool suppress_bind_attrs"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" const struct of_device_id *of_match_table"/>
<node CREATED="1389249333362" ID="ID_224095447" MODIFIED="1389249333362" TEXT=" int (*probe) (struct device *dev)">
<node CREATED="1389929457378" ID="ID_398698543" MODIFIED="1389929819391">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#24403;&#39537;&#21160;&#21644;&#35774;&#22791;&#21305;&#37197;&#26102;&#35843;&#29992;&#27492;&#20989;&#25968;&#25506;&#27979;&#35774;&#22791;&#26159;&#21542;&#30495;&#30340;&#23384;&#22312;
    </p>
    <p>
      &#27492;&#20989;&#25968;&#19968;&#33324;&#34987;&#35774;&#32622;&#20026;&#39537;&#21160;&#30340;&#26356;&#39640;&#23618;&#25277;&#35937;(platform_driver)&#30456;&#23545;&#24212;&#30340;probe&#20989;&#25968;&#27604;&#22914;platform_drv_probe
    </p>
    <p>
      &#28982;&#21518;&#30001;&#36825;&#20010;&#20989;&#25968;&#23558;struct device_driver&#36716;&#25442;&#20026;&#39537;&#21160;&#30340;&#26356;&#39640;&#23618;&#25277;&#35937;(platform_driver),&#20043;&#21518;&#20877;&#35843;&#29992;&#39640;&#23618;&#25277;&#35937;&#39537;&#21160;&#30340;probe&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389249333362" ID="ID_620772195" MODIFIED="1389249333362" TEXT=" int (*remove) (struct device *dev)">
<node CREATED="1390441252299" ID="ID_1795402054" MODIFIED="1390441369568">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#29992;&#20110;&#21024;&#38500;&#35774;&#22791;
    </p>
    <p>
      &#27492;&#20989;&#25968;&#19968;&#33324;&#34987;&#35774;&#32622;&#20026;&#39537;&#21160;&#30340;&#26356;&#39640;&#23618;&#25277;&#35937;(platform_driver)&#30456;&#23545;&#24212;&#30340;remove&#20989;&#25968;&#27604;&#22914;platform_drv_remove
    </p>
    <p>
      &#28982;&#21518;&#30001;&#36825;&#20010;&#20989;&#25968;&#23558;struct device_driver&#36716;&#25442;&#20026;&#39537;&#21160;&#30340;&#26356;&#39640;&#23618;&#25277;&#35937;(platform_driver),&#20043;&#21518;&#20877;&#35843;&#29992;&#39640;&#23618;&#25277;&#35937;&#39537;&#21160;&#30340;remove&#20989;&#25968;
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1389249333362" ID="ID_1465439513" MODIFIED="1389249333362" TEXT=" void (*shutdown) (struct device *dev)"/>
<node CREATED="1389249333362" ID="ID_1847125294" MODIFIED="1389249333362" TEXT=" int (*suspend) (struct device *dev, pm_message_t state)"/>
<node CREATED="1389249333362" MODIFIED="1389249333362" TEXT=" int (*resume) (struct device *dev)"/>
<node CREATED="1389249333362" ID="ID_708725497" MODIFIED="1389249333362" TEXT=" const struct attribute_group **groups"/>
<node CREATED="1389249333362" ID="ID_268149664" LINK="#ID_1077634871" MODIFIED="1389249403863" TEXT=" const struct dev_pm_ops *pm"/>
<node CREATED="1389249333362" FOLDED="true" ID="ID_1785046827" MODIFIED="1390442392966" TEXT=" struct driver_private *p">
<node CREATED="1390441578766" ID="ID_1251791005" MODIFIED="1390441584408" TEXT="struct kobject kobj">
<node CREATED="1390441650799" ID="ID_397941852" MODIFIED="1390441673860" TEXT="&#x4ee3;&#x8868;&#x6b64;driver&#x7684;&#x5185;&#x6838;&#x5bf9;&#x8c61;,&#x7528;&#x4e8e;&#x5c06;driver&#x94fe;&#x63a5;&#x5230;driver&#x6811;&#x5f62;&#x7ed3;&#x6784;&#x4e0a;"/>
</node>
<node CREATED="1390441592030" ID="ID_72320691" LINK="#ID_574351709" MODIFIED="1390442128619" TEXT="struct klist klist_devices">
<node CREATED="1390441703471" ID="ID_1840780152" MODIFIED="1390441719771" TEXT="&#x7ed1;&#x5b9a;&#x5230;&#x6b64;driver&#x7684;&#x6240;&#x6709;device"/>
</node>
<node CREATED="1390441600510" ID="ID_1824633485" MODIFIED="1390441601066" TEXT="struct klist_node knode_bus">
<node CREATED="1390441728559" ID="ID_538922353" LINK="#ID_454823893" MODIFIED="1390441818193" TEXT="&#x7528;&#x4e8e;&#x94fe;&#x63a5;&#x5230;&#x6240;&#x6302;&#x8f7d;&#x7684;bus&#x4e0a;"/>
</node>
<node CREATED="1390441609118" ID="ID_938401516" MODIFIED="1390441609578" TEXT="struct module_kobject *mkobj"/>
<node CREATED="1390441617342" ID="ID_1454994368" MODIFIED="1390441617803" TEXT="struct device_driver *driver">
<node CREATED="1390442305813" ID="ID_1563121052" MODIFIED="1390442322688" TEXT="&#x5173;&#x8054;&#x7684;struct device_driver&#x7ed3;&#x6784;"/>
</node>
</node>
</node>
<node CREATED="1390440907151" ID="ID_1423240566" MODIFIED="1390440915220" TEXT="&#x5982;&#x4f55;&#x4f7f;&#x7528;driver">
<node CREATED="1390440956105" ID="ID_528423083" MODIFIED="1390440963156" TEXT="&#x521d;&#x59cb;&#x5316;">
<node CREATED="1390441062954" ID="ID_1189409637" MODIFIED="1390441174820">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct device_driver&#30340;&#20197;&#19979;&#25104;&#21592;&#24517;&#39035;&#21021;&#22987;&#21270;
    </p>
    <p>
      name, bus, owner, probe, remove
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1390441405773" ID="ID_809695274" MODIFIED="1390441414521" TEXT="&#x6ce8;&#x518c;&#x9a71;&#x52a8;">
<node CREATED="1390441438557" ID="ID_351256909" MODIFIED="1390441439401" TEXT="int driver_register(struct device_driver *drv)"/>
</node>
<node CREATED="1390441445165" ID="ID_1308870209" MODIFIED="1390441458275" TEXT="&#x6ce8;&#x9500;&#x9a71;&#x52a8;">
<node CREATED="1390441470429" ID="ID_1732357687" MODIFIED="1390441471017" TEXT="void driver_unregister(struct device_driver *drv)"/>
</node>
<node CREATED="1390442643447" ID="ID_282152413" MODIFIED="1390442650307" TEXT="&#x5c5e;&#x6027;&#x64cd;&#x4f5c;">
<node CREATED="1390442666424" ID="ID_1148183396" MODIFIED="1390442722827">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#28155;&#21152;&#23646;&#24615;
    </p>
    <p>
      int driver_create_file(struct device_driver *drv, const struct driver_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1390442666424" ID="ID_1365452736" MODIFIED="1390442746299">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &#21024;&#38500;&#23646;&#24615;
    </p>
    <p>
      int driver_remove_file(struct device_driver *drv, const struct driver_attribute *attr)
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1389868840854" ID="ID_1687800606" MODIFIED="1389868847650" TEXT="dma&#x62bd;&#x8c61;"/>
</node>
</node>
</map>
