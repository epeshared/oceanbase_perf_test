for i in {0..191}
do
	echo 1 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {0..47}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 


for i in {48..95}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 


for i in {96..143} 
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done


for i in {144..191}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

pqos -e "llc:1=0x7FFF"
pqos -a "llc:1=0-47,96-142,48-95,144-191;"
