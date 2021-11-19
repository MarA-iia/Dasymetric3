#!/bin/sh

export PYTHONPATH=$PYTHONPATH:/usr/share/qgis/python:/usr/share/qgis/python/plugins:/usr/lib/python3/dist-packages:/usr/lib/python3/dist-packages/qgis/
export LD_LIBRARY_PATH=/usr/lib
export PATH=$PATH:/usr
export XDG_RUNTIME_DIR=/home 
export RUNLEVEL=3

print(POP)

export GDAL_FILENAME_IS_UTF8=YES
set CPL_LOG=NUL

Xvfb :99 -ac -noreset &
export DISPLAY=:99
python3 DasymetricV2.py 2>&1 | tee log.txt