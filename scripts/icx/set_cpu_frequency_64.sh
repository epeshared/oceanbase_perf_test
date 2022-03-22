for i in {0..143}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..31}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {32..35}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {36..67}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {68..71}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {72..103} 
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {104..107}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {108..139}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {140..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x07FF"
pqos -a "llc:1=0-31,36-67,72-103,108-139;"

#pcm-msr -a 0x620 -w 0x1414
