#!/bin/bash
#
# Peter Degen-Portnoy
# October 11, 2011
# 
# Purpose: print out the latest SVN log entry for each of the passed in SVN urls
#
# USAGE each_log.sh `svn propget svn:externals vendor/plugins | sort | awk '{print $2}'`

print_usage () {
  echo "each_log.sh <list of SVN URLs>"
  echo "   Prints the latest log entry of the supplied SVN URLS"
  echo "----------"
  echo "Example:"
  echo "  This will print the latest log entry from the vendor/plugins directory:"
  echo "  each_log.sh \`svn propget svn:externals vendor/plugins | sort | awk '{print $2}'\`"
}

# if there are 0 arguements, print usage and exit
if [ $# -eq 0 ]
then
  print_usage
  exit 0 
fi

for SVN_DIR in $*
do
  echo "Getting log for: " $SVN_DIR
  svn log -l 1 $SVN_DIR
  echo "============================================================"
done

