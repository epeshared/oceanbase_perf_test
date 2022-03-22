for i in {0..143}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..23}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {24..35}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {36..59}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {60..71}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {72..95} 
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {96..107}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {108..131}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {132..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x00FF"
pqos -a "llc:1=0-23,36-59,72-95,108-131;"

#pcm-msr -a 0x620 -w 0x1414
