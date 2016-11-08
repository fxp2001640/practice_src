1, DesignatedPort定期发送的RSTP BPDU中flags.Proposal始终置位, 为什么?
答:理论上, DesignatedPort收到对端的agreement后会清除此标帜, 这是在recordAgreement中完成的, 
   但是如果配置参数operPointToPointMAC没有设置的话, 则不会清除, 因为在一个多点LAN上, 一个点同意了不代表其他点也同意了

2, RootPort发送的多个Topology Change RSTP BPDU中Agreement都置位了, 为什么Agreement一直保持置位?
答:同步一般只进行一次, 所以agree和agreed会在拓扑变化前一直保持当前值
