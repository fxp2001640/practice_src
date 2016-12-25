<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1337137168037" ID="ID_91168690" MODIFIED="1337137177949" TEXT="mib map">
<node CREATED="1337137198741" FOLDED="true" ID="ID_1205454194" MODIFIED="1337328074676" POSITION="right" TEXT="method 1 : mib operations">
<node CREATED="1337137229928" ID="ID_672636337" MODIFIED="1337237760337" TEXT="add object">
<node CREATED="1337137273390" FOLDED="true" ID="ID_860259743" MODIFIED="1337238232580" TEXT="InternetGatewayDevice.LANDevice.1.WLANConfiguration">
<node CREATED="1337137715196" ID="ID_1582433171" MODIFIED="1337137771625" TEXT="nothing to do because we don&apos;t know if this object is a AP or station"/>
</node>
<node CREATED="1337140232427" FOLDED="true" ID="ID_977011099" MODIFIED="1337237933667" TEXT="Device.WiFi.AccessPoint">
<node CREATED="1337140264720" ID="ID_448389121" MODIFIED="1337141118074">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      map WLANConfiguration to AccessPoint
    </p>
    <p>
      
    </p>
    <p>
      -----------
    </p>
    <p>
      <font color="#e21515">this operation can't be done in service plugin, do it in mib core ? </font>
    </p>
    <p>
      <font color="#e21515">it's not good to do it in mib core.</font>
    </p>
  </body>
</html></richcontent>
<node CREATED="1337140304005" ID="ID_967996924" MODIFIED="1337140325849" TEXT="addobject InternetGatewayDevice.LANDevice.1.WLANConfiguration"/>
<node CREATED="1337139629959" ID="ID_26471596" MODIFIED="1337148116583">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      map WLANConfiguration x to AccessPoint y
    </p>
    <p>
      where x is the max index of WLANConfiguration
    </p>
    <p>
      and y is the max index of AccessPoint
    </p>
  </body>
</html></richcontent>
<node CREATED="1337139938882" ID="ID_1835222113" MODIFIED="1337149715813">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.TotalAssociations._O.VarP
    </p>
    <p>
      =
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.y.AssociatedDeviceNumberOfEntries._O.VarP
    </p>
    <p>
      
    </p>
    <p>
      ..........
    </p>
    <p>
      
    </p>
    <p>
      map all mib under InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
    <p>
      and Device.WiFi.AccessPoint.y
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1337137246299" ID="ID_1332881613" MODIFIED="1337137248167" TEXT="set">
<node CREATED="1337138462884" FOLDED="true" ID="ID_833577766" MODIFIED="1337237963122" TEXT="InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.DeviceOperationMode">
<node CREATED="1337138564899" ID="ID_1371189942" MODIFIED="1337151034480" TEXT="map WLANConfiguration to AccessPoint or EndPoint &#xa;when the value of this object is AP or Station&#xa;and gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.Enable._O.VarP-&gt;MappedToTr069 == 0">
<node CREATED="1337138695029" ID="ID_226925807" MODIFIED="1337138765760" TEXT="addobject Device.WiFi.AccessPoint"/>
<node CREATED="1337139629959" ID="ID_742505015" MODIFIED="1337237835412">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      map WLANConfiguration 1 to AccessPoint i where i is the max index of AccessPoint
    </p>
  </body>
</html></richcontent>
<node CREATED="1337139938882" ID="ID_608057296" MODIFIED="1337150726031">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.TotalAssociations._O.VarP
    </p>
    <p>
      =
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.{i}.AssociatedDeviceNumberOfEntries._O.VarP
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.TotalAssociations._O.Type-&gt;VarP
    </p>
    <p>
      =
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.{i}.AssociatedDeviceNumberOfEntries._O.Type-&gt;VarP
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoit.{i}.AssociatedDeviceNumberOfEntries._O.VarP-&gt;MappedToTr069 = 1
    </p>
    <p>
      ..........
    </p>
    <p>
      
    </p>
    <p>
      map all mib under InternetGatewayDevice.LANDevice.1.WLANConfiguration.1
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1337147909194" FOLDED="true" ID="ID_1444061991" MODIFIED="1337238146487">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Device.WiFi.AccessPoint.{i}.Enable
    </p>
    <p>
      
    </p>
    <p>
      ----------
    </p>
    <p>
      any mib under Device.WiFi.AccessPoint.{i}
    </p>
    <p>
      which have mapped tr069 mib
    </p>
  </body>
