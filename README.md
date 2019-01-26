## M3C-store

M3C-store is a ...

## Authors (alphabetical order)
* Nestor F. Aguirre ( nfaguirrec@gmail.com )
* Manuel Alcamí ( xx@xxx )
* Sergio Díaz-Tendero ( xx@xxx )
* Ewa Erdmann ( xx@xxx )
* Paul-Antoine Hervieux ( xx@xxx )
* Marta Łabuda ( xx@xxx )
* Fernando Martín ( xx@xx )
* Juan P. Sánchez ( xx@xxx )

## Citing

The list below is a bibliography which specifies the citations appropriate for the M3C-store dataset depending
of which molecules are used. M3C-store should be used in publications where a full author list will be printed.

<!-- [![DOI](https://zenodo.org/badge/33068598.svg)](https://zenodo.org/badge/latestdoi/33068598)-->

M3C-store dataset. N. F. Aguirre, M. Alcamí, S. Díaz-Tendero, E. Erdmann, M. Łabuda, F. Martín, and J. P. Sánchez__
 2019. URL: [https://github.com/nfaguirrec/M3C-store](https://github.com/nfaguirrec/M3C-store)
 
Other entries in the bibliography are some of the citations for specific molecular structures:

1. **C<sub>n</sub>H<sub>m</sub>O (n=1-4, m=0-4)**.__
   Furan Fragmentation in the Gas Phase: New Insights from Statistical and Molecular Dynamics Calculations.  
   E. Erdmann, M. Łabuda, N. F. Aguirre, S. Díaz-Tendero, and M. Alcamí  
   [*J. Phys. Chem. A* **122**, 4153-4166 (2018)](http://pubs.acs.org/doi/10.1021/acs.jpca.8b00881)
<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jpcafh/2018/jpcafh.2018.122.issue-16/acs.jpca.8b00881/20180423/images/medium/jp-2018-00881v_0014.gif">
</p>

2. C<sub>n</sub></sub> (n=1-9), C<sub>n</sub></sub><sup>+</sup> (n=1-5), C<sub>n</sub>H<sub>m</sub><sup>q+</sup> (n=1-2, m=1-2, q=0,1)
   M3C: A Computational Approach To Describe Statistical Fragmentation of Excited Molecules and Clusters.  
   N. F. Aguirre, S. Díaz-Tendero, P.-A. Hervieux, M. Alcamí, and F. Martín.  
   [*J. Chem. Theory Comput.* **13**, 992-1009 (2017)](http://pubs.acs.org/doi/pdf/10.1021/acs.jctc.6b00984)
<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jctcce/2017/jctcce.2017.13.issue-3/acs.jctc.6b00984/20170308/images/medium/ct-2016-009843_0008.gif">
</p>

3. C<sub>n</sub>H<sub>m</sub><sup>q+</sup> (n=1-5, m=1-4, q=0-3)
   Structure, Ionization, and Fragmentation of Neutral and Positively Charged Hydrogenated Carbon Clusters:  
   C<sub>n</sub>H<sub>m</sub><sup>q+</sup> (n=1-5, m=1-4, q=0-3).  
   J. P. Sánchez, N. F. Aguirre, S. Díaz-Tendero, F. Martín, and M. Alcamí.  
   [*J. Phys. Chem. A* **120**, 588-605 (2016)](http://pubs.acs.org/doi/abs/10.1021/acs.jpca.5b10143)
<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jpcafh/2016/jpcafh.2016.120.issue-4/acs.jpca.5b10143/20160129/images/medium/jp-2015-10143w_0015.gif">
</p>

### Installing
Download the .zip file from this page and extract the files,
```
$ unzip M3C-store-master.zip
Archive:  M3C-store-master.zip
012efb01d2b1ffb8b94e856e4cc720d7d5946639
   creating: M3C-store-master/
 extracting: M3C-store-master/README  
   creating: M3C-store-master/develop/
   creating: M3C-store-master/develop/6-311++G.3df.2p/
   creating: M3C-store-master/develop/6-311++G.3df.2p/C4N/
...

$ mv M3C-store-master/ M3C-store
```
or clone the repository using git
```
$ git clone https://github.com/nfaguirrec/M3C-store.git
```
The following should be the content of the M3C-store directory if previous steps were successful:
```
$ cd M3C-store
$ ls
develop  master  README.md  utils
```

### Using the database with M3C

Finally, to use the database with [M3C](https://github.com/nfaguirrec/M3C) follow the next steps:

1. Choose the basis set and level of theory:

```
$ cd master/6-311++G.3df.2p/ccsdt
```

2. Choose the parent molecule (e.g. H2C2) and its lowest energy state (in this example H2C2.q0.m1-1.rxyz):

```
$ grep Energy H2C2.q0.m* | sort -k3 -n
H2C2.q0.m1-1.rxyz:Energy =   -77.1757558750
H2C2.q0.m1-3.rxyz:Energy =   -77.1034510280
H2C2.q0.m3-4.rxyz:Energy =   -77.0331091650
H2C2.q0.m3-3.rxyz:Energy =   -77.0298114970
H2C2.q0.m3-2.rxyz:Energy =   -77.0098651160
```

3. Use the command M3C.store from the [M3C project](https://github.com/nfaguirrec/M3C) to create the
FRAGMENTS_DATABASE block  necessary for the M3C input file:

```
$ M3C.store makeDB H2C2.q0.m1-1.rxyz
BEGIN FRAGMENTS_DATABASE

   store = /home/nestor/Develop/M3C-store/master/6-311++G.3df.2p/ccsdt
   reference = H2C2(s1)
   
   #------------------------------------------------------------------------------
   #    Label    Z  M WL  SYM             geomFile          Eelec          maxVib
   #------------------------------------------------------------------------------
        H(d1)    0  2  1    1       H.q0.m2-1.rxyz     -13.667114                  #        R3(2-S)
        C(s1)    0  1  5    1       C.q0.m1-1.rxyz   -1026.574168                  #        R3(1-D)
        C(t1)    0  3  3    1       C.q0.m3-1.rxyz   -1028.024016                  #        R3(3-P)
       H2(s1)    0  1  1    2      H2.q0.m1-1.rxyz     -31.388074     H(d1)+H(d1)  #  4.05  D*H(1-SGG)
       HC(d1)    0  2  2    1      HC.q0.m2-1.rxyz   -1044.975479     H(d1)+C(t1)  #  3.28  C*V(2-PI)
       HC(q1)    0  4  1    1      HC.q0.m4-1.rxyz   -1044.307456     H(d1)+C(t1)  #  2.62  C*V(4-SG)
       C2(s1)    0  1  1    2      C2.q0.m1-1.rxyz   -2062.151541     C(t1)+C(t1)  #  6.10  D*H(1-SGG)
       C2(t1)    0  3  2    2      C2.q0.m3-1.rxyz   -2062.058719     C(t1)+C(t1)  #  6.01  D*H(3-PIU)
      H2C(s2)    0  1  1    2     H2C.q0.m1-2.rxyz   -1062.850491    H2(s1)+C(t1)  #  3.44  C2V(1-A1)
      H2C(t2)    0  3  1    2     H2C.q0.m3-2.rxyz   -1063.289273    H2(s1)+C(t1)  #  3.88  C2V(3-B1)
      H2C(t3)    0  3  1    2     H2C.q0.m3-3.rxyz   -1060.078559    H2(s1)+C(t1)  #  0.67  C2V(3-A2)
      HC2(d1)    0  2  1    1     HC2.q0.m2-1.rxyz   -2080.744453    H(d1)+C2(s1)  #  4.93  C*V(2-SG)
      HC2(d3)    0  2  1    2     HC2.q0.m2-3.rxyz   -2079.791997    H(d1)+C2(s1)  #  3.97  C2V(2-A1)
      HC2(q2)    0  4  1    1     HC2.q0.m4-2.rxyz   -2076.964678    H(d1)+C2(s1)  #  1.15  CS(4-A")
     H2C2(s1)    0  1  1    2    H2C2.q0.m1-1.rxyz   -2100.060065   H(d1)+HC2(d1)  #  5.65  D*H(1-SGG)
     H2C2(s3)    0  1  1    2    H2C2.q0.m1-3.rxyz   -2098.092549   H2(s1)+C2(s1)  #  4.55  C2V(1-A1)
     H2C2(t2)    0  3  1    2    H2C2.q0.m3-2.rxyz   -2095.545946   H(d1)+HC2(d3)  #  2.09  C2H(3-AU)
     H2C2(t3)    0  3  1    2    H2C2.q0.m3-3.rxyz   -2096.088715   C(t1)+H2C(s2)  #  5.21  C2V(3-B2)
     H2C2(t4)    0  3  1    2    H2C2.q0.m3-4.rxyz   -2096.178449   H2(s1)+C2(s1)  #  2.64  C2V(3-B2)
   #------------------------------------------------------------------------------
END FRAGMENTS_DATABASE
```

