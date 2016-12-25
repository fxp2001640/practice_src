<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1311226589347" ID="ID_1739716422" MODIFIED="1311226613738" TEXT="linux&#x7ec8;&#x7aef;&#x8bbe;&#x5907;&#x9a71;&#x52a8;">
<node CREATED="1311228000101" FOLDED="true" ID="ID_120875230" MODIFIED="1317396630826" POSITION="right" TEXT="&#x4e32;&#x53e3;&#x9a71;&#x52a8;">
<node CREATED="1311228042402" ID="ID_1456604605" MODIFIED="1311228048010" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;"/>
<node CREATED="1311228023843" ID="ID_251937201" MODIFIED="1311228026387" TEXT="serial8250_init">
<node CREATED="1311228152899" ID="ID_1540552942" LINK="#ID_57386836" MODIFIED="1311228868870">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uart_register_driver
    </p>
    <p>
      &#20854;&#20013;&#30340;&#21442;&#25968;&#20026;:
    </p>
  </body>
</html></richcontent>
<node CREATED="1311228874355" ID="ID_1741914344" MODIFIED="1311228998244" TEXT=".owner = THIS_MODULE, &#xa;.driver_name = &quot;serial&quot;, &#xa;.dev_name = &quot;ttyS&quot;, &#xa;.major = TTY_MAJOR, &#xa;.minor = 64, &#xa;.cons = SERIAL8250_CONSOLE"/>
</node>
</node>
</node>
<node CREATED="1311228159107" FOLDED="true" ID="ID_1471549793" MODIFIED="1317396629085" POSITION="left" TEXT="uart">
<node CREATED="1311228209368" ID="ID_1012138213" MODIFIED="1311228216948" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1311228350816" ID="ID_1073202195" MODIFIED="1311228352551" TEXT="struct uart_driver">
<node CREATED="1311228387822" ID="ID_259319732" MODIFIED="1311228393957" TEXT="struct module&#x9; *owner"/>
<node CREATED="1311228406669" ID="ID_258189193" MODIFIED="1311228407914" TEXT="driver_name"/>
<node CREATED="1311228415077" ID="ID_1862910382" MODIFIED="1311228416149" TEXT="dev_name"/>
<node CREATED="1311228422510" ID="ID_151323859" MODIFIED="1311228424315" TEXT="major"/>
<node CREATED="1311228428781" ID="ID_475972732" MODIFIED="1311228430741" TEXT="minor"/>
<node CREATED="1311228435949" ID="ID_373058392" MODIFIED="1311228437488" TEXT="nr"/>
<node CREATED="1311228449932" ID="ID_1769877400" MODIFIED="1311228474563">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct console *cons
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311228485322" FOLDED="true" ID="ID_616727035" MODIFIED="1311232396997" TEXT="struct uart_state *state">
<node CREATED="1311229923224" ID="ID_1621593814" MODIFIED="1311229925212" TEXT="close_delay"/>
<node CREATED="1311229934776" ID="ID_1052256573" MODIFIED="1311229936640" TEXT="closing_wait"/>
<node CREATED="1311229941815" ID="ID_1756905198" MODIFIED="1311229943923" TEXT="count"/>
<node CREATED="1311229947879" ID="ID_1003914997" MODIFIED="1311229949065" TEXT="pm_state"/>
<node CREATED="1311229958823" ID="ID_480342531" MODIFIED="1311231735254">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct uart_info info
    </p>
  </body>
</html></richcontent>
<node CREATED="1311230064737" ID="ID_916390469" MODIFIED="1311230079681">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct tty_port port
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311230089663" ID="ID_1228266744" MODIFIED="1311230102512">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct circ_buf xmit
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311230110782" ID="ID_1076553760" MODIFIED="1311230113086" TEXT="flags"/>
<node CREATED="1311230123085" ID="ID_19904846" MODIFIED="1311230128901" TEXT="struct tasklet_struct tlet"/>
<node CREATED="1311230138652" ID="ID_804601624" MODIFIED="1311230144667" TEXT="wait_queue_head_t delta_msr_wait"/>
</node>
<node CREATED="1311229980357" FOLDED="true" ID="ID_730321652" MODIFIED="1311231712636">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct uart_port *port
    </p>
  </body>
