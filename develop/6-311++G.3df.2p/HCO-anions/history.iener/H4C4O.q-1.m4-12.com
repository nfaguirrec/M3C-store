%NProcShared=4
#p ccsd(t,maxcyc=200)/6-311++G(3df,2p)

 ccsd(t) iener

-1 4
    C   -0.919073   -0.672224   -0.000000
    C    1.216629    0.149921   -0.000000
    O    0.394543   -1.055686    0.000000
    C    0.191901    1.222879   -0.000000
    C   -1.078024    0.701633    0.000000
    H   -1.645983   -1.467721   -0.000000
    H    1.863803    0.129176    0.887114
    H    1.863803    0.129176   -0.887114
    H   -2.024772    1.220128    0.000000
