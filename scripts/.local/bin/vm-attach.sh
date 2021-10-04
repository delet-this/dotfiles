#!/usr/bin/env bash

monitor=1
output=3
devices=(046D:C53F CDCD:6868 1AF3:0001)
vmname=$(virsh list | sed -n '3p' | sed -nr 's/ *[0-9]+ +(.*) +running/\1/p')

attach_device() {
    vmname=$1
    device=(${2//:/ })
    action=$3
    xml_name=/tmp/device-${device[0]}:${device[1]}.xml

    echo "<hostdev mode='subsystem' type='usb'>"      > $xml_name
    echo "  <source>"                                >> $xml_name
    echo "          <vendor id='0x${device[0]}'/>"   >> $xml_name
    echo "          <product id='0x${device[1]}'/>"  >> $xml_name
    echo "  </source>"                               >> $xml_name
    echo "</hostdev>"                                >> $xml_name

    virsh $action-device $vmname $xml_name
}

if [ "$1" == "attach" ];
then
    for dev in "${devices[@]}"
    do
            attach_device "$vmname" $dev attach
    done
    # ddcutil setvcp 60 $monitor --bus=$output
else
    for dev in "${devices[@]}"
    do
            attach_device "$vmname" $dev detach
    done
fi

