#!/bin/bash
./nafe-0.1/txt2psf ter-powerline.txt ter-powerline.psf
psfaddtable ter-powerline.psf ter-powerline.map ter-powerline.psfu
gzip -c ter-powerline.psfu > ter-powerline.psfu.gz
