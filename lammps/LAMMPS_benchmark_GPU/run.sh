#!/bin/bash

for name in LJ-2.5 EAM ReaxFF-C Tersoff; do
    cd $name
    lmp -k on g 1 -sf kk -pk kokkos cuda/aware on neigh full comm device binsize 2.8 -var x 8 -var y 4 -var z 8 -in in.* > run.log 2>&1
    cd ..
done
