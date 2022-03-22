for i in {0..191}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..35}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {36..47}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {96..131}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

for i in {132..143}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done



for i in {48..83}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 

for i in {84..95}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done

for i in {144..179}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {180..191}
do
        echo 0 > /sys/devices/system/cpu/cpu$i/online;
done


pqos -e "llc:1=0x07FF"
pqos -a "llc:1=0-35,96-131,48-83,144-179;"

#pcm-msr -a 0x620 -w 0x1414
