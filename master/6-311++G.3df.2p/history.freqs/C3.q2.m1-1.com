%NProcShared=1
#p b3lyp/6-311++G(3df,2p) freq

 b3lyp opt

2 1
 C
 C,1,cc2
 C,2,cc3,1,ccc3

 cc2=1.30087364
 cc3=1.30087364
 ccc3=179.9978496
