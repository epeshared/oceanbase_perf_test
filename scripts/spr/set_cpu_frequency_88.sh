for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..43}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {44..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..139}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {140..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..91}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {92..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..187}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {188..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x3FFF"
pqos -a "llc:1=0-43,96-139,48-91,144-187;"

#pcm-msr -a 0x620 -w 0x1414
