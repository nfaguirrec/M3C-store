## M3C-store

The latest release of M3C-store (version 0.9.1, released 2019-01-26) contains 394 molecules including carbon clusters, hydrogenated and nitrogenated carbon clusters, and fragments from the furan molecule fragmentation. Its principal aim is to include the fragments necessary to describe the fragmentation of a given molecule. Each molecule is available at two levels of theory: B3LYP and CCSD(T), and two basis sets: 6-311++G(d,p) and 6-311++G(3df,2p). The files format is an extension of the popular .xyz format. Each molecule's file contains the energy, geometry, vibrational frequencies, symmetry and the symmetry of the electronic state. This database has been specially adapted as the starting point of an M3C calculation.

## Installing
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

## File format .rxyz

All files are stored in the .rxyz format, which is the standard format used by M3C.
The name of the files follow the format &lt;stoichiometry&gt;.q&lt;charge&gt;.m&lt;multiplicity&gt;-&lt;id&gt;.rxyz
e.g. H2C2.q0.m1-1.rxyz. This format basically the same than .xyz files
(line 1: number of atoms n, line 2: comment, lines from 3 up to 3 + n: symbols and atomic
positions in Å), except that in the second line the value of the energy is given in atomic
units (it is not only a simple comment!). Additionally, calculated vibrational frequencies
in cm<sup>-1</sup>, symmetry, and electronic state are also included. The following block
shows the information of the lowest energy state of the acetylene molecule 
 (H<sub>2</sub>C<sub>2</sub>) in the .rxyz format:

```
4
Energy =   -77.1757558750
C  0.316435238  0.578031412 -0.011149452
C -0.455252451 -0.279767271  0.304468434
H  1.001639096  1.339720463 -0.291420995
H -1.140462527 -1.041456161  0.584725214

FREQUENCIES 7
659.4392
659.4392
765.5414
765.5414
2066.1167
3408.1288
3508.7083

SYMMETRY D*H
ELECTRONIC_STATE 1-SGG
```

## Using the database with M3C