</html></richcontent>
<node CREATED="1337140264720" ID="ID_542824194" MODIFIED="1337152595810">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      map WLANConfiguration to AccessPoint
    </p>
    <p>
      if gwmibObjects.Device.WiFi.AccessPoit.y.Enable._O.VarP-&gt;MappedToTr069 == 0
    </p>
    <p>
      
    </p>
    <p>
      <font color="#dd1616">do it in propgate of wlan service plugin</font>
    </p>
  </body>
</html></richcontent>
<node CREATED="1337140304005" ID="ID_355175313" MODIFIED="1337140325849" TEXT="addobject InternetGatewayDevice.LANDevice.1.WLANConfiguration"/>
<node CREATED="1337159538288" ID="ID_939525251" MODIFIED="1337159560053" TEXT="set InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.DeviceOperationMode as AP"/>
<node CREATED="1337139629959" ID="ID_1797064910" MODIFIED="1337152065912">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      map WLANConfiguration x to AccessPoint y
    </p>
    <p>
      where x is the max index of WLANConfiguration
    </p>
    <p>
      and y is the index of AccessPoint under set operation
    </p>
  </body>
</html></richcontent>
<node CREATED="1337139938882" ID="ID_1316990320" MODIFIED="1337152084597">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.TotalAssociations._O.VarP
    </p>
    <p>
      =
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.y.AssociatedDeviceNumberOfEntries._O.VarP
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.TotalAssociations._O.Type-&gt;VarP
    </p>
    <p>
      = <font color="#d32020">no need</font>
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.y.AssociatedDeviceNumberOfEntries._O.Type-&gt;VarP
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoit.{i}.AssociatedDeviceNumberOfEntries._O.VarP-&gt;MappedToTr069 = 1
    </p>
    <p>
      ..........
    </p>
    <p>
      
    </p>
    <p>
      map all mib under InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
    <p>
      and Device.WiFi.AccessPoint.y
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1337137248779" ID="ID_1240855734" MODIFIED="1337137250359" TEXT="get">
<node CREATED="1337152426544" FOLDED="true" ID="ID_1103221119" MODIFIED="1337238212214" TEXT="InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}.Enable">
<node CREATED="1337137715196" ID="ID_717827840" MODIFIED="1337137771625" TEXT="nothing to do because we don&apos;t know if this object is a AP or station"/>
</node>
<node CREATED="1337152459845" FOLDED="true" ID="ID_1100562785" MODIFIED="1337238213117">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Device.WiFi.AccessPoint.{i}.Enable
    </p>
    <p>
      
    </p>
    <p>
      ---------------
    </p>
    <p>
      any mib under Device.WiFi.AccessPoint.{i}
    </p>
    <p>
      which have mapped tr069 mib
    </p>
  </body>
</html></richcontent>
<node CREATED="1337140264720" ID="ID_318412422" MODIFIED="1337152588305">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      map WLANConfiguration to AccessPoint
    </p>
    <p>
      if gwmibObjects.Device.WiFi.AccessPoit.y.Enable._O.VarP-&gt;MappedToTr069 == 0
    </p>
    <p>
      
    </p>
    <p>
      <font color="#dd1616">do it in status update of wlan service plugin</font>
    </p>
  </body>
</html></richcontent>
<node CREATED="1337140304005" ID="ID_430170918" MODIFIED="1337140325849" TEXT="addobject InternetGatewayDevice.LANDevice.1.WLANConfiguration"/>
<node CREATED="1337139629959" ID="ID_1319698808" MODIFIED="1337152065912">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      map WLANConfiguration x to AccessPoint y
    </p>
    <p>
      where x is the max index of WLANConfiguration
    </p>
    <p>
      and y is the index of AccessPoint under set operation
    </p>
  </body>