</html></richcontent>
<node CREATED="1311230235031" ID="ID_562233778" MODIFIED="1311230237591" TEXT="lock"/>
<node CREATED="1311230243449" ID="ID_1639883127" MODIFIED="1311230244911" TEXT="iobase"/>
<node CREATED="1311230249686" ID="ID_1724968540" MODIFIED="1311230251207" TEXT="membase"/>
<node CREATED="1311230257462" ID="ID_356019427" MODIFIED="1311230263054" TEXT="serial_in&#x51fd;&#x6570;"/>
<node CREATED="1311230267893" ID="ID_60985221" MODIFIED="1311230271792" TEXT="serial_out&#x51fd;&#x6570;"/>
<node CREATED="1311230276021" ID="ID_1026852888" MODIFIED="1311230277637" TEXT="irq"/>
<node CREATED="1311230282037" ID="ID_264269400" MODIFIED="1311230283333" TEXT="uartclk"/>
<node CREATED="1311230287460" ID="ID_1626645559" MODIFIED="1311230289375" TEXT="fifosize"/>
<node CREATED="1311230293428" ID="ID_663933133" MODIFIED="1311230294852" TEXT="x_char"/>
<node CREATED="1311230299060" ID="ID_979838114" MODIFIED="1311230301081" TEXT="regshift"/>
<node CREATED="1311230307379" ID="ID_1624908372" MODIFIED="1311230309211" TEXT="iotype"/>
<node CREATED="1311230316563" ID="ID_1494143863" MODIFIED="1311230317883" TEXT="read_status_mask"/>
<node CREATED="1311230324178" ID="ID_49197018" MODIFIED="1311230326043" TEXT="ignore_status_mask"/>
<node CREATED="1311230338513" ID="ID_1898367205" MODIFIED="1311230348091">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct uart_info *info
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311230358481" ID="ID_1295184717" MODIFIED="1311230364256" TEXT="struct uart_icount icount"/>
<node CREATED="1311230371903" ID="ID_589527203" MODIFIED="1311230383816">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct console *cons
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311230392175" ID="ID_236321545" MODIFIED="1311230393806" TEXT="flags"/>
<node CREATED="1311230399615" ID="ID_260764594" MODIFIED="1311230401136" TEXT="mctrl"/>
<node CREATED="1311230405806" ID="ID_1407051346" MODIFIED="1311230407623" TEXT="timeout"/>
<node CREATED="1311230412157" ID="ID_972344137" MODIFIED="1311230413749" TEXT="type"/>
<node CREATED="1311230421693" ID="ID_149303501" MODIFIED="1311230432085">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct uart_ops *ops
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311230440236" ID="ID_792618610" MODIFIED="1311230442436" TEXT="custom_divisor"/>
<node CREATED="1311230446891" ID="ID_770811326" MODIFIED="1311230448707" TEXT="line"/>
<node CREATED="1311230454379" ID="ID_498807509" MODIFIED="1311230456663" TEXT="mapbase"/>
<node CREATED="1311230476634" ID="ID_624278765" MODIFIED="1311230492762">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct device *dev
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311230501018" ID="ID_341958080" MODIFIED="1311230502501" TEXT="hub6"/>
<node CREATED="1311230509160" ID="ID_354854905" MODIFIED="1311230511428" TEXT="suspended"/>
<node CREATED="1311230517591" ID="ID_1384405613" MODIFIED="1311230519110" TEXT="private_data"/>
</node>
<node CREATED="1311230005380" ID="ID_1772822303" MODIFIED="1311230022236">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      struct mutex mutex
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1311228501514" ID="ID_129287985" MODIFIED="1311228507200" TEXT="struct tty_driver *tty_driver"/>
</node>
</node>
<node CREATED="1311228226039" ID="ID_1658212048" MODIFIED="1311228230996" TEXT="&#x521d;&#x59cb;&#x5316;"/>
<node CREATED="1311228312474" ID="ID_1096450418" MODIFIED="1311228319784" TEXT="&#x63a5;&#x53e3;">
<node CREATED="1311228152899" ID="ID_57386836" MODIFIED="1311229816266">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      uart_register_driver(struct uart_driver *drv)
    </p>
    <p>
      &#24213;&#23618;&#30340;&#20018;&#21475;&#39537;&#21160;&#24212;&#35813;&#21021;&#22987;&#21270;struct uart_driver&#21442;&#25968;&#30340;
    </p>
    <p>
      .owner
    </p>
    <p>
      .driver_name
    </p>
    <p>
      .dev_name
    </p>
    <p>
      .major
    </p>
    <p>
      .minor
    </p>
    <p>
      .cons
    </p>
    <p>
      &#37096;&#20998;, &#32780;state&#21644;tty_driver&#21017;&#24212;&#30001;tty&#23618;&#36827;&#34892;&#21021;&#22987;&#21270;
    </p>
  </body>
