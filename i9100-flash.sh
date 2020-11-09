set -e

echo "Building zImage-dtb"
boot_dir="/mnt/linux/.output/arch/arm/boot"
kernel_file="$boot_dir/zImage-dtb"
cat $boot_dir/zImage $boot_dir/dts/exynos4210-i9100.dtb > $kernel_file

echo "Flash with 'heimdall flash --KERNEL $kernel_file'"