</html></richcontent>
<node CREATED="1337139938882" ID="ID_291873870" MODIFIED="1337152084597">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.TotalAssociations._O.VarP
    </p>
    <p>
      =
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.y.AssociatedDeviceNumberOfEntries._O.VarP
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.TotalAssociations._O.Type-&gt;VarP
    </p>
    <p>
      = <font color="#d32020">no need</font>
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.y.AssociatedDeviceNumberOfEntries._O.Type-&gt;VarP
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoit.{i}.AssociatedDeviceNumberOfEntries._O.VarP-&gt;MappedToTr069 = 1
    </p>
    <p>
      ..........
    </p>
    <p>
      
    </p>
    <p>
      map all mib under InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
    <p>
      and Device.WiFi.AccessPoint.y
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1337137251051" ID="ID_54751657" MODIFIED="1337137255960" TEXT="del object">
<node CREATED="1337156928340" FOLDED="true" ID="ID_1094950295" MODIFIED="1337238214137" TEXT="InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}">
<node CREATED="1337156977019" ID="ID_1629581331" MODIFIED="1337157648012">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}.Enable._O.VarP !=
    </p>
    <p>
      &#160; gwmibObjectVars.InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}.Enable._O
    </p>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}.Enable._O.VarP-&gt;MappedToTr069 = 0
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}.Enable._O.VarP
    </p>
    <p>
      =
    </p>
    <p>
      gwmibObjectVars.InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}.Enable._O
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337157656202" ID="ID_685598825" MODIFIED="1337158548504">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delobject Device.WiFi.AccessPoint.{i}
    </p>
    <p>
      traversal Device.WiFi.AccessPoint.{i} to see its VarP == VarP of WLANConfiguration.{i}
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1337158566713" FOLDED="true" ID="ID_131892036" MODIFIED="1337238215381" TEXT="Device.WiFi.AccessPoint.{i}">
<node CREATED="1337156977019" ID="ID_1024627593" MODIFIED="1337158675419">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if gwmibObjects.Device.WiFi.AccessPoint.{i}.Enable._O.VarP !=
    </p>
    <p>
      &#160;&#160;gwmibObjectVars.Device.WiFi.AccessPoint.{i}.Enable._O
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.{i}.Enable._O.VarP-&gt;MappedToTr069 = 0
    </p>
    <p>
      
    </p>
    <p>
      gwmibObjects.Device.WiFi.AccessPoint.{i}.Enable._O.VarP
    </p>
    <p>
      =
    </p>
    <p>
      gwmibObjectVars.Device.WiFi.AccessPoint.{i}.Enable._O
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337157656202" ID="ID_1265660114" MODIFIED="1337158728001">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delobject InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i}
    </p>
    <p>
      traversal InternetGatewayDevice.LANDevice.1.WLANConfiguration.{i} to see its VarP == VarP of AccessPoint.{i}
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1337150966165" ID="ID_1633147225" MODIFIED="1337150970022" TEXT="inform"/>
<node CREATED="1337148407376" ID="ID_695886281" MODIFIED="1337148411580" TEXT="store"/>
<node CREATED="1337148412928" ID="ID_1516014766" MODIFIED="1337148416765" TEXT="restore"/>
</node>
<node CREATED="1337160403529" FOLDED="true" ID="ID_639296770" MODIFIED="1337328076702" POSITION="left" TEXT="method 2 : mib operations">
<node CREATED="1337160477635" ID="ID_1003159200" MODIFIED="1337237415900" TEXT="mib map database">
<node CREATED="1337160599940" ID="ID_1259441301" MODIFIED="1337160656798">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      key = Device.WiFi.AccessPoint
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337161397011" ID="ID_1593138479" LINK="#ID_947658173" MODIFIED="1337161431529">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      key = Device.WiFi.AccessPoint.{y+1}
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337162084451" ID="ID_267643139" LINK="#ID_947658173" MODIFIED="1337162109095" TEXT="key = Device.WiFi.AccessPoint.{y+1}.Enable &#xa;val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.Enable"/>
</node>
<node CREATED="1337137229928" FOLDED="true" ID="ID_200443983" MODIFIED="1337235366560" TEXT="add object">
<node CREATED="1337137273390" FOLDED="true" ID="ID_1378746931" MODIFIED="1337234939900" TEXT="InternetGatewayDevice.LANDevice.1.WLANConfiguration">
<node CREATED="1337137715196" ID="ID_1201030301" MODIFIED="1337160706757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_1121493576" MODIFIED="1337160719121" TEXT="no hit, so nothing to do"/>
</node>
</node>
<node CREATED="1337140232427" ID="ID_736249263" MODIFIED="1337234951104" TEXT="Device.WiFi.AccessPoint">
<node CREATED="1337137715196" FOLDED="true" ID="ID_543069367" MODIFIED="1337235184327">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_792656877" MODIFIED="1337160793289">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      hit &quot;InternetGatewayDevice.LANDevice.1.WLANConfiguration&quot;, so command changed to:
    </p>
    <p>
      addobject InternetGatewayDevice.LANDevice.1.WLANConfiguration
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1337160845079" FOLDED="true" ID="ID_1529224191" MODIFIED="1337235363058">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      do callback after add object, parameters for callback :
    </p>
    <p>
      (command path before map, command path after map)
    </p>
  </body>
