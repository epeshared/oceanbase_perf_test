for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..27}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {28..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..123}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {124..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..75}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {76..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..171}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {172..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x01FF"
pqos -a "llc:1=0-27,96-123,48-75,144-171;"

#pcm-msr -a 0x620 -w 0x1414
