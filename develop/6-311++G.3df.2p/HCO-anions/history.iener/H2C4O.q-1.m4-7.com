%NProcShared=8
#p ccsd(t,maxcyc=200)/6-311++G(3df,2p) scf(QC)

 ccsd(t) iener

-1 4
    C   -0.938490    0.672576   -0.171013
    C    1.075553   -0.143158    0.288425
    O    0.318946    1.026428    0.235331
    C    0.146843   -1.178035    0.209527
    C   -1.093415   -0.707065   -0.194839
    H   -1.583173    1.470373   -0.510969
    H   -1.979423   -1.237933   -0.505348

