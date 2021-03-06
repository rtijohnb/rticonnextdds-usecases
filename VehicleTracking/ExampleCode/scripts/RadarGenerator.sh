#!/bin/sh

filename=$0
script_dir=`dirname $filename`
executable_name="RadarGenerator"
bin_dir=${script_dir}/../objs/x64Linux3gcc5.4.0/RadarGenerator

if [ -f $bin_dir/$executable_name ]
then
    cd $bin_dir
    export LD_LIBRARY_PATH=../thirdparty/proj-4.9.3/lib/x64Linux3gcc5.4.0:../thirdparty/wxWidgets-3.0.3/lib/x64Linux3gcc5.4.0:$LD_LIBRARY_PATH
    ./$executable_name $*
else
    echo "***************************************************************"
    echo $executable_name executable does not exist in:
    echo $bin_dir
    echo ""
    echo Please, try to recompile the application using the command:
    echo " $ make -f make/Makefile.x64Linux3gcc5.4.0"
    echo "***************************************************************"
fi