</html></richcontent>
<node CREATED="1337161214154" ID="ID_947658173" LINK="#ID_1593138479" MODIFIED="1337162080366">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      x = max index of InternetGatewayDevice.LANDevice.1.WLANConfiguration
    </p>
    <p>
      y = max index of Device.WiFi.AccessPoint
    </p>
    <p>
      add map entry into mib map database:
    </p>
    <p>
      
    </p>
    <p>
      key = Device.WiFi.AccessPoint.{y+1}
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
    <p>
      
    </p>
    <p>
      key = Device.WiFi.AccessPoint.{y+1}.Enable
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.Enable
    </p>
    <p>
      
    </p>
    <p>
      other mibs both exist in tr181 and tr098
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337161510019" ID="ID_1196348936" MODIFIED="1337165270362">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      set mib which is in tr098 but not in tr181, such as:
    </p>
    <p>
      InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.DeviceOperationMode
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1337137246299" FOLDED="true" ID="ID_1329629459" MODIFIED="1337236581859" TEXT="set">
<node CREATED="1337138462884" FOLDED="true" ID="ID_776189254" MODIFIED="1337235582889">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tr098 mibs, such as :
    </p>
    <p>
      InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.DeviceOperationMode
    </p>
    <p>
      InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.Enable
    </p>
  </body>
</html></richcontent>
<node CREATED="1337137715196" FOLDED="true" ID="ID_1741392029" MODIFIED="1337235504627">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_85859656" MODIFIED="1337160719121" TEXT="no hit, so nothing to do"/>
</node>
<node CREATED="1337164920063" FOLDED="true" ID="ID_25848025" MODIFIED="1337235580005" TEXT="propergate of InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.DeviceOperationMode">
<node CREATED="1337164991209" ID="ID_860069001" MODIFIED="1337165030594">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if DeviceOperationMode == AP
    </p>
    <p>
      x = max index of InternetGatewayDevice.LANDevice.1.WLANConfiguration
    </p>
    <p>
      y = max index of Device.WiFi.AccessPoint
    </p>
    <p>
      add map entry into mib map database:
    </p>
    <p>
      
    </p>
    <p>
      key = Device.WiFi.AccessPoint.{y+1}
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
    <p>
      
    </p>
    <p>
      key = Device.WiFi.AccessPoint.{y+1}.Enable
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.Enable
    </p>
    <p>
      
    </p>
    <p>
      other mibs both exist in tr181 and tr098
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337164991209" ID="ID_497359582" MODIFIED="1337165080489">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      if DeviceOperationMode == Station
    </p>
    <p>
      x = max index of InternetGatewayDevice.LANDevice.1.WLANConfiguration
    </p>
    <p>
      y = max index of Device.WiFi.EndPoint
    </p>
    <p>
      add map entry into mib map database:
    </p>
    <p>
      
    </p>
    <p>
      key = Device.WiFi.EndPoint.{y+1}
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
    <p>
      
    </p>
    <p>
      key = Device.WiFi.EndPoint.{y+1}.Enable
    </p>
    <p>
      val = InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.Enable
    </p>
    <p>
      
    </p>
    <p>
      other mibs both exist in tr181 and tr098
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1337147909194" FOLDED="true" ID="ID_658689973" MODIFIED="1337235637052">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tr181 mibs, such as:
    </p>
    <p>
      Device.WiFi.AccessPoint.{i}.Enable
    </p>
    <p>
      Device.WiFi.AccessPoint.{i}.RetryLimit
    </p>
  </body>
