CPU_JOB_NUM=$(($(grep processor /proc/cpuinfo | awk '{field=$NF};END{print field+1}')*3))
echo "CPU number is "$CPU_JOB_NUM

#cp config_e9_linux .config

export ARCH=arm
export CROSS_COMPILE=~/toolchain/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/tq-linaro-toolchain/bin/arm-none-linux-gnueabi-

if [ "clean" == "$1" ]; then
	make clean
else
	make menuconfig
	make uImage -j$CPU_JOB_NUM
fi