</html></richcontent>
<node CREATED="1311229575229" ID="ID_1995122835" MODIFIED="1311231557150">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      1, &#32473;drv-&gt;state&#20998;&#37197;&#19968;&#20010;struct uart_state&#32467;&#26500;
    </p>
    <p>
      &#27599;&#20010;&#29289;&#29702;&#19978;&#30340;&#20018;&#21475;&#23545;&#24212;&#19968;&#20010;struct uart_state&#32467;&#26500;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1311229636873" ID="ID_572101709" MODIFIED="1311229659716" TEXT="2, &#x7ed9;drv-&gt;tty_driver&#x5206;&#x914d;&#x4e00;&#x4e2a;struct tty_driver&#x7ed3;&#x6784;"/>
<node CREATED="1311229708517" ID="ID_1756601243" MODIFIED="1311229782503" TEXT="3, &#x521d;&#x59cb;&#x5316;&#x65b0;&#x5206;&#x914d;&#x7684;struct tty_driver&#x7ed3;&#x6784;,&#x5373;drv-&gt;tty_driver">
<node CREATED="1311229847229" ID="ID_249696633" MODIFIED="1311229872569" TEXT="drv-&gt;tty_driver-&gt;driver_state = drv"/>
<node CREATED="1311229847229" FOLDED="true" ID="ID_926675102" MODIFIED="1311232008883">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      drv-&gt;tty_driver-&gt;ops = uart_ops
    </p>
    <p>
      &#20854;&#20013;uart_ops&#26159;&#19968;&#20010;struct tty_operations&#32467;&#26500;
    </p>
  </body>