</html></richcontent>
<node CREATED="1337137715196" FOLDED="true" ID="ID_1803919246" MODIFIED="1337235628525">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_1286375567" MODIFIED="1337162252805">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      for tr181 mib which exist in tr098, i will hit, so command will changed to :
    </p>
    <p>
      set InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.Enable
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337160709588" ID="ID_706761174" MODIFIED="1337162333976">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      for tr181 mib which not exist in tr098, i will not hit, so nothing to do,
    </p>
    <p>
      just do normal operation
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1337137246299" FOLDED="true" ID="ID_646431590" MODIFIED="1337237101432" TEXT="get">
<node CREATED="1337138462884" FOLDED="true" ID="ID_1247723598" MODIFIED="1337236711329">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tr098 mibs, such as :
    </p>
    <p>
      InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.DeviceOperationMode
    </p>
    <p>
      InternetGatewayDevice.LANDevice.1.WLANConfiguration.1.Enable
    </p>
  </body>
</html></richcontent>
<node CREATED="1337137715196" ID="ID_1796575575" MODIFIED="1337160706757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_937496555" MODIFIED="1337160719121" TEXT="no hit, so nothing to do"/>
</node>
</node>
<node CREATED="1337147909194" FOLDED="true" ID="ID_389436974" MODIFIED="1337237099903">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      tr181 mibs, such as:
    </p>
    <p>
      Device.WiFi.AccessPoint.{i}.Enable
    </p>
    <p>
      Device.WiFi.AccessPoint.{i}.RetryLimit
    </p>
  </body>
</html></richcontent>
<node CREATED="1337137715196" ID="ID_375891297" MODIFIED="1337160706757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_856220375" MODIFIED="1337162539621">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      for tr181 mib which exist in tr098, i will hit, so command will changed to :
    </p>
    <p>
      get InternetGatewayDevice.LANDevice.1.WLANConfiguration.x.Enable
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337160709588" ID="ID_1937302804" MODIFIED="1337162333976">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      for tr181 mib which not exist in tr098, i will not hit, so nothing to do,
    </p>
    <p>
      just do normal operation
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1337137251051" FOLDED="true" ID="ID_1276804523" MODIFIED="1337235371625" TEXT="del object">
<node CREATED="1337156928340" ID="ID_521134809" MODIFIED="1337162614091" TEXT="InternetGatewayDevice.LANDevice.1.WLANConfiguration.x">
<node CREATED="1337137715196" ID="ID_1060219412" MODIFIED="1337160706757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_1475026996" MODIFIED="1337160719121" TEXT="no hit, so nothing to do"/>
</node>
<node CREATED="1337160845079" ID="ID_996547952" MODIFIED="1337162828157">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      do callback after del object, parameters for callback :
    </p>
    <p>
      (command path before map, command path after map)
    </p>
  </body>
</html></richcontent>
<node CREATED="1337162873041" ID="ID_1524917971" MODIFIED="1337163041635">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delete all entry whose key include &quot;command path before map&quot; in mib map database
    </p>
    <p>
      here command path before map is InternetGatewayDevice.LANDevice.1.WLANConfiguration.x,
    </p>
    <p>
      so there is no entry is deleted in this step
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337162873041" ID="ID_1999851864" MODIFIED="1337163142425">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delete all entry whose val include &quot;command path after map&quot; in mib map database
    </p>
    <p>
      here command path after map is InternetGatewayDevice.LANDevice.1.WLANConfiguration.x,
    </p>
    <p>
      so all entry about Device.WiFi.AccessPoint.{y+1} is deleted in this step
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
<node CREATED="1337158566713" ID="ID_919141580" MODIFIED="1337163164748">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      Device.WiFi.AccessPoint.{y+1}
    </p>
  </body>
</html></richcontent>
<node CREATED="1337137715196" ID="ID_194219012" MODIFIED="1337160706757">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      search mib map database
    </p>
  </body>
</html></richcontent>
<node CREATED="1337160709588" ID="ID_261491803" MODIFIED="1337163261577">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      hit &quot;InternetGatewayDevice.LANDevice.1.WLANConfiguration.x&quot;, so command changed to:
    </p>
    <p>
      delobject InternetGatewayDevice.LANDevice.1.WLANConfiguration.x
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1337160845079" ID="ID_528938816" MODIFIED="1337162828157">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      do callback after del object, parameters for callback :
    </p>
    <p>
      (command path before map, command path after map)
    </p>
  </body>
