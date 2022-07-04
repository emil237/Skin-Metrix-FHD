#!/bin/sh

# wget -q "--no-check-certificate" https://raw.githubusercontent.com/emil237/Skin-Metrix-FHD/main/MetrixFHD.sh -O - | /bin/sh
###################################################################################
version=5
################################################################################### 
MY_URL="https://raw.githubusercontent.com/emil237/Skin-Metrix-FHD/main"
METRIX1="Metrix1FHD.tar.gz"
METRIX2="Metrix2FHD.tar.gz"
MY-TAR-PY3="MetrixFHD-py3.10.tar.gz"
echo "******************************************************************************************************************"
TEMPATH=/tmp
BOXHOSTNAME=$( cat /etc/hostname)
SETTINGS='/etc/enigma2/settings'

# remove old version

echo ""
# Download and install plugin
cd /tmp
set -e
echo "===> Downloading And Installing MetrixFHD plugin Please Wait ......"
if python --version 2>&1 | grep -q '^Python 3\.'; then
  wget "$MY_URL/$MY-TAR-PY3"
tar -xzf MetrixFHD-py3.10.tar.gz -C /
	else 
echo "   Install Plugin please wait "
   wget "$MY_URL/$METRIX1"
wait
tar -xzf Metrix1FHD.tar.gz -C /
wait
wget "$MY_URL/$METRIX2"
wait
tar -xzf Metrix2FHD.tar.gz -C /
	fi
echo "================================="
set +e
cd ..
wait
echo "================================="
set +e
cd ..
wait
rm -rf /tmp/Metrix1FHD.tar.gz
rm -rf /tmp/Metrix2FHD.tar.gz
rm -rf /tmp/MetrixFHD-py3.10.tar.gz
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi

#########################
echo "Add Setting To ${SETTINGS} ..."
init 4
sleep 2   
{
    echo "config.plugins.MetrixWeather.currentWeatherDataValid=0"
    echo "config.plugins.MetrixWeather.currentWeatherfeelslike=24"
    echo "config.plugins.MetrixWeather.currentWeatherhumidity=40"
    echo "config.plugins.MetrixWeather.currentWeatherobservationtime=16:30:00"
    echo "config.plugins.MetrixWeather.currentWeatherTemp=24"
    echo "config.plugins.MetrixWeather.currentWeatherwinddisplay=5 mph South"
    echo "config.plugins.MetrixWeather.currentWeatherwindspeed=5 mph"
    echo "config.plugins.MetrixWeather.forecastTodayTempMax=25"
    echo "config.plugins.MetrixWeather.forecastTomorrowTempMax3=19"
    echo "config.plugins.MyMetrixLiteOther.EHDenabled=1"
    echo "config.plugins.MyMetrixLiteOther.EHDfontoffset=0"
    echo "config.plugins.MyMetrixLiteOther.EHDtested="$BOXHOSTNAME"_|_01"
    echo "config.plugins.MyMetrixLiteOther.layeraunderlineposy=0"
    echo "config.plugins.MyMetrixLiteOther.layeraunderlinesize=1"
    echo "config.plugins.MyMetrixLiteOther.runningTextSpeed=60"
    echo "config.plugins.MyMetrixLiteOther.runningTextStartdelay=1200"
    echo "config.plugins.MyMetrixLiteOther.setFieldMargin=5"
    echo "config.plugins.MyMetrixLiteOther.setItemDistance=5"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignButtonsFrameSize=0"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignButtonsTextPosition=0"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignButtonsTextSize=24"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignInfobarXPiconPosX=0"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignInfobarXPiconPosY=0"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignInfobarZZZPiconPosX=0"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignInfobarZZZPiconPosY=0"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignInfobarZZZPiconSize=0"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignScrollbarBorderWidth=1"
    echo "config.plugins.MyMetrixLiteOther.SkinDesignScrollbarSliderWidth=10"
    echo "config.plugins.MyMetrixLiteOther.STBDistance=10"        
} >>${SETTINGS}

echo ""
sync
echo "##############################################################"
echo "#         MetrixFHD $version INSTALLED SUCCESSFULLY          #"
echo "#             Uploded BY Emil_Nabil           #"
echo "##############################################################"
echo "**************************************************************"
echo "##############################################################"
echo "#              your Device will RESTART Now                  #"
echo "##############################################################"
wait
sleep 2
init 4
init 3
exit 0




