## M3C-store

M3C-store is a ...

## Authors (alphabetical order)
* Nestor F. Aguirre ( nfaguirrec@gmail.com )
* Manuel Alcamí ( xx@xxx )
* Sergio Díaz-Tendero ( xx@xxx )
* Ewa Erdmann ( xx@xxx )
* Paul-Antoine Hervieux ( xx@xxx )
* Marta Łabuda ( xx@xxx )
* Juan P. Sánchez ( xx@xxx )

## Citing

<!--To cite this database, please proceed as follows:

[![DOI](https://zenodo.org/badge/33068598.svg)](https://zenodo.org/badge/latestdoi/33068598)-->

<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jpcafh/2018/jpcafh.2018.122.issue-16/acs.jpca.8b00881/20180423/images/medium/jp-2018-00881v_0014.gif">
</p>

1. Furan Fragmentation in the Gas Phase: New Insights from Statistical and Molecular Dynamics Calculations.  
E. Erdmann, M. Łabuda, N. F. Aguirre, S. Díaz-Tendero, and M. Alcamí  
[*J. Phys. Chem. A* **122**, 4153-4166 (2018)](http://pubs.acs.org/doi/10.1021/acs.jpca.8b00881)

<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jctcce/2017/jctcce.2017.13.issue-3/acs.jctc.6b00984/20170308/images/medium/ct-2016-009843_0008.gif">
</p>

2. M3C: A Computational Approach To Describe Statistical Fragmentation of Excited Molecules and Clusters.  
N. F. Aguirre, S. Díaz-Tendero, P.-A. Hervieux, M. Alcamí, and F. Martín.  
[*J. Chem. Theory Comput.* **13**, 992-1009 (2017)](http://pubs.acs.org/doi/pdf/10.1021/acs.jctc.6b00984)

<p align="center">
  <img src="https://pubs.acs.org/appl/literatum/publisher/achs/journals/content/jpcafh/2016/jpcafh.2016.120.issue-4/acs.jpca.5b10143/20160129/images/medium/jp-2015-10143w_0015.gif">
</p>

3. Structure, Ionization, and Fragmentation of Neutral and Positively Charged Hydrogenated Carbon Clusters:  
C<sub>n</sub>H<sub>m</sub><sup>q+</sup> (n=1-5, m=1-4, q=0-3).  
J. P. Sánchez, N. F. Aguirre, S. Díaz-Tendero, F. Martín, and M. Alcamí.  
[*J. Phys. Chem. A* **120**, 588-605 (2016)](http://pubs.acs.org/doi/abs/10.1021/acs.jpca.5b10143)

### Using the database with M3C
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
This should be the content of the M3C-store directory if previous steps were successful:
```
$ cd M3C-store
$ ls
develop  master  README.md  utils
```
<!--Finally, to use the database in M3C, you simply have to copy the files in a directory included in the PATH system variable, as for example bin in your home directory:
```
$ cp sjobq/* $HOME/bin/
```-->

