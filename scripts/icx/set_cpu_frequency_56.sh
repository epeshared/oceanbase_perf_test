for i in {0..143}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..27}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {28..35}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {36..63}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {64..71}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {72..99} 
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {100..107}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {108..135}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {136..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x01FF"
pqos -a "llc:1=0-27,36-63,72-99,108-135;"

#pcm-msr -a 0x620 -w 0x1414
