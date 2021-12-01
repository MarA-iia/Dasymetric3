#!/bin/bash

export PYTHONPATH=$PYTHONPATH:/usr/share/qgis/python:/usr/share/qgis/python/plugins:/usr/lib/python3/dist-packages:/usr/lib/python3/dist-packages/qgis/
export LD_LIBRARY_PATH=/usr/lib
export PATH=$PATH:/usr
export XDG_RUNTIME_DIR=/home 
export RUNLEVEL=3

export GDAL_FILENAME_IS_UTF8=YES
set CPL_LOG=NUL

Xvfb :99 -ac -noreset &
export DISPLAY=:99

formula=$(bash creare_formula_sql.sh)
#echo $formula

# python3 argument_input.py  "$formula"
python3 DasymetricV2.py $formula 2>&1 | tee log.txt
#python3 DasymetricV2.py "$formula"
