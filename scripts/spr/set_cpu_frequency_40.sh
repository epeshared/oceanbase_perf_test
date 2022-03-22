for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..19}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {20..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..115}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {116..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..67}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {68..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..163}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {164..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x007F"
pqos -a "llc:1=0-19,96-115,48-67,144-163;"

#pcm-msr -a 0x620 -w 0x1414
