for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..23}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {24..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..119}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {120..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..71}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {72..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..167}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {168..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x00FF"
pqos -a "llc:1=0-23,96-119,48-71,144-167;"

#pcm-msr -a 0x620 -w 0x1414
