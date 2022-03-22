for i in {0..143}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done