</html></richcontent>
<node CREATED="1311230892275" ID="ID_1795299390" MODIFIED="1311230894149" TEXT=".open&#x9;&#x9;= uart_open,"/>
<node CREATED="1311230919409" ID="ID_1140757299" MODIFIED="1311230920942" TEXT=".close&#x9;&#x9;= uart_close,"/>
<node CREATED="1311230929712" ID="ID_1219329219" MODIFIED="1311230931309" TEXT=".write&#x9;&#x9;= uart_write,"/>
<node CREATED="1311230940241" ID="ID_539017570" MODIFIED="1311230942809" TEXT=".put_char&#x9;= uart_put_char,"/>
<node CREATED="1311230947295" ID="ID_567550058" MODIFIED="1311230949023" TEXT=".flush_chars&#x9;= uart_flush_chars,"/>
<node CREATED="1311230955135" ID="ID_1511780833" MODIFIED="1311230956735" TEXT=".write_room&#x9;= uart_write_room,"/>
<node CREATED="1311230961902" ID="ID_127474787" MODIFIED="1311230963646" TEXT=".chars_in_buffer= uart_chars_in_buffer,"/>
<node CREATED="1311230971182" ID="ID_1416960106" MODIFIED="1311230973223" TEXT=".flush_buffer&#x9;= uart_flush_buffer,"/>
<node CREATED="1311230979917" ID="ID_507353038" MODIFIED="1311230981381" TEXT=".ioctl&#x9;&#x9;= uart_ioctl,"/>
<node CREATED="1311230986573" ID="ID_1449585055" MODIFIED="1311230988253" TEXT=".throttle&#x9;= uart_throttle,"/>
<node CREATED="1311230993436" ID="ID_103674681" MODIFIED="1311230995160" TEXT=".unthrottle&#x9;= uart_unthrottle,"/>
<node CREATED="1311230999820" ID="ID_812260918" MODIFIED="1311231001221" TEXT=".send_xchar&#x9;= uart_send_xchar,"/>
<node CREATED="1311231006620" ID="ID_950612527" MODIFIED="1311231007989" TEXT=".set_termios&#x9;= uart_set_termios,"/>
<node CREATED="1311231012955" ID="ID_449211687" MODIFIED="1311231014235" TEXT=".set_ldisc&#x9;= uart_set_ldisc,"/>
<node CREATED="1311231018619" ID="ID_1250781786" MODIFIED="1311231019995" TEXT=".stop&#x9;&#x9;= uart_stop,"/>
<node CREATED="1311231024283" ID="ID_1484418291" MODIFIED="1311231026095" TEXT=".start&#x9;&#x9;= uart_start,"/>
<node CREATED="1311231031914" ID="ID_471869722" MODIFIED="1311231033626" TEXT=".hangup&#x9;&#x9;= uart_hangup,"/>
<node CREATED="1311231038218" ID="ID_604354330" MODIFIED="1311231039658" TEXT=".break_ctl&#x9;= uart_break_ctl,"/>
<node CREATED="1311231044057" ID="ID_35628469" MODIFIED="1311231045858" TEXT=".wait_until_sent= uart_wait_until_sent,"/>
<node CREATED="1311231051833" ID="ID_1705904192" MODIFIED="1311231053281" TEXT=".proc_fops&#x9;= &amp;uart_proc_fops,"/>
<node CREATED="1311231058265" ID="ID_547683293" MODIFIED="1311231060277" TEXT=".tiocmget&#x9;= uart_tiocmget,"/>
<node CREATED="1311231065176" ID="ID_373372474" MODIFIED="1311231066743" TEXT=".tiocmset&#x9;= uart_tiocmset,"/>
<node CREATED="1311231072920" ID="ID_274670829" MODIFIED="1311231074672" TEXT=".poll_init&#x9;= uart_poll_init,"/>
<node CREATED="1311231080199" ID="ID_1998092781" MODIFIED="1311231082255" TEXT=".poll_get_char&#x9;= uart_poll_get_char,"/>
<node CREATED="1311231088167" ID="ID_192857881" MODIFIED="1311231089283" TEXT=".poll_put_char&#x9;= uart_poll_put_char,"/>
</node>
</node>
<node CREATED="1311231596826" FOLDED="true" ID="ID_1339768756" MODIFIED="1311232127492">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      4, &#21021;&#22987;&#21270;&#27599;&#20010;&#29289;&#29702;&#20018;&#21475;&#23545;&#24212;&#30340;struct uart_state&#32467;&#26500;
    </p>
  </body>
