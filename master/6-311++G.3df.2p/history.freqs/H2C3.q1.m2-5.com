%NProcShared=2
#p b3lyp/6-311++G(3df,2p) freq

 b3lyp opt

1 2
C -0.000   0.866   0.000
C -0.696  -0.286   0.000
C  0.696  -0.286   0.000
H  1.600  -0.886   0.000
H -1.600  -0.886   0.000

