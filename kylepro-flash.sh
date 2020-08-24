set -e

echo "Building zImage-dtb"
boot_dir="/mnt/linux/.output/arch/arm/boot"
image_file="$boot_dir/zImage-dtb"
cat $boot_dir/zImage $boot_dir/dts/bcm21664-kylepro.dtb > $image_file

echo "Patching boot.img"
boot_file="$boot_dir/boot.img"
cp /mnt/rootfs_samsung-kylepro/boot/boot.img $boot_file
abootimg -u $boot_file -k $image_file -c "bootsize=8388608"

echo "Flashing kernel"
echo "heimdall flash --KERNEL $boot_file"
