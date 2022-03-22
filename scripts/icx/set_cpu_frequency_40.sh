for i in {0..143}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..19}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {20..35}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {36..55}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {56..71}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {72..91} 
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {92..107}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {108..127}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {128..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x007F"
pqos -a "llc:1=0-19,36-55,72-91,108-127;"

#pcm-msr -a 0x620 -w 0x1414
