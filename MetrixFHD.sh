#!/bin/sh

# wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/Skin-Metrix-FHD/main/MetrixFHD.sh -O - | /bin/sh

version=6
#############################################################
MY_URL="https://raw.githubusercontent.com/emil237/Skin-Metrix-FHD/main"
MYTAR_PY2="MetrixFHD-py2.0.tar.gz"
MYTAR_PY3="MetrixFHD-py3.0.tar.gz"
MYTAR_PY310="MetrixFHD-py310.tar.gz"
TEMPATH=/tmp
BOXHOSTNAME=$( cat /etc/hostname)
SETTINGS='/etc/enigma2/settings'
PYTHON_VERSION=$(python -c"import platform; print(platform.python_version())")


# remove old version

rm -rf /usr/lib/enigma2/python/Plugins/Extensions/MyMetrixLite
rm -rf /usr/share/enigma2/MetrixHD


echo ""
# Download and install plugin
if [ "$PYTHON_VERSION" == 3.9.7 ]; then
    echo "OpenAtv PYTHON-$PYTHON_VERSION ..."
    cd /tmp
    set -e
    echo "===> Downloading And Installing MetrixFHD python3 plugin Please Wait ......"
    echo
    wget "$MY_URL/$MYTAR_PY3"
    tar -xzf MetrixFHD-py3.0.tar.gz --warning=no-timestamp -C /
    set +e
    rm -f MetrixFHD-py3.0.tar.gz
elif [ "$PYTHON_VERSION" == 3.10.4 ]; then
    echo "OpenAtv PYTHON-$PYTHON_VERSION ..."
    cd /tmp
    set -e
    echo "===> Downloading And Installing MetrixFHD python3 plugin Please Wait ......"
    echo
    wget "$MY_URL/$MYTAR_PY310"
    tar -xzf MetrixFHD-py310.tar.gz --warning=no-timestamp -C /
    set +e
    rm -f MetrixFHD-py310.tar.gz    
else
    echo "OpenAtv PYTHON-$PYTHON_VERSION ..."
    cd /tmp
    set -e
    echo "===> Downloading And Installing MetrixFHD python2 plugin Please Wait ......"
    echo
    wget "$MY_URL/$MYTAR_PY2"
    tar -xzf MetrixFHD-py2.0.tar.gz -C /
    set +e
    rm -f MetrixFHD-py2.0.tar.gz   
fi

#########################
echo "Add Setting To ${SETTINGS} ..."
init 4 
{
    echo "config.plugins.MyMetrixLiteOther.EHDenabled=1"
    echo "config.plugins.MyMetrixLiteOther.EHDtested="$BOXHOSTNAME"_|_01"
    
} >>${SETTINGS}

echo ""
sync
echo "##############################################################"
echo "#         MetrixFHD $version INSTALLED SUCCESSFULLY          #"
echo "#             Uploded BY EMIL_NABIL #"
sleep 4;
echo "##############################################################"
echo "**************************************************************"
echo "##############################################################"
echo "#         Please  RESTART Now  your Device                    #"
echo "##############################################################"
exit 0