To use the database with [M3C](https://github.com/nfaguirrec/M3C) follow the next steps:

1. Choose the basis set and level of theory:

```
$ cd master/6-311++G.3df.2p/ccsdt
```

2. Choose the parent molecule (e.g. acetylene H<sub>2</sub>C<sub>2</sub>) and its lowest energy state (in this example H2C2.q0.m1-1.rxyz):

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

   store = /myurl/M3C-store/master/6-311++G.3df.2p/ccsdt
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

This block consists in a table that contains as many rows
as number of molecules or fragments are going to be considered in the process. Each
row in the table contains the following information:

- **Label**. Represents a unique identifier for the molecule. The format is <group
label>(<specifier label>). The program will sort the molecules in several
groups where each of those groups is identified by a group label. Additionally
inside each group, each molecule is identified by a specifier label. This is
specially advantageous to study observables which are to be discriminated by
groups of molecules. For example: In a mass spectrum, a particular line represents
the molecule A. However, this line is not a single signal but a superposition of
signals produced by isomers or excited states of the same molecule A. In this
sense, it is advantageous to label these isomers or excited states as A(s1), A(s2),
A(tc), and so on, where the specifier label is arbitrary but useful for the user.

- **Charge (Z)** Assigns the charge of the molecule.

- **Multiplicity (M)** Assigns the multiplicity of the electronic state of the molecule.

- **Multiplicity (WL)** Assigns the electronic state degeneracy due to the orbital angular momentum.

- **Rotational symmetry number (SYM)** Assigns the rotational symmetry number of the
molecule.

- **Geometry file name** in .rxyz format

- **Electronic energy** given in eV

- **Maximum vibrational energy allowed**. This value is determined by the energy of
the lowest transition state available, whereby the molecule can be breaking up,
specifically by its energy barrier. This value may be written directly in the table
(given in eV).
One simple way to estimate this value is to suppose that the reverse activation
barrier is very small, then the maximum vibrational energy is equivalent to the
difference between the electronic energy of the molecule and the electronic energy
of the fragmentation products. In this case, you can write directly in the table,
the chosen fragmentation channel. For example: A(s1)+B(st).

M3C treats all the information after the # on a line as a comment. In this example,
after # it is printed the actual value of the maximum vibrational energy in eV,
and the symmetry of the molecule with the corresponding electronic state.

## Contributors (alphabetical order)
* Nestor F. Aguirre ( nfaguirrec@gmail.com )
* Manuel Alcamí ( manuel.alcami@uam.es )
* Karine Béroff ( karine.beroff@u-psud.fr )
* Marin Chabot ( chabot@ipno.in2p3.fr )
* Sergio Díaz-Tendero ( sergio.diaztendero@uam.es )
* Ewa Erdmann ( ewa.erdmann@pg.edu.pl )
* Paul-Antoine Hervieux ( paul-antoine.hervieux@ipcms.unistra.fr )
* Tijani IdBarkach ( idbarkach@ipno.in2p3.fr )
* Marta Łabuda ( marta.labuda@pg.edu.pl )
* Fernando Martín ( fernando.martin@uam.es )
* Juan P. Sánchez ( juanp.sanchez@uam.es )

## Citing

The list below is a bibliography which specifies the citations appropriate for the M3C-store dataset depending
of which molecules are used. M3C-store should be used in publications where a full author list will be printed.

[![DOI](https://zenodo.org/badge/80756117.svg)](https://zenodo.org/badge/latestdoi/80756117)

M3C-store dataset. N. F. Aguirre, M. Alcamí, K. Béroff, M. Chabot, S. Díaz-Tendero, E. Erdmann, P.-A. Hervieux, T. IdBarkach, M. Łabuda, F. Martín, and J. P. Sánchez. 2019.
URL: [https://github.com/nfaguirrec/M3C-store](https://github.com/nfaguirrec/M3C-store)
 
Other entries in the bibliography are some of the citations for specific molecular structures:

1. **C<sub>n</sub> (n=0-5), C<sub>n</sub>H<sub>m</sub> (n=0-4, m=1-2), C<sub>n</sub>N (n=3-4)**<br/>
   Fully versus Constrained Statistical Fragmentation of Carbon Clusters and their Heteronuclear Derivatives.<br/>
   N. F. Aguirre, S. Díaz-Tendero, T. IdBarkach, M. Chabot, K. Béroff, M. Alcamí, and F. Martín.<br/>
   [*J. Chem. Phys.* **150**, 144301 (2019)](https://aip.scitation.org/doi/10.1063/1.5083864)
<p align="center">
  <img src="https://lh3.googleusercontent.com/AxYKPPOPVJ4kcPTEgjPPr0Us--M1qzP1goUVk-xwXSINj6Jf8xXnGhBNUzk2ywgQSQ9HzgsPyoGAlB-J-ghXnBxEZ3pji-iIaT6tnGN3_wAXr2YfxW0CUdKt_Y2ZSa7F15TV9QkFwU9oK8oXezLp4oymqmRtP2ZfEQNl21uoousJRP5dwhWsQP5cG24duoDKQd-rjhx-JRctuTHwvvnu1-24HPyKIqge2zwzaJcKk617_NROxvQGbj5gXDHYbzPp97AmmG7RGDLKFWbgNqe7_vTjQ40VyafoAQZ2yQIuJVzoxBxBqqczIpnT8s98Yrc77vWlvMGlTPTONJYedUabZsLVV9MXOOecsdUYF32aOCcdcxmorvnNfxsN0ml9vBas2WquK5KsNmxjOGGPxm7b-WxW6od1TP1TZjP_w-Orh18FnB9OeMFB4LB_wkYDtGyJJDoXrW0DxLKm_jKKSxzDxBcSsku-crBhqOaxdJXiuSma0pTK6udAQvwLgulqop7li-Bvljr7ql11FBqw7OehppL06kNsoarley0VUgzVyYWWXkMeMVmT9qVWr4kXBFajNCBSPWRTNZxA8wPgFtVZcJEqgXo-clDHricuOjOzYoDh4qbCk3PM6xIgGqzZWmlYuh1hrMJ2GiK9kaCPjktGR3I7g6YsS1o=w551-h294-no">
</p>

2. **C<sub>n</sub>H<sub>m</sub>O (n=1-4, m=0-4)**<br/>
   Furan Fragmentation in the Gas Phase: New Insights from Statistical and Molecular Dynamics Calculations.<br/>
   E. Erdmann, M. Łabuda, N. F. Aguirre, S. Díaz-Tendero, and M. Alcamí.<br/>
   [*J. Phys. Chem. A* **122**, 4153-4166 (2018)](http://pubs.acs.org/doi/10.1021/acs.jpca.8b00881)
<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jpcafh/2018/jpcafh.2018.122.issue-16/acs.jpca.8b00881/20180423/images/medium/jp-2018-00881v_0014.gif">
</p>

3. **C<sub>n</sub>N<sup>q+</sup> (n=0-3, q=0-1)**<br/>
   Semiempirical breakdown curves of C2N(+) and C3N(+) molecules; application to products branching ratios predictions of physical and chemical processes involving these adducts.<br/>
   T. IdBarkach, T. Mahajan, M. Chabot, K. Béroff, N.F. Aguirre, S. Diaz-Tendero, T. Launoy, A. Le Padelle, L. Perrot, M.A. Bonnin, K.C. Le, F. Geslin, N. de Séréville, F. Hammache, A. Jallat, A. Meyer, E. Charon, T. Pino, T. Hamelin, and V. Wakelam<br/>
   [*Mol. Astrophysics* **12**, 25-32 (2018)](https://www.sciencedirect.com/science/article/pii/S2405675818300125)


5. **C<sub>n</sub></sub> (n=1-9), C<sub>n</sub></sub><sup>+</sup> (n=1-5)**<br/>
   M3C: A Computational Approach To Describe Statistical Fragmentation of Excited Molecules and Clusters.<br/>
   N. F. Aguirre, S. Díaz-Tendero, P.-A. Hervieux, M. Alcamí, and F. Martín.<br/>
   [*J. Chem. Theory Comput.* **13**, 992-1009 (2017)](http://pubs.acs.org/doi/pdf/10.1021/acs.jctc.6b00984)
<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jctcce/2017/jctcce.2017.13.issue-3/acs.jctc.6b00984/20170308/images/medium/ct-2016-009843_0008.gif">
</p>

5. **C<sub>n</sub>H<sub>m</sub><sup>q+</sup> (n=1-5, m=1-4, q=0-3)**<br/>
   Structure, Ionization, and Fragmentation of Neutral and Positively Charged Hydrogenated Carbon Clusters:
   C<sub>n</sub>H<sub>m</sub><sup>q+</sup> (n=1-5, m=1-4, q=0-3).<br/>
   J. P. Sánchez, N. F. Aguirre, S. Díaz-Tendero, F. Martín, and M. Alcamí.<br/>
   [*J. Phys. Chem. A* **120**, 588-605 (2016)](http://pubs.acs.org/doi/abs/10.1021/acs.jpca.5b10143)
<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jpcafh/2016/jpcafh.2016.120.issue-4/acs.jpca.5b10143/20160129/images/medium/jp-2015-10143w_0015.gif">
</p>
