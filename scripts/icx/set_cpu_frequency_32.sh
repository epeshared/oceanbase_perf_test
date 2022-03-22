for i in {0..143}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..15}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {16..35}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {36..51}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {52..71}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {72..87} 
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {88..107}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {108..123}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {124..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x001F"
pqos -a "llc:1=0-15,36-51,72-87,108-123;"

#pcm-msr -a 0x620 -w 0x1414
