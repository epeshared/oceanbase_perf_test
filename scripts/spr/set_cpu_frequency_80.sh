for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..39}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {40..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..135}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {136..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..87}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {88..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..183}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {184..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x1FFF"
pqos -a "llc:1=0-39,96-135,48-87,144-183;"

#pcm-msr -a 0x620 -w 0x1414
