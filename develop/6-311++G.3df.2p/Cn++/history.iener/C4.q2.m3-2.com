%NProcShared=5
#p ccsd(t,maxcyc=200)/6-311+G(3df) scf(MaxCyc=300) guess(Huckel)

 ccsd(t) iener

2 3
    C   -0.024144    0.000344   -0.058879
    C   -0.454747    0.001569    1.136699
    C    0.414287   -0.000904   -1.274845
    C   -0.950419    0.002985    2.496993