</html></richcontent>
<node CREATED="1337162873041" ID="ID_882932145" MODIFIED="1337163348654">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delete all entry whose key include &quot;command path before map&quot; in mib map database
    </p>
    <p>
      here command path before map is Device.WiFi.AccessPoint.{y+1}
    </p>
    <p>
      so all entry about Device.WiFi.AccessPoint.{y+1} is deleted in this step
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1337162873041" ID="ID_1277622206" MODIFIED="1337163142425">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      delete all entry whose val include &quot;command path after map&quot; in mib map database
    </p>
    <p>
      here command path after map is InternetGatewayDevice.LANDevice.1.WLANConfiguration.x,
    </p>
    <p>
      so all entry about Device.WiFi.AccessPoint.{y+1} is deleted in this step
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1337235285158" ID="ID_1150614174" MODIFIED="1337238601969" POSITION="right" TEXT="task">
<node CREATED="1337235290567" ID="ID_1425171753" MODIFIED="1337235384677">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      create 2 mib tree in masterd
    </p>
  </body>
</html></richcontent>
<node CREATED="1337235343999" ID="ID_1803551451" MODIFIED="1337235345867" TEXT="gwmibObjects.Device"/>
<node CREATED="1337235346911" ID="ID_6327405" MODIFIED="1337235366810" TEXT="gwmibObjects.InternetGatewayDevice"/>
</node>
<node CREATED="1337235397430" ID="ID_1298829382" MODIFIED="1337235406067" TEXT="mibsh get 2 tree"/>
<node CREATED="1337235406775" ID="ID_895250771" MODIFIED="1337235421349" TEXT="service plugin depend/claim"/>
<node CREATED="1337235423018" ID="ID_1480650181" MODIFIED="1337235424310" TEXT="map"/>
<node CREATED="1337237108945" ID="ID_681692931" MODIFIED="1337237121058" TEXT="get  xx.* can&apos;t be done"/>
<node CREATED="1337238635308" ID="ID_1480579738" MODIFIED="1337238648272" TEXT="do map in report stage"/>
<node CREATED="1337328091804" ID="ID_944559461" MODIFIED="1337328173893" TEXT="should function mibInit be called for tr181 mib at init stage ?">
<node CREATED="1337328296329" ID="ID_676790099" MODIFIED="1337328300452" TEXT="no need"/>
</node>
<node CREATED="1337333067435" FOLDED="true" ID="ID_1423429559" MODIFIED="1337850996664" TEXT="how to do with Object-&gt;Type-&gt;VarP-&gt;ServicePlugin between tr181 and tr069 when a mib exist in both mib tree ?&#xa;&#xa;how about when it is not in hide node ?">
<node CREATED="1337334200941" ID="ID_651434362" MODIFIED="1337566563106" TEXT="copy it from tr069 to tr181 because it will not changed"/>
</node>
<node CREATED="1337336772153" ID="ID_1688151645" MODIFIED="1337336797042" TEXT="how to do factory reset for tr181 in mibManagerObjectDefaultRestore ?"/>
<node CREATED="1337570578387" FOLDED="true" ID="ID_1087502326" MODIFIED="1337851057624" TEXT="how to do store and restore for tr181 mibs ?">
<node CREATED="1337570619706" ID="ID_1482990933" MODIFIED="1337570667971" TEXT="no need, tr181 mibs are maped to tr069, and are not stored and restored"/>
<node CREATED="1337656952025" ID="ID_605897527" MODIFIED="1337657000605" TEXT="tr181 mibs works ok after store and restore"/>
</node>
<node CREATED="1337677441538" FOLDED="true" ID="ID_505248411" MODIFIED="1337851061348" TEXT="how to do with addobject/delobject">
<node CREATED="1337677531502" ID="ID_695642950" MODIFIED="1337678105343" TEXT="addobject InternetGatewayDevice.LANDevice.a[0].WLANConfiguration&#xa;condition : no hiden, no map">
<node CREATED="1337677851576" ID="ID_75893754" MODIFIED="1337677859028" TEXT="if DeviceOperationMode is ap">
<node CREATED="1337677912500" ID="ID_476156621" MODIFIED="1337679784036" TEXT="find Device.WiFi.AccessPoint.a[x] which is (no hiden and no map) or hiden"/>
<node CREATED="1337678077986" ID="ID_1338075440" MODIFIED="1337678126652" TEXT="Device.WiFi.AccessPoint.a[x] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
<node CREATED="1337678077986" ID="ID_1862263697" MODIFIED="1337678193603" TEXT="Device.WiFi.AccessPoint.a[x].allfield =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y].allfield"/>
<node CREATED="1337678208188" ID="ID_1184984928" MODIFIED="1337678245794" TEXT="record map :&#xa;Device.WiFi.AccessPoint.a[x] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
</node>
<node CREATED="1337677851576" ID="ID_1207586746" MODIFIED="1337678312079" TEXT="if DeviceOperationMode is sta">
<node CREATED="1337677912500" ID="ID_222376011" MODIFIED="1337679801723" TEXT="find Device.WiFi.EndPoint.a[x] which is (no hiden and no map) or hiden"/>
<node CREATED="1337678077986" ID="ID_4822406" MODIFIED="1337678342386" TEXT="Device.WiFi.EndPoint.a[x] =&gt; &#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
<node CREATED="1337678077986" ID="ID_1232731814" MODIFIED="1337678360623" TEXT="Device.WiFi.EndPoint.a[x].allfield =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y].allfield"/>
<node CREATED="1337678208188" ID="ID_1399050919" MODIFIED="1337678385513" TEXT="record map :&#xa;Device.WiFi.EndPoint.a[x] =&gt; &#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
</node>
</node>
<node CREATED="1337677617580" ID="ID_722232174" MODIFIED="1337679310941" TEXT="addobject Device.WiFi.AccessPoint&#xa;condition : no hiden, no map">
<node CREATED="1337679595093" ID="ID_1017782125" MODIFIED="1337679601288" TEXT="start a new job"/>
<node CREATED="1337679358172" ID="ID_565410858" MODIFIED="1337679625795" TEXT="addobject InternetGatewayDevice.LANDevice.a[0].WLANConfiguration in this job"/>
<node CREATED="1337679633535" ID="ID_192065842" MODIFIED="1337679655789" TEXT="set DeviceOperationMode to ap in this job"/>
</node>
<node CREATED="1337677666461" ID="ID_752706519" MODIFIED="1337679873312" TEXT="addobject Device.WiFi.EndPoint&#xa;condition : no hiden, no map">
<node CREATED="1337679595093" ID="ID_788311817" MODIFIED="1337679601288" TEXT="start a new job"/>
<node CREATED="1337679358172" ID="ID_575681568" MODIFIED="1337679625795" TEXT="addobject InternetGatewayDevice.LANDevice.a[0].WLANConfiguration in this job"/>
<node CREATED="1337679633535" ID="ID_910707157" MODIFIED="1337679857126" TEXT="set DeviceOperationMode to sta in this job"/>
</node>
<node CREATED="1337677531502" ID="ID_1870094191" MODIFIED="1337680393232" TEXT="delobject InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x]&#xa;condition : hiden, mapped">
<node CREATED="1337677851576" ID="ID_1284840240" MODIFIED="1337677859028" TEXT="if DeviceOperationMode is ap">
<node CREATED="1337677912500" ID="ID_764815938" MODIFIED="1337680518879" TEXT="find Device.WiFi.AccessPoint.a[y] which is mapped to&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x]"/>
<node CREATED="1337678077986" ID="ID_1187404746" MODIFIED="1337680571800" TEXT="unmap Device.WiFi.AccessPoint.a[y] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x]"/>
<node CREATED="1337678077986" ID="ID_1284274704" MODIFIED="1337680591550" TEXT="unmap Device.WiFi.AccessPoint.a[y].allfield =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x].allfield"/>
<node CREATED="1337678208188" ID="ID_380306906" MODIFIED="1337680616902" TEXT="delete map :&#xa;Device.WiFi.AccessPoint.a[y] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x]"/>
</node>
<node CREATED="1337677851576" ID="ID_1765429084" MODIFIED="1337678312079" TEXT="if DeviceOperationMode is sta">
<node CREATED="1337677912500" ID="ID_1006927309" MODIFIED="1337680653690" TEXT="find Device.WiFi.EndPoint.a[y] which is mapped to&#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x]"/>
<node CREATED="1337678077986" ID="ID_1331790637" MODIFIED="1337680676975" TEXT="unmap Device.WiFi.EndPoint.a[y] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x]"/>
<node CREATED="1337678077986" ID="ID_1514873291" MODIFIED="1337680709202" TEXT="unmap Device.WiFi.EndPoint.a[y].allfield =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x].allfield"/>
<node CREATED="1337678208188" ID="ID_718557088" MODIFIED="1337680733876" TEXT="delete map :&#xa;Device.WiFi.EndPoint.a[y] =&gt; &#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[x]"/>
</node>
</node>
<node CREATED="1337677617580" ID="ID_35498686" MODIFIED="1337681324593" TEXT="delobject Device.WiFi.AccessPoint.a[x]&#xa;condition : hiden, mapped">
<node CREATED="1337677912500" ID="ID_785463385" MODIFIED="1337681366430" TEXT="find InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y] which is mapped to&#xa;Device.WiFi.AccessPoint.a[x] "/>
<node CREATED="1337678077986" ID="ID_38431339" MODIFIED="1337681480937" TEXT="unmap Device.WiFi.AccessPoint.a[x] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
<node CREATED="1337678077986" ID="ID_572874278" MODIFIED="1337681495909" TEXT="unmap Device.WiFi.AccessPoint.a[x].allfield =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y].allfield"/>
<node CREATED="1337678208188" ID="ID_646188192" MODIFIED="1337681521490" TEXT="delete map :&#xa;Device.WiFi.AccessPoint.a[x] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
</node>
<node CREATED="1337677666461" ID="ID_1029613435" MODIFIED="1337681624895" TEXT="delobject Device.WiFi.EndPoint.a[x]&#xa;condition : hiden, mapped">
<node CREATED="1337677912500" ID="ID_577596963" MODIFIED="1337681601864" TEXT="find InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y] which is mapped to&#xa;Device.WiFi.EndPoint.a[x] "/>
<node CREATED="1337678077986" ID="ID_956389440" MODIFIED="1337681638307" TEXT="unmap Device.WiFi.EndPoint.a[x] =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
<node CREATED="1337678077986" ID="ID_570730670" MODIFIED="1337681647033" TEXT="unmap Device.WiFi.EndPoint.a[x].allfield =&gt; InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y].allfield"/>
<node CREATED="1337678208188" ID="ID_1124725270" MODIFIED="1337681658756" TEXT="delete map :&#xa;Device.WiFi.EndPoint.a[x] =&gt; &#xa;InternetGatewayDevice.LANDevice.a[0].WLANConfiguration.a[y]"/>
</node>
</node>
<node CREATED="1337749862433" ID="ID_253613808" MODIFIED="1337749869547" TEXT="tr098 inform"/>
<node CREATED="1337759900697" ID="ID_1836072575" MODIFIED="1337759936767" TEXT="how to do when two mapped mibs have different data type?"/>
<node CREATED="1337846426797" FOLDED="true" ID="ID_693990728" MODIFIED="1337932231941" TEXT="how to do when DeviceOperationMode changed ?">
<node CREATED="1337932212678" ID="ID_300354783" MODIFIED="1337932228571" TEXT="monitor it in tr181 report"/>
</node>
<node CREATED="1337847855973" ID="ID_1024153079" MODIFIED="1337847862974" TEXT="how to do reboot"/>
<node CREATED="1337847863947" ID="ID_1696470501" MODIFIED="1337847871058" TEXT="how to do watch?"/>
<node CREATED="1337847895787" ID="ID_296086765" MODIFIED="1337847902063" TEXT="how to do event ?"/>
<node CREATED="1337851615035" FOLDED="true" ID="ID_441667421" MODIFIED="1337932239536" TEXT="why Device.WiFi.Radio.{i}.RegulatoryDomain was hiden after reset?">
<node CREATED="1337932167622" ID="ID_924293008" MODIFIED="1337932193606" TEXT="Device.WiFi.Radio have been set to autohiden"/>
</node>
<node CREATED="1337932245557" ID="ID_625470590" MODIFIED="1337932291741" TEXT="all mapped mibs in tr181 and tr098 must have the same data type and same attributes"/>
<node CREATED="1337932298190" ID="ID_1554927314" MODIFIED="1337932386970" TEXT="nothing can be done before tr181 first fix map"/>
</node>
<node CREATED="1337333937867" ID="ID_683098872" MODIFIED="1337333940490" POSITION="left" TEXT="idea">
<node CREATED="1337333941654" ID="ID_1102794805" MODIFIED="1337333977386" TEXT="masterd run on pc, but its command run on embed system"/>
</node>
</node>
</map>
