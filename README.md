# pyGainmap
A python script generating a gain map from pixelwise histograms from either fluorescence or sample data.

#1. Fitting
```bash
./gainmap fit -h
```
```
usage: gainmap fit [-h] [-m FILE] [-o PATH] [-t PATH] [-c INT] FILE

positional arguments:
  FILE        A histogram file (as created by the cheetah histogram module)

optional arguments:
  -h, --help  show this help message and exit
  -m FILE     A mask file in order to exclude bad pixels from the fitting
  -o PATH     Path to the output directory
  -t PATH     Path to the directory where things will be stored during runtime
  -c INT      Nr. of CPUs to be used
```

A typical histogram file looks like this:
```text
HDF5 "histogram.h5" {
FILE_CONTENTS {
 group      /
 group      /data
 link       /data/data -> data/histogram
 dataset    /data/histogram
 dataset    /data/histogramBinsize
 dataset    /data/histogramCount
 dataset    /data/histogramMin
 dataset    /data/histogramNbins
 dataset    /data/offset
 }
```

#2. Generating maps
```python
./gainmap generate -h
```

```
usage: gainmap generate [-h] [-m FILE] [-o PATH] [-s] [-b INT]
                        [-ba FLOAT FLOAT] [-bs FLOAT FLOAT] [-pa FLOAT FLOAT]
                        [-ps FLOAT FLOAT] [-g FLOAT FLOAT]
                        FILE

positional arguments:
  FILE             A fitting file (as created by the pyGainmap fit module)

optional arguments:
  -h, --help       show this help message and exit
  -m FILE          A mask file in order to exclude bad pixels for the gain map
                   generation
  -o PATH          Path to the output directory
  -s               Show histograms/maps for diagnostic reasons
  -b INT           Nr. of bins for showing histograms/maps for diagnostic
                   reasons
  -ba FLOAT FLOAT  Minimal and Maximal allowed values for the amplitude of the
                   background peak
  -bs FLOAT FLOAT  Minimal and Maximal allowed values for the offset of the
                   background peak
  -pa FLOAT FLOAT  Minimal and Maximal allowed values for the amplitude of the
                   photon peak
  -ps FLOAT FLOAT  Minimal and Maximal allowed values for the sigma of the
                   photon peak
  -g FLOAT FLOAT   Minimal and Maximal allowed values for the gain
```
