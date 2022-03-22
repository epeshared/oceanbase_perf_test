for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..31}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {32..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..127}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {128..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..79}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {80..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..175}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {176..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x03FF"
pqos -a "llc:1=0-31,96-127,48-79,144-175;"

#pcm-msr -a 0x620 -w 0x1414
