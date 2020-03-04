#!/bin/bash

pip3 install igv-jupyter

jupyter serverextension enable --py igv --sys-prefix
jupyter nbextension install --py igv --sys-prefix
jupyter nbextension enable --py igv --sys-prefix


pip3 install rpy2==3.0.4
pip3 install singledispatch
pip3 install tzlocal


echo "install.packages(c(\"optparse\",\"data.table\"),repos=\"http://cran.us.r-project.org\")" | R --no-save


set -e

GATK_VERSION=4.1.3.0
GATK_ZIP_PATH=/tmp/gatk-$GATK_VERSION.zip

# remove pre-existing GATK version
rm -rf /bin/gatk

# download the gatk zip if it doesn't already exist

if ! [ -f $GATK_ZIP_PATH ]; then
  # curl and follow redirects and output to a temp file
  curl -L -o $GATK_ZIP_PATH https://github.com/broadinstitute/gatk/releases/download/$GATK_VERSION/gatk-$GATK_VERSION.zip
fi

# unzip with forced overwrite (if necessary) to /bin
unzip -o $GATK_ZIP_PATH -d /etc/

# make a symlink to gatk right inside bin so it's available from the existing PATH

ln -s /etc/gatk-$GATK_VERSION/gatk /bin/gatk

pip3 install /etc/gatk-$GATK_VERSION/gatkPythonPackageArchive.zip


export PATH=$PATH:/home/jupyter-user/.local/bin