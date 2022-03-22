for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..15}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {16..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..111}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {112..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..63}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {64..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..159}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {160..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x001F"
pqos -a "llc:1=0-15,96-111,48-63,144-159;"

pcm-msr -a 0x620 -w 0x1414
