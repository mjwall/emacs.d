#!/bin/bash
#
# This script will handle tag generation for all project directories
# underneath a particular parent directory.
#
# e.g., 'make-all-tags.sh /home/aaron/src/' will run mktags.sh in all
# directories under /home/aaron/src/** that have a .classpath file.


bin=`dirname $0`
bin=`cd ${bin} && pwd`

targetdir="."

if [ ! -z "$1" ]; then
  targetdir="$1"
fi

cd "${targetdir}"

find . -name .classpath -execdir "${bin}/mktags.sh" \;