</html></richcontent>
<node CREATED="1311231814494" ID="ID_1956768062" MODIFIED="1311231819954" TEXT="1, state-&gt;close_delay     = 500"/>
<node CREATED="1311231830189" ID="ID_1798012031" MODIFIED="1311231833690" TEXT="2, state-&gt;closing_wait    = 30000"/>
<node CREATED="1311231852444" ID="ID_21601039" MODIFIED="1311231874913" TEXT="3, &#x521d;&#x59cb;&#x5316;&#x4e92;&#x65a5;&#x9501;state-&gt;mutex"/>
<node CREATED="1311231908473" ID="ID_258455687" MODIFIED="1311231925843" TEXT="4, &#x8c03;&#x7528;tty_port_init&#x521d;&#x59cb;&#x5316;state-&gt;info.port"/>
<node CREATED="1311231939528" ID="ID_336829788" MODIFIED="1311231949971" TEXT="5, &#x521d;&#x59cb;&#x5316;&#x7b49;&#x5f85;&#x961f;&#x5217;state-&gt;info.delta_msr_wait"/>
<node CREATED="1311231972758" ID="ID_1964674563" MODIFIED="1311231998520" TEXT="6, &#x521d;&#x59cb;&#x5316;&#x4efb;&#x52a1;state-&gt;info.tlet&#x5c06;&#x5176;&#x884c;&#x4e3a;&#x8bbe;&#x5b9a;&#x4e3a;uart_tasklet_action"/>
</node>
<node CREATED="1311232131564" ID="ID_1405700066" MODIFIED="1311232165100" TEXT="5, &#x8c03;&#x7528;tty_register_driver&#x6ce8;&#x518c;tty&#x9a71;&#x52a8;"/>
</node>
</node>
</node>
<node CREATED="1311228567036" FOLDED="true" ID="ID_750311379" MODIFIED="1317396631938" POSITION="right" TEXT="console">
<node CREATED="1311228586948" ID="ID_1626392428" MODIFIED="1311228594417" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1311228596788" FOLDED="true" ID="ID_564200610" MODIFIED="1311228723461" TEXT="struct console">
<node CREATED="1311228607459" ID="ID_1873402931" MODIFIED="1311228609507" TEXT="name"/>
<node CREATED="1311228615299" ID="ID_389778961" MODIFIED="1311228621331" TEXT="write&#x51fd;&#x6570;"/>
<node CREATED="1311228626899" ID="ID_857343336" MODIFIED="1311228630719" TEXT="read&#x51fd;&#x6570;"/>
<node CREATED="1311228653105" ID="ID_55990315" MODIFIED="1311228656152" TEXT="device&#x51fd;&#x6570;"/>
<node CREATED="1311228663392" ID="ID_1143548917" MODIFIED="1311228666835" TEXT="unblank&#x51fd;&#x6570;"/>
<node CREATED="1311228672112" ID="ID_1209680056" MODIFIED="1311228674860" TEXT="setup&#x51fd;&#x6570;"/>
<node CREATED="1311228681071" ID="ID_1568059648" MODIFIED="1311228684436" TEXT="early_setup&#x51fd;&#x6570;"/>
<node CREATED="1311228690390" ID="ID_717382197" MODIFIED="1311228691855" TEXT="flags"/>
<node CREATED="1311228696222" ID="ID_667334101" MODIFIED="1311228697742" TEXT="index"/>
<node CREATED="1311228701726" ID="ID_1006293773" MODIFIED="1311228702606" TEXT="cflag"/>
<node CREATED="1311228707950" ID="ID_1858220631" MODIFIED="1311228713945" TEXT="data&#x6307;&#x9488;"/>
<node CREATED="1311228721021" ID="ID_112392476" MODIFIED="1311228722185" TEXT="next"/>
</node>
</node>
</node>
<node CREATED="1311232410781" FOLDED="true" ID="ID_415668073" MODIFIED="1317396626637" POSITION="left" TEXT="tty driver">
<node CREATED="1311232445626" ID="ID_1564197528" MODIFIED="1311232452385" TEXT="&#x6570;&#x636e;&#x7ed3;&#x6784;">
<node CREATED="1311232578099" FOLDED="true" ID="ID_575978064" MODIFIED="1311232987852" TEXT="struct tty_driver">
<node CREATED="1311232587267" ID="ID_61520394" MODIFIED="1311232590083" TEXT="magic"/>
<node CREATED="1311232597090" ID="ID_1195668266" MODIFIED="1311232599042" TEXT="kref"/>
<node CREATED="1311232831221" ID="ID_863537499" MODIFIED="1311232834533" TEXT="struct cdev cdev"/>
<node CREATED="1311232841892" ID="ID_1592494365" MODIFIED="1311232843716" TEXT="owner"/>
<node CREATED="1311232849220" ID="ID_1175844442" MODIFIED="1311232850525" TEXT="driver_name"/>
<node CREATED="1311232854867" ID="ID_1644549312" MODIFIED="1311232856140" TEXT="name"/>
<node CREATED="1311232860387" ID="ID_958199620" MODIFIED="1311232861796" TEXT="name_base"/>
<node CREATED="1311232865763" ID="ID_970117493" MODIFIED="1311232867187" TEXT="major"/>
<node CREATED="1311232872178" ID="ID_23674922" MODIFIED="1311232873500" TEXT="minor_start"/>
<node CREATED="1311232878002" ID="ID_405695826" MODIFIED="1311232887217" TEXT="minor_num"/>
<node CREATED="1311232892257" ID="ID_1243837412" MODIFIED="1311232893562" TEXT="num"/>
<node CREATED="1311232898065" ID="ID_1703384868" MODIFIED="1311232899337" TEXT="type"/>
<node CREATED="1311232903297" ID="ID_1765070130" MODIFIED="1311232904617" TEXT="subtype"/>
<node CREATED="1311232912048" ID="ID_1417619031" MODIFIED="1311232913448" TEXT="struct ktermios init_termios"/>
<node CREATED="1311232917584" ID="ID_1603102955" MODIFIED="1311232918984" TEXT="flags"/>
<node CREATED="1311232925151" ID="ID_1565841819" MODIFIED="1311232926575" TEXT="proc_entry"/>
<node CREATED="1311232934223" ID="ID_331012300" MODIFIED="1311232935365" TEXT="struct tty_driver *other"/>
<node CREATED="1311232945871" ID="ID_1278041497" MODIFIED="1311232947363" TEXT="struct tty_struct **ttys"/>
<node CREATED="1311232954286" ID="ID_884929081" MODIFIED="1311232955750" TEXT="struct ktermios **termios"/>
<node CREATED="1311232961741" ID="ID_1674181856" MODIFIED="1311232963461" TEXT="struct ktermios **termios_locked"/>
<node CREATED="1311232967821" ID="ID_166980647" MODIFIED="1311232969237" TEXT="driver_state"/>
<node CREATED="1311232975340" ID="ID_907776246" MODIFIED="1311232976941" TEXT="struct tty_operations *ops"/>
<node CREATED="1311232984380" ID="ID_1038630948" MODIFIED="1311232985550" TEXT="struct list_head tty_drivers"/>
</node>
</node>
<node CREATED="1311232458666" ID="ID_304596215" MODIFIED="1311232463256" TEXT="&#x63a5;&#x53e3;">
<node CREATED="1311232478009" ID="ID_1560986163" MODIFIED="1311232480056" TEXT="tty_register_driver(struct tty_driver *driver)">
<node CREATED="1311233113813" ID="ID_1985759116" MODIFIED="1311233126960" TEXT="1, &#x5206;&#x914d;2&#x4e2a;&#x6307;&#x9488;&#x7a7a;&#x95f4;"/>
<node CREATED="1311233127588" ID="ID_85388347" MODIFIED="1311233149198" TEXT="2, &#x8c03;&#x7528;register_chrdev_region&#x6ce8;&#x518c;&#x5b57;&#x7b26;&#x8bbe;&#x5907;"/>
<node CREATED="1311233296091" ID="ID_435971077" MODIFIED="1311233331077" TEXT="3, &#x5c06;driver-&gt;ttys&#x548c;driver-&gt;termios&#x6307;&#x5411;&#x65b0;&#x5206;&#x914d;&#x7684;&#x6307;&#x9488;&#x7a7a;&#x95f4;"/>
<node CREATED="1311233348552" ID="ID_1592822333" MODIFIED="1311233379277" TEXT="4, &#x8c03;&#x7528;cdev_init&#x7528;tty_fops&#x521d;&#x59cb;&#x5316;driver-&gt;cdev"/>
<node CREATED="1311233391077" ID="ID_1261732061" MODIFIED="1311233409729" TEXT="5, &#x8c03;&#x7528;cdev_add&#x6dfb;&#x52a0;driver-&gt;cdev"/>
<node CREATED="1311233431012" ID="ID_1157404525" MODIFIED="1311233459543" TEXT="6, &#x5c06;driver-&gt;tty_drivers&#x6dfb;&#x52a0;&#x5230;tty_drivers&#x94fe;&#x8868;&#x4e2d;"/>
<node CREATED="1311233482768" ID="ID_1181323447" MODIFIED="1311233495932" TEXT="7, &#x8c03;&#x7528;tty_register_device&#x6dfb;&#x52a0;tty&#x8bbe;&#x5907;"/>
</node>
</node>
</node>
</node>
</map>
