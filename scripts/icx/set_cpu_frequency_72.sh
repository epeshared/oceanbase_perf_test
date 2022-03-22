for i in {0..143}
do
        echo 1 > /sys/devices/system/cpu/cpu$i/online;
done


for i in {0..35}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 


for i in {36..71}
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done 


for i in {72..107} 
do
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq; 
done

for i in {108..143}
do 
	echo 2700000 > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq;
done

pqos -e "llc:1=0x0FFF"
pqos -a "llc:1=0-35,36-71,72-107,108-143;"

pcm-msr -a 0x620 -w 0x1414

#/opt/intel/sep_private_5.31_linux_121516364bb91f7/bin64/./emon -collect-edp > /home/xtang/emon/oceanbase/sysbench/36cores
